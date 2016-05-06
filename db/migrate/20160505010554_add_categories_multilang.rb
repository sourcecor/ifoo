class AddCategoriesMultilang < ActiveRecord::Migration
  def change
     change_table :categories do |t|
       t.string :caption_s
       t.string :caption_e

    end
  end
end
