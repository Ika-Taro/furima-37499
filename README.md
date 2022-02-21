
## users table

| Column             | Type  | Option               |
| ------------------ | ----- | -------------------- |
| nickname           | sting | null: false , unique: true |
| email              | sting | null: false          |
| encrypted_password | sting | null: false          |
| name               | sting | null: false          |
| kana               | sting | null: false          |

### Association
- has_many: items
- has_many: comments



## comments table

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| comment_text | text       | null: false                    |
| user_id      | references | null: false ,foreign_key: true |
| item_id      | references | null: false ,foreign_key: true |

### Association
- belongs_to: user
- belongs_to: item



## shipping_address table

| Column         | Type  | Option      |
| -------------- | ----- | ----------- |
| post_code      | sting | null: false |
| prefectures    | sting | null: false |
| municipalities | sting | null: false |
| address        | sting | null: false |
| building_name  | sting | null: false |
| phone_number   | sting | null: false |

### Association
- belongs_to: item 

## items table

| Column           | Type  | Option                         |
| ---------------- | ----- | ------------------------------ |
| item_description | text  | null: false                    |
| selling_price    | sting | null: false                    |
| user_id          | sting | null: false ,foreign_key: true |

### Association
- has_many: comments
- has_one: shipping_address
- belongs_to: user

