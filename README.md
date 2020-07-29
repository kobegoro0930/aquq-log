# README

## DB設計 ERD
![個人アプリ_ERD_2](https://user-images.githubusercontent.com/62911575/87666816-44bca880-c7a4-11ea-8959-0440de0b6395.png)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|image|string||
### Association
- has_many :saves, dependent: :destroy
- has_many :groups
- has_many :wents, dependent: :destroy
- has_many :comments

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|catchphrase|string|null: false|
|title|string|null: false|
|text|string|null: false|
|area|string|null: false|
### Association
- belongs_to :user
- has_many :saves
- has_many :groups_tags
- has_many :tags, throgh: :groups_tags
- has_many :images
- has_many :comments
- has_many :wents

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|title|string|null: false|
|text|text|null: false|
|rate|integer|null: false|
### Association
- belongs_to :user
- belongs_to :group

## savesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## wentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :groups, throgh: :groups_tags
- has_many :groups_tags

## groups_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|tag_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tag
- belongs_to :group

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null: false, foreign_key: true|
|image|string|null: false|
### Association
- belongs_to :group
