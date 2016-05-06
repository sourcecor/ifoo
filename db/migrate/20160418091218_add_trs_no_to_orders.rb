class AddTrsNoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :trsNo, :string, limit: 12
  end
end
