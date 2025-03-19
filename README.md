# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |

has_many :items
has_many :purchases



## items テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| users            | references | null: false, foreign_key: true   |
| name             | string     | null: false                      |
| description      | text       | null: false                      |
| category_id      | integer    | null: false                      |
| condition_id     | integer    | null: false                      |
| shipping_fee_id  | integer    | null: false                      |
| shipping_area_id | integer    | null: false                      |
| shipping_day_id  | integer    | null: false                      |
| price            | integer    | null: false                      |

belongs_to :user
has_one :purchase


## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address



## addresses テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | --------------------------------|
| purchase         | references | null: false, foreign_key: true  |
| postal_code      | string     | null: false                     |
| shipping_area_id | integer    | null: false                     |
| city             | string     | null: false                     |
| street_address   | string     | null: false                     |
| building_name    | string     |                                 |
| phone_number     | string     | null: false                     |

belongs_to :purchase
