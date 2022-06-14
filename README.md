# pj-u

## 実行方法

プロジェクトのダウンロード
```
cd workdir
git clone git@github.com:fuuukeee3/pj-u.git
cd pj-u
```

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

ログイン可能なテストユーザ  
user1のみサンプル画像登録済み。
- user1/pass1
- user2/pass2
- user3/pass3
