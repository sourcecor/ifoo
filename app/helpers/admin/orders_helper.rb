module Admin::OrdersHelper
   def render_order_timestamp(order)
    #order.created_at.to_s(:long)
    order.created_at.strftime("%Y-%m-%d  %H:%M")
  end

  def render_order_state(order)
    t("orders.order_state.#{order.aasm_state}")
  end

end
