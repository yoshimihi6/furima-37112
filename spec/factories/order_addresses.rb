FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { '2' }
    municipality { '横浜市' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
    token {'tok_abcdefghijk00000000000000000'}
  end
end
