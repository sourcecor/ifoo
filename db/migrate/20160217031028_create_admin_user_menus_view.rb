class CreateAdminUserMenusView < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE VIEW admin_users_menus AS
        select a.group_id, a.user_id, b.menu_id, parent_id, caption, "action", position, seq
        from  group_users a
        inner join  group_menus b on a.group_id = b.group_id
        inner join  menus c on b.menu_id = c.id
        order by a.group_id, seq
    SQL
  end

  def down
    execute "DROP VIEW admin_users_menus"
  end
end
