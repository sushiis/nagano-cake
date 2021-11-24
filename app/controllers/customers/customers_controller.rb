class Customers::CustomersController < ApplicationController
  def show
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_subscribed: true)
    reset_session
    flash[:notice] = "退会処理が完了しました。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :farst_name, :last_name_kana, :farst_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
