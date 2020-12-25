class Purchase < ApplicationRecord
  belongs_to :users
  belongs_to :items
  has_one :shipping_information

end
