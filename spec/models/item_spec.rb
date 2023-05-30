require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
   end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '必要な情報があれば商品を出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'ユーザーがログインしていない出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
       it '商品の画像がないと出品できない' do
        @item.image.attach(nil)
        @item.valid?
        expect(@item.errors.full_messages).to include("Image must be attached")
       end     
      it '商品名がないと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリがないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態がないと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '送料の負担の説明がないと出品できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送元の地域がないと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数がないと出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '価格の情報がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は半角数値のみ保存可能である' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '価格は、¥300~¥9,999,999の間のみ保存可能である' do
        invalid_prices = [100, 10_000_000]
        invalid_prices.each do |price|
          @item.price = price
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid")
        end
      end
    end
  end
end

