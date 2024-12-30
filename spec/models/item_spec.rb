require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテムの保存' do
    context 'アイテムが出品できる場合' do
      it 'image,title,detail,price,category_id,states_id,shipping_fee_status_id,prefecture_id,sucheduled_delivery_idが存在する時は出品できる' do
        expect(@item).to be_valid
      end
    end
    context 'アイテムが出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'titleが空では投稿できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it 'detailが空では投稿できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end
      it 'category_idが空では投稿できない' do
        @item.category_id = 'Category.first.id '
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'states_idが空では投稿できない' do
        @item.states_id = 'States.first.id '
        @item.valid?
        expect(@item.errors.full_messages).to include "States can't be blank"
      end
      it 'shipping_fee_status_idが空では投稿できない' do
        @item.shipping_fee_status_id = 'ShippingFeeStatus.first.id '
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee status can't be blank"
      end
      it 'prefecture_idが空では投稿できない' do
        @item.prefecture_id = 'Prefecture.first.id '
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'sucheduled_delivery_idが空では投稿できない' do
        @item.sucheduled_delivery_id = 'SucheduledDelivery.first.id '
        @item.valid?
        expect(@item.errors.full_messages).to include "Sucheduled delivery can't be blank"
      end
      it 'priceが空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300円以下では投稿できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが9999999円以上では投稿できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'priceが全角では投稿できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
