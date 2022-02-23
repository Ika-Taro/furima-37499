FactoryBot.define do
  factory :item do
    image
    item_name
    item_description
    item_category_id
    item_condition_id
    delivery_charge_id
    prefecture_id
    take_for_shipping_id
    selling_price
  end
end
