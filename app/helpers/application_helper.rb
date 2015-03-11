module ApplicationHelper

  def nav_links
    links = "<li class='#{home_active_class}'><a href='/'>首页</a></li>"
    @roots.each do |root|
      links += "<li class='#{nav_active_class root}'>"
      links += link_to root.name, category_path(root)
      links += "</li>"
    end
    links.html_safe
  end

  def home_active_class
    params[:controller] == "home" && params[:action] == "index" ? "active" : ""
  end

  def nav_active_class(category)
    @category == category ? "active" : ""
  end

  def short_date(time)
    time.strftime("%Y-%m-%d")
  end

  def short_datetime(time)
    time.strftime("%Y-%m-%d %H:%M:%S")
  end
end
