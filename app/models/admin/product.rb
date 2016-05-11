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


  def self.iwhere(str)
    case  I18n.locale.to_s

      when "en"

        c = Admin::Product.find_by_sql("Select id,itemcode,
                                      caption_e as caption,description_e as description,
                                      unit_price_e as unit_price,sale_price_e as sale_price,
                                      cost from products "+ str )
      when "zh-TW"
        c = Admin::Product.find_by_sql("Select id,itemcode,
                                      caption as caption,description as description,
                                      unit_price as unit_price,sale_price as sale_price,
                                      cost from products "+ str )

      when "zh-CN"
        c = Admin::Product.find_by_sql("Select id,itemcode,
                                      caption_s as caption,description_s as description,
                                      unit_price_s as unit_price,sale_price_s as sale_price,
                                      cost from products "+ str )

      else
        c = Admin::Product.find_by_sql("Select id,itemcode,
                                      caption_e as caption,description_e as description,
                                      unit_price_e as unit_price,sale_price_e as sale_price,
                                      cost from products "+ str )

    end
  end

  def self.cwhere(str)
    case  I18n.locale.to_s
      when "en"
        c = Admin::Product.find_by_sql("Select a.id,a.itemcode,
                                        a.caption_e as caption,a.description_e as description,
                                        a.unit_price_e as unit_price,a.sale_price_e as sale_price,
                                        a.cost from products a,category_products b,categories c
                                        where a.id = b.product_id
                                        and b.category_id = c.id
                                        and c.caption_e like "+str)


      when "zh-TW"
        c = Admin::Product.find_by_sql("Select a.id,a.itemcode,
                                        a.caption as caption,a.description as description,
                                        a.unit_price as unit_price,a.sale_price as sale_price,
                                        a.cost from products a,category_products b,categories c
                                        where a.id = b.product_id
                                        and b.category_id = c.id
                                        and c.caption like "+str)

      when "zh-CN"
        c = Admin::Product.find_by_sql("Select a.id,a.itemcode,
                                        a.caption_s as caption,a.description_s as description,
                                        a.unit_price_s as unit_price,a.sale_price_s as sale_price,
                                        a.cost from products a,category_products b,categories c
                                        where a.id = b.product_id
                                        and b.category_id = c.id
                                        and c.caption_s like "+str)

      else
        c = Admin::Product.find_by_sql("Select a.id,a.itemcode,
                                        a.caption_e as caption,a.description_e as description,
                                        a.unit_price_e as unit_price,a.sale_price_e as sale_price,
                                        a.cost from products a,category_products b,categories c
                                        where a.id = b.product_id
                                        and b.category_id = c.id
                                        and c.caption_e like "+str)

    end
  end

  def colors
    colors =[]

    case  I18n.locale.to_s
      when "en"
        self.sub_products.each do |item|
    	    colors.push(item.color_e) unless colors.include?(item.color_e)
        end
      when "zh-TW"
        self.sub_products.each do |item|
          colors.push(item.color) unless colors.include?(item.color)
        end
      when "zh-CN"
        self.sub_products.each do |item|
          colors.push(item.color_s) unless colors.include?(item.color_s)
        end
      else
        self.sub_products.each do |item|
          colors.push(item.color_e) unless colors.include?(item.color_e)
        end
    end
    return colors
  end

  def sizes
    sizes =[]
    case  I18n.locale.to_s
      when "en"
        self.sub_products.each do |item|
        	sizes.push(item.size_e) unless sizes.include?(item.size_e)
        end
      when "zh-TW"
        self.sub_products.each do |item|
          sizes.push(item.size) unless sizes.include?(item.size)
        end
      when "zh-CN"
        self.sub_products.each do |item|
          sizes.push(item.size_s) unless sizes.include?(item.size_s)
        end
      else
        self.sub_products.each do |item|
          sizes.push(item.size_e) unless sizes.include?(item.size_e)
        end

    end
    return sizes
  end


end
