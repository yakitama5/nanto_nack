# slides

NantoNack を紹介する3分プレゼンのスライド。[flutter_deck](https://pub.dev/packages/flutter_deck) で実装し、Flutter Web としてビルドする。

スライドにはスクリーンショットではなく **`shopping` パッケージの `ShoppingApp` を実際に描画している**。アプリ本体と同じウィジェットなので、拡大しても粗くならず、注釈のオーバーレイもレイアウトから座標を取って正確に重ねられる。

## ⚠️ このパッケージは Dart workspace のメンバーではない

ルートの `pubspec.yaml` の `workspace:` に **意図的に含めていない**。

本パッケージが使う `flutter_deck 0.29.0` は `go_router ^17` を要求し（実際に解決されるのは 17.3.0）、
一方 `app_main` は `go_router ^14.8.1` に固定されている。Dart workspace は単一解決なので両立できない。
`go_router 14` 系と両立する `flutter_deck` は 0.18.0 までさかのぼる必要があり、採用するには古すぎる。

そのため以下の点に注意すること。

- **依存を変えたら `cd apps/slides && flutter pub get`**。ルートの `melos bootstrap` では解決されない
- 一方 `melos run lint`（= ルートからの `flutter analyze .`）の **解析対象には含まれる**。
  `analysis_options.yaml` はルートを include しておくこと（`package:flutter_lints` のままだと CI が落ちる）
- `melos run test:all` の **対象外**。CI では `annotation_target_test.dart` だけを個別に実行している

## テスト

| ファイル | 役割 | CI |
| --- | --- | --- |
| `annotation_target_test.dart` | スライド2の注釈座標が実画面と一致するかの検査 | ✅ 実行する |
| `slide_preview_test.dart` | スライドの見た目を `test/goldens/` に PNG 出力する**プレビュー生成器** | ❌ 実行しない |

```bash
# スライドの見た目を確認する（goldens を上書きする。比較はしない）
fvm flutter test --update-goldens test/slide_preview_test.dart
```

プレビューは **goldens を開発機で生成している**ため、フォントのラスタライズが異なる CI（Linux）で
比較すると必ず落ちる。期待画像を固定するとスライドを直すたびに落ちてプレビューとして使えなくなるので、
**比較はせず常に上書きする**設計にしてある。

## 開発

```bash
cd apps/slides
fvm flutter pub get
fvm flutter run -d chrome
```

矢印キー / スペースでスライドを送る。

## ビルドと配信

成果物は **GitHub Actions の Artifact** として配布する。Web でホスティングはしない。
`main` の `apps/slides/**` が変わると自動でビルドされ、Actions の実行結果に
`nanto-nack-slides` という Artifact が付く。

> `quiz_core` / `shopping` を変更したときは自動では走らない。
> スライドに反映したい場合は Actions から **Build Slides を手動実行**すること。

### ⚠️ index.html をダブルクリックしても動かない

Flutter Web は `file://` では JS とアセットの読み込みに失敗する。
**必ず HTTP サーバを立てること。**

```bash
# Artifact をダウンロードして解凍したあと
cd 解凍先
python -m http.server 8000
# ブラウザで http://localhost:8000/ を開く
```

### ローカルでビルドする場合

```bash
fvm dart run melos run build:slides   # apps/slides/build/web に出力
fvm dart run melos run serve:slides   # http://localhost:8000/ で配信
```

`--base-href` は **`/` 固定**。ローカルの HTTP サーバで配信する前提のため。
サブパスで配信する（GitHub Pages 等）場合はこの指定を変える必要がある。

## 実装上の注意

- **`AppTheme.light()`（quiz_core）を必ず被せる。** `ShoppingApp` は `Theme.of(context).extension<ShoppingAppTheme>()!` を読むため、
  素の `MaterialApp` では null チェック例外でクラッシュする。NotoSansJP もここから供給される
- **`LocaleSettings` は呼ばない。** クイズUIのカスタム言語は `sq` / `qt` が `AppLocale.xx` をハードコードで返すため、
  ロケール初期化なしで架空言語が表示される
- **URL 戦略はデフォルト（ハッシュ）のまま。** `usePathUrlStrategy()` を呼ぶと、
  静的配信には SPA の rewrite が無いためスライドへの直リンク（`#/wonder` 等）が 404 になる
