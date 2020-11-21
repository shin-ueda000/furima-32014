# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
|full_name          | string | null: false |
|full_name_katakana | string | null: false |
|birthday           | string |null:false   |
### Association

- has_one :purchase
- has_many :items

## itemsテーブル

| Column             |        Type     | Options                       |
| ---------          | ---------       | ------------------------------|  
| title              | string          |       null: false             |
|description of item | text            |       null: false             |
|category            | text            |       null: false             |
|product_condition   |text             |   null: false                 |
|shipping_charges    |text             |       null: false             |
|shipping_area       |text             |      null:  false             |
|days_to_sip         |text             |      null:   false            |
|selling_price       |integer          |     null:   false             |
| user               |references       | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one    :purchase

## purchase テーブル

| Column  | Type       |Options                         |
| --------| ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
|item     | references | null: false, foreign_key: true |

### Association
- belongs_one :user
- belongs_one :buyer_address

## buyer_address テーブル

| Column         | Type       |Options        |
| -------        | ---------- | --------------|
| postal_code    | text       | null: false   |
|municipalities  | text       | null: false   |
|address         |  text      | null: false   |
|building_name   |  text      | null: false   |
|phone_number    |   text     | null:  false  |
