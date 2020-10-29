require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の保存' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    context '購入がうまくいくとき' do
      it '必須項目が条件通りに存在すれば保存できる' do
        expect(@order_destination).to be_valid
      end
      it '建物名が無くても保存できる' do
        @order_destination.address_build = ''
        expect(@order_destination).to be_valid
      end
    end
    context '購入がうまくいかない時' do
      it '郵便番号が空だと保存できないこと' do
        @order_destination.postal_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_destination.postal_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postal code は-を入れて入力してください')
      end
      it '都道府県が空だと保存できないこと' do
        @order_destination.address_pref_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address pref can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_destination.address_city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address city can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_destination.address_num = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address num can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が12桁以上だと保存できないこと' do
        @order_destination.phone_number = '090123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number は半角数字のみで11桁以内で入力してください')
      end
      it '電話番号に-があると保存できないこと' do
        @order_destination.phone_number = '012−345−6789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number は半角数字のみで11桁以内で入力してください')
      end
      it 'トークンが空だと保存できないこと' do
        @order_destination.token = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
