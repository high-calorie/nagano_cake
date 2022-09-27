class Public::OrdersController < ApplicationController



    def new
        @order = Order.new
    end


    def index
    @orders = Order.all
    @order_details = OrderDetail.all
    end

    def show
      @order = Order.find(params[:id])
      @order_details = @order.order_details
      @total = 0
    end

    def create
      cart_items = current_customer.cart_items
    # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
      @order = current_customer.orders.new(order_params)
    # 渡ってきた値を @order に入れます
      if @order.save
        cart_items.each do |cart|
    # 取り出したカートアイテムの数繰り返します
    # order_item にも一緒にデータを保存する必要があるのでここで保存します
          order_item = OrderDetail.new
          order_item.item_id = cart.item_id
          order_item.order_id = @order.id
          order_item.quantity = cart.quantity
    # 購入が完了したらカート情報は削除するのでこちらに保存します
          order_item.tax_included_price = cart.item.net_price*1.1
          order_item.make_status = 0
    # カート情報を削除するので item との紐付けが切れる前に保存します
          order_item.save
        end
        redirect_to orders_path
        cart_items.destroy_all
    # ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
      else
        @order = Order.new(order_params)
        render :new
      end
    end


    def confirm
        @order = Order.new(order_params)
        @postage = 800
        @cart_items = current_customer.cart_items.all
        @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }


    #自身の住所の場合
        if params[:order][:select_address] == "0"
            @order = Order.new(order_params)
            @order.postal_code = current_customer.postal_code
            @order.shippig_address = current_customer.shippig_address
            @order.name = current_customer.first_name + current_customer.last_name

        #登録済みの住所の場合
        elsif params[:order][:select_address] == "1"
        if  params[:order][:customer_id] == ""
            flash[:notice] = "お届け先の登録済住所を選択してください"
            redirect_to new_order_path
        else
            @order = Order.new(order_params)
            @address = Address.find(params[:order][:customers_id])
            @order.postal_code = @address.postal_code
            @order.shippig_address = @address.shippig_address
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
        params.require(:order).permit(:payment_method, :postal_code, :shipping_address, :name, :postage, :total_price, :orders_status, :customer_id)
    end


    def address_params
      params.require(:order).permit(:name, :address)
    end
    
    
    def order_item_params
      params.require(:order_item).permit(:item_id, :order_id, :quantity, :subprice, :order_status)
    end

end



