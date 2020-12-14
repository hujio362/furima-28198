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
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false|
|encrypted_password|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|date|null:false|

### Association
has_many :items
has_many :orders

## Items
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|category_id|integer|null:false|
|price|integer|null:false|
|explanation|text|null:false|
|status_id|integer|null:false|
|delivery_cost_id|integer|null:false|
|prefecture_id|integer|null:false|
|day_id|integer|null:false|
|user|references|foreign_key: true|

### Association
has_one :order
belongs_to :user

## Orders
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address

## Addresses 
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null:false|
|prefecture_id|integer|null:false|
|municipality|string|null:false|
|building|string||
|house_number|string|null:false|
|tel_number|string|null:false|
|order|references|null:false,foreign_key: true|

### Association
belongs_to :order