class Admin::SubProduct < ActiveRecord::Base
  self.table_name = "sub_products"
  belongs_to :products
end
