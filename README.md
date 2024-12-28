# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| furigana_first_name | string | null: false |
| furigana_last_name  | string | null: false |
| birth_date          | date   | null: false |


### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| title                  | string    | null: false |
| detail                 | text      | null: false |
| states_id              | integer   | null: false |
| category_id            | integer   | null: false |
| shipping_fee_status_id | integer   | null: false |
| prefecture_id          | integer   | null: false |
| sucheduled_delivery_id | integer   | null: false |
| price                  | integer   | null: false |
| user                   | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- belongs_to :purchase


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## purchase テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| item             | reference | null: false, foreign_key: true |
| user             | reference | null: false, foreign_key: true |
| shipping_address | reference | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_many :items
- has_many :comments
- has_one  :shipping_address

## shippin_address テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| addresses    | string     | null: false |
| building     | string     |  |
| phone_number | string     | null: false |
| purchase     | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase




