class Page < ActiveRecord::Base

  mount_uploader :photo, ProductPhotoUploader
  
  belongs_to :category

  default_scope { order('created_at desc') }
  
end
