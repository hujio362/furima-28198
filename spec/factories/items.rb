FactoryBot.define do
  factory :item do
    name              { 'test' }
    category_id       { 2 }
    price             { 300 }
    explanation       { 'testtest' }
    status_id         { 2 }
    delivery_cost_id  { 2 }
    prefecture_id           { 2 }
    day_id            { 2 }
    association :user, factory: :user

    # after(:build) do |item|
    #   item.image.attach(io: File.open('spec/fixtures/files/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    # end
  end
end
