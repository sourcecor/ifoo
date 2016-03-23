class Admin::MenusController < Admin::BaseController
	before_action :set_record, :only => [:show, :edit, :update, :destroy]

	def index
		@menus_grid = initialize_grid(Admin::Menu.where("(parent_id IS NULL or parent_id =0)"), per_page: 15)
	end

	def new
		@menu = Admin::Menu.new
		# @sub_menus  = @menu.sub_menus.build # new a sub-item
	end

	def create
		@menu = Admin::Menu.create(menu_params)
		if @menu.save
			flash[:notice] = '新增成功'
			redirect_to :action => 'index'
		else
			render :new
		end
	end

	def edit
		# @sub_menus  = @menu.sub_menus.build # new a sub-item
	end

	def update
		if @menu.update_attributes(menu_params)
			flash[:notice] = '修改成功'
			redirect_to :action => 'index'
		else
			render :edit
		end
	end

	def destroy
    @menu.destroy
	  flash[:notice] = '資料已刪除'
	  redirect_to :action => 'index'
	end

private

  def set_record
    @menu = Admin::Menu.find(params[:id])
  end

	def menu_params
		params.require(:admin_menu).permit(:caption, :action, :position, :seq,
			{sub_menus_attributes: [:parent_id, :id, :caption, :action, :position, :seq, :_destroy]})
	end

end
