class Admins::ItemsController < ApplicationController

  def index
    @items = Item.all
    @page = Item.all.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_items_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :status, :genre_id )
  end

end
