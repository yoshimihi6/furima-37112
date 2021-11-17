FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    
    password              {"password1"}
    password_confirmation {"password1"}
    first_name {"太郎"}
    last_name {"山田"}
    first_name_kana {"タロウ"}
    last_name_kana {"ヤマダ"}
    birthday {"2021-01-01"}
  end
end