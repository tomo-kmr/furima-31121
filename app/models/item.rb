class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipper_area
  belongs_to_active_hash :days_shipping

  with_options presence: true do
    validates :name
    validates :detail
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :shipper_area_id, numericality: { other_than: 1 }
    validates :days_shipping_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角数字を使用してください' },
                      numericality: { greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9_999_999 }
    validates :image
  end
  belongs_to :user
  has_one_attached :image
end
