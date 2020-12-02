class Item < ApplicationRecord

  with_options presence: true do
  validates :title
  validates :description_of_item
  validates :category_id,           numericality: { other_than: 1 }
  validates :product_condition_id,  numericality: { other_than: 1 }
  validates :shipping_charge_id,    numericality: { other_than: 1 }
  validates :shipping_area_id,      numericality: { other_than: 1 }
  validates :days_to_sip_id,        numericality: { other_than: 1 }
  validates :selling_price,         numericality: { greater_than: 299,less_than: 10000000 }
  validates :image
  end

  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_sip

  has_one_attached :image
  has_one    :purchase
  belongs_to :user

end
