class Admin::BaseController < ApplicationController

  layout 'admin'

  # before_filter :get_sidebar_categories
  before_filter :login_required

  def index
  end

  private

  # def get_sidebar_categories
  #   @categories = Category.nested_set.select('id, name as title, parent_id').all
  # end

  def login_required
    redirect_to root_path and return if current_user.blank?
  end
end
