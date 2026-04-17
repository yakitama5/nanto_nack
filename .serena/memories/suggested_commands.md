# 主要コマンド一覧

## 重要: Windows 環境での Melos 実行

Windows では `melos` 単体コマンドが動作しない場合がある。
その際は `fvm dart run melos <command>` を使用すること。

```bash
# Melos コマンドの実行形式（Windows環境）
fvm dart run melos <command>
# または（fvm が PATH に通っている場合）
fvm flutter pub run melos <command>
```

## 日常的なコマンド

| 用途 | コマンド |
|------|---------|
| 依存解決 | `fvm dart run melos bootstrap` |
| コード生成（全パッケージ） | `fvm dart run melos run gen:all` |
| 静的解析 | `fvm dart run melos run lint` |
| ユニットテスト | `fvm dart run melos run test:unit` |
| 全テスト | `fvm dart run melos run test:all` |

## ビルド

| 用途 | コマンド |
|------|---------|
| Web ビルド | `fvm dart run melos run build:web` |
| Android 本番 | `fvm dart run melos run build:android:prod` |
| iOS 本番 | `fvm dart run melos run build:ios:prod` |

## システム系（Windows）

| 用途 | コマンド |
|------|---------|
| ファイル一覧 | `ls` / `dir` |
| ファイル検索 | `find . -name "*.dart"` |
| テキスト検索 | `grep -r "pattern" .` |
| Git操作 | `git status`, `git log`, `git diff` |

## アプリ起動

```bash
cd apps/app_main
fvm flutter run
# flavor指定
fvm flutter run --flavor dev --dart-define-from-file=dart_define/dev.json
```
