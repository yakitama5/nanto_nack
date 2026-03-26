import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/catalog.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:shopping/src/i18n/shopping_translations_extension.dart';
import 'package:shopping/src/presentation/cart_badge.dart';
import 'package:shopping/src/presentation/shopping_item_tile.dart';
import 'package:shopping/src/presentation/water_quiz/water_quiz_notifier.dart';

// Amazon風カラー定数
const _kNavyColor = Color(0xFF131921);

// ボディ内の検索バー・カテゴリチップの高さ（FloatingMissionBar の位置計算に使用）
const _kSearchBarHeight = 48.0;
const _kCategoryBarHeight = 40.0;

class WaterQuizScreen extends ConsumerStatefulWidget {
  const WaterQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<WaterQuizScreen> createState() => _WaterQuizScreenState();
}

class _WaterQuizScreenState extends ConsumerState<WaterQuizScreen> {
  static const _timeLimitSeconds = 60;

  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(waterQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(waterQuizProvider);
    final missionText = context.s.water.missionText;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFFF3F3F3),
          appBar: _AmazonAppBar(
            cartCount: quizState.cart.totalCount,
            onCartTap: () => _showCart(context),
          ),
          body: Column(
            children: [
              // フェイク検索バー（ダミーテキスト）
              const _FakeSearchBar(),
              // カテゴリナビ（ダミーテキスト）
              const _CategoryBar(),
              // 商品グリッド
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.58,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: kShoppingCatalog.length,
                  itemBuilder: (context, index) {
                    final item = kShoppingCatalog[index];
                    final isHinted = quizState.hintItemId == item.id;
                    final quantity = quizState.cart.items
                            .where((ci) => ci.id == item.id)
                            .firstOrNull
                            ?.quantity ??
                        0;
                    return ShoppingItemTile(
                      item: item,
                      highlighted: isHinted,
                      quantity: quantity,
                      onIncrement: () =>
                          ref.read(waterQuizProvider.notifier).addToCart(
                                CartItem(
                                  id: item.id,
                                  name: item.name,
                                  price: item.price,
                                  quantity: 1,
                                ),
                              ),
                      onDecrement: () => ref
                          .read(waterQuizProvider.notifier)
                          .updateQuantity(item.id, quantity - 1),
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: const _AmazonBottomNav(),
        ),
        // フローティングミッションバー（検索バー＋カテゴリバーの下に配置）
        if (quizState.status == QuizStatus.playing)
          Positioned(
            top: MediaQuery.paddingOf(context).top +
                kToolbarHeight +
                _kSearchBarHeight +
                _kCategoryBarHeight +
                8,
            left: 16,
            right: 16,
            child: FloatingMissionBar(
              remainingSeconds: quizState.remainingSeconds,
              missionText: missionText,
              hintUsed: quizState.hintUsed,
              timeLimitSeconds: _timeLimitSeconds,
              onHintTap: () => ref.read(waterQuizProvider.notifier).useHint(),
            ),
          ),
        // カットイン演出（クイズ開始時のみ）
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
                ref.read(waterQuizProvider.notifier).retry();
              },
              onNext: quizState.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              insight: const _ShoppingUiInsight(),
            ),
          ),
      ],
    );
  }

  void _showCart(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => const _CartBottomSheet(),
    );
  }
}

// ─── Amazon風ヘッダー ────────────────────────────────────────────

class _AmazonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AmazonAppBar({
    required this.cartCount,
    required this.onCartTap,
  });

  final int cartCount;
  final VoidCallback onCartTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _kNavyColor,
      title: UnreadableText(
        context.sq.water.appTitle,
        isObfuscated: true,
        animateOnObfuscate: false,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      actions: [
        CartBadge(count: cartCount, onTap: onCartTap),
        const SizedBox(width: 4),
      ],
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}

// ─── フェイク検索バー（ダミーテキスト） ───────────────

class _FakeSearchBar extends StatelessWidget {
  const _FakeSearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _kNavyColor,
      height: _kSearchBarHeight,
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: UnreadableText(
                context.sq.water.searchPlaceholder,
                isObfuscated: true,
                animateOnObfuscate: false,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ),
            const Icon(Icons.camera_alt_outlined, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }
}

// ─── カテゴリナビゲーションバー（ダミーテキスト） ──────────────────────

class _CategoryBar extends StatelessWidget {
  const _CategoryBar();

  @override
  Widget build(BuildContext context) {
    final cats = context.sq.categories;
    final categories = [
      cats.daily,
      cats.food,
      cats.electronics,
      cats.fashion,
      cats.sports,
      cats.kitchen,
    ];

    return Container(
      height: _kCategoryBarHeight,
      color: const Color(0xFF232F3E),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 4),
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.circular(2),
          ),
          child: UnreadableText(
            categories[index],
            isObfuscated: true,
            animateOnObfuscate: false,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}

// ─── Amazon風ボトムナビゲーション ────────────────────────────────

class _AmazonBottomNav extends StatelessWidget {
  const _AmazonBottomNav();

  @override
  Widget build(BuildContext context) {
    final nav = context.sq.navigation;
    return Container(
      decoration: const BoxDecoration(
        color: _kNavyColor,
        border: Border(top: BorderSide(color: Color(0xFF3A4553))),
      ),
      padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(icon: Icons.home_outlined, label: nav.home),
          _NavItem(icon: Icons.search, label: nav.search),
          _NavItem(icon: Icons.person_outline, label: nav.account),
          _NavItem(icon: Icons.menu, label: nav.menu),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(height: 2),
          UnreadableText(
            label,
            isObfuscated: true,
            animateOnObfuscate: false,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

// ─── カートボトムシート（Amazon風） ──────────────────────────────

class _CartBottomSheet extends ConsumerWidget {
  const _CartBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(waterQuizProvider);
    final cart = quizState.cart;
    final qt = context.sq.water;

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ヘッダー
          Container(
            width: double.infinity,
            color: const Color(0xFFF3F3F3),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart, color: Color(0xFF007185)),
                const SizedBox(width: 8),
                UnreadableText(
                  qt.cartTitle,
                  isObfuscated: true,
                  animateOnObfuscate: false,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF007185),
                      ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          if (cart.isEmpty)
            Padding(
              padding: const EdgeInsets.all(32),
              child: UnreadableText(
                qt.cartEmpty,
                isObfuscated: true,
                animateOnObfuscate: false,
              ),
            )
          else ...[
            ...cart.items.map(
              (item) => ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFF3F3F3),
                  child: Text('📦', style: TextStyle(fontSize: 20)),
                ),
                title: UnreadableText(
                  context.sq.common.quantity.replaceAll(
                    '{qty}',
                    item.quantity.toString(),
                  ),
                  isObfuscated: true,
                  animateOnObfuscate: false,
                ),
                subtitle: UnreadableText(
                  '¥${item.price}',
                  isObfuscated: true,
                  animateOnObfuscate: false,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UnreadableText(
                      '¥${item.totalPrice}',
                      isObfuscated: true,
                      animateOnObfuscate: false,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, size: 20),
                      onPressed: () => ref
                          .read(waterQuizProvider.notifier)
                          .removeFromCart(item.id),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            // 小計
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UnreadableText(
                    qt.subtotal.replaceAll(
                      '{count}',
                      cart.totalCount.toString(),
                    ),
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: const TextStyle(fontSize: 13),
                  ),
                  UnreadableText(
                    '¥${cart.totalPrice}',
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // 購入ボタン（Amazon黄色）
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD814),
                    foregroundColor: Colors.black87,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Color(0xFFFFA41C)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    ref.read(waterQuizProvider.notifier).purchase();
                  },
                  child: UnreadableText(
                    qt.confirmOrder,
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── UX解説セクション ──────────────────────────────────────────

/// 正解後リザルト画面に表示する「なぜわかったのか？」解説
class _ShoppingUiInsight extends StatelessWidget {
  const _ShoppingUiInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.water.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.lightbulb, color: Color(0xFFFFD814), size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                insight.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          insight.subtitle,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '🛒',
          title: insight.iconTitle,
          desc: insight.iconDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🎨',
          title: insight.colorTitle,
          desc: insight.colorDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '📱',
          title: insight.patternTitle,
          desc: insight.patternDesc,
        ),
      ],
    );
  }
}

class _InsightItem extends StatelessWidget {
  const _InsightItem({
    required this.emoji,
    required this.title,
    required this.desc,
  });

  final String emoji;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFFFE082)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
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
                      ?.copyWith(color: Colors.grey.shade700, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
