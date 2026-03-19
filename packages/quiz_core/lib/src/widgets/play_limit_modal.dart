import 'package:flutter/material.dart';
import 'package:quiz_core/src/theme/app_colors.dart';

/// 1日のプレイ回数上限到達時の課金誘導モーダル
class PlayLimitModal extends StatelessWidget {
  const PlayLimitModal({
    super.key,
    required this.onUpgrade,
    required this.onDismiss,
  });

  final VoidCallback onUpgrade;
  final VoidCallback onDismiss;

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onUpgrade,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => PlayLimitModal(
        onUpgrade: onUpgrade,
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
              '本日のプレイ上限に達しました',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'プレミアムにアップグレードすると\n無制限でプレイできます',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onUpgrade,
                child: const Text('アップグレード'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onDismiss,
                child: const Text('あとで'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
