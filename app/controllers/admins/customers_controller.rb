class Admins::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @page = Item.all.page(params[:page]).per(10)

  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  end

end
