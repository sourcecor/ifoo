class Admin::Group < ActiveRecord::Base
  self.table_name = "groups"
	has_and_belongs_to_many :users ,:class_name => "Admin::User", :join_table => "group_users",:association_foreign_key => "user_id"
	has_and_belongs_to_many :menus ,:class_name => "Admin::Menu", :join_table => "group_menus",:association_foreign_key => "menu_id"
end
