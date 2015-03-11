class Admin::CategoriesController < Admin::BaseController
  include TheSortableTreeController::Rebuild

  load_and_authorize_resource

  def new
  end

  def create
    if @category.save
      redirect_to manage_admin_categories_path
    else
      render :new
    end
  end

  def show
    if @category.is_single?
      @page = @category.pages.first
      redirect_to admin_category_page_path(@category, @page)
    else
      redirect_to admin_category_pages_path(@category)
    end
  end

  def edit  
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to manage_admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to manage_admin_categories_path
  end

  def manage
    @categories = Category.nested_set.select('id, name as title, parent_id').all
  end

  private

  def category_params
    params.require(:category).permit(:name, :item_type_id, :photo)
  end

end
