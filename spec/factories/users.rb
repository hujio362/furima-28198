FactoryBot.define do
  factory :user do
    nickname            { 'テスト' }
    email               { 'test@test' }
    password            { '123456a' }
    password_confirmation { '123456a' }
    first_name          { '佐藤' }
    last_name           { '健' }
    first_name_kana     { 'サトウ' }
    last_name_kana      { 'タケル' }
    birthday            { '2000-01-01' }
  end
end
