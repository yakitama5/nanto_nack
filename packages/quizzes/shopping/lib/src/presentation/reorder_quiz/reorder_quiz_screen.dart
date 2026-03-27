import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/catalog.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:shopping/src/i18n/shopping_translations_extension.dart';
import 'package:shopping/src/presentation/reorder_quiz/reorder_quiz_notifier.dart';
import 'package:shopping/src/presentation/reorder_quiz/reorder_quiz_state.dart';
import 'package:shopping/src/presentation/shopping_app.dart';

class ReorderQuizScreen extends ConsumerStatefulWidget {
  const ReorderQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<ReorderQuizScreen> createState() => _ReorderQuizScreenState();
}

class _ReorderQuizScreenState extends ConsumerState<ReorderQuizScreen> {
  static const _timeLimitSeconds = 90;

  bool _showCutIn = true;

  // リトライ時に ShoppingApp の内部状態をリセットするキー
  int _appKey = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(reorderQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(reorderQuizProvider);
    final missionText = context.s.reorder.missionText;

    return ShoppingApp(
      key: ValueKey(_appKey),
      cart: quizState.cart,
      onAddToCart: (CartItem item) =>
          ref.read(reorderQuizProvider.notifier).addToCart(item),
      onUpdateQuantity: (String id, int qty) =>
          ref.read(reorderQuizProvider.notifier).updateQuantity(id, qty),
      onRemoveFromCart: (String id) =>
          ref.read(reorderQuizProvider.notifier).removeFromCart(id),
      onPurchase: () => ref.read(reorderQuizProvider.notifier).purchase(),
      highlightedItemId: quizState.hintUsed ? quizState.targetItemId : null,
      quizStatus: quizState.status,
      remainingSeconds: quizState.remainingSeconds,
      missionText: missionText,
      hintUsed: quizState.hintUsed,
      timeLimitSeconds: _timeLimitSeconds,
      onHintTap: () => ref.read(reorderQuizProvider.notifier).useHint(),
      cartBottomSheetBuilder: (context) => const _ReorderCartSheet(),
      accountViewBuilder: (context) => _ReorderAccountView(
        quizState: quizState,
        onReorder: () =>
            ref.read(reorderQuizProvider.notifier).reorderFromHistory(),
      ),
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: _timeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        if (quizState.status == QuizStatus.correct ||
            quizState.status == QuizStatus.incorrect ||
            quizState.status == QuizStatus.timeUp)
          Positioned.fill(
            child: QuizResultOverlay(
              status: quizState.status,
              score: quizState.score,
              elapsedMs: quizState.elapsedMs,
              onRetry: () {
                setState(() {
                  _showCutIn = true;
                  _appKey++;
                });
                ref.read(reorderQuizProvider.notifier).retry();
              },
              onNext: quizState.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              insight: const _ReorderUiInsight(),
            ),
          ),
      ],
    );
  }
}

// ─── アカウントビュー（アカウント → 注文履歴 のサブナビ管理） ──────────────

class _ReorderAccountView extends StatefulWidget {
  const _ReorderAccountView({
    required this.quizState,
    required this.onReorder,
  });

  final ReorderQuizState quizState;
  final VoidCallback onReorder;

  @override
  State<_ReorderAccountView> createState() => _ReorderAccountViewState();
}

class _ReorderAccountViewState extends State<_ReorderAccountView> {
  bool _showOrderHistory = false;

  @override
  Widget build(BuildContext context) {
    if (_showOrderHistory) {
      return _OrderHistoryView(
        targetItemId: widget.quizState.targetItemId,
        isPlaying: widget.quizState.status == QuizStatus.playing,
        onBack: () => setState(() => _showOrderHistory = false),
        onReorder: () {
          widget.onReorder();
          // カートに追加後はホームタブへ自動遷移させるため
          // ShoppingApp の nav を切り替えたいが内部状態なので不可。
          // 代わりに注文履歴を閉じてアカウントビューに戻す。
          setState(() => _showOrderHistory = false);
        },
      );
    }

    return _AccountMenuView(
      onOrderHistoryTap: () => setState(() => _showOrderHistory = true),
    );
  }
}

// ─── アカウントメニューリスト ────────────────────────────────────────────

class _AccountMenuView extends StatelessWidget {
  const _AccountMenuView({required this.onOrderHistoryTap});

  final VoidCallback onOrderHistoryTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // プロフィールヘッダー
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8E8E8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 32,
                  color: Color(0xFF888888),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: UnreadableText(
                  context.sq.navigation.account,
                  isObfuscated: true,
                  animateOnObfuscate: false,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              _AccountMenuTile(
                icon: Icons.local_shipping_outlined,
                label: context.sq.reorder.orderHistoryTitle,
                showDivider: true,
              ),
              _AccountMenuTile(
                icon: Icons.receipt_long_outlined,
                label: context.sq.reorder.appTitle,
                onTap: onOrderHistoryTap,
                showDivider: true,
                highlighted: true,
              ),
              _AccountMenuTile(
                icon: Icons.favorite_border,
                label: context.sq.common.addToCart,
                showDivider: true,
              ),
              _AccountMenuTile(
                icon: Icons.settings_outlined,
                label: context.sq.navigation.menu,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AccountMenuTile extends StatelessWidget {
  const _AccountMenuTile({
    required this.icon,
    required this.label,
    this.onTap,
    this.showDivider = false,
    this.highlighted = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool showDivider;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: highlighted
                      ? const Color(0xFF007185)
                      : const Color(0xFF555555),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: UnreadableText(
                    label,
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: highlighted
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: highlighted
                          ? const Color(0xFF007185)
                          : Colors.black87,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(height: 1, indent: 56),
      ],
    );
  }
}

// ─── 注文履歴ビュー ────────────────────────────────────────────────────────

class _OrderHistoryView extends StatelessWidget {
  const _OrderHistoryView({
    required this.targetItemId,
    required this.isPlaying,
    required this.onBack,
    required this.onReorder,
  });

  final String targetItemId;
  final bool isPlaying;
  final VoidCallback onBack;
  final VoidCallback onReorder;

  @override
  Widget build(BuildContext context) {
    final targetItem =
        kShoppingCatalog.firstWhere((i) => i.id == targetItemId);
    final qt = context.sq.reorder;

    return Column(
      children: [
        // ビュー内ヘッダー（戻るボタン付き）
        Container(
          color: kShoppingNavyColor,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: onBack,
              ),
              Expanded(
                child: UnreadableText(
                  qt.appTitle,
                  isObfuscated: true,
                  animateOnObfuscate: false,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        // 注文履歴リスト
        Expanded(
          child: ListView(
            children: [
              // セクションヘッダー
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                color: const Color(0xFFF3F3F3),
                child: Row(
                  children: [
                    const Icon(
                      Icons.history,
                      size: 18,
                      color: Color(0xFF007185),
                    ),
                    const SizedBox(width: 8),
                    UnreadableText(
                      qt.orderHistoryTitle,
                      isObfuscated: true,
                      animateOnObfuscate: false,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF007185),
                      ),
                    ),
                  ],
                ),
              ),
              // 注文カード
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // カードヘッダー（注文日）
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF3F3F3),
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: UnreadableText(
                          qt.lastOrderDate,
                          isObfuscated: true,
                          animateOnObfuscate: false,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                    // 商品情報
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 商品画像
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey.shade50,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                targetItem.imagePath,
                                package: 'shopping',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // 商品名・価格
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UnreadableText(
                                  context.sqCatalogItemName(targetItemId),
                                  isObfuscated: true,
                                  animateOnObfuscate: false,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 6),
                                UnreadableText(
                                  '¥${targetItem.price}',
                                  isObfuscated: true,
                                  animateOnObfuscate: false,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 「もう一度買う」ボタン
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFD814),
                            foregroundColor: Colors.black87,
                            elevation: 0,
                            padding:
                                const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                color: Color(0xFFFFA41C),
                              ),
                            ),
                          ),
                          onPressed: isPlaying ? onReorder : null,
                          child: UnreadableText(
                            qt.reorderButton,
                            isObfuscated: true,
                            animateOnObfuscate: false,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── カートシート（リアクティブ更新のため ConsumerWidget） ─────────────────

class _ReorderCartSheet extends ConsumerWidget {
  const _ReorderCartSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reorderQuizProvider);
    return AmazonCartSheet(
      cart: state.cart,
      onRemoveFromCart: (String id) =>
          ref.read(reorderQuizProvider.notifier).removeFromCart(id),
      onPurchase: () {
        Navigator.of(context).pop();
        ref.read(reorderQuizProvider.notifier).purchase();
      },
    );
  }
}

// ─── UX 解説 ──────────────────────────────────────────────────────────────

class _ReorderUiInsight extends StatelessWidget {
  const _ReorderUiInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.reorder.insight;
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
        ShoppingInsightItem(
          emoji: '🖼️',
          title: insight.imageTitle,
          desc: insight.imageDesc,
        ),
        const SizedBox(height: 10),
        ShoppingInsightItem(
          emoji: '💰',
          title: insight.priceTitle,
          desc: insight.priceDesc,
        ),
        const SizedBox(height: 10),
        ShoppingInsightItem(
          emoji: '🔄',
          title: insight.patternTitle,
          desc: insight.patternDesc,
        ),
      ],
    );
  }
}
