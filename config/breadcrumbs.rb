crumb :root do
  link "首页", admin_root_path
end

crumb :users do
  link "用户列表", admin_users_path
  parent :root
end

crumb :user do |user|
  if user.id.blank?
    link "新建用户", new_admin_user_path
  else
    link "用户 #{user.login}", admin_user_path(user)
  end
  parent :users
end

crumb :categories do
  link "网站结构", manage_admin_categories_path
  parent :root
end

crumb :category do |category|
  if category.id.blank?
    link "新建页面", new_admin_category_path
  else
    link "编辑页面", edit_admin_category_path(category)
  end
  parent :categories
end

crumb :show_category do |category|
  link category.name, admin_category_path(category)
  parent :root
end

crumb :page do |page|
  category = page.category
  if page.id.blank?
    link "新建", new_admin_category_page_path(category)
  else
    link "##{page.id}", admin_category_page_path(category, page)
  end
  parent :show_category, category
end

crumb :settings do
  link "网站设置", admin_settings_path
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).