class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :params_input, except: [:index, :new, :create]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

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

  def edit
    # @item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def update
    # @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
    # @item = Item.find(params[:id])
  end

end

private

def item_params
  params.require(:item).permit(:image, :item_name, :explanation, :category_id, :quality_id, :shipping_cost_id, :prefecture_id,
                               :ship_date_id, :price).merge(user_id: current_user.id)
end

def params_input
  @item = Item.find(params[:id])
end