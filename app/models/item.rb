class Item < ApplicationRecord
  belongs_to       :user
  #has_one          :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :schedule

  validates :name,                 presence: true
  validates :info,                 presence: true
  validates :category_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :schedule_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :image,                presence: true

  

end
