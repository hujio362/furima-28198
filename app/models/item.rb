class Item < ApplicationRecord

  has_one :order
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :explanation, presence: true

  validates :price, presence: true,
            if: {  :greater_than_or_equal_to => 300,
                :less_than_or_equal_to => 9999999,
                :message => '入力値が¥300~¥9,999,999の範囲外です' }
  
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_cost_id, presence: true
  validates :area_id, presence: true
  validates :day_id, presence: true
end
