class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :imege

  validetes :item_name,         presence: true, length: { maximum: 40 }
  validates :explanation,       presence: true, length: { maximum: 1000 }
  validates :category_id,       presence: true
  validates :quality_id,        presence: true
  validates :shipping_cost_id,  presence: true
  validates :prefecture_id,     presence: true
  validatas :ship_date_id,      presence: true
  validates :price,             presence: true
  validates :imege,             presence: true
end
