class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
		@order_details = @order.order_details
  end

  def update
		@order = Order.find(params[:id])
	  @order_details = @order.order_details
    @order.update(order_params)
    if @order.order_status == "1"
       @order_details.update_all(make_status: "1")
    end
    redirect_to admin_order_path
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :shipping_address, :name, :postage, :total_price, :order_status)
  end
end