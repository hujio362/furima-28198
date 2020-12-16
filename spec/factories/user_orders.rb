FactoryBot.define do
  factory :user_order do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    municipality  { '練馬区' }
    house_number  { '1-1' }
    tel_number  { '00000000000' }
    building  {'aa'}
    token {'kkkkkkkk'}
  end
end
