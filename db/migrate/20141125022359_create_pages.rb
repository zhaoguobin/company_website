class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :category_id
      t.string :title
      t.string :photo
      t.text :content

      t.timestamps
    end
  end
end
