# pj-u

## 実行方法

環境変数の設定
```
export UNIFA_CLIENT_ID={CLIENT_ID}
export UNIFA_CLIENT_SECRET={CLIENT_SECRET}
```

DBの作成、シードの流し込み
```
bin/rails db:migrate
bin/rails db:seed
```

アプリの起動
```
bin/rails s
```
