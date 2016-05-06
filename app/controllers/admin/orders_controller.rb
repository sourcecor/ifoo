class Admin::OrdersController <  Admin::BaseController
  #
  before_action :set_record, :only => [:show, :edit, :update, :destroy]

  def index
    if !params[:filter].blank?
     # @orders_grid = initialize_grid(Order.where("aasm_state ='#{params[:filter]}'"),include:  :user,  per_page: 15)
      @orders_grid = initialize_grid(
           Order.where("aasm_state ='#{params[:filter]}'"),

           per_page: 15
      )
    else
     # @orders_grid = initialize_grid(Order.where("aasm_state ='paid'"),   per_page: 15)

      @orders_grid = initialize_grid(
            Order.where("aasm_state ='paid'"),

            per_page: 15
      )
    end
    session[:aasm_state] =  params[:filter]
    #@status = params[:filter]
  end

  def show
    @order_detail_grid = initialize_grid(
         OrderDetail.where(id:  @order.id),
         per_page: 15
    )
  end

  def create

    @status = params[:filter][:status]
    redirect_to action: :index, filter: @status
  end

  def edit

   @order_detail_grid = initialize_grid(
        OrderDetail.where(id:  @order.id),
        per_page: 15
   )

  end

  def cancel_order     #取消訂單  =>  order_placed -> cancel_closed
    set_record
    @order.cancel_order!
    redirect_to action: :index, filter: session[:aasm_state]

  end

  def make_payment      #訂單付款  => order_placed -> paid
    set_record
    @order.make_payment!
    redirect_to action: :index, filter: session[:aasm_state]

  end

  def ask_for_cancel    #取消訂單 申請退款  =>  paid -> paid_on_return
    set_record
    @order.ask_for_cancel!
    redirect_to action: :index, filter: session[:aasm_state]
  end

  def paid_return    #訂單取消退款  =>  paid_on_return -> cancel_closed
    set_record
    @order.paid_return!
    redirect_to action: :index, filter: session[:aasm_state]
  end

  def ship           #出貨   => paid => shipping
    set_record
    @order.ship!
    redirect_to action: :index, filter: session[:aasm_state]
  end

  def deliver        #寄送  => shipping => shipped
    set_record
    @order.deliver!
    redirect_to action: :index, filter: session[:aasm_state]
  end

  def wait_ten_days      #等待十天鑑賞  => shipped => ship_closed
    set_record

    @order.wait_ten_days!

    redirect_to action: :index, filter: session[:aasm_state]
  end

  def ask_for_return     #客戶要求退貨  => shipped => goods_on_return
    set_record
    @order.ask_for_return!
    redirect_to action: :index, filter: session[:aasm_state]
  end

  def return_goods     #客戶要求退貨  => goods_on_return => goods_returned
    set_record
    @order.return_goods!
    redirect_to action: :index, filter: session[:aasm_state]
  end

  def make_payback     #退貨退款  => goods_returned => return_closed
    set_record
    @order.make_payback!
    redirect_to action: :index, filter: session[:aasm_state]
  end

  def update

    #case @order.status
    #  when "ship"
    #      ship
    #  else
         # redirect_to action: :index, filter: session[:aasm_state]
    #end

    if @order.update_attributes(order_params)
      #flash[:notice] = order_params[:title]
      flash[:notice] = '修改成功'
      #case @order.title
      case order_params[:title]
        when "ship"
          ship
        else
          redirect_to action: :index, filter: session[:aasm_state]

      end

      #flash[:notice] = '修改成功'


      #case params[:act]
      #  when "ship"
      #    ship
      #  else
      #    flash[:notice] = params[:act]
      #end


      #redirect_to action: :index, filter: @status
      #redirect_to action: :index, filter: session[:aasm_state]
    else
      render :edit
    end
  end



  private

  def set_record

    @order =  Order.find(params[:id])
    @order.edituser = current_admin_user.username
  end

  def order_params
    params.require(:order).permit(:user_id,:total_amount,:qty_amount,:shipping_name,
      :shipping_phone,:shipping_zipcode,:shipping_address,:status,:trsno,:title,
      {order_details_attributes: [:order_id,:qty,:price,:product_id,:color,:size,:itemcode,:itemname]});

  end



end
