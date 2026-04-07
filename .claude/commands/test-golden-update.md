ゴールデンテストの期待画像を更新してください。

## 引数

`$ARGUMENTS` にパッケージ名またはテストファイルパスを指定すると、対象を絞ることができます。
例: `/test-golden-update shopping` → shoppingパッケージのゴールデン画像を更新

## 手順

### 特定パッケージを更新する場合

```
cd packages/quizzes/$ARGUMENTS && fvm flutter test --update-goldens
```

### 全パッケージのゴールデン画像を更新する場合（引数なし）

```
fvm dart run melos exec --flutter -- flutter test --update-goldens
```

> alchemist を使用している場合は `CI=true` 環境変数が必要なケースがあります:
> ```
> CI=true fvm dart run melos exec --flutter -- flutter test --update-goldens
> ```

## 注意

- ゴールデン画像の更新は **意図した UI 変更のみ** を対象にしてください
- 更新後は `/test-all` を実行して他のテストが壊れていないか確認してください
- 差分ファイルをコミットに含め、`🚨test: ゴールデン画像を更新` のラベルでコミットしてください
