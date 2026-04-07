analyst エージェントを使ってコードを解析してください。

## 解析対象

$ARGUMENTS

（指定がない場合は直近の変更や現在のコンテキストを対象にします）

## analyst エージェントへの指示

以下の観点でコードを分析してください:

1. **4層レイヤードアーキテクチャの遵守**: Presentation / Application / Domain / Infrastructure の分離
2. **禁止事項の検知**: `@riverpod`, `flutter_hooks`, `json_serializable`, `DateTime.now()` の使用
3. **コードの品質と保守性**: SOLID 原則、`copyWith` の実装、不要な複雑さ
4. **パッケージ間の整合性**: `apps/app_main`, `packages/system`, `packages/quiz_core`, `packages/quizzes/` の役割分担

規約違反が見つかった場合は `.claude/rules/` の該当ファイルを引用して説明し、具体的な改善案を提示してください。
