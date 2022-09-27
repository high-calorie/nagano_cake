class Public::CustomersController < ApplicationController


  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

  def show
    @customer = current_customer
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(withdrawal_flag: false)
    reset_session
    redirect_to homes_top_path
  end

  def deleted
    @customer = current_customer
    @customer.update(withdrawal_flag: false)
    flash[:notice] = "退会処理を実行いたしました"
    reset_session
    redirect_to root_path
  end

 private

 def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_pasward, :post_code, :phone_namber, :address, :withdrawal_flag)
 end

end
