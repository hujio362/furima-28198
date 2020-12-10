class Address < ApplicationRecord
  belongs_to :order

  postal_code|string|null:false|
|prefecture_id|integer|null:false|
|municipality|string|null:false|
|building|string||
|house_number|string|null:false|
|tel_number|string|null:false|
|order|references|null:false,foreign_key: true|
end
