class Public::DeliveriesController < ApplicationController
  def index
    @deliveries = current_customer.deliveries
  	@delivery = Delivery.new
  end

  def edit
    @delivery =Delivery.finf(params[:id])
  end

  def create
    @delivery = Delivery.new(delivery_params)
	  @delivery.customer_id = current_customer.id
    @deliveries = current_customer.delivery
	  if @delivery.save
	  else
	    render 'index'
	  end
  end

  def update
    @delivery = Delivery.find(params[:id])
	  if @delivery.update(delivery_params)
     redirect_to customers_delivery_path
	  else
	   render "edit"
	  end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
	  @delivery.destroy
    @deliveries = current_customer.delivery
  end

  private

	def delivery_params
  	params.require(:delivery).permit(:post_code, :address, :name)
  end
end
