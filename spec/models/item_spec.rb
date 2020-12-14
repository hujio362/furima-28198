require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('spec/fixtures/files/test_image.jpg')
  end

  describe '商品出品機能' do
    it 'すべての項目が存在していれば保存できる' do
      expect(@item).to be_valid
    end
    it '画像が1枚もないと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名がないと保存できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明がないと保存できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリー情報が1だと保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態の情報が1だと保存できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end
    it '配送料負担の情報が1だと保存できない' do
      @item.delivery_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery cost must be other than 1')
    end
    it '発送元地域の情報が1だと保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '発送までの日数がの情報が1だと保存できない' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day must be other than 1')
    end
    it '価格についての情報がないと保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
    end
    it '価格の範囲が¥300以下だと保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が¥9,999,999以上だと保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '販売価格は半角数字でないと保存できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
