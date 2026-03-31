import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/settings/settings_state.dart';

const _keyThemeMode = 'settings_theme_mode';
const _keyUiStyle = 'settings_ui_style';

/// 設定値を [SharedPreferences] を用いて永続化する Notifier。
///
/// build() で同期的にデフォルト値を返し、非同期で保存済み設定を読み込んで反映する。
/// これにより、起動直後のフレームでシステムデフォルトを表示しつつ、
/// 速やかに保存済みのテーマ・UIスタイルへ切り替わる。
class SettingsNotifier extends Notifier<SettingsState> {
  @override
  SettingsState build() {
    // 非同期でプリファレンスをロード（完了を待たない）
    _loadPreferences();
    return const SettingsState();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeValue = prefs.getString(_keyThemeMode);
    final uiStyleValue = prefs.getString(_keyUiStyle);
    state = SettingsState(
      themeMode: _parseThemeMode(themeModeValue),
      uiStyle: _parseUiStyle(uiStyleValue),
    );
  }

  /// テーマモードを変更して永続化する
  Future<void> setThemeMode(AppThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemeMode, mode.name);
  }

  /// UIスタイルを変更して永続化する
  Future<void> setUiStyle(AppUiStyle style) async {
    state = state.copyWith(uiStyle: style);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUiStyle, style.name);
  }
}

AppThemeMode _parseThemeMode(String? value) {
  return switch (value) {
    'light' => AppThemeMode.light,
    'dark' => AppThemeMode.dark,
    _ => AppThemeMode.system,
  };
}

AppUiStyle _parseUiStyle(String? value) {
  return switch (value) {
    'material' => AppUiStyle.material,
    'cupertino' => AppUiStyle.cupertino,
    _ => AppUiStyle.system,
  };
}

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>(
  SettingsNotifier.new,
);
