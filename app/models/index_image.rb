class IndexImage < ActiveRecord::Base

  acts_as_list
  mount_uploader :photo, IndexPhotoUploader

  default_scope ->{order("position asc")}

end
