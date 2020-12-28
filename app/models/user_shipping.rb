class UserShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchases_id, :user_id, :item_id



#ここからshpping_informationモデルのバリデーション
validates :postal_code,    presence: true,  format: {with: /\A\d{3}[-]\d{4}\z/, massage: 'Postal code input correctly'}
validates :prefecture_id,  presence: true,  numericality: { other_than: 1 }
validates :municipality,   presence: true
validates :address,        presence: true
validates :phone_number,   presence: true,  format: {with: /\A0\d{10,11}\z/, massage: 'Phone number Input only number'}
#/ここまでshipping_informationのバリデーション

  def save 
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    ShippingInformation.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, 
                address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id )            
  end

end