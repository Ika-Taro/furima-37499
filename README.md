



## users table

| Column             | Type  | Option                     |
| ------------------ | ----- | -------------------------- |
| nickname           | sting | null: false                |
| email              | sting | null: false , unique: true |
| encrypted_password | sting | null: false                |
| first_name         | sting | null: false                |
| last_name          | sting | null: false                |
| kana_firstname    | sting | null: false                |
| kana_lastname     | sting | null: false                |
| birthday           | date  | null: false                |

### Association

- has_many: items
- has_many: comments
- has_many: purchase_records



## comments table

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| comment_text | text       | null: false                    |
| user_id      | references | null: false ,foreign_key: true |
| item_id      | references | null: false ,foreign_key: true |

### Association

- belongs_to: user
- belongs_to: item



## shipping_addresses table

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| post_code          | sting      | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalities     | sting      | null: false                    |
| address            | sting      | null: false                    |
| building_name      | sting      |                                |
| phone_number       | sting      | null: false                    |
| purchase_record_id | references | null: false ,foreign_key: true |

### Association

- belongs_to: purchase_record



## items table

| Column               | Type       | Option                         |
| -------------------- | ---------- | ------------------------------ |
| item_name            | sting      | null: false                    |
| item_description     | text       | null: false                    |
| item_category_id     | integer    | null: false                    |
| item_condition_id    | integer    | null: false                    |
| delivery_charge_id   | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| take_for_shipping_id | integer    | null: false                    |
| selling_price        | integer    | null: false                    |
| user                 | references | null: false ,foreign_key: true |

### Association

- has_many: comments
- has_one: purchase_record
- belongs_to: user



## purchase_records

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false ,foreign_key: true |
| item   | references | null: false ,foreign_key: true |

### Associations

- belongs_to: user
- belongs_to: item
- has_one: shipping_address

