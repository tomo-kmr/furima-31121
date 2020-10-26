FactoryBot.define do
  factory :item do
    name                  { Faker::Lorem.sentence }
    detail                { Faker::Lorem.sentence }
    category_id           { 2 }
    status_id             { 3 }
    delivery_fee_id       { 2 }
    shipper_area_id       { 3 }
    days_shipping_id      { 2 }
    price                 { 4000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end