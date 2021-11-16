class OrderAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number

  attr_accessor :token


  with_options presence: true do
    validates :postal_code,      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,    numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipality
    validates :address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}
    validates :token
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end

end
