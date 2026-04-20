import 'package:flutter/material.dart';
import 'package:quiz_core/i18n/strings.g.dart';
import 'package:quiz_core/src/theme/app_colors.dart';

/// 1日のプレイ回数上限到達時のモーダル
class PlayLimitModal extends StatelessWidget {
  const PlayLimitModal({
    super.key,
    required this.onDismiss,
  });

  final VoidCallback onDismiss;

  static Future<void> show(
    BuildContext context,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => PlayLimitModal(
        onDismiss: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.lock_clock,
              size: 56,
              color: AppColors.locked,
            ),
            const SizedBox(height: 16),
            Text(
              context.t.purchase.limitReached,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              context.t.purchase.unlockDescription,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onDismiss,
                child: Text(context.t.purchase.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
