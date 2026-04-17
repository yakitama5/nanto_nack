コード生成（build_runner）を実行してください。

## 手順

以下のコマンドを実行する:
```
fvm dart run melos run gen:all
```

## 対象となる生成ツール

| ツール | 用途 |
|---|---|
| `flutter_gen` | アセット（画像・フォント等）の型安全な参照クラス生成 |
| `drift_dev` + `build_runner` | ローカルDB（Drift）のDAO・クエリコード生成 |
| `slang` + `build_runner` | 多言語化（i18n）の型安全アクセスクラス生成 |

## 注意

- `json_serializable` や `riverpod_generator` は **使用禁止** です
- 生成後は `/lint` で警告が出ていないか確認してください
