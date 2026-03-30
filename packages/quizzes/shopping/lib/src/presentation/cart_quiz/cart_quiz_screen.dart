import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:shopping/src/domain/entities/shopping_cart.dart';
import 'package:shopping/src/i18n/shopping_translations_extension.dart';
import 'package:shopping/src/presentation/cart_quiz/cart_quiz_notifier.dart';

// Amazon風カラー定数
const _kNavyColor = Color(0xFF131921);

/// カートの合計金額を当てるクイズ画面（Amazon風カートページ）
class CartQuizScreen extends ConsumerStatefulWidget {
  const CartQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<CartQuizScreen> createState() => _CartQuizScreenState();
}

class _CartQuizScreenState extends ConsumerState<CartQuizScreen> {
  bool _showCutIn = true;

  // クイズ問題として使用するカート（固定データ）
  static final _cart = ShoppingCart(
    items: const [
      CartItem(id: 'water_500ml', price: 100, quantity: 3),
      CartItem(id: 'tea_500ml', price: 150, quantity: 2),
      CartItem(id: 'coffee_500ml', price: 180, quantity: 1),
    ],
  );

  static const _choices = [480, 580, 630, 750];
  static const _timeLimitSeconds = 60;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cartQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(cartQuizProvider);
    final missionText = context.s.cart.missionText;

    return Stack(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            textTheme: GoogleFonts.notoSansJpTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          child: DefaultTextStyle.merge(
            style: GoogleFonts.notoSansJp(),
            child: Scaffold(
            backgroundColor: const Color(0xFFF3F3F3),
            appBar: AppBar(
              backgroundColor: _kNavyColor,
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
                  // 合計金額クイズセクション
                  _PriceSummarySection(
                    cart: _cart,
                    choices: _choices,
                    selectedChoice: quizState.selectedChoice,
                    hintUsed: quizState.hintUsed,
                    isPlaying: quizState.status == QuizStatus.playing,
                    onChoiceSelect: (c) => ref
                        .read(cartQuizProvider.notifier)
                        .selectChoice(choice: c, cart: _cart),
                  ),

                ],
              ),
            ),
          ),
          ),
        ),
        // フローティングミッションバブル（ドラッグ可能な円形タイマー）
        if (quizState.status == QuizStatus.playing)
          FloatingMissionBubble(
            remainingSeconds: quizState.remainingSeconds,
            missionText: missionText,
            hintUsed: quizState.hintUsed,
            timeLimitSeconds: _timeLimitSeconds,
            onHintTap: () => ref.read(cartQuizProvider.notifier).useHint(),
          ),
        // カットイン演出
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: _timeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        // 正誤結果オーバーレイ
        if (quizState.status == QuizStatus.correct ||
            quizState.status == QuizStatus.incorrect ||
            quizState.status == QuizStatus.timeUp)
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
            ),
          ),
      ],
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
    return Container(
      color: Colors.white,
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
                    color: const Color(0xFF007185),
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
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade200),
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
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xFFF3F3F3),
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
                      '¥${item.totalPrice}',
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

// ─── 合計金額クイズセクション ─────────────────────────────────────

class _PriceSummarySection extends StatelessWidget {
  const _PriceSummarySection({
    required this.cart,
    required this.choices,
    required this.selectedChoice,
    required this.hintUsed,
    required this.isPlaying,
    required this.onChoiceSelect,
  });

  final ShoppingCart cart;
  final List<int> choices;
  final int? selectedChoice;
  final bool hintUsed;
  final bool isPlaying;
  final ValueChanged<int> onChoiceSelect;

  @override
  Widget build(BuildContext context) {
    final qt = context.sq.cart;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 合計金額の問いかけ
          Row(
            children: [
              const Icon(Icons.calculate_outlined, color: Color(0xFF007185)),
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
                ?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          // 選択肢（2×2グリッド）
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.8,
            children: choices
                .map(
                  (c) => _ChoiceButton(
                    price: c,
                    isSelected: selectedChoice == c,
                    onTap: isPlaying ? () => onChoiceSelect(c) : null,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          // ヒント表示（使用済みの場合）
          if (hintUsed)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3CD),
                border: Border.all(color: const Color(0xFFFF9900)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    color: Color(0xFFFF9900),
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  UnreadableText(
                    qt.hint,
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ChoiceButton extends StatelessWidget {
  const _ChoiceButton({
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  final int price;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF3CD) : Colors.white,
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF9900)
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: UnreadableText(
            '¥$price',
            isObfuscated: true,
            animateOnObfuscate: false,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? const Color(0xFFB45309)
                  : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
