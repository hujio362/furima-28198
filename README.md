# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Users 
|Column|Type|Options|
|nickname|string|null:false|
|email|string|null:false|
|encrypted_password|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|string|null:false|

### Association
has_many :items
has_many :orders

## Items
|Column|Type|Options|
|name|string|null:false|
|category_id|integer|null:false|
|price|integer|null:false|
|explanation|text|null:false|
|status_id|integer|null:false|
|delivery_cos_id_|integer|null:false|
|area_id|integer|null:false|
|days_id|integer|null:false|
|user_id|references|null:false|

### Association
belongs_to :orders

## Orders
|Column|Type|Options|
|user_id|references|null:false|
|item_id|references|null:false|

### Association
belongs_to :users
has_one :item
has_one :address

## Addresses 
|Column|Type|Options|
|postal_code|string|null:false|
|prefectures|string|null:false|
|municipality|string|null:false|
|building|string|null:false|
|house_number|string|null:false|
|tel_number|string|null:false|

### Association
has_one :order