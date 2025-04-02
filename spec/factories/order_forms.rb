FactoryBot.define do
  factory :order_form do
    postal_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    shipping_area_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone_number { "0" + Faker::Number.number(digits: Faker::Number.between(from: 9, to: 10)).to_s }
    token {"tok_abcdefghijk00000000000000000"}
  end
end