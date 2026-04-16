import 'package:flutter/material.dart';

/// クイズリザルト画面のInsightセクション（解説）を表示する共通ウィジェット。
///
/// [QuizResultOverlay] の `insight` パラメータに渡して使用する。
/// スタイルはMaterial 3の標準セカンダリテキスト色（onSurfaceVariant）を使用する。
///
/// ```dart
/// QuizResultOverlay(
///   ...
///   insight: QuizInsightContent(
///     title: insight.title,
///     subtitle: insight.subtitle,
///     items: [
///       QuizInsightItem(emoji: '📱', title: insight.step1Title, desc: insight.step1Desc),
///       QuizInsightItem(emoji: '👆', title: insight.step2Title, desc: insight.step2Desc),
///       QuizInsightItem(emoji: '✅', title: insight.step3Title, desc: insight.step3Desc),
///     ],
///   ),
/// ),
/// ```
class QuizInsightContent extends StatelessWidget {
  const QuizInsightContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.items,
  });

  final String title;
  final String subtitle;
  final List<QuizInsightItem> items;

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.onSurfaceVariant;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.lightbulb, color: Color(0xFFFFD814), size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: secondaryColor),
        ),
        const SizedBox(height: 12),
        ...items.expand(
          (item) => [
            _InsightItemWidget(emoji: item.emoji, title: item.title, desc: item.desc),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}

/// [QuizInsightContent] に渡すInsightアイテムのデータクラス。
class QuizInsightItem {
  const QuizInsightItem({
    required this.emoji,
    required this.title,
    required this.desc,
  });

  final String emoji;
  final String title;
  final String desc;
}

class _InsightItemWidget extends StatelessWidget {
  const _InsightItemWidget({
    required this.emoji,
    required this.title,
    required this.desc,
  });

  final String emoji;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.onSurfaceVariant;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: secondaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
