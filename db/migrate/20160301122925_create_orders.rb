class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total_amount, precision: 10, scale: 2
      t.integer :qty_amount
      t.string :shipping_name
      t.string :shipping_phone
      t.string :shipping_zipcode
      t.string :shipping_address
      t.string :status
      t.timestamps null: false
    end
  end
end
