class Admin::HomesController < ApplicationController
  def top
    @orders = Order.find(params[:id])
    @order_details = Oder_detail.find(params[:id])
  end
end
