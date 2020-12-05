class Item < ApplicationRecord
  has_one :order
  belongs_to :user
  has_one_attached :image

  validates :name               , presence: true
  validates :explanation        , presence: true
  validates :price              , presence: true , numericality: {  greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image              , presence: true
  validates :category_id        , numericality: { other_than: 1 }
  validates :status_id          , numericality: { other_than: 1 }
  validates :delivery_cost_id   , numericality: { other_than: 1 }
  validates :area_id            , numericality: { other_than: 1 }
  validates :day_id             , numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :status
    
  end
