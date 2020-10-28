class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :address_pref_id, :address_city, :address_num,
                :address_build, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は-を入れて入力してください' }
    validates :address_pref_id, numericality: { other_than: 1 }
    validates :address_city, :address_num
    validates :phone_number, format: { with: /\A[0-9]{11}+\z/, message: 'は半角数字11桁で入力してください' }
    validates :token
  end
  def save
    # 購入の情報を保存し、「order」という変数に入れている
    order = Order.create(user_id: user_id, item_id: item_id)
    # 配送先の情報を保存
    Destination.create(order_id: order.id, postal_code: postal_code, address_pref_id: address_pref_id, address_city: address_city,
                       address_num: address_num, address_build: address_build, phone_number: phone_number)
  end
end
