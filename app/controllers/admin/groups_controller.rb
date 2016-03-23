class Admin::GroupsController < Admin::BaseController
  
  before_action :set_record, :only => [:show, :edit, :update, :destroy]

  def index
    @groups_grid = initialize_grid(Admin::Group.all, per_page: 15)
  end

  def new
    @group = Admin::Group.new 
  end

  def create
    @group = Admin::Group.create(group_params)
    if @group.save
      flash[:notice] = '新增成功'
      redirect_to :action => :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update_attributes(group_params)
      flash[:notice] = '修改成功'
      redirect_to :action => :index
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    flash[:notice] = '刪除成功'
    redirect_to :action => :index
  end

private
  
  def set_record
    @group = Admin::Group.find(params[:id])
  end
    
  def group_params
    params.require(:admin_group).permit(:caption, user_ids:[], menu_ids:[])
    
  end

end
