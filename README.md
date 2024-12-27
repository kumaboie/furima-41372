# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false, unique: true |
| password            | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| furigana_first_name | string | null: false |
| furigana_last_name  | string | null: false |
| date                | string | null: false |


### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| image               | string | null: false |
| title               | string | null: false |
| detail              | text   | null: false |
| states              | string | null: false |
| category            | string | null: false |
| shipping_fee_status | string | null: false |
| prefecture          | string | null: false |
| sucheduled_delivery | string | null: false |
| price               | string | null: false |
| user                | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_many :purchases


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
- has_many :comments
- belongs_to :shipping_address

## shippin_address テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | string     | null: false |
| prefecture   | string     | null: false |
| city         | text       | null: false |
| addresses    | string     | null: false |
| building     | string     | null: false |
| phone_number | string     | null: false |
| user         | references | null: false, foreign_key: true |


### Association

- has_one :purchase




