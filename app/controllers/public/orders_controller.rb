class Public::OrdersController < ApplicationController
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
            @order.post_code = params[:order][:post_code]
            @order.shipping_address = params[:order][:shipping_address]
            @order.name = params[:order][:name]
            @order.payment_method = params[:order][:payment_method]
        end

    
    end
    
    private
    def order_params
        params.require(:order).permit(:payment_method, :postal_code, :shipping_address, :name, :postage, :total_price, :orders_status )
    end
    
    
end