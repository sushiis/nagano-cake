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
    if params[:order][:address_option] == "0"#view で定義している address_option が"0"だったときにこの処理を実行
      @order.address = current_customer.address# form_with で @order で送っているので、order に紐付いた address_option
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.farst_name
    elsif params[:order][:address_option] == "1"

    else

    end
  end

  def create
  end

end
