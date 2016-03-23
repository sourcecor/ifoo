class CreateSubProducts < ActiveRecord::Migration
  def change
    create_table :sub_products do |t|
      t.string :size
      t.string :color
      t.integer :qty
      t.string :itemcode
      t.integer :seq
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
