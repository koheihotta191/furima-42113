FactoryBot.define do
  factory :user do
    nickname              {'山田太郎ものがたり'}
    email                 {'name@gmail.com'}
    password              {'1q2w3e'}
    first_name            {'山田'}
    last_name             {'太郎'}
    first_name_kana       {'ヤマダ'}
    last_name_kana        {'タロウ'}
    birth_date            {'2000-01-01'}
  end
end