# UI, Navigation & Internationalization

## 🔗 Routing

- **GoRouter:** 宣言的ナビゲーションのために `go_router` を使用。
- **注意:** `go_router_builder` は使用せず、ルート定義は手動で行うこと。

## 📐 Layout & Responsive

- **Responsive Framework:** `responsive_framework` を使用してマルチデバイス対応を行う。
- **デバイス別挙動:**
  - **Mobile / Tablet:** 画面サイズに最適化。
  - **Desktop (Web/Mac/Windows):** タブレットサイズ（例: 最大800px）で固定。
  - **余白:** デスクトップ表示時は、コンテンツを中央に寄せ、左右にマージンを表示するレイアウトを徹底すること。

## 🌍 Internationalization (i18n)

- **Slang:** `slang` および `slang_flutter` を使用。
- **ワークフロー:** JSON/YAMLベースで定義し、コード生成を行う。型安全なアクセスを優先すること。
