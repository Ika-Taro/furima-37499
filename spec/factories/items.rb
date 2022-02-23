FactoryBot.define do
  factory :item do
    item_name {'オムライス'}
    item_description {'食べられません'}
    item_category_id {'2'}
    item_condition_id {'2'}
    delivery_charge_id {'2'}
    prefecture_id {'2'}
    take_for_shipping_id {'2'}
    selling_price {'2000'}

    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/omuraisu.png'), filename: 'omuraisu.png')
    end
  end
end
