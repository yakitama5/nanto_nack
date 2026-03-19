import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../application/stage_list_provider.dart';

class ShoppingStubScreen extends ConsumerWidget {
  const ShoppingStubScreen({
    super.key,
    required this.quizId,
    required this.title,
  });

  final String quizId;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'クイズ実装中...',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () => _simulateClear(context, ref),
              child: const Text('クリア（テスト用）'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _simulateClear(BuildContext context, WidgetRef ref) async {
    await ref.read(stageListProvider.notifier).onQuizCleared(
          quizId: quizId,
          clearTimeMs: 3000,
          score: 800,
          failureCount: 0,
        );
    if (context.mounted) context.pop();
  }
}
