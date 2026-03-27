import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    this.onHintTap,
    // ── カートシート ─────────────────────────────────────────
    required this.cartBottomSheetBuilder,
    // ── クイズオーバーレイ（カットイン・リザルト等）──────────
    this.overlays = const [],
    // ── 注文履歴データ（null = 注文なし）────────────────────
    this.recentOrder,
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
  final VoidCallback? onHintTap;
  final WidgetBuilder cartBottomSheetBuilder;
  final List<Widget> overlays;
  final ShoppingRecentOrder? recentOrder;

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  ShoppingCategory? _selectedCategory;
  String _searchQuery = '';
  int _selectedNavIndex = 0;
  bool _showOrderHistory = false;
  final _searchController = TextEditingController();

  /// ホームビュー（商品グリッド）を表示中かどうか。
  bool get _isHomeView => _selectedNavIndex != 2;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCatalog = kShoppingCatalog.where((ShoppingItem item) {
      if (_selectedCategory != null && item.category != _selectedCategory) {
        return false;
      }
      if (_searchQuery.isNotEmpty &&
          !item.id.contains(_searchQuery.toLowerCase())) {
        return false;
      }
      return true;
    }).toList();

    final missionBarTop = MediaQuery.paddingOf(context).top +
        kToolbarHeight +
        (_isHomeView
            ? kShoppingSearchBarHeight + kShoppingCategoryBarHeight
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
              appBar: _ShoppingAppBar(
                cartCount: widget.cart.totalCount,
                onCartTap: () => _showCart(context),
              ),
              body: _buildBody(filteredCatalog),
              bottomNavigationBar: _ShoppingBottomNav(
                selectedIndex: _selectedNavIndex,
                onTap: _onNavTap,
              ),
            ),
          ),
        ),
        // ミッションバー（プレイ中のみ表示）
        if (widget.quizStatus == QuizStatus.playing)
          Positioned(
            top: missionBarTop,
            left: 16,
            right: 16,
            child: FloatingMissionBar(
              remainingSeconds: widget.remainingSeconds,
              missionText: widget.missionText,
              hintUsed: widget.hintUsed,
              timeLimitSeconds: widget.timeLimitSeconds,
              onHintTap: widget.onHintTap,
            ),
          ),
        // クイズ固有のオーバーレイ（カットイン・リザルト等）
        ...widget.overlays,
      ],
    );
  }

  Widget _buildBody(List<ShoppingItem> filteredCatalog) {
    // アカウントタブ
    if (_selectedNavIndex == 2) {
      return _showOrderHistory
          ? _OrderHistoryView(
              recentOrder: widget.recentOrder!,
              onBack: () => setState(() => _showOrderHistory = false),
            )
          : _AccountMenuView(
              recentOrder: widget.recentOrder,
              onOrderHistoryTap: () =>
                  setState(() => _showOrderHistory = true),
            );
    }

    // ホーム / 検索 / メニュータブ: 商品グリッド
    return Column(
      children: [
        _ShoppingSearchBar(
          controller: _searchController,
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
  });

  final TextEditingController controller;
  final String searchQuery;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

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

// ─── ボトムナビゲーション ──────────────────────────────────────────────────

class _ShoppingBottomNav extends StatelessWidget {
  const _ShoppingBottomNav({
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
        color: kShoppingNavyColor,
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
            child: _ShoppingNavItem(
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

class _ShoppingNavItem extends StatelessWidget {
  const _ShoppingNavItem({
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

// ─── アカウントメニュービュー ──────────────────────────────────────────────

class _AccountMenuView extends StatelessWidget {
  const _AccountMenuView({
    required this.recentOrder,
    required this.onOrderHistoryTap,
  });

  /// null のとき注文履歴メニューは非活性
  final ShoppingRecentOrder? recentOrder;
  final VoidCallback onOrderHistoryTap;

  @override
  Widget build(BuildContext context) {
    final hasOrder = recentOrder != null;

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
        // メニューリスト
        Container(
          color: Colors.white,
          child: Column(
            children: [
              _AccountMenuTile(
                icon: Icons.local_shipping_outlined,
                label: context.sq.reorder.orderHistoryTitle,
                showDivider: true,
              ),
              // 注文履歴: recentOrder がある場合のみ活性化
              _AccountMenuTile(
                icon: Icons.receipt_long_outlined,
                label: context.sq.reorder.appTitle,
                onTap: hasOrder ? onOrderHistoryTap : null,
                showDivider: true,
                highlighted: hasOrder,
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
  }
}

// ─── 注文履歴サブビュー ────────────────────────────────────────────────────

class _OrderHistoryView extends StatelessWidget {
  const _OrderHistoryView({
    required this.recentOrder,
    required this.onBack,
  });

  final ShoppingRecentOrder recentOrder;
  final VoidCallback onBack;

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
            ...cart.items.map(
              (CartItem item) => ListTile(
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
                      onPressed: () => onRemoveFromCart(item.id),
                    ),
                  ],
                ),
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
