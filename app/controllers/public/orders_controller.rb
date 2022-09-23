class Public::OrdersController < ApplicationController
  def index
    @order = current_customer.orders.all
  end

  def show
  end
end


