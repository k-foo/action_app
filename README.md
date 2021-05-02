# README
![icon](https://user-images.githubusercontent.com/68714247/108448237-ad24b880-72a4-11eb-8fab-b148a5b2ae1c.png)

# 目次
1. [アプリケーションの概要](#anchor1) 
1. [なぜこのアプリケーションを作ろうと思ったのか](#anchor2) 
1. [アプリケーションの機能一覧](#anchor3)
1. [このアプリケーション内で使用している技術一覧](#anchor4) 
1. [工夫したところ](#anchor5) 
1. [苦労したところ](#anchor6) 
1. [チャレンジしたこと](#anchor7) 
1. [今後追加したい機能について](#anchor8) 
1. [プログラミングに対する向き合い方について](#anchor9) 
1. [オリジナルアプリ通して得られた気付き](#anchor10) 

<br>
<br>

<a id="anchor1"></a>

# [1.アプリケーションの概要](#anchor1) 

### アプリケーション名

ACTION
<br>

## 概要

小さな積み重ねを通して"自信"と”自分は出来る感覚”を持ちながら成長につなげることを目的とした、習慣化や目標設定・自分自身を励ますことができるアプリケーションです。
<br>

## URL（AWS EC2によるデプロイ）

http://18.176.166.90/

## URL（Herokuによるデプロイ）

https://action-today.herokuapp.com/


### Basic認証

- ID: admin
- Pass: 2222
<br>

### テスト用アカウント

- ニックネーム: ぶどう
- メールアドレス: yumem1@gmail.com
- yume12345aa
- 生年月日: 2000年1月27日
<br>

### 補足

新規登録時とログイン時で画面遷移が異なるため、是非ユーザー登録して遊んでみてください！

- 新規登録：新規登録後、イフゼンルールを設定してから習慣カウント画面へ
- ログイン：ログイン後、習慣カウント画面へ
<br>

<br>
<br>

<a id="anchor2"></a>

# [2.なぜこのアプリケーションを作ろうと思ったのか](#anchor2) 

<p>小さな習慣（良い行い）が、大きな自己成長に繋がるのではないかという仮説があったからです。</p>
<p>なぜならば、憧れている方を構造化して紐解いてみると、１日で大成するわけではなく、日々どれだけ良質な習慣を積み重ねられているかによると感じました。</p>
<p>また習慣化することによって、"自信"や"自分は出来るという感覚"を身につけられるのではないかと考えました。</p>

<br>

## 解決したい悩み

- 「成長したいと思っているけれど、自分にとっての良い習慣が続かない」
- 「続いたことを可視化をしたいけれど書くのが手間であり、紙に書いてもなくす」

<br>

## ユーザーインタビュー


![interview](https://user-images.githubusercontent.com/68714247/108855007-d68a6f00-762b-11eb-80a3-10c407be70e0.png)

上記らを機能に落とし込もうと考えました。

<br>
<br>

<a id="anchor3"></a>

# [3.アプリケーションの機能一覧](#anchor3)

|NO|画面|機能|目的|備考|様子|
|:---|:---|:---|:---|:---|:---|
|1|ランディングページ|機能紹介|どんなアプリなのか知ってから登録したいため|画像で誰のために何ができるアプリなのか説明|![1](https://user-images.githubusercontent.com/68714247/108995709-d5674980-76e0-11eb-8ddc-e2135e65c85a.gif)|
|2|ユーザー登録|新規登録・ログイン機能|ユーザーごとにカウントするため|JavaScriptで🔑マークに遊びを入れた|![2](https://user-images.githubusercontent.com/68714247/108995839-02b3f780-76e1-11eb-9036-f475e0292f2b.gif)|
|3|イフゼンルール|新規登録・編集・更新機能|習慣化させるため|カテゴリー別に考えられるようにした|![3](https://user-images.githubusercontent.com/68714247/108995975-2f680f00-76e1-11eb-8d4b-14f44cab3932.gif)|
|4|習慣カウント|カウント機能|可視化するため|ワンクリックでカウント可能|![4](https://user-images.githubusercontent.com/68714247/108996116-5b839000-76e1-11eb-9e1f-b6d95a54a228.gif)|
|5|目標設定|新規登録・詳細・編集・更新・削除機能|どうなりたいか明確にするため|改行できるように設定|![5](https://user-images.githubusercontent.com/68714247/108996205-7229e700-76e1-11eb-97aa-833afcd47064.gif)|
|6|セルフコンパッション|新規投稿機能|上手くいかない時でも励ますため|Ajaxによる非同期通信|![6](https://user-images.githubusercontent.com/68714247/108996277-8968d480-76e1-11eb-8e3c-cd868fa172db.gif)|

<br>

## 画像で紹介

![READMEfunction](https://user-images.githubusercontent.com/68714247/108849880-046cb500-7626-11eb-8e0b-d1c40b3ed15e.png)

<br>
<br>

<a id="anchor4"></a>

# [4.このアプリケーション内で使用している技術の一覧](#anchor4) 

## 使用しているフレームワーク・バージョン等

### ローカル環境  (2021/3/21更新)
- Rails 6.1.3
- ruby 3.0.0
- MySQL 5.6.50

### 本番環境 (2021/3/21更新)
- Rails 6.1.3
- ruby 3.0.0
- capistrano 3.16.0
- unicorn 5.7.0
- nginx1
- MariaDB 5.5.68
<br>

## 制作期間

- 12/21〜1/13（構想・ユーザーインタビュー・要件定義・データベース設計）
- 1/14〜2/19(実装スタート・デプロイまで）
- 2/20〜2/23（フィードバックを受けて改善）
<br>

## ER 図

![RE](https://user-images.githubusercontent.com/68714247/108610092-40c9c680-7416-11eb-90fa-1a3a012822ba.png)
<br>

## テーブル設計

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

### clone
```
% git clone https://github.com/erika618/action_app.git
% cd action_app
% bundle install
% rails db:create
% rails db:migrate
% yarn install
```
<br>

## 結合テストコード・使うコマンド
```terminal
✅ユーザーの新規登録時の画面遷移を確認
% bundle exec rspec spec/system/users_spec.rb

✅新規目標設定時の画面遷移を確認
% bundle exec rspec spec/system/objectives_spec.rb

✅新規イフゼンルール設定時の画面遷移を確認
% bundle exec rspec spec/system/rules_spec.rb
```
<br>

## モデル単体テストコード・使うコマンド
```terminal
✅ユーザーの新規登録時のバリデーションを確認
% bundle exec rspec spec/models/user_spec.rb

✅目標設定時のバリデーションを確認
% bundle exec rspec spec/models/objective_spec.rb

✅イフゼンルールのバリデーションを確認
% bundle exec rspec spec/models/rule_spec.rb
```
<br>

## その他使用しているgem・使うコマンド
```terminal
🚨brakeman（脆弱性に繋がるコードがないか確認するため ※全てのファイル・全ての警告オプション）
% bundle exec brakeman -A -w1

🚨rails_best_practices（読みやすく正しいコードか確認するため）
% rails_best_practices .

🚨rubocop（インデントを整えるため）
% bundle exec rubocop -a
```
<br>
<br>

<a id="anchor5"></a>

# [5.工夫したところ](#anchor5) 

以下、３点を工夫しました。

### 1.いかにユーザーに安心感を持ってもらえるか
- ランディングページを作り、機能をあらかじめ説明することによって使ってみたくなるよう構成。
- ユーザー登録することによって、パーソナルな環境を作れるよう構成。

### 2.いかにユーザーの手間を減らせるか
- 習慣カウントについて、ログイン後のトップページとし`checked: true`をつけてワンクリックでカウント出来るよう工夫。
- ナビゲーションについて、アイコンも併用。視覚的にもわかりやすく表現。

### 3.いかにユーザーに楽しんでもらえるか
- 毎日、アプリケーションを開いてもらえるように、見た目についても気を配った。具体的にはオリジナルロゴの作成や、３色以内のベーシックな色合いなど。
- 日々の習慣をカウントするだけでなく、途切れてしまったあとに復活した回数もカウントできる「restart」を設けて、ポジティブなアプリケーションになるように考えた。
- パスワードについて安全性を高めるためデフォルト6文字→10文字以上に変更。その際、入力時に10文字以上になると鍵マークがくっきりするよう遊びをつけた。

![7](https://user-images.githubusercontent.com/68714247/108996355-9dacd180-76e1-11eb-9e7c-c5549029ac0b.gif)


<a id="anchor6"></a>

# [6.苦労したところ](#anchor6) 

以下、３点が特に苦労しました。

### 1.構想
- 実現したいことを機能に落とし込んだため、どうデータベース設計をしたらいいか（ふるまいごとに分けられるか）に苦慮した。

### 2.複数のコントローラーを一つのビューに表示させること
- ふるまいごとにデータベースを分けた結果、習慣カウントにイフゼンルールを表示させる方法に苦慮した。（アソシエーションやストロングパラメーター、外部キーの理解が深まった）

### 3.対話調の実装をすること
- セルフコンパッションで対話調にする方法に苦慮した。また実現できたと思ったら本番環境で画像が反映されないことに苦慮した。（`enum`によるラジオボタンの実装、条件分岐、アセットコンパイルについての理解が深まった）

<br>
<br>

<a id="anchor7"></a>

# [7.チャレンジしたこと](#anchor7) 

## テスト駆動開発

最後のイフゼンルールを実装する際、テスト駆動開発のことを知り、実践しました。
<br>
「レッドグリーンリファクタリング」で進めていく実装方法のおかげで開発環境と本番環境で一致していないバグに気づくことができました。
<br>
一つずつ動作するきれいなコードにブラッシュアップしていく工程が、楽しかったです。またGitHubのコミットの粒度を今までで一番揃えられた気がして嬉しかったです。

<br>
<br>

<a id="anchor8"></a>

#  [8.今後追加したい機能](#anchor8) 

<br>
実際に使ってもらったユーザーからフィードバックを受け、見た目に関する部分は修正しました。
今後、機能について以下のような追加をしていきたいと考えています。

- マイページ(ニックネームを変更したい)
- カウント時のアニメーション(カウントしたくなるようなアニメーション)
- 自分のカウントを他人へ共有できる機能(他者との繋がりでより習慣化へつなげる)
- 目標を検索できる機能(今まで投稿したものを探しやすくする)

<br>
<br>

<a id="anchor9"></a>

# [9.プログラミングに対する向き合い方](#anchor9) 

<br>
技術力と同じ位、楽しく長く付き合っていくための向き合い方を試行錯誤しながらアプリケーションを制作していました。
<br>
なぜならば、プログラミングは上手くいかないことの方が多く、自分との弱さに向き合う機会が多いと感じたためです。
<br>
現在は、以下の考えや行動を大切にしながら、プログラミングと向き合っています。

- 毎日15分以上行うこと（ハードルは低く設定）
- 「HOW」より「WHY」を大事にインプットする（応用に繋がると実感したため）
- アウトプットをすること（言語化できない＝理解できていないと気がついたため）

<br>
<br>

<a id="anchor10"></a>

# [10.オリジナルアプリ通して得られた気付き](#anchor10) 

<br>
オリジナルアプリを初めて作ってみて、「想い」を仕様に落とし込んで機能にする「楽しさ」と「難しさ」を一番に感じました。
<br>
また今回は自分の想いを形にしましたが、これを他の方の想いや戦略を形にできたらどれだけ面白いだろうかとワクワクしました。
<br>
<br>
進め方について、自分の仮説だけでなく、他者の意見を取り入れることによって、より本質的な課題解決に繋がるアプリケーションにブラッシュアップできることも感じたことです。
<br>
今後も「この課題を解決したい」「こんなふうに便利にしたい」いろんな人の想いを、アプリケーションの力で仕組み化・具現化していく経験を増やしていきたいです。
