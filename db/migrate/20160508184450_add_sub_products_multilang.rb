class AddSubProductsMultilang < ActiveRecord::Migration
  def change
     change_table :sub_products do |t|
       t.string :size_s
       t.string :color_s
       t.string :size_e
       t.string :color_e

    end
  end
end
