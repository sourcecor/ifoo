class ShoppingController < ApplicationController
  before_action :set_current_user

  def index
    redirect_to action: :new  
  end

  def new
    @step = 'billing'
    render :billing
  end

  def create
    @step = params[:step] 

    case @step
      when "billing"
        session[:billing] = order_params[:billing]
        @step = 'shipping'
        render :shipping
      when "shipping"
        session[:shipping] = order_params[:shipping]
        puts session[:shipping][:name]
        @step = 'confirm'
        render :confirm
      when "confirm"
        @order = cart.build_order
        if @order.save
          cart.clear # 清除購物車
          redirect_to controller: :site, action: :index
        end
    end

  end

  def destroy
  	cart.del_item(params[:id])
  	redirect_to new_shopping_path
  end

private

  def order_params
    params.permit(:step, {shipping:[:name, :phone, :zipcode, :address, :receipt]}, {billing:[:paytype]})
  end

  def set_current_user
    session[:user] = current_user
  end

end
