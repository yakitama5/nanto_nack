<img width="1280" height="714" alt="feature" src="https://github.com/user-attachments/assets/33c87801-539e-4abf-b934-3c7c4adf8895" />

# NantoNack

UI/UX直感クイズアプリ「NantoNack」の公式リポジトリです。

## 概要

NantoNackは、ユーザーが楽しく直感的にUXの概念やクイズを学べるアプリケーションです。
FlutterとDartを用いたモノレポ構成を採用しており、高い保守性と拡張性を維持しています。

## 技術スタック

- **Flutter**: v3.41.5 (fvm管理)
- **状態管理**: Riverpod (`flutter_riverpod`)
- **ルーティング**: Go Router (`go_router`)
- **データベース**: Drift (SQLite)
- **バックエンド**: Firebase
- **多言語化**: Slang
- **テスト**: Alchemist (Golden Test), Mocktail

## アーキテクチャ

本プロジェクトは、4層レイヤードアーキテクチャを採用しています。

- **Presentation**: UIコンポーネントおよび画面レイアウト。
- **Application**: アプリケーションロジック、状態管理。
- **Domain**: ドメイン知識、エンティティ定義。
- **Infrastructure**: Firebase、DB、API通信等の外部サービスとのインターフェース。

## 開発セットアップ

### 前提条件

- [fvm](https://fvm.app/) がインストールされていること。

### 手順

1. プロジェクトをクローンし、ディレクトリに移動します。
2. 依存関係のインストール（Melosを利用）:
   ```bash
   fvm flutter pub get
   melos bootstrap
   ```

## 主要コマンド (Melos)

プロジェクトの管理には `melos` を使用します。

- **依存関係の同期**: `melos bootstrap`
- **コード生成 (build_runner)**: `melos run gen:all`
- **静的解析**: `melos run lint`
- **テスト全実行**: `melos run test:all`

## ライセンス

[LICENSE](LICENSE) ファイルを参照してください。
