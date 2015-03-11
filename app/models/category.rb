class Category < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes
  
  mount_uploader :photo, CategoryPhotoUploader

  has_many :pages

  validates :item_type_id, :presence => true

  after_create :create_information_page
  after_save :update_site_map_pages
  after_move :update_site_map_pages

  scope :site_maps, -> { where(["item_type_id = ?", self.types[:site_map]]) }

  def self.types
    {
      :information => 0,
      :news => 1,
      :products => 2,
      :site_map => 3
    }
  end

  def type_name
    self.class.types.each do |key, value|
      return key.to_s if self.item_type_id == value
    end
  end

  self.types.each do |key, value|
    define_method "is_#{key}?".to_sym do
      self.item_type_id == value
    end
  end

  def is_single?
    self.is_information? || self.is_site_map?
  end

  def is_list?
    self.is_news? || self.is_products?
  end

  def self.generate_site_map
    html = "<div><ul class='site_map'>"
    Category.roots.each do |root|
      html += "<li><a href='/categories/#{root.id}'>#{root.name}</a></li>"
    end
    html += "</ul></div>"
  end

  def self.update_site_map_pages
    site_map = nil
    self.site_maps.each do |category|
      category.pages.create if category.pages.blank?
      category.pages.each do |page|
        site_map ||= generate_site_map
        page.update_attribute(:content, site_map)
      end
    end
  end

  protected

  def create_information_page
    self.pages.create if self.is_information? && self.pages.blank?
  end

  def update_site_map_pages
    self.class.update_site_map_pages
  end

end
