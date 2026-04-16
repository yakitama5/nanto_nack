# NantoNack プロジェクト概要

## プロジェクト概要

**NantoNack** は Flutter/Dart で開発された UI/UX 直感クイズアプリ。
ユーザーが実際のアプリ UI（Gmail 風メール、チャット、地図等）を操作しながら
直感力・操作知識を試すクイズ形式のゲームアプリ。

## リポジトリ構成

**Pub Workspace + Melos** モノレポ。バージョン管理は **fvm**。

```
nanto_nack/
├── apps/
│   └── app_main/          # メインアプリ（状態管理・ルーティング）
├── packages/
│   ├── system/            # 基盤（Firebase / Drift / IAP）
│   ├── quiz_core/         # 共通コンポーネント・テーマ
│   ├── geolocator_windows_stub/  # Windows向けスタブ
│   └── quizzes/           # カテゴリ別クイズ
│       ├── alarm/
│       ├── chat/
│       ├── mail/
│       ├── map/
│       ├── payment/
│       ├── shopping/
│       └── streaming/
├── docs/                  # 設計ドキュメント
├── .agents/rules/         # 詳細技術規約
└── pubspec.yaml           # ワークスペースルート
```

## ドキュメント

- `docs/table-design.md`: ローカルDB（Drift）テーブル定義
- `docs/custom-language-design.md`: カスタム言語（異世界文字）変換仕様
- `docs/quizzes/<category>.md`: カテゴリ別クイズ仕様
- `.agents/rules/`: 詳細技術規約（アーキテクチャ・状態管理・UI・テスト等）
