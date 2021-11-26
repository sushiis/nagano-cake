class Customers::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end


  def update
    customer = current_customer
    if customer.update(customer_params)
      redirect_to customers_my_page_path(customer)
    else
      @customer = current_customer
      render :show
    end
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
