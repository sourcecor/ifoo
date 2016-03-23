class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users, id: false do |t|
      t.integer :group_id
      t.integer :user_id
      t.timestamps null: false
    end

    add_index :group_users, :group_id
    add_index :group_users, :user_id
  end
end
