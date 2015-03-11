class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => true, :index => true
      t.integer :rgt, :null => true, :index => true
      t.integer :item_type_id, :null => true, :default => 0, :index => true

      t.timestamps
    end
  end
end
