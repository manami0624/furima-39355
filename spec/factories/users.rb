FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
  end
end