require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end
  describe 'ユーザー新規登録' do
    it '全ての項目が存在すれば登録できる' do
      expect(@user_order).to be_valid
    end
    it 'buildingがなくても登録できる' do
      @user_order.building = ''
      expect(@user_order).to be_valid
    end
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
      expect(@user_order.errors.full_messages).to include('Tel number は数字11桁以内で入力してください。')
    end
    it '電話番号は数字でなければ登録できない' do
      @user_order.tel_number = 'abcdefghijk'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Tel number は数字11桁以内で入力してください。')
    end
    it '電話番号は11桁以内でなければ登録できない' do
      @user_order.tel_number = '00000000000000'
      @user_order.valid?
      binding.pry
      expect(@user_order.errors.full_messages).to include('Tel number は数字11桁以内で入力してください。')
    end
  end
end
