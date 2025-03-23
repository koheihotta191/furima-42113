FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              { Faker::Alphanumeric.alphanumeric(number: 8) + "1" }
    password_confirmation {password}
    first_name            { Faker::Japanese::Name.first_name }
    last_name             { Faker::Japanese::Name.last_name }
    first_name_kana       { "ヤマダ" }
    last_name_kana        { "タロウ" }
    birth_date            { Faker::Date.birthday }
  end
end