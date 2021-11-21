require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '商品が購入できる時' do
      it '全て入力されている時は購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない時' do
      it '郵便番号が空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は「3桁ハイフン4桁」の半角文字列で入力してください")
      end

      it '郵便番号は、３桁ハイフン４桁の半角文字列以外は購入できない' do
        @order_address.postal_code = 'あああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は「3桁ハイフン4桁」の半角文字列で入力してください")
      end

      it '都道府県が空では購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end

      it '市区町村が空では購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地が空では購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号が空では購入できない' do
        @order_address.telephone_number= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は10桁以上11桁以内の半角数値で入力してください")
      end

      it '電話番号が12桁以上では購入できない' do
        @order_address.telephone_number = '1111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値で入力してください")
      end

      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_address.telephone_number = 'ああああああああああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値で入力してください")
      end

      it 'userが紐づいていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end

      it 'itemが紐づいていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end

      it 'tokenが空では保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

    end
  end



end
