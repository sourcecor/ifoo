class Admin::CategoriesController < Admin::BaseController
  #
  before_action :set_record, :only => [:show, :edit, :update, :destroy]

  def index
    @categories_grid = initialize_grid(Admin::Category.where("(parent_id IS NULL or parent_id =0)"), per_page: 15)
  end

  def new
    @category = Admin::Category.new
  end

  def create
    @category = Admin::Category.new(category_params)
    if @category.save
      flash[:notice] = '新增成功'
      redirect_to :action => :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:notice] = '修改成功'
      redirect_to :action => :index
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = '刪除成功'
    redirect_to :action => :index
  end

private

  def set_record
    @category = Admin::Category.find(params[:id])
  end

  def category_params
    params.require(:admin_category).permit(:caption, :description, :parent_id, :seq,
      {sub_categories_attributes: [:parent_id, :id, :caption, :description, :seq, :_destroy]})

  end
end
