class CreateIndexImages < ActiveRecord::Migration
  def change
    create_table :index_images do |t|
      t.string :photo
      t.string :link
      t.integer :position

      t.timestamps
    end
  end
end
