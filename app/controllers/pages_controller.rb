class PagesController < ApplicationController

  before_filter :find_category

  def index
    @q = @category.pages.search(params[:q])
    @pages = @q.result.page(params[:page]).per(9)
  end

  def show
    @page = @category.pages.find(params[:id])
  end

  protected

  def find_category
    @category = Category.find(params[:category_id])
  end
end
