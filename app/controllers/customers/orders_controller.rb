class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.order
    @items = Order.items
  end

  def show
    @order = Order.find(params[:id])
    @order_details = Order.order_details
  end
  
  def new
    @order = Order.new
    @customer = current_customer
  end

end
