# slides

NantoNack を紹介する3分プレゼンのスライド。[flutter_deck](https://pub.dev/packages/flutter_deck) で実装し、Flutter Web としてビルドする。

スライドにはスクリーンショットではなく **`shopping` パッケージの `ShoppingApp` を実際に描画している**。アプリ本体と同じウィジェットなので、拡大しても粗くならず、注釈のオーバーレイもレイアウトから座標を取って正確に重ねられる。

## ⚠️ このパッケージは Dart workspace のメンバーではない

ルートの `pubspec.yaml` の `workspace:` に **意図的に含めていない**。

`flutter_deck` が `go_router ^17` を要求する一方、`app_main` は `go_router ^14.8.1` に固定されており、
Dart workspace は単一解決なので両立できないため。`go_router 14` 系と両立する `flutter_deck` は 0.18.0（かなり古い）しかない。

そのため以下の点に注意すること。

- **依存を変えたら `cd apps/slides && flutter pub get`**。ルートの `melos bootstrap` では解決されない
- 一方 `melos run lint`（= ルートからの `flutter analyze .`）の **解析対象には含まれる**。
  `analysis_options.yaml` はルートを include しておくこと（`package:flutter_lints` のままだと CI が落ちる）

## 開発

```bash
cd apps/slides
fvm flutter pub get
fvm flutter run -d chrome
```

矢印キー / スペースでスライドを送る。

## ビルド

```bash
# GitHub Pages 向け（リポジトリ名のサブパスで配信されるため base-href が必須）
fvm flutter build web --base-href /nanto_nack/
```

## 実装上の注意

- **`AppTheme.light()`（quiz_core）を必ず被せる。** `ShoppingApp` は `Theme.of(context).extension<ShoppingAppTheme>()!` を読むため、
  素の `MaterialApp` では null チェック例外でクラッシュする。NotoSansJP もここから供給される
- **`LocaleSettings` は呼ばない。** クイズUIのカスタム言語は `sq` / `qt` が `AppLocale.xx` をハードコードで返すため、
  ロケール初期化なしで架空言語が表示される
- **URL 戦略はデフォルト（ハッシュ）のまま。** `usePathUrlStrategy()` を呼ぶと、
  GitHub Pages は静的配信で rewrite が無いためスライドへの直リンクが 404 になる
