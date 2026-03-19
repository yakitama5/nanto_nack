import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NantoNack'),
        centerTitle: true,
      ),
      body: MaxWidthBox(
        maxWidth: 800,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NantoNack',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'UI/UX直感クイズ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 48),
              const _StageListPlaceholder(),
            ],
          ),
        ),
      ),
    );
  }
}

class _StageListPlaceholder extends StatelessWidget {
  const _StageListPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text('ステージ ${index + 1}'),
              subtitle: Text(index == 0 ? '解放済み' : 'クリア後に解放'),
              trailing: index == 0
                  ? const Icon(Icons.play_arrow)
                  : const Icon(Icons.lock),
            ),
          ),
        ),
      ),
    );
  }
}
