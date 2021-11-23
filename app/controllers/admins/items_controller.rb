class Admins::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    @items.genre_id = Item.new(item_params)
    @items.save
    redirect_to admins_items_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :status, :genre_id)
  end

end
