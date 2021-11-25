class Customers::CartItemsController < ApplicationController
  before_action :setup_cart_item!, only: [:create, :update, :destroy, :destory_all]

  def index
    @cart_items = current_customer.cart_items
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def create

    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
    end

    @cart_item.amount += params[:amount].to_i
    @cart_item.save
    redirect_to current_cart
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to current_cart
  end

# カート詳細画面から、「削除」を押した時のアクション
  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end

  def destroy_all
    if current_customer.cart_items.destoy_all
       session[:cart_item_id] = nil
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items
      render "index"
    end
  end


  private

  def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end



  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
