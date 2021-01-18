 # アプリケーション名	 
 
 zerosystem

 # アプリケーション概要	
 
 旅行をする上で、計画作りやきっかけ・意見交換を行えるアプリケーションを目指す

 # URL 
 
 https://zerosystem-32413.herokuapp.com/
 
 # テスト用アカウント 

 ユーザーアカウント ID 1 ああああ
 メールアドレス: abe@yahoo.co.jp
 password : 1q1q1q1

 ユーザーアカウント ID 2 いいいい
 メールアドレス: hata@yahoo.co.jp
 password : 2q2q2q2
 
Basic認証 :ID       :admin
          password :2222

 # 利用方法	
 
 チャット / 画像を含めた投稿機能 / スケジュール管理機能

 # 目指した課題解決
 
 CSSを利用して、どこまで実装できるか。プルダウン機能やアニメーションなどをjavaを使用せずに実装できた
 GoogleMapを利用して、画像投稿と合わせて実装できるか。 アソシエーションやバリデーションに組むのに時間がかかったが負荷なく実装できた。
 また、環境変数を使用することになったので、暗証のキーをうまく隠せることができた。

 # 洗い出した要件

 device /action cable / acive storage / GoogleMap / simple_calendar / rspec-rails & factory_bot_rails & faker

 # 実装した機能についてのGIFと説明

 ユーザー管理機能 :gemのdeviceを利用して、ユーザー管理をより確実に行えるようにする。
            下記の全ての機能に、未ログイン・ログイン・投稿者にできることを条件式によって振り分ける

 チャット機能 :action cableを利用して、LINEのように遅滞のない会話ができるようにする。
            ログインしているユーザー名を一括に別途に掲示しておくことで誰とトークしているかわかるようにしている。

画像投稿機能 :active storageを利用して画像を投稿することで、おすすめの商品を掲載する。
            またGoogleMapを活用して、店の場所を細かく掲載することで、現地に行った時迷うことなく到着できるようにする。

カレンダー機能 :gemのsimple_calendarを活用して、カレンダーを作成。そこから書面のみの投稿機能を設定する

 # 実装予定の機能

 チャット機能にルームの部屋分け・いいね機能

 カレンダー機能のグレードアップ（まだ考え中）

 新たなテーブル

 # ローカルでの動作方法
 
 	HTML・CSS・Ruby・Ruby on Rails・JavaScript・SQL・Git・ GitHub 等の技術を用いたアプリケーション開発

# データベース設計 ER図 https://github.com/Kaneko-Yukihiro0117/zerosystem/blob/master/original.png

 ## users テーブル

| Column             | Type       | Options                                     |
| ------------------ | ---------- | ------------------------------------------- |
| nickname           | string     | null: false                                 |
| encrypted_password | string     | null: false                                 |
| email              | string     | null: false, unique: true, index: true      |
| first_name_kanji   | string     | null: false                                 |
| last_name_kanji    | string     | null: false                                 |
| first_name_kana    | string     | null: false                                 |
| last_name_kana     | string     | null: false                                 |
| birthday           | date       | null: false                                 |

### Association

- has_many :comments
- has_many :shops
- has_many :blogs


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |


##  shopsテーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | --------------------------------|
| item_name   | string     | null: false                     |
| store_name  | string     | null: false                     |
| latitude    | float      | null: false                     |
| longitude   | float      | null: false                     |
| detail      | text       | null: false                     |
| category_id | integer    | null: false                     |
| user_id     | references | null: false, foreign_key :true  |

### Association

- belongs_to_active_hash :category
- has_one_attached :image
- belongs_to :user

## blogs テーブル

| Column     | Type       | Options                         |
| ---------- | ---------- | ------------------------------- |
| title      | string     | null: false                     |
| plan       | text       | null: false                     |
| start_time | datetime   | null: false                     |
| user       | references | null: false, foreign_key :true  |

### Association

- belongs_to :user
