class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
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
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @postage = 800

  end

  def create
    @order = Order.new(order_params)
    @order.postage = 800
    @cart_items = current_customer.cart_items
    @order.total_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.status = 0
    @order.customer_id = current_customer.id
    @order.save
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item.id
        @order_detail.amount = cart_item.amount
        @order_detail.price = cart_item.item.price
        @order_detail.making_status = 0
        @order_detail.save
      end
    @cart_items.destroy_all
    redirect_to thanx_path
  end

  def thanx
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :way, :postal_code, :postage, :total_price, :status)
  end

end
