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
- has_many :orders



## items テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item_name        | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |

### Association
- belongs_to :user
- has_one    :order



## shopping_addresses テーブル(配送先住所を保存するテーブル)

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zipcode       | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order



## orders テーブル(購入記録を登録するテーブル)

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- has_one :shopping_address
- belongs_to :item
- belongs_to :user