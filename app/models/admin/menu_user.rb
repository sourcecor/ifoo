class Admin::MenuUser < ActiveRecord::Base
	self.table_name = "admin_users_menus"
	self.primary_key = :group_id, :user_id, :menu_id
	has_and_belongs_to_many :users
	has_many :sub_menus, -> { order(:seq) }, class_name: "Admin::MenuUser", foreign_key: "parent_id"
end
