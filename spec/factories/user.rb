FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.email}
    password              {"a000000"}
    password_confirmation {password}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_katakana  {"ヤマダ"}
    first_name_katakana   {"タロウ"}
    birthday              {"1993-01-01"}
  end
end