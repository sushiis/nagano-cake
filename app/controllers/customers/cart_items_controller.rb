class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :setup_cart_item!, only: [:update, :destroy, :destory_all]

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def create
      @cart_item = CartItem.new(cart_item_params)
      @item = @cart_item.item
      current_cart_items = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
          if current_cart_items.present?
           cart_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: current_customer.id)
            if @cart_item.amount != nil
              cart_item.update!(amount: cart_item.amount + @cart_item.amount)
              redirect_to cart_items_path
            else
              render "/customers/items/show"
            end
          else
            @cart_item.customer_id = current_customer.id
            if @cart_item.save
              redirect_to cart_items_path
            else
              render "/customers/items/show"
            end
          end

  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
    redirect_back fallback_location: @cart_item
  end

# カート詳細画面から、「削除」を押した時のアクション
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end


  private

  def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end



  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
