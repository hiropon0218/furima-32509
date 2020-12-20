class ItemsController < ApplicationController

  def new
    @item =Item.new
  end

  def create
  end
  
end

private

def item_parames
  prams.require(:item).permit(:image, :item_name, :explanation, :category_id, :quality_id, :shipping_cost_id, :prefecture_id, :ship_date_id )
end