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


## 作成資料

### 設計図

https://miro.com/app/board/uXjVOtn0w6A=/?share_link_id=895533122777

### テスト

https://docs.google.com/spreadsheets/d/1oXW60t57Mvqd1BWNqI0YXa5chDIOsZ2z2GB1G-SFsUM/edit?usp=sharing

## 作業時間

- 要件整理 1h
- 写真一覧 ~ アップロード 6.5h
- OAuth関連 4h
- リファクタ 1.5h
- テスト 1h
- 合計 およそ14h

