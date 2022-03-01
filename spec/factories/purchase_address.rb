FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    municipality { '八戸市' }
    address { '1-1' }
    phone_number { '00011112222'}
    token {"tok_abcdefghijk00000000000000000"}

    prefecture_id { '2' }

    building_name { '八戸ハイツ' }
  end
end
