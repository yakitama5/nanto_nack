# Issue #116: iOS のアプリ名に `(dev)` が付いている — 実装計画

- Issue: https://github.com/yakitama5/nanto_nack/issues/116
- ブランチ: `fix/#116/ios-app-name-dev-suffix`
- 事象: prod フレーバーで配信した iOS アプリのホーム画面表示名が `(dev)NantoNack` になっている（本来は `NantoNack`）

## 問題の原因

iOS の表示名（`CFBundleDisplayName`）だけが「ビルド中に動的生成される xcconfig」に依存しており、その仕組みが構造的に機能していないため。

### 値が解決されるまでの流れ

1. `apps/app_main/ios/Runner/Info.plist:9-10`
   `CFBundleDisplayName` = `$(appName)` を参照。
2. `$(appName)` の供給元は `apps/app_main/ios/Flutter/Dart-Defines.xcconfig`
   （`Debug.xcconfig` / `Release.xcconfig` が `#include? "Dart-Defines.xcconfig"` で読み込む）。
3. このファイルは Xcode の「Extract Dart Defines」ビルドフェーズ
   （`apps/app_main/ios/scripts/extract_dart_defines.sh`）が、Flutter から渡される
   環境変数 `DART_DEFINES` をデコードして **ビルド中に** 生成・上書きする。

### なぜ prod ビルドでも `(dev)` になるか

- **xcconfig によるビルド設定はビルド開始時（ビルドグラフ構築時）に評価される。**
  ビルドフェーズ内でファイルを書き換えても、そのビルドには反映されず「1ビルド遅れ」になる。
- さらに `Dart-Defines.xcconfig` は **dev の値（`appName=(dev)NantoNack`）で git にコミット済み**
  （commit `8ca3364` で dev に固定された）。
- そのため `melos run build:ios`
  （`flutter build ipa --release --flavor prod --dart-define-from-file=dart_define/prod.json`）
  を実行しても、ビルド開始時点のファイル内容 = dev の値で `CFBundleDisplayName` が解決され、
  `(dev)NantoNack` のまま配信される。

### 傍証

- Bundle ID は `Runner.xcodeproj/project.pbxproj` の**フレーバー別ビルド構成に直書き**
  （Release-prod → `com.yakuran.nantoNack` 等）されているため、prod 配信で正しく機能している。
  動的生成に依存している表示名だけが壊れている。
- Android は `build.gradle.kts:74` が Gradle の設定フェーズ（ビルド開始前）に
  `DART_DEFINES` を直接デコードして `app_name` を解決するため、この問題は起きない。

## 解決方法

**Bundle ID と同じ方式に揃える**: `project.pbxproj` の Runner ターゲットの
フレーバー別ビルド構成 6 つの `buildSettings` に `appName` を直書きする。
pbxproj の `buildSettings` は xcconfig より優先されるため、
`Dart-Defines.xcconfig` の内容やビルドタイミングに一切左右されなくなる。

### 手順

1. **`project.pbxproj` に `appName` を直書き**（Runner ターゲット、pbxproj 1113〜1237 行付近の 6 構成）

   | ビルド構成 | 設定値 |
   |---|---|
   | Debug-dev / Release-dev / Profile-dev | `appName = "(dev)NantoNack";` |
   | Debug-prod / Release-prod / Profile-prod | `appName = NantoNack;` |

   各構成の `buildSettings` ブロック内（`PRODUCT_BUNDLE_IDENTIFIER` の並び）に追加する。
   `Info.plist` は `$(appName)` 参照のまま変更不要。

2. **動的生成の仕組みを撤去**（appName 専用の仕組みで、他に利用箇所がないため）
   - pbxproj から「Extract Dart Defines」ビルドフェーズを削除（`project.pbxproj:390` 付近の定義と、ターゲットの `buildPhases` からの参照）
   - `apps/app_main/ios/scripts/extract_dart_defines.sh` を削除
   - `Debug.xcconfig` / `Release.xcconfig` から `#include? "Dart-Defines.xcconfig"` を削除
   - `apps/app_main/ios/Flutter/Dart-Defines.xcconfig` を git から削除
   - ※「Copy GoogleService-Info.plist」フェーズは `DART_DEFINES` を直接読んでおり
     この xcconfig に依存しないため、影響なし

3. **影響なしを確認する箇所（変更しない）**
   - `apps/app_main/dart_define/{dev,prod}.json` の `appName` は
     Android（`build.gradle.kts`）と Dart（`AppEnvironment.appName`）が使用中のため残す
   - `packages/system/lib/src/environment/app_environment.dart` は変更不要

## 検証方法

Windows ローカルでは iOS ビルドができないため、Mac / CI での確認が必要。

1. prod ビルド: `melos run build:ios` 実行後、生成された
   `Runner.app/Info.plist` の `CFBundleDisplayName` が `NantoNack` であることを確認
   （`plutil -p Runner.app/Info.plist | grep CFBundleDisplayName`）
2. dev ビルド: `flutter build ios --flavor dev --dart-define-from-file=dart_define/dev.json`
   で `(dev)NantoNack` のままであることを確認（デグレ防止）
3. クリーン状態（`flutter clean` 直後や CI のクリーンチェックアウト）から
   1 回目のビルドで正しい名前になることを確認（本バグの再現条件）
4. 静的解析: `fvm dart run melos run lint`（Dart 側は無変更のため通過見込み）

## リスク・補足

- pbxproj の手編集はフォーマットが崩れると Xcode で開けなくなるため、
  既存の `PRODUCT_BUNDLE_IDENTIFIER` 行の記法に正確に合わせること
  （`(dev)` を含む値は `"(dev)NantoNack"` とクォート必須）
- 手順 2（撤去）を保守的に見送る場合でも、手順 1 だけで問題は解消する
  （pbxproj 直書きが xcconfig を上書きするため）。ただし壊れた仕組みが残ると
  誤解を招くため、撤去まで行うことを推奨
