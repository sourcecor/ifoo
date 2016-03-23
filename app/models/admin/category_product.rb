class Admin::CategoryProduct < ActiveRecord::Base
self.table_name = "category_products"
	belongs_to :product
	belongs_to :category
end
