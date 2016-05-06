class CreateFormNumbers < ActiveRecord::Migration
  def change
    create_table :form_numbers do |t|
      t.string :trsType, limit: 2
      t.string :yymm, limit: 6
      t.integer :seq

      t.timestamps null: false
    end
  end
end
