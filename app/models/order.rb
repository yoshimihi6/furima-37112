class Order < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :user
  belongs_to :item
  has_one    :address
  has_one_attached :image
end
