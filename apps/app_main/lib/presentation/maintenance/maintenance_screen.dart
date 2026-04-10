import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

/// メンテナンス中に表示するフルスクリーン画面。
///
/// ナントムの悲しい顔と [maintenance_message] を表示する。
/// 戻るボタンやナビゲーションを一切排除した強制表示画面。
class MaintenanceScreen extends ConsumerWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final systemState = ref.watch(systemConfigProvider);

    final message = systemState.maybeWhen(
      data: (state) => switch (state) {
        SystemMaintenance(:final message) when message.isNotEmpty => message,
        _ => t.maintenance.defaultMessage,
      },
      orElse: () => t.maintenance.defaultMessage,
    );

    return PopScope(
      // 戻るボタンを完全に無効化し、メンテナンス画面から離れられないようにする
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'packages/quiz_core/assets/images/ghost/cry.svg',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        t.maintenance.title,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        message,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
