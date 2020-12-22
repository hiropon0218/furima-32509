class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end
end

private

def item_params
  params.require(:item).permit(:image, :item_name, :explanation, :category_id, :quality_id, :shipping_cost_id, :prefecture_id,
                               :ship_date_id, :price).merge(user_id: current_user.id)
end
