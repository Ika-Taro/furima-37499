class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :phurchase_record_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchaserecord = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number,purchase_record_id: purchaserecord.id)
  end
end