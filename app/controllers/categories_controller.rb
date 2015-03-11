class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    if @category.is_list?
      redirect_to category_pages_path(@category)
    else
      @page = @category.pages.first
      redirect_to category_page_path(@category, @page)
    end
  end
end
