class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = Order.order_details
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"#view で定義している address_option が"0"だったときにこの処理を実行
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address# form_with で @order で送っているので、order に紐付いた address_option
      @order.name = current_customer.last_name + current_customer.farst_name
    elsif params[:order][:address_option] == "1"
      @order.postal_code = address.postal_code
      @order.address = address.postal_code
      @order.name = address.postal_code
    else
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.postal_code
      @order.name = current_customer.postal_code
    end
    @cart_items = current_customer.cart_items
    @postage = 800

  end

  def create
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :way, :postal_code )
  end

end
