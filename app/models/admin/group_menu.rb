class  Admin::GroupMenu < ActiveRecord::Base
    self.table_name = "group_menus"
    has_and_belongs_to_many :groups
end
