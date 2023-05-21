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
| birthday           | integer | null: false              |

### Association

- has_many :items
- has_many :comments
- has_one : card


## items テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| user_id       | string     | null: false                    |
| item_name     | string     | null: false                    |
| price         | integer    | null: false                    |
| condition     | string     | null: false                    |
| shipping_cost	| string     | null: false                    |
| prefecture    | string     | null: false                    |
| shipping_days	| integer    | null: false                    |
| category_id   | references | null: false, foreign_key: true |
| brand_id      | references | null: false, foreign_key: true |
| image         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many : images
- has_one :category
- has_one :brand

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

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |
| comment    | text       |                                |

### Association

- belongs_to :item
- belongs_to :user


## card テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| card_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item