require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品が成功する時' do
      it '出品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が存在する' do
        expect(@item).to be_valid
      end
    end

    context '商品出品が失敗する時' do
      it '画像が存在しない時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が存在しない時' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が存在しない時' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'カテゴリーが選択されていない時' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it '商品の状態が選択されていない時' do
        @item.quality_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Quality is not a number')
      end

      it '配送料の負担が選択されていない時' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost is not a number')
      end

      it '発送元の地域が選択されていない時' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end

      it '発送までの日数が選択されていない時' do
        @item.ship_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship date is not a number')
      end

      it '販売価格が存在しない時' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が299円以下の時' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が10,000,000円以上の時' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
