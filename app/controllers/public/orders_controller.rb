class Public::OrdersController < ApplicationController



    def new
    @order = Order.new
    end


    def index
    @order = current_customer.orders.all
    @order_details = OrderDetail.all
    end

    def show
      @order = Order.find(params[:id])
      @order_details = @order.order_details
      @total = 0
    end

    def create
      cart_items = current_customer.cart_items
      @order = current_customer.orders.new(order_params)
      if @order.save
        cart_items.each do |cart|
          order_item = OrderDetail.new
          order_item.item_id = cart.id
          order_item.order_id = @order.id
          order_item.quantity = Cart.quantity
          order_item.tax_included_price = cart.item.net_price*1.1
          order_item.make_status = 0
          order_item.save
        end
        redirect_to thanx_path
        cart_items.destroy_all

        render :new
      end
    end

    def thanx

    end

    def confirm
        @order = Order.new(order_params)
        @postage = 800
        @cart_items = current_customer.cart_items.all
        @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }


    #自身の住所の場合
        if params[:order][:select_address] == "0"
            @order = Order.new(order_params)
            @order.postal_code = current_customer.post_code
            @order.shipping_address = current_customer.address
            @order.name = current_customer.first_name + current_customer.last_name

        #登録済みの住所の場合
        elsif params[:order][:select_address] == "1"
        if  params[:order][:customer_id] == ""
            flash[:notice] = "お届け先の登録済住所を選択してください"
            redirect_to new_order_path
        else
            @order = Order.new(order_params)
            @address = Deliveries.find(params[:order][:customers_id])
            @order.postal_code = @address.post_code
            @order.shippig_address = @address.address
            @order.name = @address.name
        end

        # 新しいお届け先
        elsif params[:order][:select_address] = "2"
            @order = Order.new
            @order.postal_code = params[:order][:postal_code]
            @order.shipping_address = params[:order][:shipping_address]
            @order.name = params[:order][:name]
            @order.payment_method = params[:order][:payment_method]
        end
    end


    private

    def order_params
        params.require(:order).permit(:payment_method, :postal_code, :shipping_address, :name, :postage, :total_price, :order_status, :customer_id)
    end


    def address_params
      params.require(:order).permit(:name, :address, :delivery_id)
    end
    
    
    def order_item_params
      params.require(:order_item).permit(:item_id, :order_id, :quantity, :subprice, :order_status)
    end

end



