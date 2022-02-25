class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, prefecture_id, municipality, adress, building_name, phone_number, phurchase_record_id, user_id, item_id
end