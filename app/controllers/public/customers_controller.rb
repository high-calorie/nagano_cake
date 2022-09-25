class Public::CustomersController < ApplicationController
    

  def show
      @customer = current_customer
  end
    
  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(withdrawal_flag: true)
    reset_session
    redirect_to root_path
  end

    

    
  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(withdrawal_flag: true)
    reset_session
    redirect_to root_path
  end

 private
 
 def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_pasward, :post_code, :phone_namber, :address, :withdrawal_flag)
 end
    
end
