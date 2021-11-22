class Customers::CustomersController < ApplicationController
  def show

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_my_page_path(customer)
  end


end
