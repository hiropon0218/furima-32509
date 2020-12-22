class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :ship_date
  belongs_to :user
  has_one_attached :image

  validates :item_name,         presence: true
  validates :explanation,       presence: true
  validates :category_id,       numericality: { other_than: 1 }
  validates :quality_id,        numericality: { other_than: 1 }
  validates :shipping_cost_id,  numericality: { other_than: 1 }
  validates :prefecture_id,     numericality: { other_than: 1 }
  validates :ship_date_id,      numericality: { other_than: 1 }
  validates :price,             presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image,             presence: true
end
