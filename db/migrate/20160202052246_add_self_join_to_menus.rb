class AddSelfJoinToMenus < ActiveRecord::Migration
  def change
    change_table :menus do |t|
      t.references :parent_id
    end
  end
end
