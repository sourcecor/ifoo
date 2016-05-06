class Admin::Product < ActiveRecord::Base
	self.table_name = "products"
	validates :caption, :itemcode, presence: true

	has_many :main_pictures, -> { order(:seq) }, class_name: "Admin::ProductMainPicture", dependent: :destroy
	accepts_nested_attributes_for :main_pictures, allow_destroy: true, :reject_if => lambda { |a| a[:image].blank? }

	has_many :profile_pictures, -> { order(:seq) }, class_name: "Admin::ProductProfilePicture", dependent: :destroy
	accepts_nested_attributes_for :profile_pictures, allow_destroy: true, :reject_if => lambda { |a| a[:image].blank? }
	#
	has_many :categories, through: :category_products
	has_many :category_products, dependent: :destroy
	#
	has_many :sub_products, -> { order(:seq) }, foreign_key: "product_id", dependent: :destroy
	#has_many :sub_products,   foreign_key: "product_id", dependent: :destroy
	accepts_nested_attributes_for :sub_products, allow_destroy: true, :reject_if => lambda { |a| (a[:size].blank? && a[:color].blank?) || a[:qty].blank?}


  def colors
    colors =[]
    self.sub_products.each do |item|
    	colors.push(item.color) unless colors.include?(item.color)
    end
    return colors
  end

  def sizes
    sizes =[]
    self.sub_products.each do |item|
    	sizes.push(item.size) unless sizes.include?(item.size)
    end
    return sizes
  end
end
