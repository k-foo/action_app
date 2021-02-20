# README
# アプリ名
ACTION
<br>

![icon](https://user-images.githubusercontent.com/68714247/108448237-ad24b880-72a4-11eb-8fab-b148a5b2ae1c.png)

ワンクリックで習慣をカウント出来ることから、”クリック”をモチーフにしたオリジナルロゴを作成。
時間は有限なため、今日から行動につなげようという意味を込めて、「LET'S START TODAY」のサブタイトルをつけた。

<br><br>


# アプリケーションの概要

ランディングページと、大きく４つの機能があるアプリケーション。

- 新規登録前にどんなアプリケーションか画像などを用いて説明し、ユーザーに”安心感”と”使ってみたくなる印象”を与えるための「ランディングページ」
- 食事・睡眠・運動・学び・マインド５つのカテゴリーごとに日々の小さな目標を設定できる「イフゼンルールページ」
- 将来像や達成したいことなど、中長期的な目標も設定できる「目標設定（WOOPの法則ページ）」
- 習慣をカウントして、積み重ねを可視化できる「習慣カウントページ」
- 途中で上手くいかないことがあっても、自分の弱さを受け入れて励ますことができる「セルフコンパッションページ」


<br><br>

# URL （AWS EC2によるデプロイ）

http://18.176.166.90/

<br><br>

#### Basic認証
- ID: admin
- Pass: 2222
<br>
<br>

# テスト用アカウント

- ニックネーム: ゆっこ
- メールアドレス: yume@gmail.com
- yumeyume12345eee
- 生年月日: 2000年1月27日


<br>
<br>

# 実装機能

<br>
<br>

# ER 図

![RE](https://user-images.githubusercontent.com/68714247/108610092-40c9c680-7416-11eb-90fa-1a3a012822ba.png)

<br>
<br>

# テーブル設計

### users テーブル

| Column             | Type   | Options                   |
| :----------------- | :----- | :------------------------ |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birthdate          | date   | null: false               |

#### Association

- has_many :objectives
- has_many :troubles
- has_many :habits
- has_one  :rule

<br>

### objectives テーブル

| Column      | Type       | Options                        |
| :---------- | :--------- | :----------------------------- |
| user        | references | null: false, foreign_key: true |
| title       | string     | null: false                    |
| category_id | integer    | null: false                    |
| wish        | text       | null: false                    |
| outcome     | text       | null: false                    |
| obstacle    | text       | null: false                    |
| plan        | text       | null: false                    |

#### Association

- belongs_to :user

<br>

### troubles テーブル

| Column       | Type       | Options                        |
| :----------- | :--------- | :----------------------------- |
| user         | references | null: false, foreign_key: true |
| message_type | integer    |                                |
| worry        | text       | null: false                    |

#### Association

- belongs_to :user

<br>

### habits テーブル

| Column    | Type       | Options                        |
| :-------- | :--------- | :----------------------------- |
| user      | references | null: false, foreign_key: true |
| count_1   | boolean    |                                |
| restart_1 | boolean    |                                |
| count_2   | boolean    |                                |
| restart_2 | boolean    |                                |
| count_3   | boolean    |                                |
| restart_3 | boolean    |                                |
| count_4   | boolean    |                                |
| restart_4 | boolean    |                                |
| count_5   | boolean    |                                |
| restart_5 | boolean    |                                |

#### Association

- belongs_to :user
- has_one :rule

<br>

### rules テーブル

| Column | Type       | Options                        |
| :----- | :--------- | :----------------------------- |
| user   | references | null: false, foreign_key: true |
| if_1   | boolean    | null: false                    |
| then_1 | boolean    | null: false                    |
| if_2   | boolean    | null: false                    |
| then_2 | boolean    | null: false                    |
| if_3   | boolean    | null: false                    |
| then_3 | boolean    | null: false                    |
| if_4   | boolean    | null: false                    |
| then_4 | boolean    | null: false                    |
| if_5   | boolean    | null: false                    |
| then_5 | boolean    | null: false                    |

#### Association

- belongs_to :user
- belongs_to :habit, optional: true

<br>
<br>

# 使用しているフレームワーク・バージョン等

#### ローカル環境
- Rails 6.0.3.4
- ruby 2.6.5
- MySQL 5.6.47

#### 本番環境
- Rails 6.0.3.4
- ruby 2.6.5
- capistrano 3.15.0
- unicorn 5.4.1
- nginx1
- MariaDB 5.5.68

<br>
<br>

# clone
```
% git clone https://github.com/erika618/action_app.git
% cd action_app
% bundle install
% rails db:create
% rails db:migrate
% yarn install
```

<br>
<br>

# 結合テストコード・使うコマンド
```terminal
✅ユーザーの新規登録時の画面遷移を確認
% bundle exec rspec spec/system/users_spec.rb

✅新規目標設定時の画面遷移を確認
% bundle exec rspec spec/system/objectives_spec.rb

✅新規イフゼンルール設定時の画面遷移を確認
% bundle exec rspec spec/system/rules_spec.rb
```

<br>

# モデル単体テストコード・使うコマンド
```terminal
✅ユーザーの新規登録時のバリデーションを確認
% bundle exec rspec spec/models/user_spec.rb

✅目標設定時のバリデーションを確認
% bundle exec rspec spec/models/objective_spec.rb

✅イフゼンルールのバリデーションを確認
% bundle exec rspec spec/models/rule_spec.rb
```

<br>

# その他使用しているgem・使うコマンド
```terminal
🚨brakeman（脆弱性に繋がるコードがないか確認するため ※全てのファイル・全ての警告オプション）
% bundle exec brakeman -A -w1

🚨rails_best_practices（読みやすく正しいコードか確認するため）
% rails_best_practices .

🚨rubocop（インデントを整えるため）
% bundle exec rubocop -a
```