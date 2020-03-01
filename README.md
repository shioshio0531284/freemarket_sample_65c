# フリマクローンサイト

# Basic認証
user : admin
pass : team65c


# DB設計

## usersテーブル 
|Column|Type|options|
|------|----|-------|
|first_name|string|null: false|  # first_name: 姓
|last_name|string|null: false|   # last_name: 名
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone_number|string|null: false, unique: true|

### Associatioin
- has_many :items
- has_many :item_comments, dependent: :destroy
- has_one :users_addresses
- has_one :credit_cards
- has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :selling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"


## users_addressテーブル
|Column|Type|Options|
|------|----|-------|
|address_first_name|string|null: false|
|address_last_name|string|null: false|
|address_first_name_kana|string|null: false|
|address_last_name_kana|string|null: false|
|post_number|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|address_phone_number|string||
|user_id|references|null: false,foreign_key: true|

### Associatioin
- belongs_to :user


## itemsテーブル (商品)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|description|text|null: false| #description:商品説明
|status|integer|null: false| #status:商品状態
|postage|string|null: false|  #postage:配送料の負担
|delivery_way|string|null: false| #delivery_way:配送方法
|delivery_area|string|null: false| #delivery_area:発送元地域
|delivery_date|string|null :false| #delivery_date:発送までの目安
|price|integer|null: false|
|category_id|references|null: false,foreign_key: true|
|size|text||
|brand|text||
|seller_id|integer|class_name: "User"|
|seller_id|integer|class_name: "User"|


### Associatioin
- belongs_to :user
- has_many :item_comments, dependent: :destroy
- belongs_to :category
- belongs_to :brand
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'

## credit_cardsテーブル 
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|card_id|integer|null: false|
|customer_id|integer|null: false|

### Association
- belongs_to :user


## item_commentsテーブル (商品に対するコメント)
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false,foreign_key: true|
|item_id|references|null: false,foreign_key: true|

### Associatioin
- belongs_to :user
- belongs_to :item_id


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|genre|string|null: false, unique: true|

### Associatioin
- has_many :items
- has_many :brands, through:brand_categories

## brand_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

- belongs_to :categories
- belongs_to :brands

### Associatioin


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|genre|string|null: false|

### Associatioin
- has_many :categories, through:brand_categories

