class Item < ApplicationRecord
  has_one :order
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :image
  end

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :day_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :status
end
