class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :building, :house_number, :tel_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'にはハイフン（-）を含めてください。' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates_format_of :tel_number, with: /\A[0-9]+\z/, length: { maximum: 11 }, message: 'は数字11桁以内で入力してください。'
  end

  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, building: building, house_number: house_number, tel_number: tel_number, order_id: order.id)
  end

end