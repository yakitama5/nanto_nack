# アーキテクチャ・コーディング規約

## 4層レイヤードアーキテクチャ

各パッケージ内で以下に分離:
1. **Presentation** – UI描画・ユーザー操作・状態監視
2. **Application** – ユースケース定義（Presentation ↔ Domain/Infrastructure の仲介）
3. **Domain** – ビジネスルール・エンティティ（外部依存なし純粋 Dart）
4. **Infrastructure** – データソース（Firebase/Drift/IAP）へのアクセス・Repository実装

## 状態管理ルール

- `flutter_riverpod` を使用。`ConsumerWidget` / `ConsumerStatefulWidget` のみ使用
- **`riverpod_generator` (@riverpod) 禁止**
- **`flutter_hooks` / `HookWidget` 禁止**
- `Provider`, `NotifierProvider`, `AsyncNotifierProvider`, `StateProvider` を手動で定義
- `autoDispose` Provider: `await` またぎで `ref.read` が必要な処理は `await` 前に完了させること
- public action の先頭に状態ガード (`if (state.status != QuizStatus.playing) return;`) を付けること

## コーディングベストプラクティス

- SOLID原則・「継承よりコンポジション」
- イミュータビリティ: `copyWith` を手動実装
- `List`/`Set` フィールドは `UnmodifiableListView` / `UnmodifiableSetView` でラップ
- 宣言したパラメータは必ず実装内で使用（未使用は削除）

## 現在日時

- `DateTime.now()` 禁止 → `clock.now()` を使用 (`package:clock/clock.dart`)
- 使用パッケージの `pubspec.yaml` に `clock: ^1.1.2` を追加

## エラーハンドリング

- `catch (_) {}` 空catchブロック禁止
- `catch (error, stackTrace)` で受け取り `appLogger.e(...)` でログ記録
- 副作用が連続する場合は `finally` を使い後続処理を保証

## UI・テキスト

- 色は `ThemeExtension` で定義・管理（ウィジェット層でのハードコード禁止）
- テキストはすべて `slang` 経由（日本語・英語のベタ書き禁止）
  - クイズUI内: `context.sq`（xx ロケール = カスタム言語）
  - ミッション・解説: `context.s`（ja ロケール）
- `optional callback`: null のときウィジェットラッパーを適用しないこと

## カスタム言語（クイズ内テキスト）

- `xx.i18n.json`: クイズUI表示テキスト（異世界文字）
- `ja.i18n.json`: ミッション・解説
- `en.i18n.json`: 英語版
