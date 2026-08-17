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

## プレゼンター表示（発表者用画面）

画面下にマウスを寄せるとツールバーが出る。**「Open presenter view」**で別タブが開き、
そこに **現在のスライド / 次のスライド / 経過時間 / スピーカーノート（原稿）** が並ぶ。
投影には本体のタブを出し、手元でこちらを見る。

- **どちらのタブで送っても同期する。** 状態は `localStorage` の `storage` イベントで
  やり取りしている。そのため**同一オリジンでの配信が必須**（`file://` では動かない）
- 別タブを開くのに `url_launcher` を使うので、**ポップアップブロックを許可**しておくこと
- ノートの文字サイズは、プレゼンター表示の右上の `+` / `−` で変えられる
- **必ずツールバーのボタンから開くこと。** `#/presenter-view` を手で開くと、
  本体タブ側の同期が初期化されないまま繋がらない（初期化はボタンの中で走る）

### 原稿は `lib/speaker_notes.dart` にまとめてある

発表の原稿は**このファイルにだけ**置いている。推敲するときはここだけ見ればよく、
スライドのレイアウトを触る必要はない。各スライドは
`speakerNotes: SpeakerNotes.hookSlide` のように定数を参照しているだけ。

定数は **`const` のまま保つこと。** スライドの構成は `const` で組まれているので、
文字列連結や補間を入れると参照側がコンパイルできなくなる。

### ⚠️ スピーカーノートはスライド単位（ステップ単位ではない）

`FlutterDeckSlideConfiguration.speakerNotes` は1スライドに1つで、**ステップが進んでも
切り替わらない**。6ステップあるスライド2は、原稿の側に `［ステップ2 ①形］` のように
ステップ番号を書いて対応を取っている。ここを崩すと発表中に読めなくなる。

装飾も効かない（ただの `Text` で描かれる）。Markdown の `**強調**` は
そのまま記号として出るので使わないこと。

## ビルドと配信

`main` のスライド関連の変更で自動ビルドされ、**2つの成果物**が出る。

| 成果物 | 用途 | base-href |
| --- | --- | --- |
| Artifact `nanto-nack-slides` | **発表本番用**。書体を除きネットワーク非依存 | `/` |
| [GitHub Pages](https://yakitama5.github.io/nanto_nack/) | 共有・見返し用 | `/nanto_nack/` |

**投影は Artifact を使う。** バンドルが約90MBあり、会場の回線に依存させたくないため。

### ⚠️ 書体だけはネットワークに依存する

本文の書体 **Kiwi Maru は `google_fonts` が実行時に fonts.gstatic.com から取得する**。
フォントファイルはバンドルに含めていない。

- 通信できれば Kiwi Maru（丸みのある字形）で表示される
- **通信できないと無言で NotoSansJP に戻る。** エラーは出ないので気づけない

投影本番で字形を確実に揃えたい場合は、TTF を `assets/fonts/` に置いて
`pubspec.yaml` の `fonts:` 宣言に切り替えること。Kiwi Maru は OFL 1.1 なので、
同梱する場合は `OFL.txt` も一緒に置く。

```bash
# 同梱に切り替える場合の取得元（google/fonts の ofl/kiwimaru/）
# KiwiMaru-Regular.ttf / KiwiMaru-Medium.ttf / OFL.txt
```

### ⚠️ Kiwi Maru に太字は無い

ウェイトは Light(300) / Regular(400) / **Medium(500)** の3つだけで、Bold(700) が無い。
`FontWeight.bold` を指定しても太くならないので、
**見出しと本文の差は文字サイズと色で付ける**こと（`SlideText` がそうしてある）。

`base-href` は配信場所ごとに変わり **1つの成果物を使い回せない**（値が合わないとアセットが全て404になる）。
そのためワークフローでは 2 回ビルドしている。

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

`build:slides` の `--base-href` は **`/` 固定**（ローカル配信用）。

Pages と同じ成果物を手元で作る場合は、`apps/slides` で直接ビルドする。

```bash
cd apps/slides
fvm flutter pub get
fvm flutter build web --base-href /nanto_nack/
```

このまま `localhost` で配信しても**アセットが404になる**（`/nanto_nack/` を探すため）。
ローカル確認用には `--base-href /` の方を使うこと。

## 実装上の注意

- **`AppTheme.light()`（quiz_core）を必ず被せる。** `ShoppingApp` は `Theme.of(context).extension<ShoppingAppTheme>()!` を読むため、
  素の `MaterialApp` では null チェック例外でクラッシュする。NotoSansJP もここから供給される
- **`LocaleSettings` は呼ばない。** クイズUIのカスタム言語は `sq` / `qt` が `AppLocale.xx` をハードコードで返すため、
  ロケール初期化なしで架空言語が表示される
- **URL 戦略はデフォルト（ハッシュ）のまま。** `usePathUrlStrategy()` を呼ぶと、
  静的配信には SPA の rewrite が無いためスライドへの直リンク（`#/wonder` 等）が 404 になる
