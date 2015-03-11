class HomeController < ApplicationController
  def index
    @information_category = Category.find(1)
    @information = @information_category.pages.first
    @news_category = Category.find(3)
    @news = @news_category.pages.limit(5)
    @products_category = Category.find(2)
    @products = @products_category.pages
    @index_images = IndexImage.all
  end
end
