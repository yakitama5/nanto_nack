import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:system/system.dart';

/// アップデートダイアログの種類
enum UpdateDialogType {
  /// 強制アップデート（閉じることができない）
  force,

  /// 任意アップデート（後で閉じられる）
  optional,
}

/// アップデートダイアログを表示する。
///
/// [isForced] が true の場合は強制アップデートダイアログを表示し、
/// バックキーや「後で」ボタンによる閉幕を禁止する。
Future<void> showUpdateDialog(
  BuildContext context, {
  required bool isForced,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: !isForced,
    builder: (context) => UpdateDialog(isForced: isForced),
  );
}

/// アップデートを促すダイアログ Widget。
///
/// - 強制アップデート: ストア遷移ボタンのみ。バックキー無効化。
/// - 任意アップデート: ストア遷移ボタン ＋「後で」ボタン。
class UpdateDialog extends StatelessWidget {
  const UpdateDialog({super.key, required this.isForced});

  final bool isForced;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return PopScope(
      // 強制アップデートの場合はバックキーによるキャンセルを無効化
      canPop: !isForced,
      child: AlertDialog(
        title: Text(t.update.title),
        content: Text(
          isForced ? t.update.forceMessage : t.update.optionalMessage,
        ),
        actions: [
          if (!isForced)
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(t.update.laterButton),
            ),
          FilledButton(
            onPressed: () => _openStore(),
            child: Text(t.update.updateButton),
          ),
        ],
      ),
    );
  }

  Future<void> _openStore() async {
    await StoreRedirect.redirect(
      androidAppId: AppEnvironment.androidPackageName,
      iOSAppId: AppEnvironment.iosAppStoreId,
    );
  }
}
