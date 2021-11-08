# テーブル設計

## users テーブル

| Column             |Type      |Options                    |
| ------------------ |--------- |-------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_kana    | string   | null: false               |
| last_name_kana     | string   | null: false               |
| birthday           | datetime | null: false               |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column               |Type       |Option                          |
| -------------------- | --------- | ------------------------------ |
| name                 | string    | null: false                    |
| info                 | text      | null: false                    |
| category_id          | integer   | null: false                    |
| product_condition_id | integer   | null: false                    |
| shipping_charge_id   | integer   | null: false                    |
| prefecture_id        | integer   | null: false                    |
| schedule_id          | integer   | null: false                    |
| price                | integer   | null: false                    |
| user                 | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column  |Type       |Option                          |
| ------- | --------- | ------------------------------ |
| user    | reference | null: false, foreign_key: true |
| item    | reference | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :addresses


## addresses テーブル

| Column           |Type       |Option                          |
| ---------------- | --------- | ------------------------------ |
| postal_code      | string    | null: false                    |
| prefecture_id    | integer   | null: false                    |
| municipality     | string    | null: false                    |
| address          | string    | null: false                    |
| building_name    | string    | null: false                    |
| telephone_number | integer   | null: false                    |
| user             | reference | null: false  foreign_key: true |
| item             | reference | null: false, foreign_key: true |

### Association
- belongs_to :order