class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :product_condition_id, :shipping_charge_id, :prefecture_id, :schedule_id, :price, :image).merge(user_id: current_user.id)
end

