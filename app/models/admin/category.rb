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

  attr_accessor :locale

  def self.iwhere(str)

    case  I18n.locale.to_s

      when "en"

        c = Admin::Category.find_by_sql("Select id,caption_e as caption, description
                                     from categories "+ str )

      when "zh-TW"

        c = Admin::Category.find_by_sql("Select id,caption as caption, description
                                     from categories "+ str )
      when "zh-CN"

        c = Admin::Category.find_by_sql("Select id,caption_s as caption, description
                                     from categories "+ str )
      else

        c = Admin::Category.find_by_sql("Select id,caption_e as caption, description
                                     from categories "+ str )
    end
  end


  def self.sub_cat(id)
    case  I18n.locale.to_s

      when "en"
        e = Admin::Category.find_by_sql("Select id,caption_e as caption, description
                                     from categories  where parent_id = '#{id}' ")

      when "zh-TW"
        e = Admin::Category.find_by_sql("Select id,caption as caption, description
                                     from categories  where parent_id = '#{id}' ")

      when "zh-CN"
        e = Admin::Category.find_by_sql("Select id,caption_s as caption, description
                                     from categories  where parent_id = '#{id}' ")

      else
        e = Admin::Category.find_by_sql("Select id,caption_e as caption, description
                                     from categories  where parent_id = '#{id}' ")


    end
  end

end
