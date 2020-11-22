require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "全ての項目が存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
    end
    it "emailが重複していると登録できない" do
    end
    it "emailは＠を含む必要がある" do
    end
    it "passwordが空だと登録できない" do
    end
    it "passwordが6文字以下だと登録できない" do
    end
    it "passwordが全角だと登録できない" do
    end
    it "passwordが数字だけだと登録できない" do
    end
    it "passwordが英語だけだと登録できない" do
    end
    it "passwordが英語だけだと登録できない" do
    end
    it "encrypted_passwordが空だと登録できない" do
    end
    it "first_nameが空だと登録できない" do
    end
    it "last_nameが空だと登録できない" do
    end
    it "first_name_kanaが空だと登録できない" do
    end
    it "last_name_kanaが空だと登録できない" do
    end
    it "birthdayが空だと登録できない" do
    end
  end
end
