FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'あきら' }
    last_name             { '田中' }
    furigana_first_name   { 'アキラ' }
    furigana_last_name    { 'タナカ' }
    birth_date            { Faker::Date.birthday(min_age: 0, max_age: 100) }
  end
end
