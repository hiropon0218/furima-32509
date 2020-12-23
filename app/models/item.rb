class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :ship_date
  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :quality_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :ship_date_id
  end

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
