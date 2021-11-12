FactoryBot.define do
  factory :item do
    name   {Faker::Name.name}
    info   {'test'}
    category_id  {'2'}
    product_condition_id  {'2'}
    shipping_charge_id  {'2'}
    prefecture_id  {'2'}
    schedule_id  {'2'}
    price  {'1000'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
