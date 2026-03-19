# Testing Guidelines

## 🧪 Testing Stack

品質維持のため、以下のツールを適切に組み合わせてテストを記述すること。

- **Unit Test:** `test` パッケージ。
- **Widget Test:** `flutter_test` パッケージ。
- **Golden Test:** `alchemist` を利用。
- **E2E Test:** `patrol` を利用。

## 🚀 Execution

- テストの実行は、個別のディレクトリではなく、ルートから `melos run test:all` 等の Melos スクリプトを介して行うことを推奨する。
