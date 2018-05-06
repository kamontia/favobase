# 冬休み(~1/8)でサービス作ってみよう

## スケジュール
* ~1/8　サーバーサイドは完成
* 1月中　クライアント完成

## サービス
* fav整理

## favorite取得API
* [GET favorites/list - お気に入りしたツイートを取得する](https://syncer.jp/Web/API/Twitter/REST_API/GET/favorites/list/)

## MongoDB 参考サイト
[ドットインストール](https://dotinstall.com/lessons/basic_mongodb_v3)

## SPA(Single Page Application)
https://qiita.com/yuku_t/items/13f3d1f71d31f3e78123



## 機能
* お気に入りを整理できる
* favo内容から適切なタグを構成
  * 階層化はいオプション
* リマインド(設定期間中に読まれていなければ)　→ LINEに投稿
    * 技術系
    * 

## tag
jsonでもつ

DBはNoSQL(MongoDB)

以下のようなjsonで持たせれば複数tag可能

fav{
  tweetid: hogehoge
  dir: hoge1/hoge2 (opt)
  tag{
    あとでよむ,
    技術,
    データベース
  }
}

## 実装手順
1. user twitter認証
1. apiでfav取得
1. JSONで一覧取得表示 <- ここまでサーバーサイド
1. GUIでfav一覧表示 <- ここクライアントで頑張る(Cordovaを使って一気にWeb、Android、iPhone作る) 

## 論理構成 実現可能性は早期に検証してね^^
* デプロイサーバ：Heroku
* フレームワーク
    * サーバーサイド：Ruby on Rails
    * クライアントサイド：
* ミドルウェア
    * MongoDB
    * Ruby on Rails 5


## view
(初版)
```
あなたのfav
---
[タグをつける](button)
*tweet link
user
text
技術,なんとか,タグです -< tagをおすと、このタグだけのtweetがみれる
---
*tweet link
user
text

```

(進化)
```
①最初にタグのプールを作る
-----------
| 技術系    |
-----------

-----------
| 日常    |
-----------

あなたのfav
---
②ドラッグ&ドロップでプールに移動。移動したツイートは色がつく
*tweet link
user
text
技術,なんとか,タグです -< tagをおすと、このタグだけのtweetがみれる
---
*tweet link
user
text

```
