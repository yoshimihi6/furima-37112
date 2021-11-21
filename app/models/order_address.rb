class OrderAddress 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :token



  with_options presence: true do
    validates :postal_code,      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は「3桁ハイフン4桁」の半角文字列で入力してください"}
    validates :prefecture_id,    numericality: { other_than: 1 , message: "を入力してください"}
    validates :municipality
    validates :address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値で入力してください"}
    validates :token
    validates :user_id
    validates :item_id
  end


  def save

    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end

end
