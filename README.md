# テーブル設計

## usersテーブル

| Column              | Type     | Options            |
| ------------------- | -------- | ------------------ |
| nickname            | string   | null: false        |
| email               | string   | null: false, unique|
| encrypted_password  | string   | null: false        |
| last_name_kanji     | string   | null: false        |
| first_name_kanji    | string   | null: false        |
| last_name_katakana  | string   | null: false        |
| first_name_katakana | string   | null: false        |
| birthday            | date     | null: false        |

### Association

- has_many :items
- has_many :purchases

##  itemsテーブル
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| item_name        | string     | null: false                     |
| explanation      | text       | null: false                     |
| category_id      | integer    | null: false                     |
| quality_id       | integer    | null: false                     |
| shipping_cost_id | integer    | null: false                     |
| prefecture_id    | integer    | null: false                     |
| ship_date_id     | integer    | null: false                     |
| price            | integer    | null: false                     |
| user             | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :purchase

## shipping_informationテーブル (配送先情報)
| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| postal_code   | string   | null: false |
| prefecture_id | integer  | null: false |
| municipality  | string   | null: false |
| address       | string   | null: false |
| building_name | string   |             |
| phone_number  | string   | null: false |
| card_number   | integer  | null: false |
| expiration    | date     | null: false |
| security_code | integer  | null: false |

### Association

- belongs_to :purchase

## purchasesテーブル (購入情報)
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :items
- has_one :shipping_information