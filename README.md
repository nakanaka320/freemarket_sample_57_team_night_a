# README

* Deployment instructions

* ...

# userテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|fullname|string|null: false|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|cards|integer||
|password|string|null: false|
|E-mail|string|null:false , unique: true|
|birth|date|null:false|
|phone_number|integer|null: false|
|comment|string|null: false|
|good|timestanp|null: false|
|sellitem|string|null: false|
|buyitem|string|null: false|

# Association
- has_many :comments ,dependent::destroy
- has_many :goods ,dependent::destroy
- has_many :sellitems
- has_many :buyitems

# addressテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|state|string|null: false|
|city|string|null: false|
|street|string|null: false|
|use_id|references|nill: false, foreign_key: true|

# Association
- belongs_to :user

# sellitemテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|name|string|null: false|
|price|integer|null:false|
|user_id|references|null: false, foreign_key: true|
|image|text|null: false|

# Association
- belongs_to :user
- has_many :comments

# buyitemテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|sellitem_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

# Association
- belongs_to :user

# commentテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|

# Association
- belongs_to :user
- has_many :item

# goodテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|good|text|null: false|
|user_id|references|null: false, foreign_key: true|

# Association
- belongs_to :user
- has_many :item

# categoriesテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|

# Association
- has_many :sellitem
- has_many :buyitem