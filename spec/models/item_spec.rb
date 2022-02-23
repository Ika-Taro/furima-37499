require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では保存できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_descriptionが空では保存できない' do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'item_category_idが空では保存できない' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it 'item_condition_idが空では保存できない' do
        @item.item_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it 'delivery_charge_idが空では保存できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'take_for_shipping_idが空では保存できない' do
        @item.take_for_shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Take for shipping can't be blank")
      end

      it 'selling_priceが空では保存できない' do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end


      it 'selling_priceが9999999円以上では保存できない' do
        @item.selling_price = '1000000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
      end

    end

  end
end
