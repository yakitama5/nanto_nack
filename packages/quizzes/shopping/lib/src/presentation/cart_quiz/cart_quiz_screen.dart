import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:system/system.dart';
import 'package:shopping/src/domain/entities/shopping_cart.dart';
import 'package:shopping/src/domain/shopping_quiz_config.dart';
import 'package:shopping/src/i18n/shopping_translations_extension.dart';
import 'package:shopping/src/presentation/cart_quiz/cart_quiz_notifier.dart';

/// カートの合計金額を当てるクイズ画面（Amazon風カートページ）
class CartQuizScreen extends ConsumerStatefulWidget {
  const CartQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<CartQuizScreen> createState() => _CartQuizScreenState();
}

class _CartQuizScreenState extends ConsumerState<CartQuizScreen> {
  bool _showCutIn = true;
  late final ShoppingCart _cart;

  // 1の位を0固定、100の位と10の位をランダムに決定した単価（¥XY0形式）
  // 合計が4桁入力の上限（9999円）に収まるまで再生成する
  static ShoppingCart _buildRandomCart() {
    final rng = Random();
    int randomPrice() => (rng.nextInt(9) + 1) * 100 + rng.nextInt(10) * 10;
    int randomQty() => rng.nextInt(5) + 1;

    while (true) {
      final items = [
        CartItem(id: 'water_500ml', price: randomPrice(), quantity: randomQty()),
        CartItem(id: 'tea_500ml', price: randomPrice(), quantity: randomQty()),
        CartItem(id: 'coffee_500ml', price: randomPrice(), quantity: randomQty()),
      ];
      final cart = ShoppingCart(items: items);
      if (cart.totalPrice <= 9999) return cart;
    }
  }

  @override
  void initState() {
    super.initState();
    _cart = _buildRandomCart();
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    final quizState = ref.watch(cartQuizProvider);
    final missionText = context.s.cart.missionText;

    return QuizExitScope(
      quizStatus: quizState.status,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: ext.scaffoldBackground,
            appBar: AppBar(
              backgroundColor: ext.navyColor,
              title: UnreadableText(
                context.sq.cart.appTitle,
                isObfuscated: true,
                animateOnObfuscate: false,
                style: const TextStyle(color: Colors.white),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // カート内アイテム一覧
                  _CartItemsSection(cart: _cart),
                  const SizedBox(height: 8),
                  // 合計金額クイズセクション（暗証番号スタイル入力）
                  _PriceSummarySection(
                    cart: _cart,
                    enteredDigits: quizState.enteredDigits,
                    hintUsed: quizState.hintUsed,
                    isPlaying: quizState.status == QuizStatus.playing,
                    onDigitUp: (i) =>
                        ref.read(cartQuizProvider.notifier).updateDigit(i, 1),
                    onDigitDown: (i) =>
                        ref.read(cartQuizProvider.notifier).updateDigit(i, -1),
                    onConfirm: () => ref
                        .read(cartQuizProvider.notifier)
                        .confirmEntry(cart: _cart),
                  ),
                ],
              ),
            ),
          ),
        // フローティングミッションバブル（ドラッグ可能な円形タイマー）
        if (quizState.status == QuizStatus.playing)
          FloatingMissionBubble(
            remainingSeconds: quizState.remainingSeconds,
            missionText: missionText,
            hintUsed: quizState.hintUsed,
            timeLimitSeconds: ShoppingQuizConfig.cartTimeLimitSeconds,
            onHintTap: () => ref.read(cartQuizProvider.notifier).useHint(),
            onGiveUp: () => ref.read(cartQuizProvider.notifier).giveUp(),
          ),
        // カットイン演出
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: ShoppingQuizConfig.cartTimeLimitSeconds,
            onFinished: () {
              if (!mounted) return;
              setState(() => _showCutIn = false);
              ref.read(cartQuizProvider.notifier).startQuiz();
            },
          ),
        // 正誤結果オーバーレイ
        if (quizState.status == QuizStatus.correct ||
            quizState.status == QuizStatus.incorrect ||
            quizState.status == QuizStatus.timeUp ||
            quizState.status == QuizStatus.giveUp)
          Positioned.fill(
            child: QuizResultOverlay(
              status: quizState.status,
              score: quizState.score,
              elapsedMs: quizState.elapsedMs,
              onRetry: () {
                setState(() => _showCutIn = true);
                ref.read(cartQuizProvider.notifier).retry();
              },
              onNext: quizState.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.cart.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '🔐',
                        title: insight.cipherTitle,
                        desc: insight.cipherDesc,
                      ),
                      QuizInsightItem(
                        emoji: '💴',
                        title: insight.priceTitle,
                        desc: insight.priceDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🧮',
                        title: insight.layoutTitle,
                        desc: insight.layoutDesc,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
      ),
    );
  }
}

// ─── カート内アイテム一覧セクション ──────────────────────────────

class _CartItemsSection extends StatelessWidget {
  const _CartItemsSection({required this.cart});

  final ShoppingCart cart;

  // 商品IDに対応する絵文字
  static const _emojiMap = {
    'water_500ml': '💧',
    'tea_500ml': '🍵',
    'coffee_500ml': '☕',
    'juice_500ml': '🍊',
    'water_2l': '🫙',
  };

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    return Container(
      color: ext.surfaceColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                UnreadableText(
                  context.sq.cart.itemsHeader,
                  isObfuscated: true,
                  animateOnObfuscate: false,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: ext.amazonTealColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: UnreadableText(
                    context.sq.cart.itemCount.replaceAll('{count}', cart.totalCount.toString()),
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ...cart.items.map((item) => _CartItemTile(item: item, emojiMap: _emojiMap)),
        ],
      ),
    );
  }
}

class _CartItemTile extends StatelessWidget {
  const _CartItemTile({
    required this.item,
    required this.emojiMap,
  });

  final CartItem item;
  final Map<String, String> emojiMap;

  @override
  Widget build(BuildContext context) {
    final emoji = emojiMap[item.id] ?? '📦';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 商品画像
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Theme.of(context).extension<ShoppingAppTheme>()!.itemImageBackground,
              border: Border.all(color: Theme.of(context).extension<ShoppingAppTheme>()!.subTextColor),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 36)),
            ),
          ),
          const SizedBox(width: 12),
          // 商品情報
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 商品名（カスタム言語で表示）
                UnreadableText(
                  context.sqCatalogItemName(item.id),
                  isObfuscated: true,
                  animateOnObfuscate: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, height: 1.4),
                ),
                const SizedBox(height: 4),
                // Prime バッジ
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00A8E1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: UnreadableText(
                    context.sq.common.primeBadge,
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                // 数量・金額
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).extension<ShoppingAppTheme>()!.subTextColor),
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).extension<ShoppingAppTheme>()!.scaffoldBackground,
                      ),
                      child: UnreadableText(
                        context.sq.common.quantity.replaceAll('{qty}', item.quantity.toString()),
                        isObfuscated: true,
                        animateOnObfuscate: false,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const Spacer(),
                    UnreadableText(
                      '¥${item.price}',
                      isObfuscated: true,
                      animateOnObfuscate: false,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── 合計金額クイズセクション（暗証番号スタイル） ─────────────────

class _PriceSummarySection extends StatelessWidget {
  const _PriceSummarySection({
    required this.cart,
    required this.enteredDigits,
    required this.hintUsed,
    required this.isPlaying,
    required this.onDigitUp,
    required this.onDigitDown,
    required this.onConfirm,
  });

  final ShoppingCart cart;
  final List<int> enteredDigits;
  final bool hintUsed;
  final bool isPlaying;
  final ValueChanged<int> onDigitUp;
  final ValueChanged<int> onDigitDown;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    final qt = context.sq.cart;
    return Container(
      color: ext.surfaceColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 合計金額の問いかけ
          Row(
            children: [
              Icon(Icons.calculate_outlined, color: ext.amazonTealColor),
              const SizedBox(width: 8),
              UnreadableText(
                qt.questionTitle,
                isObfuscated: true,
                animateOnObfuscate: false,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          UnreadableText(
            qt.questionSubtitle,
            isObfuscated: true,
            animateOnObfuscate: false,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ext.subTextColor),
          ),
          const SizedBox(height: 20),
          // 暗証番号スタイルの金額入力
          _PriceSpinnerInput(
            digits: enteredDigits,
            isPlaying: isPlaying,
            onDigitUp: onDigitUp,
            onDigitDown: onDigitDown,
          ),
          const SizedBox(height: 16),
          // 確定ボタン
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ext.addToCartButtonColor,
                foregroundColor: ext.cartButtonForeground,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(color: ext.orangeAccentBorder),
                ),
              ),
              onPressed: isPlaying ? onConfirm : null,
              child: UnreadableText(
                qt.confirmButton,
                isObfuscated: true,
                animateOnObfuscate: false,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // ヒント表示（使用済みの場合）: 数字対応表
          if (hintUsed) _NumberCipherTable(labelText: qt.hintTableLabel),
        ],
      ),
    );
  }
}

// ─── 暗証番号スタイル入力ウィジェット ──────────────────────────────

class _PriceSpinnerInput extends StatelessWidget {
  const _PriceSpinnerInput({
    required this.digits,
    required this.isPlaying,
    required this.onDigitUp,
    required this.onDigitDown,
  });

  final List<int> digits;
  final bool isPlaying;
  final ValueChanged<int> onDigitUp;
  final ValueChanged<int> onDigitDown;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 円マーク
        Padding(
          padding: const EdgeInsets.only(right: 8, top: 4),
          child: Text(
            '¥',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).extension<ShoppingAppTheme>()!.primaryTextColor.withValues(alpha: 0.6),
            ),
          ),
        ),
        // 4桁のスピナー
        ...List.generate(digits.length, (i) {
          return Padding(
            padding: EdgeInsets.only(left: i == 0 ? 0 : 8),
            child: _DigitSpinner(
              digit: digits[i],
              isPlaying: isPlaying,
              onUp: () => onDigitUp(i),
              onDown: () => onDigitDown(i),
            ),
          );
        }),
      ],
    );
  }
}

class _DigitSpinner extends StatelessWidget {
  const _DigitSpinner({
    required this.digit,
    required this.isPlaying,
    required this.onUp,
    required this.onDown,
  });

  final int digit;
  final bool isPlaying;
  final VoidCallback onUp;
  final VoidCallback onDown;

  @override
  Widget build(BuildContext context) {
    final customChar = CustomLanguageEncoder.encode(digit.toString());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 上ボタン（▲）
        _SpinnerArrowButton(
          icon: Icons.keyboard_arrow_up,
          onTap: isPlaying ? onUp : null,
        ),
        const SizedBox(height: 4),
        // 数字表示（カスタム言語）
        Container(
          width: 52,
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).extension<ShoppingAppTheme>()!.surfaceColor,
            border: Border.all(color: Theme.of(context).extension<ShoppingAppTheme>()!.amazonTealColor, width: 1.5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              customChar,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        // 下ボタン（▼）
        _SpinnerArrowButton(
          icon: Icons.keyboard_arrow_down,
          onTap: isPlaying ? onDown : null,
        ),
      ],
    );
  }
}

class _SpinnerArrowButton extends StatelessWidget {
  const _SpinnerArrowButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 36,
        decoration: BoxDecoration(
          color: enabled ? ext.scaffoldBackground : ext.itemImageBackground,
          border: Border.all(
            color: enabled ? ext.subTextColor : ext.subTextColor,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          size: 22,
          color: enabled ? ext.amazonTealColor : ext.subTextColor,
        ),
      ),
    );
  }
}

// ─── 数字対応表ウィジェット ───────────────────────────────────────

class _NumberCipherTable extends StatelessWidget {
  const _NumberCipherTable({required this.labelText});

  final String labelText;

  @override
  Widget build(BuildContext context) {
    final entries = CustomLanguageEncoder.digitMap.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ext.itemHighlightBackground,
        border: Border.all(color: ext.orangeAccent),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: ext.orangeAccent,
                size: 16,
              ),
              const SizedBox(width: 6),
              UnreadableText(
                labelText,
                isObfuscated: false,
                animateOnObfuscate: false,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ext.orangeAccent,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: entries
                .map(
                  (e) => Column(
                    children: [
                      // カスタム文字（エンコード済み文字をそのまま表示）
                      Text(
                        e.value,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // 対応する数字
                      Text(
                        e.key,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ext.primaryTextColor,
                            ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

