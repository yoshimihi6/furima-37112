class Item < ApplicationRecord
  belongs_to       :user
  has_one          :order
  has_one_attached :image


  validates :name,                 presence: true
  validates :info,                 presence: true
  validates :category_id,          presence: true
  validates :product_condition_id, presence: true
  validates :shipping_charge_id,   presence: true
  validates :prefecture_id,        presence: true
  validates :schedule_id,          presence: true
  validates :price,                presence: true
end
