## backend環境構築
以下のコマンド実行

ビルド<br>
`docker-compose build`

DB作成<br>
`docker-compose run api rails db:create`

コンテナ起動<br>
`docker-compose up`

http://0.0.0.0:4000 にアクセスできたらok!

## 新たにpullした後にすること
コンテナ停止<br>
`docker-compose down`

ビルドし直す<br>
`docker-compose build`

コンテナ起動<br>
`docker-compose up`


hello worldデザイン変わってた！！

## M1Macのエラー
`docker-compose.yml`の3行目付近に以下の行を足さないとエラー出ます！
```
　　db:
　　　　platform: linux/x86_64
```
エラー内容
```
ERROR: no matching manifest for linux/arm64/v8 in the manifest list entries
```

## Dockerの注意点
1. 使い終わった時は必ず、`docker-compose down`すること
1. Dockerのアプリ自体を起動していないと、docker-composeも動かないこと