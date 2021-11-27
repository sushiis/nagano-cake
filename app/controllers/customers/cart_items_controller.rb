class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :setup_cart_item!, only: [:update, :destroy, :destory_all]

  def index
    @cart_items = current_customer.cart_items.all
   # @subtotal = cart_items.sum(:price)
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def create
    # もし元々カート内に「同じ商品」がある場合、「数量を追加」更新・保存する
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_items = CartItem.find_by(item_id: params[:cart_item][:item_id])
                      #元々カート内にあるもの「item_id」
                      #今追加した. params[:cart_item][:item_id])
        @cart_items.amount += params[:cart_item][:amount].to_i
       #cart_item.quantityに今追加したparams[:cart_item][:quantity]を加える
                                                          #.to_iとして数字として扱う
        if @cart_items.save
          redirect_to cart_items_path
        else
          @cart_items = CartItem.find_by(item_id: params[:cart_item][:item_id])
          render :index
        end

      # もしカート内に「同じ」商品がない場合は通常の保存処理
    else
          @cart_items = CartItem.new(cart_item_params)
          @cart_items.customer_id = current_customer.id
          if @cart_items.save
            redirect_to cart_items_path
          else
            @cart_items = CartItem.new(cart_item_params)
            @cart_items.customer_id = current_customer.id
            render :index

          end
    end
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to current_cart
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
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
