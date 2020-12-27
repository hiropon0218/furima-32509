class UserShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchases_id, :user_id, :item_id



#ここからshpping_informationモデルのバリデーション
validates :postal_code,    presence: true
validates :prefecture_id,  presence: true
validates :municipality,   presence: true
validates :address,        presence: true
validates :phone_number,   presence: true
#/ここまでshipping_informationのバリデーション

  def save 
    #purchaseを作る（保存）
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    #/purchaseを作る（保存）
    ShippingInformation.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, 
                address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id )            
  end

end