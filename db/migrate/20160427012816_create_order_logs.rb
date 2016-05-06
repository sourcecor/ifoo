class CreateOrderLogs < ActiveRecord::Migration
  def change
    create_table :order_logs do |t|
      t.string :username
      t.string :aasm_state
      t.references :order
      t.timestamps null: false
    end
  end
end
