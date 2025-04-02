require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '購入できるとき' do
      it '必要な情報を全て正しく入力すれば購入できる' do
        expect(@order_form).to be_valid
      end

      it "tokenがあれば保存ができること" do
        expect(@order_form).to be_valid
      end


      it '建物名が空でも購入できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end


    context '購入できないとき' do
      it '郵便番号が空では購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号が「3桁-4桁」でないと購入できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Postal code is invalid. Include a hyphen (e.g. 123-4567)'
      end
      it '都道府県が1では購入できない' do
        @order_form.shipping_area_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Shipping area can't be blank"
      end
      it '市区町村が空では購入できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空では購入できない' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Street address can't be blank"
      end
      it '電話番号が空では購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号が9桁以下では購入できない' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号が12桁以上では購入できない' do
        @order_form.phone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号にハイフンが入っていると購入できない' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号が英数混合では購入できない' do
        @order_form.phone_number = '090abcd5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'user_idが空では購入できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空では購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Item can't be blank"
      end


      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end