require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end
  describe 'ユーザー新規登録' do
    context "登録成功時" do
      it '全ての項目が存在すれば登録できる' do
        expect(@user_order).to be_valid
      end
      it 'buildingがなくても登録できる' do
        @user_order.building = ''
        expect(@user_order).to be_valid
      end
    end
    context "エラー発生時" do
      it '郵便番号がなければ登録できない' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にはハイフンがなければ登録できない' do
        @user_order.postal_code = '1111111'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code にはハイフン（-）を含めてください。")
      end
      it '都道府県がなければ登録できない' do
        @user_order.prefecture_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県のidが1の時は登録できない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村がなければ登録できない' do
        @user_order.municipality = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地がなければ登録できない' do
        @user_order.house_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号がなければ登録できない' do
        @user_order.tel_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Tel number can't be blank", "Tel number は半角数字で入力してください。")
      end
      it '電話番号は数字でなければ登録できない' do
        @user_order.tel_number = 'abcdefghijk'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Tel number は半角数字で入力してください。')
      end
      it '電話番号は11桁以内でなければ登録できない' do
        @user_order.tel_number = '00000000000000'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Tel number is too long (maximum is 11 characters)')
      end
      it 'tokenがなければ登録できない' do
        @user_order.token = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idがなければ登録できない' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがなければ登録できない' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
