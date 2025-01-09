require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe 'アイテムの購入' do
    context 'アイテムが購入できる場合' do
      it '全ての情報が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context 'アイテムが購入できない場合' do
      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeがハイフンなしでは購入できない' do
        @order_address.postal_code = '4444444'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end

      it 'cityが空では購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end

      it 'prefecture_idが空では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'addressesが空では購入できない' do
        @order_address.addresses = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Addresses can't be blank"
      end

      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is too short (minimum is 10 characters)'
      end

      it 'phone_numberが全角文字では購入できない' do
        @order_address.phone_number = '０５６７３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
      end

      it 'phone_numberが9桁以下では購入できない' do
        @order_address.phone_number = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is too short (minimum is 10 characters)'
      end

      it 'phone_numberが12桁以上では購入できない' do
        @order_address.phone_number = '1234567891011'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is too long (maximum is 11 characters)'
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いてないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いてないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
