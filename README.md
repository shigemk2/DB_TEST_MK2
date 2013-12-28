TwitterのユーザーTLをDBに突っ込む。

## 1. Twitter API1.1を利用してユーザーTLを取得する

https://dev.twitter.com/apps

Create a new application

でアプリ情報を入力し、以下の情報を取得する。

* consumer_key
* consumer_secret
* access_token
* access_token_secret

取得した情報はconfig.ymlに記述する。
なお、アクセストークンはページ下部のCreate my access tokenで取得すること。

## 2. 得られた情報をDBに突っ込む
