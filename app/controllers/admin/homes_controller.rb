class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @order_details = Oder_detail.find(params[:id])
  end
end
