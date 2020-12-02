# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false, unique: true |
|encrypted_password   | string | null: false |
|family_name          | string | null: false |
|first_name           | string | null: false |
|family_name_katakana | string | null: false |
|first_name_katakana  | string | null: false |
|birthday             |date    |null:false   |
### Association

- has_many :purchases
- has_many :items

## itemsテーブル

| Column             |        Type     | Options                       |
| ---------          | ---------       | ------------------------------|  
| title              | string          |       null: false             |
|description_of_item | text            |       null: false             |
|category_id         | integer         |       null: false             |
|product_condition_id| integer         |       null: false             |
|shipping_charge_id | integer         |       null: false             |
|shipping_area_id    | integer         |      null:  false             |
|days_to_sip_id      | integer         |      null:   false            |
|selling_price       | integer         |     null:   false             |
| user               |references       |      foreign_key: true        |

### Association

- belongs_to :user
- has_one    :purchase

## purchase テーブル

| Column  | Type       |Options                         |
| --------| ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
|item     |  references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer_address
- belongs_to: item

## buyer_address テーブル

| Column            | Type       |Options        |
| ------------------|----------- | --------------|
| postal_code       | string     | null: false   |
| prefectures_id    | integer    | null: false   |
|municipalities     | string     |  null: false   |
|address            | string     | null: false   |
|building_name      |  string    |
|phone_number       |   string   | null:  false  |
|purchase           |references  |false, foreign_key: true |

### Association
- belongs_to :purchase