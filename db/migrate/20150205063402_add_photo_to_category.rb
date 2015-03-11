class AddPhotoToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :photo, :string
  end
end
