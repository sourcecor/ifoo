class Admin::Menu < ActiveRecord::Base
	self.table_name = "menus"
	# action
	before_save # 後面可接定義的方法
	# validate
	validates :caption, :action, :position, presence: true

	# relation
	belongs_to :main_menu, class_name: "Admin::Menu"
	has_many :menus, -> { order(:seq) }, class_name: "Admin::MenuUser", foreign_key: "parent_id"
	## order 必須放在 relativ name 之後。另外 :order的方法在rails 4 已經捨棄, 須改用 lambda
	has_many :sub_menus, -> { order(:seq) }, class_name: "Admin::Menu", foreign_key: "parent_id", dependent: :destroy
	accepts_nested_attributes_for :sub_menus, allow_destroy: true, :reject_if => lambda { |a| a[:caption].blank? }
	# remove from related table
	after_destroy { |record|
		ActiveRecord::Base.connection.execute("DELETE from groups_menus where menu_id = '#{record.id}'")
	}
	#
	def position_string
		case position.to_s
		when 'top'
			'上方'
		when 'side'
			'側邊'
		when 'header'
			'標題'
		when 'divider'
			'分隔線'
		when 'item'
			'功能項目'
		end
	end

	def removable_string
		case removable.to_i
		when 0
			'否'
		when 1
			'可'
		end
	end
end
