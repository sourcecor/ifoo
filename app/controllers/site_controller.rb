class SiteController < ApplicationController

  def index
    #flash[:notice] =   I18n.locale
    # if params[:locale] != ''
    #   cart.clear
    # end

    # if !params[:locale].nil?
    #   cart.clear
    # end
    if params[:locale].to_s !=''
      cart.clear
    end
    # case  params[:locale]
    #   when "en"
    #   # if  cart.cart_count > 0
    #   #   cart.clear
    #   # end
    #     cart.clear
    #   when "zh-TW"
    #     cart.clear
    #   when "zh-CN"
    #     cart.clear
    # end
  end

  def find
    keywords = params[:keywords]
    if !keywords.blank?
      # @products = Admin::Product.all

      # @products = @products.where(["caption LIKE ?", "%#{keywords}%"])
      #   categories = Admin::Category.where(["caption LIKE ?", "%#{keywords}%"])
      #   @products = categories.first.products unless categories.first.nil?
      # end

      @products = Admin::Product.iwhere(" where caption LIKE '%#{keywords}%' ")

      if @products.empty?
        @products = Admin::Product.cwhere("  '%#{keywords}%' ")
      end

    else
      redirect_to :action => :index
    end
  end

  def show
    if !params[:id].blank?
      #@product = Admin::Product.find(params[:id])
      @product = Admin::Product.iwhere(" where id = '#{params[:id]}' ")
      @pictures = Admin::ProductMainPicture.where(["product_id = ?", "#{params[:id]}"])
      @profiles = Admin::ProductProfilePicture.where(["product_id = ?", "#{params[:id]}"])
    else
      redirect_to :action => :index
    end
  end

  def spec
    if request.xhr?
      #@product = Admin::Product.find(query_params[:id])
          # .sub_products.select('id, product_id, itemcode, qty, size, color')
          # .where(["size = ? and color = ? ", query_params[:size], query_params[:color] ]).first

      case I18n.locale.to_s
        when "en"
          @product = Admin::Product.find(query_params[:id])
            .sub_products.select('id, product_id, itemcode, qty, size_e as size, color_e as color')
            .where(["size_e = ? and color_e = ? ", query_params[:size], query_params[:color] ]).first

        when "zh-TW"
          @product = Admin::Product.find(query_params[:id])
            .sub_products.select('id, product_id, itemcode, qty, size, color')
            .where(["size = ? and color = ? ", query_params[:size], query_params[:color] ]).first

        when "zh-CN"
          @product = Admin::Product.find(query_params[:id])
            .sub_products.select('id, product_id, itemcode, qty, size_s as size, color_s as color')
            .where(["size_s = ? and color_s = ? ", query_params[:size], query_params[:color] ]).first

        else
          @product = Admin::Product.find(query_params[:id])
            .sub_products.select('id, product_id, itemcode, qty, size_e as size, color_e as color')
            .where(["size_e = ? and color_e = ? ", query_params[:size], query_params[:color] ]).first

      end
      # case I18n.locale.to_s
      #   when "en"
      #     .sub_products.select('id, product_id, itemcode, qty, size_e as size, color_e as color')
      #     .where(["size_e = ? and color_e = ? ", query_params[:size], query_params[:color] ]).first

      #   when "zh-TW"
      #     .sub_products.select('id, product_id, itemcode, qty, size, color')
      #     .where(["size = ? and color = ? ", query_params[:size], query_params[:color] ]).first

      #   when "zh-CN"
      #     .sub_products.select('id, product_id, itemcode, qty, size_s as size, color_s as color')
      #     .where(["size_s  = ? and color_s = ? ", query_params[:size], query_params[:color] ]).first

      #   else
      #     .sub_products.select('id, product_id, itemcode, qty, size, color')
      #     .where(["size = ? and color = ? ", query_params[:size], query_params[:color] ]).first

      # end
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
