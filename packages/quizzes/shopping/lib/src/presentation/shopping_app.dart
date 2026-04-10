import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/catalog.dart';
import 'package:shopping/src/domain/entities/cart_item.dart';
import 'package:shopping/src/domain/entities/shopping_cart.dart';
import 'package:shopping/src/domain/entities/shopping_category.dart';
import 'package:shopping/src/domain/entities/shopping_item.dart';
import 'package:shopping/src/i18n/shopping_translations_extension.dart';
import 'package:shopping/src/presentation/cart_badge.dart';
import 'package:shopping/src/presentation/shopping_item_tile.dart';

// Amazon 風カラー定数（パッケージ外から参照可能）
const kShoppingNavyColor = Color(0xFF131921);
const kShoppingSearchBarHeight = 48.0;
const kShoppingCategoryBarHeight = 40.0;

/// アカウントタブの「注文履歴」に表示する最近の注文データ。
///
/// クイズ画面から [ShoppingApp] に渡すことで注文履歴ビューが有効になる。
/// null の場合は注文履歴メニューが非活性表示になる。
class ShoppingRecentOrder {
  const ShoppingRecentOrder({
    required this.targetItemId,
    required this.isPlayable,
    required this.onReorder,
  });

  /// 再注文対象の商品 ID
  final String targetItemId;

  /// 「もう一度買う」ボタンを有効にするか（クイズプレイ中のみ true）
  final bool isPlayable;

  /// 「もう一度買う」タップ時のコールバック
  final VoidCallback onReorder;
}

/// EC サイト全体のシェル Widget。
/// 水クイズ・再注文クイズなど複数のクイズが共有する。
///
/// - タブ 0（ホーム）/ 1（検索）/ 3（メニュー）: 商品グリッド
/// - タブ 2（アカウント）: 常に同一のアカウントビューを表示。
///   [recentOrder] を渡すと注文履歴が有効になる。
class ShoppingApp extends StatefulWidget {
  const ShoppingApp({
    super.key,
    // ── カート ──────────────────────────────────────────────
    required this.cart,
    required this.onAddToCart,
    required this.onUpdateQuantity,
    required this.onRemoveFromCart,
    required this.onPurchase,
    // ── 商品ハイライト（ヒント表示用）──────────────────────
    this.highlightedItemId,
    // ── ミッションバー ───────────────────────────────────────
    required this.quizStatus,
    required this.remainingSeconds,
    required this.missionText,
    required this.hintUsed,
    required this.timeLimitSeconds,
    this.hintNavIndex = 0,
    this.onHintTap,
    this.onGiveUp,
    // ── カートシート ─────────────────────────────────────────
    required this.cartBottomSheetBuilder,
    // ── クイズオーバーレイ（カットイン・リザルト等）──────────
    this.overlays = const [],
    // ── 注文履歴データ（null = 注文なし）────────────────────
    this.recentOrder,
    // ── チュートリアル用：タイマーバブルの GlobalKey ─────────
    this.timerBubbleKey,
    // ── チュートリアル用：水アイテムの GlobalKey ─────────────
    this.waterItemKey,
  });

  final ShoppingCart cart;
  final void Function(CartItem) onAddToCart;
  final void Function(String id, int qty) onUpdateQuantity;
  final void Function(String id) onRemoveFromCart;
  final VoidCallback onPurchase;
  final String? highlightedItemId;
  final QuizStatus quizStatus;
  final int remainingSeconds;
  final String missionText;
  final bool hintUsed;
  final int timeLimitSeconds;
  final int hintNavIndex;
  final VoidCallback? onHintTap;
  final VoidCallback? onGiveUp;
  final WidgetBuilder cartBottomSheetBuilder;
  final List<Widget> overlays;
  final ShoppingRecentOrder? recentOrder;

  /// チュートリアル用のタイマーバブル GlobalKey。
  /// 非 null の場合、FloatingMissionBubble にこのキーが設定される。
  final GlobalKey? timerBubbleKey;

  /// チュートリアル用の水アイテム GlobalKey。
  /// 非 null の場合、water_pura_aqua アイテムのタイルにこのキーが設定される。
  final GlobalKey? waterItemKey;

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  ShoppingCategory? _selectedCategory;
  String _searchQuery = '';
  int _selectedNavIndex = 0;
  bool _showOrderHistory = false;
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final normalizedQuery = _searchQuery.trim().toLowerCase();
    final filteredCatalog = kShoppingCatalog.where((ShoppingItem item) {
      if (_selectedCategory != null && item.category != _selectedCategory) {
        return false;
      }
      final searchKey = [
        item.id,
        context.sqCatalogItemName(item.id),
      ].join(' ').toLowerCase();
      if (normalizedQuery.isNotEmpty && !searchKey.contains(normalizedQuery)) {
        return false;
      }
      return true;
    }).toList();

    return PopScope(
      canPop: widget.quizStatus != QuizStatus.playing && !_showOrderHistory,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        // 注文履歴サブビュー表示中はアカウントメニューに戻る（確認ダイアログ不要）
        if (_showOrderHistory) {
          setState(() => _showOrderHistory = false);
          return;
        }
        final confirmed = await _showExitConfirmDialog();
        if (confirmed == true && mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: const Color(0xFFF3F3F3),
            appBar: _ShoppingAppBar(
              cartCount: widget.cart.totalCount,
              onCartTap: () => _showCart(context),
            ),
            body: _buildBody(filteredCatalog),
            bottomNavigationBar: _ShoppingBottomNav(
              selectedIndex: _selectedNavIndex,
              onTap: _onNavTap,
              hintUsed: widget.hintUsed,
              hintNavIndex: widget.hintNavIndex,
            ),
          ),
          // フローティングミッションバブル（ドラッグ可能な円形タイマー、プレイ中のみ表示）
          if (widget.quizStatus == QuizStatus.playing)
            FloatingMissionBubble(
              key: widget.timerBubbleKey,
              remainingSeconds: widget.remainingSeconds,
              missionText: widget.missionText,
              hintUsed: widget.hintUsed,
              timeLimitSeconds: widget.timeLimitSeconds,
              onHintTap: widget.onHintTap,
              onGiveUp: widget.onGiveUp,
            ),
          // クイズ固有のオーバーレイ（カットイン・リザルト等）
          ...widget.overlays,
        ],
      ),
    );
  }

  Future<bool?> _showExitConfirmDialog() {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('ゲームを中断しますか？'),
        content: const Text('プレイ中のゲームを終了します。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('続ける'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('終了する'),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(List<ShoppingItem> filteredCatalog) {
    // アカウントタブ
    if (_selectedNavIndex == 2) {
      final order = widget.recentOrder;
      final canShowHistory = _showOrderHistory &&
          order != null &&
          kShoppingCatalog.any((i) => i.id == order.targetItemId);
      return canShowHistory
          ? _OrderHistoryView(
              recentOrder: order,
              hintUsed: widget.hintUsed,
              onBack: () => setState(() => _showOrderHistory = false),
            )
          : _AccountMenuView(
              recentOrder: widget.recentOrder,
              hintUsed: widget.hintUsed,
              onOrderHistoryTap: () =>
                  setState(() => _showOrderHistory = true),
            );
    }

    // メニュータブ
    if (_selectedNavIndex == 3) {
      return const _MenuTabView();
    }

    // ホームタブ: ダッシュボード
    if (_selectedNavIndex == 0) {
      return _HomeTabView(
        cart: widget.cart,
        hintUsed: widget.hintUsed,
        highlightedItemId: widget.highlightedItemId,
        onAddToCart: widget.onAddToCart,
        onUpdateQuantity: widget.onUpdateQuantity,
        waterItemKey: widget.waterItemKey,
      );
    }

    // 検索タブ: 商品グリッド
    return Column(
      children: [
        _ShoppingSearchBar(
          controller: _searchController,
          focusNode: _searchFocusNode,
          searchQuery: _searchQuery,
          onChanged: (v) => setState(() => _searchQuery = v),
          onClear: () {
            setState(() => _searchQuery = '');
            _searchController.clear();
          },
        ),
        _ShoppingCategoryBar(
          selectedCategory: _selectedCategory,
          onCategorySelected: (cat) => setState(() {
            _selectedCategory = (_selectedCategory == cat) ? null : cat;
          }),
        ),
        Expanded(
          child: filteredCatalog.isEmpty
              ? const _ShoppingEmptyResult()
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
                    final isHighlighted = widget.hintUsed &&
                        item.id == widget.highlightedItemId;
                    final quantity = widget.cart.items
                            .where(
                              (CartItem ci) => ci.id == item.id,
                            )
                            .firstOrNull
                            ?.quantity ??
                        0;
                    return ShoppingItemTile(
                      item: item,
                      highlighted: isHighlighted,
                      quantity: quantity,
                      onIncrement: () => widget.onAddToCart(
                        CartItem(
                          id: item.id,
                          price: item.price,
                          quantity: 1,
                        ),
                      ),
                      onDecrement: () =>
                          widget.onUpdateQuantity(item.id, quantity - 1),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _onNavTap(int index) {
    setState(() {
      _selectedNavIndex = index;
      // アカウントタブから離れたら注文履歴サブビューをリセット
      if (index != 2) _showOrderHistory = false;
    });
    // 検索タブへの切り替え時に検索フィールドにフォーカスを当てる
    if (index == 1) {
      _searchFocusNode.requestFocus();
    }
  }

  void _showCart(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: widget.cartBottomSheetBuilder,
    );
  }
}

// ─── Amazon 風 AppBar ──────────────────────────────────────────────────────

class _ShoppingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ShoppingAppBar({
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
      backgroundColor: kShoppingNavyColor,
      automaticallyImplyLeading: false,
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

// ─── 検索バー ───────────────────────────────────────────────────────────────

class _ShoppingSearchBar extends StatelessWidget {
  const _ShoppingSearchBar({
    required this.controller,
    required this.searchQuery,
    required this.onChanged,
    required this.onClear,
    this.focusNode,
  });

  final TextEditingController controller;
  final String searchQuery;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kShoppingNavyColor,
      height: kShoppingSearchBarHeight,
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
                focusNode: focusNode,
                onChanged: onChanged,
                onTapOutside: (_) => focusNode?.unfocus(),
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
              InkWell(
                onTap: onClear,
                borderRadius: BorderRadius.circular(12),
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

// ─── カテゴリバー ──────────────────────────────────────────────────────────

class _ShoppingCategoryBar extends StatelessWidget {
  const _ShoppingCategoryBar({
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
      height: kShoppingCategoryBarHeight,
      color: const Color(0xFF232F3E),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: categoryItems.length,
        separatorBuilder: (_, __) => const SizedBox(width: 4),
        itemBuilder: (context, index) {
          final item = categoryItems[index];
          final isSelected = selectedCategory == item.value;
          return Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(2),
            child: InkWell(
              onTap: () => onCategorySelected(item.value),
              borderRadius: BorderRadius.circular(2),
              splashColor: Colors.white24,
              highlightColor: Colors.white10,
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
            ),
          );
        },
      ),
    );
  }
}

// ─── ホームタブビュー（ダッシュボード）────────────────────────────────────

class _HomeTabView extends StatefulWidget {
  const _HomeTabView({
    required this.cart,
    required this.hintUsed,
    required this.highlightedItemId,
    required this.onAddToCart,
    required this.onUpdateQuantity,
    this.waterItemKey,
  });

  final ShoppingCart cart;
  final bool hintUsed;
  final String? highlightedItemId;
  final void Function(CartItem) onAddToCart;
  final void Function(String id, int qty) onUpdateQuantity;
  final GlobalKey? waterItemKey;

  @override
  State<_HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<_HomeTabView> {
  ShoppingCategory? _selectedCategory;
  int _bannerPage = 0;
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final home = context.sq.home;
    final cats = context.sq.categories;

    final categoryItems = [
      (label: cats.daily, value: ShoppingCategory.daily, icon: Icons.cleaning_services_outlined),
      (label: cats.food, value: ShoppingCategory.food, icon: Icons.fastfood_outlined),
      (label: cats.electronics, value: ShoppingCategory.electronics, icon: Icons.devices_outlined),
      (label: cats.fashion, value: ShoppingCategory.fashion, icon: Icons.checkroom_outlined),
      (label: cats.sports, value: ShoppingCategory.sports, icon: Icons.sports_outlined),
      (label: cats.kitchen, value: ShoppingCategory.kitchen, icon: Icons.kitchen_outlined),
    ];

    final filteredCatalog = _selectedCategory == null
        ? kShoppingCatalog
        : kShoppingCatalog
            .where((item) => item.category == _selectedCategory)
            .toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── バナーカルーセル ───────────────────────────────────────────
          SizedBox(
            height: 160,
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (i) => setState(() => _bannerPage = i),
                  children: [
                    _HomeBanner(
                      label: home.banner1,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF007185), Color(0xFF00A8B4)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      icon: Icons.local_offer_outlined,
                    ),
                    _HomeBanner(
                      label: home.banner2,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF131921), Color(0xFF3A4553)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      icon: Icons.new_releases_outlined,
                    ),
                    _HomeBanner(
                      label: home.banner3,
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF9900), Color(0xFFFFB84D)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      icon: Icons.shopping_bag_outlined,
                    ),
                  ],
                ),
                // ページインジケーター
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (i) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: _bannerPage == i ? 16 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: _bannerPage == i
                              ? Colors.white
                              : Colors.white54,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          // ── カテゴリショートカット ──────────────────────────────────────
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: UnreadableText(
                    home.categories,
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 72,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categoryItems.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final cat = categoryItems[index];
                      final isSelected = _selectedCategory == cat.value;
                      return InkWell(
                        onTap: () => setState(() {
                          _selectedCategory =
                              _selectedCategory == cat.value ? null : cat.value;
                        }),
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFFFF9900)
                                      : const Color(0xFFF3F3F3),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFFFF9900)
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  cat.icon,
                                  size: 22,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF555555),
                                ),
                              ),
                              const SizedBox(height: 4),
                              UnreadableText(
                                cat.label,
                                isObfuscated: true,
                                animateOnObfuscate: false,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: isSelected
                                      ? const Color(0xFFFF9900)
                                      : Colors.black54,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // ── おすすめ商品セクション ─────────────────────────────────────
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: UnreadableText(
              home.recommended,
              isObfuscated: true,
              animateOnObfuscate: false,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            color: const Color(0xFFF3F3F3),
            child: filteredCatalog.isEmpty
                ? const _ShoppingEmptyResult()
                : GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                      final isHighlighted =
                          widget.hintUsed && item.id == widget.highlightedItemId;
                      final quantity = widget.cart.items
                              .where((CartItem ci) => ci.id == item.id)
                              .firstOrNull
                              ?.quantity ??
                          0;
                      return ShoppingItemTile(
                        key: (widget.waterItemKey != null &&
                                item.id == 'water_pura_aqua')
                            ? widget.waterItemKey
                            : null,
                        item: item,
                        highlighted: isHighlighted,
                        quantity: quantity,
                        onIncrement: () => widget.onAddToCart(
                          CartItem(
                            id: item.id,
                            price: item.price,
                            quantity: 1,
                          ),
                        ),
                        onDecrement: () =>
                            widget.onUpdateQuantity(item.id, quantity - 1),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _HomeBanner extends StatelessWidget {
  const _HomeBanner({
    required this.label,
    required this.gradient,
    required this.icon,
  });

  final String label;
  final LinearGradient gradient;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: Stack(
        children: [
          // 装飾用の大きなアイコン（背景）
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(icon, size: 160, color: Colors.white12),
          ),
          // テキスト
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 28, color: Colors.white70),
                const SizedBox(height: 8),
                UnreadableText(
                  label,
                  isObfuscated: true,
                  animateOnObfuscate: false,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── メニュータブビュー ────────────────────────────────────────────────────

class _MenuTabView extends StatelessWidget {
  const _MenuTabView();

  @override
  Widget build(BuildContext context) {
    final nav = context.sq.navigation;
    final menu = context.sq.menu;

    return ListView(
      children: [
        // ユーザーヘッダー
        Container(
          color: kShoppingNavyColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF3A4553),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, size: 24, color: Colors.white),
              ),
              const SizedBox(width: 12),
              UnreadableText(
                nav.account,
                isObfuscated: true,
                animateOnObfuscate: false,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // プログラム＆機能セクション
        _MenuSection(
          title: menu.programs,
          items: [
            _MenuSectionItem(
              icon: Icons.star_border,
              label: menu.prime,
              iconColor: const Color(0xFF00A8E1),
            ),
            _MenuSectionItem(
              icon: Icons.cloud_outlined,
              label: menu.digitalContent,
              iconColor: const Color(0xFF007185),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // 設定セクション
        _MenuSection(
          title: menu.settingsSection,
          items: [
            _MenuSectionItem(
              icon: Icons.notifications_outlined,
              label: menu.notification,
            ),
            _MenuSectionItem(
              icon: Icons.headset_mic_outlined,
              label: menu.customerService,
            ),
            _MenuSectionItem(
              icon: Icons.help_outline,
              label: menu.help,
            ),
            _MenuSectionItem(
              icon: Icons.description_outlined,
              label: menu.terms,
              showDivider: false,
            ),
          ],
        ),
      ],
    );
  }
}

class _MenuSection extends StatelessWidget {
  const _MenuSection({
    required this.title,
    required this.items,
  });

  final String title;
  final List<_MenuSectionItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: const Color(0xFFF3F3F3),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: UnreadableText(
            title,
            isObfuscated: true,
            animateOnObfuscate: false,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF555555),
            ),
          ),
        ),
        Material(
          color: Colors.white,
          child: Column(children: items),
        ),
      ],
    );
  }
}

class _MenuSectionItem extends StatelessWidget {
  const _MenuSectionItem({
    required this.icon,
    required this.label,
    this.iconColor = const Color(0xFF888888),
    this.showDivider = true,
  });

  final IconData icon;
  final String label;
  final Color iconColor;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(icon, size: 22, color: iconColor),
                const SizedBox(width: 16),
                Expanded(
                  child: UnreadableText(
                    label,
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
        if (showDivider) const Divider(height: 1, indent: 54),
      ],
    );
  }
}

// ─── 検索結果が空のとき ────────────────────────────────────────────────────

class _ShoppingEmptyResult extends StatelessWidget {
  const _ShoppingEmptyResult();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off, size: 48, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          UnreadableText(
            context.sq.common.noResults,
            isObfuscated: true,
            animateOnObfuscate: false,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// ─── ヒント時に点滅するウィジェット ──────────────────────────────────────

class _Blinker extends StatefulWidget {
  const _Blinker({
    required this.blinking,
    required this.child,
  });

  final bool blinking;
  final Widget child;

  @override
  State<_Blinker> createState() => _BlinkerState();
}

class _BlinkerState extends State<_Blinker>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    if (widget.blinking) _ctrl.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(_Blinker old) {
    super.didUpdateWidget(old);
    if (widget.blinking != old.blinking) {
      if (widget.blinking) {
        _ctrl.repeat(reverse: true);
      } else {
        _ctrl.stop();
        _ctrl.reset();
      }
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.blinking) return widget.child;
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, child) => Opacity(
        opacity: 0.4 + _ctrl.value * 0.6,
        child: child,
      ),
      child: widget.child,
    );
  }
}

// ─── ボトムナビゲーション ──────────────────────────────────────────────────

class _ShoppingBottomNav extends StatelessWidget {
  const _ShoppingBottomNav({
    required this.selectedIndex,
    required this.onTap,
    this.hintUsed = false,
    this.hintNavIndex = 0,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;
  final bool hintUsed;
  final int hintNavIndex;

  @override
  Widget build(BuildContext context) {
    final nav = context.sq.navigation;
    final navItems = [
      (icon: Icons.home_outlined, label: nav.home),
      (icon: Icons.search, label: nav.search),
      (icon: Icons.person_outline, label: nav.account),
      (icon: Icons.menu, label: nav.menu),
    ];

    return Material(
      color: kShoppingNavyColor,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF3A4553))),
        ),
        padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
        child: Row(
          children: navItems.asMap().entries.map((entry) {
            final i = entry.key;
            final item = entry.value;
            return Expanded(
              child: InkWell(
                onTap: () => onTap(i),
                splashColor: Colors.white24,
                highlightColor: Colors.white10,
                child: SizedBox(
                  height: 56,
                  child: _ShoppingNavItem(
                    icon: item.icon,
                    label: item.label,
                    isSelected: selectedIndex == i,
                    showHintBorder: hintUsed && i == hintNavIndex,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ShoppingNavItem extends StatelessWidget {
  const _ShoppingNavItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
    this.showHintBorder = false,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final bool showHintBorder;

  @override
  Widget build(BuildContext context) {
    final content = Column(
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
    );

    final innerWidget = showHintBorder
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow, width: 2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: content,
          )
        : content;

    return _Blinker(
      blinking: showHintBorder,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: innerWidget,
      ),
    );
  }
}

// ─── アカウントメニュービュー ──────────────────────────────────────────────

class _AccountMenuView extends StatelessWidget {
  const _AccountMenuView({
    required this.recentOrder,
    required this.hintUsed,
    required this.onOrderHistoryTap,
  });

  /// null のとき注文履歴メニューは非活性
  final ShoppingRecentOrder? recentOrder;
  final bool hintUsed;
  final VoidCallback onOrderHistoryTap;

  @override
  Widget build(BuildContext context) {
    final hasOrder = recentOrder != null;

    return ListView(
      children: [
        // プロフィールヘッダー
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {},
            child: Padding(
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
          ),
        ),
        const SizedBox(height: 8),
        // メニューリスト
        Material(
          color: Colors.white,
          child: Column(
            children: [
              _AccountMenuTile(
                icon: Icons.local_shipping_outlined,
                label: context.sq.reorder.orderHistoryTitle,
                showDivider: true,
              ),
              // 注文履歴: recentOrder がある場合のみ活性化、ヒント使用時にハイライト
              _AccountMenuTile(
                icon: Icons.receipt_long_outlined,
                label: context.sq.reorder.appTitle,
                onTap: hasOrder ? onOrderHistoryTap : null,
                showDivider: true,
                highlighted: hasOrder && hintUsed,
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
    final tile = Column(
      children: [
        InkWell(
          onTap: onTap ?? () {},
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
                      : const Color(0xFF888888),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: UnreadableText(
                    label,
                    isObfuscated: true,
                    animateOnObfuscate: false,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight:
                          highlighted ? FontWeight.bold : FontWeight.normal,
                      color:
                          highlighted ? const Color(0xFF007185) : Colors.black54,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: highlighted
                      ? Colors.grey.shade500
                      : Colors.grey.shade300,
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

    return _Blinker(
      blinking: highlighted,
      child: tile,
    );
  }
}

// ─── 注文履歴サブビュー ────────────────────────────────────────────────────

class _OrderHistoryView extends StatelessWidget {
  const _OrderHistoryView({
    required this.recentOrder,
    required this.onBack,
    this.hintUsed = false,
  });

  final ShoppingRecentOrder recentOrder;
  final VoidCallback onBack;
  final bool hintUsed;

  @override
  Widget build(BuildContext context) {
    final targetItem =
        kShoppingCatalog.firstWhere((i) => i.id == recentOrder.targetItemId);
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UnreadableText(
                                  context.sqCatalogItemName(
                                    recentOrder.targetItemId,
                                  ),
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
                    _Blinker(
                      blinking: hintUsed && recentOrder.isPlayable,
                      child: Padding(
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
                            onPressed: recentOrder.isPlayable
                                ? () {
                                    recentOrder.onReorder();
                                    onBack(); // カート追加後はアカウントメニューへ戻る
                                  }
                                : null,
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

// ─── 共有カートシート ──────────────────────────────────────────────────────

/// カートの中身を表示するボトムシート。
/// カートデータはコンストラクタで受け取り、リアクティブな更新は
/// 呼び出し元が ConsumerWidget でラップして渡す。
class AmazonCartSheet extends StatelessWidget {
  const AmazonCartSheet({
    super.key,
    required this.cart,
    required this.onRemoveFromCart,
    required this.onPurchase,
  });

  final ShoppingCart cart;
  final void Function(String id) onRemoveFromCart;
  final VoidCallback onPurchase;

  @override
  Widget build(BuildContext context) {
    final qt = context.sq.water; // cart 関連テキストは water/reorder で共通

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
            Flexible(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFF3F3F3),
                      child: Text('📦', style: TextStyle(fontSize: 20)),
                    ),
                    title: UnreadableText(
                      context.sqCatalogItemName(item.id),
                      isObfuscated: true,
                      animateOnObfuscate: false,
                    ),
                    subtitle: UnreadableText(
                      context.sq.common.quantity.replaceAll(
                        '{qty}',
                        item.quantity.toString(),
                      ),
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
                          onPressed: () => onRemoveFromCart(item.id),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            // 小計
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            // 購入ボタン（Amazon 黄色）
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
                  onPressed: onPurchase,
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

// ─── 共有インサイトアイテム ────────────────────────────────────────────────

/// リザルト画面の UX 解説セクションで使う個別アイテム Widget。
/// 水クイズ・再注文クイズで共有する。
class ShoppingInsightItem extends StatelessWidget {
  const ShoppingInsightItem({
    super.key,
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
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade700,
                        height: 1.4,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
