class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
 with_options presence: true do
  validates :nickname
  validates :birthday
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Input half-width alphanumeric characters."}
 end
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters."} do      
    validates :last_name_kanji 
    validates :first_name_kanji
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."} do
    validates :last_name_katakana  
    validates :first_name_katakana
  end

end
