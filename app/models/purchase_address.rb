class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :phurchase_record_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
  
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    # validates :building_name

  def save
    # 寄付情報を保存し、変数donationに代入する
    purchaserecord = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    # 住所を保存する


    # donation_idには、変数donationのidと指定する
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number,purchase_record_id: purchaserecord.id)
  end
end