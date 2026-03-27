import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/catalog.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:shopping/src/domain/entities/shopping_category.dart';
import 'package:shopping/src/domain/entities/shopping_item.dart';
import 'package:shopping/src/i18n/shopping_translations_extension.dart';
import 'package:shopping/src/presentation/reorder_quiz/reorder_quiz_state.dart';
import 'package:shopping/src/presentation/cart_badge.dart';
import 'package:shopping/src/presentation/reorder_quiz/reorder_quiz_notifier.dart';
import 'package:shopping/src/presentation/shopping_item_tile.dart';

// ─── View状態 ─────────────────────────────────────────────────────────────
enum _ReorderView { home, account, orderHistory }

// Amazon風カラー定数
const _kNavyColor = Color(0xFF131921);

// 固定セクションの高さ（FloatingMissionBar の位置計算に使用）
const _kSearchBarHeight = 48.0;
const _kCategoryBarHeight = 40.0;

class ReorderQuizScreen extends ConsumerStatefulWidget {
  const ReorderQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<ReorderQuizScreen> createState() => _ReorderQuizScreenState();
}

class _ReorderQuizScreenState extends ConsumerState<ReorderQuizScreen> {
  static const _timeLimitSeconds = 90;

  bool _showCutIn = true;
  ShoppingCategory? _selectedCategory;
  String _searchQuery = '';
  _ReorderView _currentView = _ReorderView.home;
  final _searchController = TextEditingController();

  int get _selectedNavIndex => switch (_currentView) {
        _ReorderView.home => 0,
        _ReorderView.account || _ReorderView.orderHistory => 2,
      };

  void _onNavTap(int index) {
    setState(() {
      _currentView = switch (index) {
        0 => _ReorderView.home,
        2 => _ReorderView.account,
        _ => _currentView,
      };
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(reorderQuizProvider.notifier).startQuiz();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(reorderQuizProvider);
    final missionText = context.s.reorder.missionText;

    // カテゴリ・検索クエリによるフィルタリング（ホームビュー用）
    final filteredCatalog = kShoppingCatalog.where((item) {
      if (_selectedCategory != null && item.category != _selectedCategory) {
        return false;
      }
      if (_searchQuery.isNotEmpty &&
          !item.id.contains(_searchQuery.toLowerCase())) {
        return false;
      }
      return true;
    }).toList();

    // 現在のビューに応じたAppBar
    final appBar = switch (_currentView) {
      _ReorderView.home || _ReorderView.account => _AmazonAppBar(
          cartCount: quizState.cart.totalCount,
          onCartTap: () => _showCart(context),
        ),
      _ReorderView.orderHistory => _AmazonAppBar(
          cartCount: quizState.cart.totalCount,
          onCartTap: () => _showCart(context),
          onBack: () =>
              setState(() => _currentView = _ReorderView.account),
          titleText: context.sq.reorder.appTitle,
        ),
    };

    // 現在のビューに応じたBody
    final body = switch (_currentView) {
      _ReorderView.home => _HomeBody(
          filteredCatalog: filteredCatalog,
          quizState: quizState,
          searchController: _searchController,
          searchQuery: _searchQuery,
          selectedCategory: _selectedCategory,
          onSearchChanged: (v) => setState(() => _searchQuery = v),
          onSearchClear: () {
            setState(() => _searchQuery = '');
            _searchController.clear();
          },
          onCategorySelected: (cat) => setState(() {
            _selectedCategory = (_selectedCategory == cat) ? null : cat;
          }),
          onAddToCart: (item) => ref
              .read(reorderQuizProvider.notifier)
              .addToCart(CartItem(id: item.id, price: item.price, quantity: 1)),
          onUpdateQuantity: (id, qty) =>
              ref.read(reorderQuizProvider.notifier).updateQuantity(id, qty),
        ),
      _ReorderView.account => _AccountView(
          onOrderHistoryTap: () =>
              setState(() => _currentView = _ReorderView.orderHistory),
        ),
      _ReorderView.orderHistory => _OrderHistoryView(
          targetItemId: quizState.targetItemId,
          isPlaying: quizState.status == QuizStatus.playing,
          onReorder: () {
            ref.read(reorderQuizProvider.notifier).reorderFromHistory();
            setState(() => _currentView = _ReorderView.home);
          },
        ),
    };

    // FloatingMissionBar の上端位置（ビューごとに調整）
    final missionBarTop = MediaQuery.paddingOf(context).top +
        kToolbarHeight +
        (_currentView == _ReorderView.home
            ? _kSearchBarHeight + _kCategoryBarHeight
            : 0.0) +
        8;

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
              appBar: appBar,
              body: body,
              bottomNavigationBar: _AmazonBottomNav(
                selectedIndex: _selectedNavIndex,
                onTap: _onNavTap,
              ),
            ),
          ),
        ),
        // フローティングミッションバー
        if (quizState.status == QuizStatus.playing)
          Positioned(
            top: missionBarTop,
            left: 16,
            right: 16,
            child: FloatingMissionBar(
              remainingSeconds: quizState.remainingSeconds,
              missionText: missionText,
              hintUsed: quizState.hintUsed,
              timeLimitSeconds: _timeLimitSeconds,
              onHintTap: () =>
                  ref.read(reorderQuizProvider.notifier).useHint(),
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
                setState(() {
                  _showCutIn = true;
                  _searchQuery = '';
                  _searchController.clear();
                  _selectedCategory = null;
                  _currentView = _ReorderView.home;
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

  void _showCart(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => const _CartBottomSheet(),
    );
  }
}

// ─── ホームビュー（商品グリッド） ─────────────────────────────────────────

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    required this.filteredCatalog,
    required this.quizState,
    required this.searchController,
    required this.searchQuery,
    required this.selectedCategory,
    required this.onSearchChanged,
    required this.onSearchClear,
    required this.onCategorySelected,
    required this.onAddToCart,
    required this.onUpdateQuantity,
  });

  final List<ShoppingItem> filteredCatalog;
  final ReorderQuizState quizState;
  final TextEditingController searchController;
  final String searchQuery;
  final ShoppingCategory? selectedCategory;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchClear;
  final ValueChanged<ShoppingCategory> onCategorySelected;
  final ValueChanged<ShoppingItem> onAddToCart;
  final void Function(String id, int qty) onUpdateQuantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SearchBar(
          controller: searchController,
          searchQuery: searchQuery,
          onChanged: onSearchChanged,
          onClear: onSearchClear,
        ),
        _CategoryBar(
          selectedCategory: selectedCategory,
          onCategorySelected: onCategorySelected,
        ),
        Expanded(
          child: filteredCatalog.isEmpty
              ? _EmptyFilterResult(
                  message: context.sq.common.noResults,
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.58,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: filteredCatalog.length,
                  itemBuilder: (context, index) {
                    final item = filteredCatalog[index];
                    final isHighlighted = quizState.hintUsed &&
                        item.id == quizState.targetItemId;
                    final quantity = quizState.cart.items
                            .where((CartItem ci) => ci.id == item.id)
                            .firstOrNull
                            ?.quantity ??
                        0;
                    return ShoppingItemTile(
                      item: item,
                      highlighted: isHighlighted,
                      quantity: quantity,
                      onIncrement: () => onAddToCart(item),
                      onDecrement: () => onUpdateQuantity(item.id, quantity - 1),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

// ─── アカウントビュー ──────────────────────────────────────────────────────

class _AccountView extends StatelessWidget {
  const _AccountView({required this.onOrderHistoryTap});

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
        // メニューセクション
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
    required this.onReorder,
  });

  final String targetItemId;
  final bool isPlaying;
  final VoidCallback onReorder;

  @override
  Widget build(BuildContext context) {
    final targetItem =
        kShoppingCatalog.firstWhere((i) => i.id == targetItemId);
    final qt = context.sq.reorder;

    return ListView(
      children: [
        // セクションヘッダー
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          margin: const EdgeInsets.only(bottom: 8),
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
                        border: Border.all(color: Colors.grey.shade200),
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
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Color(0xFFFFA41C)),
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
    );
  }
}

// ─── Amazon風ヘッダー ────────────────────────────────────────────────────

class _AmazonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AmazonAppBar({
    required this.cartCount,
    required this.onCartTap,
    this.onBack,
    this.titleText,
  });

  final int cartCount;
  final VoidCallback onCartTap;
  final VoidCallback? onBack;
  final String? titleText;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _kNavyColor,
      leading: onBack != null
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onBack,
            )
          : null,
      automaticallyImplyLeading: false,
      title: UnreadableText(
        titleText ?? context.sq.water.appTitle,
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

// ─── インタラクティブ検索バー ────────────────────────────────────────────

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.controller,
    required this.searchQuery,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController controller;
  final String searchQuery;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

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
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: CustomLanguageEncoder.encode(
                    context.sq.water.searchPlaceholder,
                  ),
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            if (searchQuery.isNotEmpty)
              GestureDetector(
                onTap: onClear,
                child: const Icon(Icons.clear, color: Colors.grey, size: 20),
              )
            else
              const Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}

// ─── インタラクティブカテゴリナビゲーションバー ──────────────────────────

class _CategoryBar extends StatelessWidget {
  const _CategoryBar({
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final ShoppingCategory? selectedCategory;
  final ValueChanged<ShoppingCategory> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final cats = context.sq.categories;
    final categoryItems = [
      (label: cats.daily, value: ShoppingCategory.daily),
      (label: cats.food, value: ShoppingCategory.food),
      (label: cats.electronics, value: ShoppingCategory.electronics),
      (label: cats.fashion, value: ShoppingCategory.fashion),
      (label: cats.sports, value: ShoppingCategory.sports),
      (label: cats.kitchen, value: ShoppingCategory.kitchen),
    ];

    return Container(
      height: _kCategoryBarHeight,
      color: const Color(0xFF232F3E),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: categoryItems.length,
        separatorBuilder: (_, __) => const SizedBox(width: 4),
        itemBuilder: (context, index) {
          final item = categoryItems[index];
          final isSelected = selectedCategory == item.value;
          return GestureDetector(
            onTap: () => onCategorySelected(item.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFFF9900)
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFFF9900)
                      : Colors.white30,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: UnreadableText(
                item.label,
                isObfuscated: true,
                animateOnObfuscate: false,
                style: TextStyle(
                  color: isSelected ? Colors.black87 : Colors.white,
                  fontSize: 12,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── フィルタ結果が空のとき ───────────────────────────────────────────────

class _EmptyFilterResult extends StatelessWidget {
  const _EmptyFilterResult({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off, size: 48, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          UnreadableText(
            message,
            isObfuscated: true,
            animateOnObfuscate: false,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// ─── Amazon風ボトムナビゲーション（インタラクティブ） ────────────────────

class _AmazonBottomNav extends StatelessWidget {
  const _AmazonBottomNav({
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final nav = context.sq.navigation;
    final navItems = [
      (icon: Icons.home_outlined, label: nav.home),
      (icon: Icons.search, label: nav.search),
      (icon: Icons.person_outline, label: nav.account),
      (icon: Icons.menu, label: nav.menu),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: _kNavyColor,
        border: Border(top: BorderSide(color: Color(0xFF3A4553))),
      ),
      padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navItems.asMap().entries.map((entry) {
          final i = entry.key;
          final item = entry.value;
          return GestureDetector(
            onTap: () => onTap(i),
            child: _NavItem(
              icon: item.icon,
              label: item.label,
              isSelected: selectedIndex == i,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFFFF9900) : Colors.white,
            size: 22,
          ),
          const SizedBox(height: 2),
          UnreadableText(
            label,
            isObfuscated: true,
            animateOnObfuscate: false,
            style: TextStyle(
              color: isSelected ? const Color(0xFFFF9900) : Colors.white,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── カートボトムシート ──────────────────────────────────────────────────

class _CartBottomSheet extends ConsumerWidget {
  const _CartBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(reorderQuizProvider);
    final cart = quizState.cart;
    final qt = context.sq.reorder;

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
                          .read(reorderQuizProvider.notifier)
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
                    ref.read(reorderQuizProvider.notifier).purchase();
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

// ─── UX解説セクション ────────────────────────────────────────────────────

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
        _InsightItem(
          emoji: '🖼️',
          title: insight.imageTitle,
          desc: insight.imageDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '💰',
          title: insight.priceTitle,
          desc: insight.priceDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🔄',
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
