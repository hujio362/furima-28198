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
|mailaddress|string|null:false|
|password|string|null:false|

### Association
has_many

## Items
|Column|Type|Options|
|item_name|string|null:false|
|category|string|null:false|
|price|string|null:false|
|image|string|null:false|
|explanation|text|null:false|
|status|string|null:false|
|delivery_cost|string|null:false|
|area|string|null:false|
|days|string|null:false|
|user_id|references|null:false|

### Association
has_one

## Rops
|Column|Type|Options|
|user_id|references|null:false|
|item_id|references|null:false|
|date|date|null:false|

### Association
has_many

## Addresses 
|Column|Type|Options|
|postal_code|string|null:false|
|prefectures|string|null:false|
|municipality|string|null:false|
|house_number|string|null:false|
|tel_number|string|null:false|

### Association
has_one