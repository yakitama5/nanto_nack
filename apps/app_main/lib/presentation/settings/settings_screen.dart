import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../application/settings/settings_notifier.dart';
import '../../domain/settings/settings_state.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          t.settings.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: false,
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
        children: const [
          _AppearanceCard(),
          SizedBox(height: 16),
          _DataCard(),
          SizedBox(height: 16),
          _AboutCard(),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// Card 1: アピアランス
// ─────────────────────────────────────────

class _AppearanceCard extends ConsumerWidget {
  const _AppearanceCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return _SettingsCard(
      backgroundColor: const Color(0xFFEDE7F6), // 薄い紫
      darkBackgroundColor: const Color(0xFF2D2640),
      title: t.settings.appearance.title,
      icon: Icons.palette_outlined,
      iconColor: const Color(0xFF7B1FA2),
      children: [
        // テーマ選択
        _SectionLabel(label: t.settings.appearance.theme),
        _ChoiceItem(
          label: t.settings.appearance.themeSystem,
          selected: settings.themeMode == AppThemeMode.system,
          onTap: () {
            ref
                .read(analyticsServiceProvider)
                .logThemeChanged(themeMode: 'system');
            notifier.setThemeMode(AppThemeMode.system);
          },
        ),
        _ChoiceItem(
          label: t.settings.appearance.themeLight,
          selected: settings.themeMode == AppThemeMode.light,
          onTap: () {
            ref
                .read(analyticsServiceProvider)
                .logThemeChanged(themeMode: 'light');
            notifier.setThemeMode(AppThemeMode.light);
          },
        ),
        _ChoiceItem(
          label: t.settings.appearance.themeDark,
          selected: settings.themeMode == AppThemeMode.dark,
          onTap: () {
            ref
                .read(analyticsServiceProvider)
                .logThemeChanged(themeMode: 'dark');
            notifier.setThemeMode(AppThemeMode.dark);
          },
        ),
        const SizedBox(height: 12),
        // UIスタイル選択
        _SectionLabel(label: t.settings.appearance.uiStyle),
        _ChoiceItem(
          label: t.settings.appearance.uiStyleSystem,
          selected: settings.uiStyle == AppUiStyle.system,
          onTap: () {
            ref
                .read(analyticsServiceProvider)
                .logUiStyleChanged(uiStyle: 'system');
            notifier.setUiStyle(AppUiStyle.system);
          },
        ),
        _ChoiceItem(
          label: t.settings.appearance.uiStyleMaterial,
          selected: settings.uiStyle == AppUiStyle.material,
          onTap: () {
            ref
                .read(analyticsServiceProvider)
                .logUiStyleChanged(uiStyle: 'material');
            notifier.setUiStyle(AppUiStyle.material);
          },
        ),
        _ChoiceItem(
          label: t.settings.appearance.uiStyleCupertino,
          selected: settings.uiStyle == AppUiStyle.cupertino,
          onTap: () {
            ref
                .read(analyticsServiceProvider)
                .logUiStyleChanged(uiStyle: 'cupertino');
            notifier.setUiStyle(AppUiStyle.cupertino);
          },
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────
// Card 2: データとアカウント
// ─────────────────────────────────────────

class _DataCard extends ConsumerWidget {
  const _DataCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    return _SettingsCard(
      backgroundColor: const Color(0xFFFFF3E0), // 薄いオレンジ
      darkBackgroundColor: const Color(0xFF3D2B10),
      title: t.settings.data.title,
      icon: Icons.storage_outlined,
      iconColor: const Color(0xFFE65100),
      children: [
        // TODO(yakitama5): IAP実装後に有効化する
        _ActionItem(
          label: t.settings.data.restorePurchase,
          icon: Icons.restore_rounded,
        ),
        _ActionItem(
          label: t.settings.data.resetData,
          icon: Icons.delete_outline_rounded,
          labelColor: Colors.red,
          onTap: () => _showResetConfirmDialog(context, ref),
        ),
      ],
    );
  }

  Future<void> _showResetConfirmDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final t = Translations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(t.settings.data.resetDataDialogTitle),
        content: Text(t.settings.data.resetDataDialogMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(t.settings.data.resetDataCancel),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(t.settings.data.resetDataOk),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    if (!context.mounted) return;

    await ref.read(analyticsServiceProvider).logDataReset();
    final repository = ref.read(quizResultRepositoryProvider);
    await repository.deleteAllPlayData();

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(t.settings.data.resetDataSuccess)),
    );
  }
}

// ─────────────────────────────────────────
// Card 3: アプリについて
// ─────────────────────────────────────────

class _AboutCard extends ConsumerStatefulWidget {
  const _AboutCard();

  @override
  ConsumerState<_AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends ConsumerState<_AboutCard> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _version = '${info.version}+${info.buildNumber}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return _SettingsCard(
      backgroundColor: const Color(0xFFE8F5E9), // 薄い緑
      darkBackgroundColor: const Color(0xFF0F2E14),
      title: t.settings.about.title,
      icon: Icons.info_outline_rounded,
      iconColor: const Color(0xFF2E7D32),
      children: [
        _ActionItem(
          label: t.settings.about.developerX,
          icon: Icons.open_in_new_rounded,
          onTap: () => _launchExternalUrl(
            'https://x.com/yakuran1',
            linkName: 'developer_x',
          ),
        ),
        _ActionItem(
          label: t.settings.about.terms,
          icon: Icons.open_in_new_rounded,
          onTap: () => _launchExternalUrl(
            'https://yakitama5.github.io/nanto_nack/terms',
            linkName: 'terms',
          ),
        ),
        _ActionItem(
          label: t.settings.about.contact,
          icon: Icons.open_in_new_rounded,
          onTap: () => _launchExternalUrl(
            'https://forms.gle/x8hA5bKNM4yHpd8A9',
            linkName: 'contact',
          ),
        ),
        _ActionItem(
          label: t.settings.about.licenses,
          icon: Icons.chevron_right_rounded,
          onTap: () => showLicensePage(
            context: context,
            applicationName: 'NantoNack',
            applicationVersion: _version.isNotEmpty
                ? t.settings.about.version.replaceAll('{version}', _version)
                : null,
          ),
        ),
        if (_version.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Text(
              t.settings.about.version.replaceAll('{version}', _version),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.45),
                  ),
            ),
          ),
      ],
    );
  }

  Future<void> _launchExternalUrl(
    String url, {
    required String linkName,
  }) async {
    // Analytics は fire-and-forget（UI ブロックを避けるため）
    ref
        .read(analyticsServiceProvider)
        .logExternalLinkTapped(linkName: linkName);
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(Translations.of(context).error.unknown)),
      );
    }
  }
}

// ─────────────────────────────────────────
// 共通ウィジェット
// ─────────────────────────────────────────

/// NantoNack風の角丸・軽いシャドウを持つ設定カード
class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    required this.backgroundColor,
    required this.darkBackgroundColor,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.children,
  });

  final Color backgroundColor;
  final Color darkBackgroundColor;
  final String title;
  final IconData icon;
  final Color iconColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? darkBackgroundColor : backgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // カードヘッダー
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 18, color: iconColor),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: iconColor,
                      ),
                ),
              ],
            ),
          ),
          // セパレーター
          Divider(
            height: 1,
            color: iconColor.withValues(alpha: 0.12),
          ),
          // コンテンツ
          ...children,
        ],
      ),
    );
  }
}

/// セクションラベル（テーマ選択・UIスタイル選択の小見出し）
class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.5),
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
      ),
    );
  }
}

/// 選択可能な設定項目（iOS設定アプリ風チェックマーク付き）
class _ChoiceItem extends StatelessWidget {
  const _ChoiceItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              color: selected ? colorScheme.primary : colorScheme.onSurface,
            ),
      ),
      trailing: selected
          ? Icon(Icons.check_rounded, size: 20, color: colorScheme.primary)
          : null,
      onTap: onTap,
    );
  }
}

/// アクション型の設定項目（タップで処理を実行）
class _ActionItem extends StatelessWidget {
  const _ActionItem({
    required this.label,
    required this.icon,
    this.onTap,
    this.labelColor,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: labelColor ?? colorScheme.onSurface,
            ),
      ),
      trailing: Icon(
        icon,
        size: 18,
        color: labelColor ?? colorScheme.onSurface.withValues(alpha: 0.4),
      ),
      onTap: onTap,
    );
  }
}
