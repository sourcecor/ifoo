class Admin::Category < ActiveRecord::Base
	self.table_name = "categories"
	validates :caption, presence: true

	# relation
	belongs_to :main_category, class_name: "Admin::Category"
	## order 必須放在 relativ name 之後。另外 :order的方法在rails 4 已經捨棄, 須改用 lambda
	has_many :sub_categories, -> { order(:seq) }, class_name: "Admin::Category", foreign_key: "parent_id", dependent: :destroy
	accepts_nested_attributes_for :sub_categories, allow_destroy: true, :reject_if => lambda { |a| a[:caption].blank? }
	#
	has_many :products, through: :category_products
	has_many :category_products, dependent: :destroy

end
