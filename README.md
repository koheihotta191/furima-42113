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

| Column             | Type   | Options                |
| ------------------ | ------ | -----------------------|
| nickname           | string | NOT NULL               |
| email              | string | NOT NULL , ユニーク制約 |
| password           | string | NOT NULL               |
| first_name         | string | NOT NULL               |
| last_name          | string | NOT NULL               |
| first_name_kana    | string | NOT NULL               |
| last_name_kana     | string | NOT NULL               |
| birth_date         | date   | NOT NULL               |


## items テーブル

| Column        | Type       | Options              |
| ------------- | ---------- | -------------------- |
| image	        | string     | NOT NULL             |
| user_id       | references | NOT NULL , 外部キー   |
| name          | string     | NOT NULL             |
| category      | string     | NOT NULL             |
| condition     | string     | NOT NULL             |
| shipping_fee  | string     | NOT NULL             |
| shipping_area | string     | NOT NULL             |
| shipping_days | integer    | NOT NULL             |
| price         | integer    | NOT NULL             |


## purchases テーブル

| Column   | Type       | Options            |
| -------- | ---------- | ------------------ |
| item_id  | references | NOT NULL , 外部キー |
| user_id  | references | NOT NULL , 外部キー |

## addresses テーブル

| Column           | Type       | Options              |
| ---------------- | ---------- | ---------------------|
| purchase_id      | references | NOT NULL ,外部キー    |
| postal_code      | string     | NOT NULL             |
| prefecture       | string     | NOT NULL             |
| city             | string     | NOT NULL             |
| street_address   | string     | NOT NULL             |
| building_name    | string     |                      |
| phone_number     | string     | NOT NULL             |


## comments テーブル

| Column   | Type       | Options            |
| -------- | ---------- | ------------------ |
| user_id  | references | NOT NULL , 外部キー |
| item_id  | references | NOT NULL , 外部キー |
| content  | text       | NOT NULL           |