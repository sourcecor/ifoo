class Admin::ProductsController < Admin::BaseController
  # 
  before_action :set_record, :only => [:show, :edit, :update, :destroy]

  def index
    @products_grid = initialize_grid(Admin::Product.all, per_page: 15)
  end

  def new
    @product = Admin::Product.new
  end

  def create
    @product = Admin::Product.create(product_params)
    if @product.save
      flash[:notice] = '新增成功'
      redirect_to :action => 'index'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      # 圖片在存檔時沒有更新seq欄位, 在找到解決方案前, 先手動方式處理
      if !params[:admin_product][:main_pictures_attributes].nil?
        params[:admin_product][:main_pictures_attributes].each do |k, v|
          Admin::ProductMainPicture.find(v[:id]).update_attribute(:seq, v[:seq]) unless !Admin::ProductMainPicture.exists?(:id => v[:id])
        end
      end

      # 圖片在存檔時沒有更新seq欄位, 在找到解決方案前, 先手動方式處理
      if !params[:admin_product][:profile_pictures_attributes].nil?
        params[:admin_product][:profile_pictures_attributes].each do |k, v|
          Admin::ProductProfilePicture.find(v[:id]).update_attribute(:seq, v[:seq]) unless !Admin::ProductProfilePicture.exists?(:id => v[:id])
        end
      end

      flash[:notice] = '修改成功'
      redirect_to :action => 'index'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = '刪除成功'
    redirect_to :action => 'index'
  end

private

  def set_record
    @product = Admin::Product.find(params[:id])
  end

  def product_params
    params.require(:admin_product).permit(:id, :caption, :description, :unit_price, :sale_price, :cost, :itemcode, 
      {sub_products_attributes: [:id, :size, :color, :qty, :itemcode, :seq, :_destroy]}, 
      {main_pictures_attributes: [:id, :image_cache, :image, :seq, :_destroy]},
      {profile_pictures_attributes: [:id, :image_cache, :image, :seq, :_destroy]},
      category_ids:[]
    )
  end
end
