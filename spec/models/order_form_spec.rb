require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
   end

  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it '必要な情報があれば商品を購入できる' do
        expect(@order_form).to be_valid
      end
    end
  end

    context '商品購入ができない場合' do
      it 'ログイン中のユーザーでないと購入できない' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it '売却済みの商品は購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
        end
      
       it '郵便番号がないと購入できない' do
        @order_form.zipcode = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Zipcode can't be blank")
      end

      it '郵便番号は「3桁ハイフン4桁」の半角文字列のみ保存可能' do
        @order_form.zipcode = '123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Zipcode input correctly")
      end

      it '都道府県が必須であること' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @order_form.street = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が必須であること' do
        @order_form.phone = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能' do
        @order_form.phone = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone input only number")
      end

      it 'クレジットカード情報は必須である' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

    end

end