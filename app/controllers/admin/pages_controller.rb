class Admin::PagesController < Admin::BaseController

  before_filter :find_category

  def index
    @q = @category.pages.search(params[:q])
    @pages = @q.result.page(params[:page]).per(20)
  end

  def new
    @page = @category.pages.new
    render_page :new
  end

  def create
    @page = @category.pages.new(page_params)
    if @page.save
      redirect_to admin_category_page_path(@category, @page)
    else
      render_page :new
    end
  end

  def show
    @page = @category.pages.find(params[:id])
    render_page :show
  end

  def edit
    @page = @category.pages.find(params[:id])
    render_page :edit
  end

  def update
    @page = @category.pages.find(params[:id])
    if @page.update_attributes(page_params)
      redirect_to admin_category_page_path(@category, @page)
    else
      render_page :edit
    end
  end

  def destroy
    @page = @category.pages.find(params[:id])
    @page.destroy
    redirect_to admin_category_pages_path(@category)
  end

  private

  def find_category
    @category = Category.find(params[:category_id])
  end

  def page_params
    if @category.is_information?
      params.require(:page).permit(:content)
    elsif @category.is_news?
      params.require(:page).permit(:title, :content)
    elsif @category.is_products?
      params.require(:page).permit(:title, :photo, :content)
    end
  end

  def render_page(action)
    @action = action
    render "#{@category.type_name}_#{@action}".to_sym
  end
  
end
