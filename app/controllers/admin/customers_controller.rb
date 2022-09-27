class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.page(params[:page]).per(10)
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
     @customers = Customer.find(params[:id])
     @customers.update(customer_params)
     redirect_to admin_customer_path(@customers)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:post_code,:address,:phone_namber,:email,:payment_method,:withdrawal_flag)
  end

end
