FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2) }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }
    price { 500 }
    association :user

  
    after(:build) do |message|
      message.image.attach(io: File.open(Rails.root.join('spec/fixtures/files/test_image.png')), filename: 'test_image.png')
    end
  end
end