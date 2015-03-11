class SessionsController < ApplicationController

  before_filter :not_login_required, :except => [:destroy]
  before_filter :login_required, :only => [:destroy]

  def new
    
  end

  def create
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to admin_root_path and return
    else
      flash[:error] = "登录失败！"
    end
    render :new
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path and return
  end

  private

  def not_login_required
    redirect_to admin_root_path and return if current_user.present?
  end

  def login_required
    redirect_to root_path and return if current_user.blank?
  end
end
