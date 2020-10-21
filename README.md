# テーブル設計

## users テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| email              | string    | null: false |
| encrypted_password | string    | null: false |
| nickname           | string    | null: false |
| last_name          | string    | null: false |
| first_name         | string    | null: false |
| last_name_kana     | string    | null: false |
| first_name_kana    | string    | null: false |
| birth_date         | date      | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| detail           | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| shipper_area_id  | integer    | null: false                    |
| days_shipping_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| order           | references | null: false, foreign_key: true |
| postal_code     | string     | null: false                    |
| address_pref_id | integer    | null: false                    |
| address_city    | string     | null: false                    |
| address_num     | string     | null: false                    |
| address_build   | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- belongs_to :order
