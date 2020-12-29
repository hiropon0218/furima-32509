require 'rails_helper'

RSpec.describe UserShipping, type: :model do
  before do
    @user_shipping = FactoryBot.build(:user_shipping)
  end

  describe '商品購入機能' do
    context '商品購入が成功する時' do
      it 'token、郵便番号、都道府県、市区町村、番地、建物名、電話番号が存在する時' do
        expect(@user_shipping).to be_valid
      end

      it '建物名だけが存在しない場合' do
        @user_shipping.building_name = nil
        expect(@user_shipping).to be_valid
      end
    end

    context '商品購入が失敗する時' do
      it 'tokenが存在しない時' do
        @user_shipping.token = nil
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が存在しない時' do
        @user_shipping.postal_code = nil
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンが存在しない時' do
        @user_shipping.postal_code = '0123456'
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が存在しない時' do
        @user_shipping.prefecture_id = nil
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県のidが1(---)の時' do
        @user_shipping.prefecture_id = 1
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("Prefecture must be other than 1")
      end


      it '市区町村が存在しない時' do
        @user_shipping.municipality = nil
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が存在しない時' do
        @user_shipping.address = nil
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が存在しない時' do
        @user_shipping.phone_number = nil
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にハイフンが入っている時' do
        @user_shipping.phone_number = '090-1234-5678'
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("Phone number is invalid")

      end

      it '電話番号が12桁以上の時' do
        @user_shipping.phone_number = '123456789012'
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("Phone number is invalid")
      end
      
      it 'user_idが存在しない時' do
        @user_shipping.user_id = nil
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが存在しない時' do
        @user_shipping.item_id = nil
        @user_shipping.valid?
        expect(@user_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
