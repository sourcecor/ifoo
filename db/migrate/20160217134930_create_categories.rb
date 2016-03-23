class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :caption
      t.string :description
      t.integer :seq
      t.timestamps null: false
    end
  end
end
