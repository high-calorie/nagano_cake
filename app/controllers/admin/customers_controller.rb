class Admin::CustomersController < ApplicationController

  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
     customers = Customer.find(params[:id])
     customers.update(customer_params)
    # redirect_to admin_customers_edit_path
  end

  private
  def customer_params
    params.require(:customer).permit(:adress) #pemit内のカラム不十分
  end

end
