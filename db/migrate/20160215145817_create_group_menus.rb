
class CreateGroupMenus < ActiveRecord::Migration
  def change
    create_table :group_menus, id: false do |t|
      t.integer :group_id
      t.integer :menu_id
      t.timestamps null: false
    end

    add_index :group_menus, :group_id
    add_index :group_menus, :menu_id
  end
end
