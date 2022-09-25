class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
  end
end


