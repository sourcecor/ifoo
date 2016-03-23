class Cart

  #Initalize Cart Session
  def initialize(session)
      @cart_data = session 
      @cart_data[:cart] ||= {}
  end

  def add_item(item)
    if @cart_data[:cart].has_key?(item[:itemcode])
      _item = @cart_data[:cart][item[:itemcode]]
      _item["buy_count"] = _item["buy_count"].to_i + item[:buy_count].to_i
    else
     @cart_data[:cart][item[:itemcode]] = item
    end
  end

  def del_item(item)
    if @cart_data[:cart].has_key?(item)
       @cart_data[:cart].delete(item)
    end
  end

  #Cart Count
  def cart_count
    amount = 0 
    if !@cart_data[:cart].empty?
      @cart_data[:cart].each do |key, item| amount += item["buy_count"].to_i end
    end
    return amount
  end

  #Cart Contents
  def cart_contents
    products = @cart_data[:cart]
  end

  #Qty & Price Count
  def subtotal
    products = cart_contents

    #Get subtotal of the cart items
    subtotal = 0
    unless products.blank?
      products.each do |key, item|
        subtotal =  subtotal + (item["sale_price"].to_f * item["buy_count"].to_f)
      end
    end
    return subtotal.round
  end

  #Build Hash For ActiveMerchant
  def build_order

    @order = Order.new
    @order.qty_amount = cart_count
    @order.total_amount = subtotal
    @order.user_id = @cart_data[:user].id
    @order.shipping_name =    @cart_data[:shipping]["name"]
    @order.shipping_phone =   @cart_data[:shipping]["phone"]
    @order.shipping_zipcode = @cart_data[:shipping]["zipcode"]
    @order.shipping_address = @cart_data[:shipping]["address"]
    cart_contents.each do |key, item|
      detail = @order.order_details.build
      detail.itemcode   = key
      detail.itemname   = item["caption"]
      detail.product_id = item["id"]
      detail.price      = item["sale_price"]
      detail.qty        = item["buy_count"]
      detail.color      = item["color"]
      detail.size       = item["size"]
    end

    return @order
  end

  def clear
    @cart_data[:cart] = nil
    @cart_data[:user] = nil
    @cart_data[:billing] = nil
    @cart_data[:shipping] = nil
  end

  #Build JSON Requests
  def build_json
    session = @session[:cart][:products]
    json = {:subtotal => self.subtotal.to_f.round(2), :qty => self.cart_count, :items => Hash[session.uniq.map {|i| [i, session.count(i)]}]}
    return json
  end
end