class Admins::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_derails = @order.order_details
  end
  
  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      redirect_to admins_order_path(order.id)
    else
      @order = Order.find(params[:id])
      @order_derails = @order.order_details
      render :show
    end
      
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end

end
