# 水族館ログ

## :orange_book: 概要 
食べログを参考に作成したWEBアプリケーションです。<br>
誰でも簡単に行きたい水族館を見つけられるアプリの機能を実装しました。<br>

<img width="1089" alt="スクリーンショット 2020-08-27 0 09 50" src="https://user-images.githubusercontent.com/62911575/91321525-ac313380-e7f9-11ea-936a-ebce2c4f9d24.png"><br>
<br>

## :orange_book: 実装した機能
- ユーザー登録・編集機能
- かんたんログイン機能
- マイページ機能
- 記事投稿機能
- コメント機能
- 評価機能
- いいね機能
- 検索機能（あいまい検索・詳細検索）
- AWS EC2 S3<br>
<br>

## :orange_book: 本番環境
- URL:    http://54.248.69.170/

### :paperclip: Basic認証
- ID:     gundam
- PASS:   0079

### :paperclip: 出品者用テストアカウント
- MAIL:   seller@gmail.com
- PASS:   seller1234

### :paperclip: 購入者用テストアカウント
- MAIL:   buyer@gmail.com
- PASS:   buyer1234<br>
<br>

## :orange_book: 使用技術(開発環境)
<a href="https://www.ruby-lang.org/ja/"><img src="https://i1.wp.com/qs.nndo.jp/wp-content/uploads/2017/06/ruby.png?fit=393%2C346" height="50px"></a>　
<a href="https://railsguides.jp/"><img src="https://job.fellow-s.co.jp/limg/public/wsystem/wp-content/uploads/rails_lo.jpg" height="50px"></a>　
<a href="https://www.mysql.com/jp/"><img src="https://cdn-ak.f.st-hatena.com/images/fotolife/o/oasist/20200614/20200614000533.png" height="50px"></a>　
<a href="https://unicorn.bogomips.org/"><img src="https://livedoor.sp.blogimg.jp/sasata299/imgs/b/d/bdc11dd3.png" height="50px"></a>　
<a href="https://www.nginx.co.jp/"><img src="https://i2.wp.com/tadtadya.com/wp-content/uploads/2017/08/nginx-min-edit.png?fit=626%2C329&ssl=1" height="50px"></a>　
<a href="https://github.com/capistrano/capistrano"><img src="https://capistranorb.com/assets/images/CapistranoLogo.png" height="50px"></a><br>
<br>
<a href="https://haml.info/"><img src="https://haml.info/images/haml.png" height="50px"></a>　
<a href="https://sass-lang.com/"><img src="https://cdn.worldvectorlogo.com/logos/sass-1.svg" height="50px"></a>　
<a href="https://jquery.com/"><img src="https://cdn.worldvectorlogo.com/logos/jquery-1.svg" height="30px"></a>　
<a href="https://github.co.jp/"><img src="https://i.pinimg.com/originals/3c/d5/67/3cd5679f54dc60811383649f9f6ea37d.png" height="50px"></a>　
<a href="https://aws.amazon.com/jp/"><img src="https://www.skyarch.net/blog/wp-content/uploads/2014/11/Non-Service_Specific_copy_AWS_Cloud.png" height="50px"></a><br>
<br>

## :orange_book: Author
アジャイル開発。2週間ごとにスプリントを設定しました。
- Slack（進捗報告やメンバー間の連絡）
- Trello（タスク管理）
- ZOOM（週2回のMTG）
- スプレッドシート （開発スケジュール、各メンバーの作業時間を把握）<br>
<br>


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
|group_id|refernce|foreign_key: true|
|image|string|null: false|
### Association
- belongs_to :group
