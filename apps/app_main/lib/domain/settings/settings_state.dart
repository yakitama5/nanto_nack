/// テーマモードの選択肢
enum AppThemeMode { system, light, dark }

/// UIスタイルの選択肢（Material / Cupertino）
enum AppUiStyle { system, material, cupertino }

/// 設定画面で管理する状態。
///
/// テーマ（ライト/ダーク/システム）と UIスタイル（Android風/iOS風/システム）を保持する。
class SettingsState {
  const SettingsState({
    this.themeMode = AppThemeMode.system,
    this.uiStyle = AppUiStyle.system,
  });

  final AppThemeMode themeMode;
  final AppUiStyle uiStyle;

  SettingsState copyWith({
    AppThemeMode? themeMode,
    AppUiStyle? uiStyle,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      uiStyle: uiStyle ?? this.uiStyle,
    );
  }
}
