module Admin::PagesHelper

  def is_active?(action)
    @action == action ? "active" : nil
  end

  def tab_link_path(action)
    return "javascript:;" if is_active?(action)
    action == :show ? admin_category_page_path(@category, @page) : edit_admin_category_page_path(@category, @page)
  end
end
