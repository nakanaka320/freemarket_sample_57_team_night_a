# README

* Deployment instructions

* ...

# userテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|fullname|string|null: false|
|nickname|string|null: false|
|kana1|string|null: false|
|kana2|string|null: false|
|cards|integer||
|password|string|null: false|
|E-mail|string|null:false , unique: true|
|birth|date|null:false|
|address|string|null: false , unique: true|
|phone_number|integer|null: false|
|comment|string|null: false|
|good|timestanp|null: false|
|sellitem|string|null: false|
|buyitem|string|null: false|

# Association
- has_many :comment
- has_many :good
- has_many :sellitem
- has_many :buyitem

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
|sellitem_id|references|null: false|
|user_id|references|null: false, foreign_key: true|

# Association
- belongs_to :user
|sellitem_id|references|null: false, foreign_key: true|

# commentテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|

# Association
- belongs_to :user
- has_many :Item

# goodテーブル
|Column|type|Options|
|:--:|:--:|:--:|
|good|text|null: false|
|user_id|references|null: false, foreign_key: true|

# Association
- belongs_to :user
- has_many :Item

# categoriesテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|

# Association
