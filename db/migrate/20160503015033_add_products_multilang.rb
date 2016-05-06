class AddProductsMultilang < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.string :caption_s
      t.text :description_s
      t.decimal :unit_price_s, :precision => 8, :scale => 2
      t.decimal :sale_price_s, :precision => 8, :scale => 2
      t.string :caption_e
      t.text :description_e
      t.decimal :unit_price_e, :precision => 8, :scale => 2
      t.decimal :sale_price_e, :precision => 8, :scale => 2
    end
  end
end
