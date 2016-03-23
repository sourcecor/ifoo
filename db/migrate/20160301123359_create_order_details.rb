class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :qty
      t.decimal :price, precision: 8, scale: 2
      t.integer :product_id
      t.string :color
      t.string :size
      t.string :itemcode
      t.string :itemname

      t.timestamps null: false
    end
  end
end
