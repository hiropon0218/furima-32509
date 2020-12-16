# テーブル設計

## usersテーブル

| Column              | Type     | Options     |
| ------------------- | -------- | ----------- |
| nickname            | string   | null: false |
| email               | string   | null: false |
| encrypted_password  | string   | null: false |
| last_name_kanji     | string   | null: false |
| first_name_kanji    | string   | null: false |
| last_name_katakana  | string   | null: false |
| first_name_katakana | string   | null: false |
| birthday            | date     | null: false |

### Association

- has_many :items

##  itemsテーブル
| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| item_name     | string   | null: false |
| explanation   | string   | null: false |
| category      | string   | null: false |
| quality       | string   | null: false |
| shipping_cost | string   | null: false |
| sender_area   | string   | null: false |
| ship_date     | string   | null: false |
| price         | integer  | null: false |

### Association

- belongs_to :user
- belongs_to :purchase

## shipping_addressesテーブル (配送先情報)
| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| postal_code   | integer  | null: false |
| prefecture    | string   | null: false |
| municipality  | string   | null: false |
| address       | string   | null: false |
| building_name | string   | null: true  |
| phone_number  | integer  | null: false |

### Association

- belongs_to :purchase

## credit_cardsテーブル (クレジットカード情報)
| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| card_number   | integer  | null: false |
| expiration_m  | integer  | null: false |
| expiration_y  | integer  | null: false |
| security_code | integer  | null: false |

### Association

- belongs_to :purchase

## purchaseテーブル (購入情報)
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| credit_card      | references | null: false, foreign_key: true |
| shipping_address | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :items
- has_many :credit_cards
- has_many :shipping_addresses