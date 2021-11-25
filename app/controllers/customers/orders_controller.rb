class Customers::OrdersController < ApplicationController

  def index
    @orders = current_customer.order
    @items = Order.items
  end

  def show
    @order = Order.find(params[:id])
    @order_details = Order.order_details
  end

end
