class SiteController < ApplicationController

  def index
    
  end

  def find
    keywords = params[:keywords]
    if !keywords.blank?
      @products = Admin::Product.all
      @products = @products.where(["caption LIKE ?", "%#{keywords}%"])
      if @products.empty?
        categories = Admin::Category.where(["caption LIKE ?", "%#{keywords}%"])
        @products = categories.first.products unless categories.first.nil?
      end
    else
      redirect_to :action => :index
    end
  end

  def show
    if !params[:id].blank?
      @product = Admin::Product.find(params[:id])
    else
      redirect_to :action => :index
    end
  end

  def spec
    if request.xhr?
      @product = Admin::Product.find(query_params[:id])
        .sub_products.select('id, product_id, itemcode, qty, size, color')
        .where(["size = ? and color = ? ", query_params[:size], query_params[:color] ]).first
      render :json => @product
    end
  end

  def cart_add
    cart.add_item(query_params)
    redirect_to site_path(query_params[:id])
  end

  def cart_del
    # if request.xhr?
      cart.del_item(params[:itemcode])
      redirect_to site_path(params[:id])
      # render :json => params[:itemcode]
    # end
  end
	
  def query_params
    params.require(:buy).permit(:id, :caption, :img, :buy_count, :item_id, :itemcode, :color, :size, :sale_price)
  end
end
