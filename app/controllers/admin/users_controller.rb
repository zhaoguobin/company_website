class Admin::UsersController < Admin::BaseController

  load_and_authorize_resource

  def index
    @q = User.search(params[:q])
    @users = @q.result.page(params[:page]).per(10)
  end

  def new
  end

  def create
    if @user.save
      redirect_to admin_user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    
  end

  private

  def user_params
    params.require(:user).permit(:login, :name, :password, :password_confirmation, :role_id)
  end

end
