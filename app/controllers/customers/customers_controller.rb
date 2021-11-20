class Customers::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  def withdraw
    @customer = current_customer
  end
end
