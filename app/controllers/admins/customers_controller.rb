class Admins::CustomersController < ApplicationController
  def index
  end
  
  def edit
    @customer = current_customer
  end
  
end
