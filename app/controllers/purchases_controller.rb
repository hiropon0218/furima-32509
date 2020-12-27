class PurchasesController < ApplicationController
  
  def index
    @user_shipping = UserShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @user_shipping = UserShipping.new(shipping_information_params)
    if @user_shipping.valid?
       @user_shipping.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def shipping_information_params
  params.require(:user_shipping).permit(:postal_code, :prefecture_id, :municipality, 
    :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end

