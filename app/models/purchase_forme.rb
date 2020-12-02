class PurchaseForme
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipalities, :address, :building_name, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/, message: "is invalid"}
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "Too long too short,is invalid"}
    validates :token
  end



  def save
    purchase = Purchase.create(user_id:user_id, item_id:item_id)
    BuyerAddress.create(postal_code:postal_code,shipping_area_id:shipping_area_id,municipalities:municipalities,address:address,building_name:building_name,phone_number:phone_number,purchase_id:purchase.id)
  end
end
