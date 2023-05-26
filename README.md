# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false              |
| first_name         | string  | null: false              |
| last_name          | string  | null: false              |
| first_name_kana    | string  | null: false              |
| last_name_kana     | string  | null: false              |
| birthday           | date    | null: false              |

### Association

- has_many :items
- has_many :comments
- has_many :orders


## items テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item_name        | string     | null: false                    |
| price            | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| brand_id         | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_many :orders
- has_one  :category
- has_one  :brand

## category テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

### Association

- has_many :items


## brand テーブル

| Column   |  Type   | Options    |
| ---------| ------ | ----------- |
| name     | string | null: false |


### Association

- has_many :items


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| comment | text       |                                |

### Association

- belongs_to :item
- belongs_to :user


## shopping_addresses テーブル

| Column        | Type    | Options                      |
| ------------- | ------- | ---------------------------- |
| zipcode       | string  | null: false                  |
| prefecture_id | integer | null: false                  |
| city          | string  | null: false                  |
| street        | string  | null: false                  |
| building      | string  |                              |
| phone         | string  | null: false                  |

### Association

- belongs_to :orders


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shopping_addresses
