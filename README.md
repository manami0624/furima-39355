# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :comments


## items テーブル

| Column        | Type   | Options     |
| --------------| ------ | ----------- |
| user_id       | string | null: false |
| item_name     | string | null: false |
| image         |        | null: false |
| price         | string | null: false |
| condition     | string | null: false |
| shipping_cost	| string | null: false |
| prefecture    | string | null: false |
| shipping_days	| string | null: false |
| category_id   | string | null: false |
| brand_id      | string | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :category
- has_one :brand

## category テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item_id  | references | null: false, foreign_key: true |

### Association

- has_many :items


## brand テーブル

| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| item_id  | references | null: false, foreign_key: true |

### Association

- has_many :items


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | string     |                                |
| user_id | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
