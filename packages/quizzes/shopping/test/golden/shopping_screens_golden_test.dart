import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/shopping.dart';

// ─── ゴールデンテスト ─────────────────────────────────────────────────────────
// NOTE: MaterialApp + Scaffold を各シナリオで使わないこと。
// alchemist のラッパーがすでに MaterialApp でラップしており、
// ネストした MaterialApp はルートアニメーションの FractionalTranslation に
// 0×∞=NaN を引き起こしてクラッシュする（Scaffold の高さが無制限の場合）。
// テーマが必要なウィジェットには Theme(data: AppTheme.light()) を使う。

void main() {
  group('ShoppingItemTile golden tests', () {
    goldenTest(
      '商品タイルのゴールデンテスト',
      fileName: 'shopping_item_tile',
      // highlighted シナリオのブリンクアニメーション（repeat）が pumpAndSettle を
      // タイムアウトさせるため、300ms ポンプして value=1.0 の状態を確定的に再現する
      pumpBeforeTest: (tester) async {
        await tester.pump(const Duration(milliseconds: 300));
      },
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'normal (quantity: 0)',
            child: SizedBox(
              width: 400,
              child: Theme(
                data: AppTheme.light(),
                child: Material(
                  child: ShoppingItemTile(
                    item: const ShoppingItem(
                      id: 'water_500ml',
                      price: 100,
                      imagePath: 'assets/item/water_pura_aqua.png',
                      category: ShoppingCategory.food,
                    ),
                    quantity: 0,
                    onIncrement: () {},
                    onDecrement: () {},
                  ),
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'with quantity stepper',
            child: SizedBox(
              width: 400,
              child: Theme(
                data: AppTheme.light(),
                child: Material(
                  child: ShoppingItemTile(
                    item: const ShoppingItem(
                      id: 'water_500ml',
                      price: 100,
                      imagePath: 'assets/item/water_pura_aqua.png',
                      category: ShoppingCategory.food,
                    ),
                    quantity: 2,
                    onIncrement: () {},
                    onDecrement: () {},
                  ),
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'highlighted (hint)',
            child: SizedBox(
              width: 400,
              child: Theme(
                data: AppTheme.light(),
                child: Material(
                  child: ShoppingItemTile(
                    item: const ShoppingItem(
                      id: 'water_500ml',
                      price: 100,
                      imagePath: 'assets/item/water_pura_aqua.png',
                      category: ShoppingCategory.food,
                    ),
                    highlighted: true,
                    quantity: 1,
                    onIncrement: () {},
                    onDecrement: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });

  group('FloatingMissionBubble golden tests', () {
    goldenTest(
      'フローティングミッションバブルのゴールデンテスト',
      fileName: 'floating_mission_bubble',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'time remaining (green)',
            child: SizedBox(
              width: 375,
              height: 300,
              child: Theme(
                data: AppTheme.light(),
                child: const Material(
                  child: Stack(
                    children: [
                      SizedBox.expand(),
                      FloatingMissionBubble(
                        remainingSeconds: 45,
                        missionText: '水を2つ購入してください',
                        hintUsed: false,
                        timeLimitSeconds: 60,
                        initialOffset: Offset(16, 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'time warning (orange)',
            child: SizedBox(
              width: 375,
              height: 300,
              child: Theme(
                data: AppTheme.light(),
                child: const Material(
                  child: Stack(
                    children: [
                      SizedBox.expand(),
                      FloatingMissionBubble(
                        remainingSeconds: 12,
                        missionText: '水を2つ購入してください',
                        hintUsed: true,
                        timeLimitSeconds: 60,
                        initialOffset: Offset(16, 16),
                      ),
                    ],
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
            child: const SizedBox(
              width: 300,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: UnreadableText(
                  '天然水 500ml',
                  isObfuscated: false,
                  animateOnObfuscate: false,
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'obfuscated (isObfuscated: true)',
            child: const SizedBox(
              width: 300,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: UnreadableText(
                  '天然水 500ml',
                  isObfuscated: true,
                  animateOnObfuscate: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}
