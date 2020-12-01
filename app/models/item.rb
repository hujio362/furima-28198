class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order
  belongs_to :user
  has_one_attached :image
  belongs_to :area
  belongs_to :category
  belongs_to :day
  belongs_to :delivery_cost
  belongs_to :status
  
  validates :name, presence: true
  validates :explanation, presence: true

  validates :price, presence: true,
            if: {  :greater_than_or_equal_to => 300,
                :less_than_or_equal_to => 9999999,
                :message => '入力値が¥300~¥9,999,999の範囲外です' }
  
  validates :category_id        , numericality: { other_than: 1 }
  validates :status_id          , numericality: { other_than: 1 }
  validates :delivery_cost_id   , numericality: { other_than: 1 }
  validates :area_id            , numericality: { other_than: 1 }
  validates :day_id             , numericality: { other_than: 1 }
end
