class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find_params

  def index
    @user_shipping = UserShipping.new
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.purchase != nil
      redirect_to root_path
    end
  end

  def create
    @user_shipping = UserShipping.new(shipping_information_params)
    if @user_shipping.valid?
       pay_item
       @user_shipping.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def shipping_information_params
  params.require(:user_shipping).permit(:postal_code, :prefecture_id, :municipality, 
    :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: shipping_information_params[:token],
      currency: 'jpy'
    )
  end

  def item_find_params
    @item = Item.find(params[:item_id])
  end
end

