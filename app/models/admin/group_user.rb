class Admin::GroupUser < ActiveRecord::Base
  self.table_name = "group_users"
	has_and_belongs_to_many :groups
end
