class ShippingInformation < ApplicationRecord
  belongs_to :purchase

  validates :postal_code,    presence: true
  validates :prefecture_id,  presence: true
  validates :municipality,   presence: true
  validates :address,        presence: true
  validates :building_name
  validates :phone_number,   presence: true
       
end
