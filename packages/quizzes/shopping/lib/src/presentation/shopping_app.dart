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

/// EC サイト全体のシェル Widget。
/// 水クイズ・再注文クイズなど複数のクイズが共有する。
///
/// - タブ 0（ホーム）/ 1（検索）/ 3（メニュー）: 商品グリッド
/// - タブ 2（アカウント）: [accountViewBuilder] で差し替え可能
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
    // ── アカウントタブのカスタムコンテンツ ───────────────────
    this.accountViewBuilder,
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
  final WidgetBuilder? accountViewBuilder;

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  ShoppingCategory? _selectedCategory;
  String _searchQuery = '';
  int _selectedNavIndex = 0;
  final _searchController = TextEditingController();

  /// ホームビュー（商品グリッド）を表示中かどうか。
  /// アカウントタブが選択され、かつカスタムビューが存在する場合は false。
  bool get _isHomeView =>
      _selectedNavIndex != 2 || widget.accountViewBuilder == null;

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
                onTap: (i) => setState(() => _selectedNavIndex = i),
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
    if (!_isHomeView) {
      return Builder(builder: widget.accountViewBuilder!);
    }

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
