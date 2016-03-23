class CreateProductMainPictures < ActiveRecord::Migration
  def change
    create_table :product_main_pictures do |t|
      t.string :image
      t.belongs_to :product
      t.integer :seq
      t.timestamps null: false
    end
  end
end
