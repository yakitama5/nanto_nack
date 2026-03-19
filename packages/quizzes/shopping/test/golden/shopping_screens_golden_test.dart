import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/shopping.dart';

// ─── ヘルパー ─────────────────────────────────────────────────────────────────

/// テスト用の ProviderScope ラッパー
Widget _wrap({required Widget child}) {
  return ProviderScope(
    child: MaterialApp(
      theme: AppTheme.light,
      home: child,
    ),
  );
}

/// デバイス幅別のシナリオを生成するヘルパー
List<GoldenTestScenario> _deviceScenarios({
  required String name,
  required Widget child,
}) {
  return [
    GoldenTestScenario(
      name: '$name - mobile (375px)',
      child: SizedBox(width: 375, child: _wrap(child: child)),
    ),
    GoldenTestScenario(
      name: '$name - tablet (768px)',
      child: SizedBox(width: 768, child: _wrap(child: child)),
    ),
  ];
}

// ─── ゴールデンテスト ─────────────────────────────────────────────────────────

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  group('ShoppingItemTile golden tests', () {
    goldenTest(
      '商品タイルのゴールデンテスト',
      fileName: 'shopping_item_tile',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'normal',
            child: SizedBox(
              width: 400,
              child: MaterialApp(
                theme: AppTheme.light,
                home: Scaffold(
                  body: ShoppingItemTile(
                    item: const ShoppingItem(
                      id: 'water_500ml',
                      name: '天然水 500ml',
                      price: 100,
                      description: '国産天然水。まろやかな口当たり。',
                      imageEmoji: '💧',
                    ),
                    onAddToCart: () {},
                  ),
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'highlighted (hint)',
            child: SizedBox(
              width: 400,
              child: MaterialApp(
                theme: AppTheme.light,
                home: Scaffold(
                  body: ShoppingItemTile(
                    item: const ShoppingItem(
                      id: 'water_500ml',
                      name: '天然水 500ml',
                      price: 100,
                      description: '国産天然水。まろやかな口当たり。',
                      imageEmoji: '💧',
                    ),
                    highlighted: true,
                    onAddToCart: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });

  group('FloatingMissionBar golden tests', () {
    goldenTest(
      'フローティングミッションバーのゴールデンテスト',
      fileName: 'floating_mission_bar',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'time remaining (green)',
            child: SizedBox(
              width: 375,
              child: MaterialApp(
                theme: AppTheme.light,
                home: const Scaffold(
                  body: Padding(
                    padding: EdgeInsets.all(16),
                    child: FloatingMissionBar(
                      remainingSeconds: 45,
                      missionText: '水を2つ購入してください',
                      hintUsed: false,
                      timeLimitSeconds: 60,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'time warning (orange)',
            child: SizedBox(
              width: 375,
              child: MaterialApp(
                theme: AppTheme.light,
                home: const Scaffold(
                  body: Padding(
                    padding: EdgeInsets.all(16),
                    child: FloatingMissionBar(
                      remainingSeconds: 12,
                      missionText: '水を2つ購入してください',
                      hintUsed: true,
                      timeLimitSeconds: 60,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });

  group('UnreadableText golden tests', () {
    goldenTest(
      'UnreadableText のゴールデンテスト',
      fileName: 'unreadable_text',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'readable (isObfuscated: false)',
            child: SizedBox(
              width: 300,
              child: MaterialApp(
                theme: AppTheme.light,
                home: const Scaffold(
                  body: Padding(
                    padding: EdgeInsets.all(16),
                    child: UnreadableText(
                      '天然水 500ml',
                      isObfuscated: false,
                      animateOnObfuscate: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'obfuscated (isObfuscated: true)',
            child: SizedBox(
              width: 300,
              child: MaterialApp(
                theme: AppTheme.light,
                home: const Scaffold(
                  body: Padding(
                    padding: EdgeInsets.all(16),
                    child: UnreadableText(
                      '天然水 500ml',
                      isObfuscated: true,
                      animateOnObfuscate: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}
