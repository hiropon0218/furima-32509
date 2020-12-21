class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :ship_date
  belongs_to :user
  has_one_attached :image

  validates :item_name,         presence: true, length: { maximum: 40 }
  validates :explanation,       presence: true, length: { maximum: 1000 }
  validates :category_id,       numericality: { other_than: 1 }
  validates :quality_id,        numericality: { other_than: 1 }
  validates :shipping_cost_id,  numericality: { other_than: 1 }
  validates :prefecture_id,     presence: true
  validates :ship_date_id,      presence: true
  validates :price,             presence: true
  validates :image,             presence: true
end
