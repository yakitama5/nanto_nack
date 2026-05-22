import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/delivery_quiz_config.dart';
import '../domain/delivery_view_state.dart';
import '../domain/food_category.dart';
import '../i18n/delivery_translations_extension.dart';
import 'delivery_app_notifier.dart';
import 'delivery_app_state.dart';

/// デリバリーアプリ全体をラップするScaffold。
///
/// [initialViewState] によって BrowsingView（商品選択）か
/// TrackingView（配達追跡）かの初期画面が決まる。
/// 内部で [deliveryAppProvider(initialViewState)] を watch し、
/// DeliveryAppState.viewState に応じて表示を切り替える。
class DeliveryAppScaffold extends ConsumerStatefulWidget {
  const DeliveryAppScaffold({
    super.key,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.initialViewState,
    this.hintUsed = false,
    this.onHintTap,
    this.overlays = const [],
    this.highlightCategory = false,
    this.highlightStepper = false,
    this.highlightCartButton = false,
    this.highlightSheet = false,
  });

  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;

  /// Quiz1〜3 は browsing、Quiz4 は tracking を渡す
  final DeliveryViewState initialViewState;
  final bool hintUsed;
  final VoidCallback? onHintTap;
  final List<Widget> overlays;

  /// ヒント使用時のハイライト対象（各クイズで1つだけ true にする）
  final bool highlightCategory;
  final bool highlightStepper;
  final bool highlightCartButton;
  final bool highlightSheet;

  @override
  ConsumerState<DeliveryAppScaffold> createState() =>
      _DeliveryAppScaffoldState();
}

class _DeliveryAppScaffoldState extends ConsumerState<DeliveryAppScaffold> {
  @override
  Widget build(BuildContext context) {
    final deliveryState =
        ref.watch(deliveryAppProvider(widget.initialViewState));
    final notifier =
        ref.read(deliveryAppProvider(widget.initialViewState).notifier);
    final ext = Theme.of(context).extension<DeliveryAppTheme>()!;

    return PopScope(
      canPop: widget.quizStatus != QuizStatus.playing,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final confirmed = await QuizExitScope.showConfirmDialog(context);
        if ((confirmed ?? false) && mounted) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: ext.scaffoldBackground,
            body: deliveryState.viewState == DeliveryViewState.browsing
                ? _BrowsingView(
                    state: deliveryState,
                    notifier: notifier,
                    ext: ext,
                    context: context,
                    highlightCategory: widget.highlightCategory,
                    highlightStepper: widget.highlightStepper,
                    highlightCartButton: widget.highlightCartButton,
                  )
                : _TrackingView(
                    state: deliveryState,
                    notifier: notifier,
                    ext: ext,
                    context: context,
                    highlightSheet: widget.highlightSheet,
                  ),
          ),
          if (widget.quizStatus == QuizStatus.playing)
            FloatingMissionBubble(
              remainingSeconds: widget.remainingSeconds,
              missionText: widget.missionText,
              hintUsed: widget.hintUsed,
              timeLimitSeconds: widget.timeLimitSeconds,
              onHintTap: widget.onHintTap,
              onGiveUp: widget.onGiveUp,
            ),
          ...widget.overlays,
        ],
      ),
    );
  }
}

// ─── BrowsingView ────────────────────────────────────────────────────────────

class _BrowsingView extends StatelessWidget {
  const _BrowsingView({
    required this.state,
    required this.notifier,
    required this.ext,
    required this.context,
    this.highlightCategory = false,
    this.highlightStepper = false,
    this.highlightCartButton = false,
  });

  final DeliveryAppState state;
  final DeliveryAppNotifier notifier;
  final DeliveryAppTheme ext;
  final BuildContext context;
  final bool highlightCategory;
  final bool highlightStepper;
  final bool highlightCartButton;

  @override
  Widget build(BuildContext buildContext) {
    return SafeArea(
      child: Column(
        children: [
          _DeliveryAppBar(ext: ext, context: buildContext),
          _CategoryHorizontalList(
            categories: state.categories,
            onTap: notifier.tapCategory,
            ext: ext,
            highlight: highlightCategory,
          ),
          Expanded(
            child: _ItemDetailArea(
              state: state,
              notifier: notifier,
              ext: ext,
              context: buildContext,
              highlightStepper: highlightStepper,
              highlightCartButton: highlightCartButton,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── DeliveryAppBar ──────────────────────────────────────────────────────────

class _DeliveryAppBar extends StatelessWidget {
  const _DeliveryAppBar({required this.ext, required this.context});

  final DeliveryAppTheme ext;
  final BuildContext context;

  @override
  Widget build(BuildContext buildContext) {
    final sq = buildContext.sq;
    return Container(
      color: ext.appBarColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnreadableText(
            sq.common.appTitle,
            animateOnObfuscate: false,
            style: TextStyle(
              color: ext.appBarTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: ext.scaffoldBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ext.cardBorderColor),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: ext.subTextColor, size: 18),
                const SizedBox(width: 8),
                UnreadableText(
                  sq.common.searchHint,
                  animateOnObfuscate: false,
                  style: TextStyle(color: ext.subTextColor, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── CategoryHorizontalList ───────────────────────────────────────────────────

class _CategoryHorizontalList extends StatelessWidget {
  const _CategoryHorizontalList({
    required this.categories,
    required this.onTap,
    required this.ext,
    this.highlight = false,
  });

  final List<FoodCategory> categories;
  final ValueChanged<String> onTap;
  final DeliveryAppTheme ext;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    return Container(
      color: ext.appBarColor,
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 4, bottom: 8),
            child: UnreadableText(
              sq.common.categories,
              animateOnObfuscate: false,
              style: TextStyle(
                color: ext.primaryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 72,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: highlight
                ? BoxDecoration(
                    border: Border.all(
                      color: ext.highlightBorderColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: ext.highlightBorderColor.withValues(alpha: 0.08),
                  )
                : null,
            // アイテム幅80にすることで、画面幅375px想定では
            // burger+sushi の2つが見えてpizzaは画面外にはみ出し、
            // 横スクロールが必要な設計になっている。
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: categories.length,
              itemBuilder: (ctx, index) {
                final category = categories[index];
                return _CategoryItem(
                  category: category,
                  onTap: () => onTap(category.id),
                  ext: ext,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.category,
    required this.onTap,
    required this.ext,
  });

  final FoodCategory category;
  final VoidCallback onTap;
  final DeliveryAppTheme ext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ext.categoryActiveBg,
              ),
              alignment: Alignment.center,
              child: Text(
                category.icon,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 4),
            UnreadableText(
              category.name,
              animateOnObfuscate: false,
              style: TextStyle(
                color: ext.primaryTextColor,
                fontSize: 11,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── ItemDetailArea ───────────────────────────────────────────────────────────

class _ItemDetailArea extends StatelessWidget {
  const _ItemDetailArea({
    required this.state,
    required this.notifier,
    required this.ext,
    required this.context,
    this.highlightStepper = false,
    this.highlightCartButton = false,
  });

  final DeliveryAppState state;
  final DeliveryAppNotifier notifier;
  final DeliveryAppTheme ext;
  final BuildContext context;
  final bool highlightStepper;
  final bool highlightCartButton;

  @override
  Widget build(BuildContext buildContext) {
    final sq = buildContext.sq;
    final itemData = _itemDataFor(buildContext, state.selectedCategoryId);
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            // カートボタン分の余白
            bottom: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 商品画像（選択カテゴリの絵文字）
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: ext.cardBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: ext.cardBorderColor),
                ),
                alignment: Alignment.center,
                child: Text(
                  state.selectedCategoryIcon,
                  style: const TextStyle(fontSize: 80),
                ),
              ),
              const SizedBox(height: 16),
              // 商品名
              UnreadableText(
                itemData.name,
                animateOnObfuscate: false,
                style: TextStyle(
                  color: ext.primaryTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // 商品説明
              UnreadableText(
                itemData.description,
                animateOnObfuscate: false,
                style: TextStyle(color: ext.subTextColor, fontSize: 14),
              ),
              const SizedBox(height: 12),
              // 価格
              UnreadableText(
                sq.common.itemPrice,
                animateOnObfuscate: false,
                style: TextStyle(
                  color: ext.primaryTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              // 数量ステッパー
              _QuantityStepper(
                quantity: state.orderQuantity,
                onIncrement: notifier.incrementQuantity,
                onDecrement: notifier.decrementQuantity,
                ext: ext,
                highlightIncrement: highlightStepper,
              ),
            ],
          ),
        ),
        // フローティングカートボタン
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: _CartButton(
            totalPrice: state.totalPrice,
            onTap: notifier.tapCartButton,
            ext: ext,
            context: buildContext,
            highlight: highlightCartButton,
          ),
        ),
      ],
    );
  }

  /// カテゴリIDに対応するアイテムデータ（名前・説明）を返す。
  _ItemData _itemDataFor(BuildContext ctx, String categoryId) {
    final sq = ctx.sq;
    return switch (categoryId) {
      'sushi' => _ItemData(
          name: sq.items.sushi.name,
          description: sq.items.sushi.description,
        ),
      'pizza' => _ItemData(
          name: sq.items.pizza.name,
          description: sq.items.pizza.description,
        ),
      'ramen' => _ItemData(
          name: sq.items.ramen.name,
          description: sq.items.ramen.description,
        ),
      'curry' => _ItemData(
          name: sq.items.curry.name,
          description: sq.items.curry.description,
        ),
      _ => _ItemData(
          name: sq.items.burger.name,
          description: sq.items.burger.description,
        ),
    };
  }
}

// ─── QuantityStepper ──────────────────────────────────────────────────────────

class _QuantityStepper extends StatelessWidget {
  const _QuantityStepper({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.ext,
    this.highlightIncrement = false,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final DeliveryAppTheme ext;
  final bool highlightIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ext.cardBorderColor),
              color: ext.cardBackground,
            ),
            alignment: Alignment.center,
            child: Text(
              '−',
              style: TextStyle(
                color: ext.primaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 32,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ext.primaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: onIncrement,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ext.cartButtonColor,
              border: highlightIncrement
                  ? Border.all(
                      color: ext.highlightBorderColor,
                      width: 3,
                    )
                  : null,
              boxShadow: highlightIncrement
                  ? [
                      BoxShadow(
                        color: ext.highlightBorderColor.withValues(alpha: 0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            alignment: Alignment.center,
            child: Text(
              '＋',
              style: TextStyle(
                color: ext.cartButtonTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── CartButton ───────────────────────────────────────────────────────────────

class _CartButton extends StatelessWidget {
  const _CartButton({
    required this.totalPrice,
    required this.onTap,
    required this.ext,
    required this.context,
    this.highlight = false,
  });

  final int totalPrice;
  final VoidCallback onTap;
  final DeliveryAppTheme ext;
  final BuildContext context;
  final bool highlight;

  @override
  Widget build(BuildContext buildContext) {
    final sq = buildContext.sq;
    // {total} プレースホルダーを実際の金額に置換
    final buttonText = sq.common.cartButton
        .replaceAll('{total}', totalPrice.toString());
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: ext.cartButtonColor,
          borderRadius: BorderRadius.circular(12),
          border: highlight
              ? Border.all(color: ext.highlightBorderColor, width: 3)
              : null,
          boxShadow: highlight
              ? [
                  BoxShadow(
                    color: ext.highlightBorderColor.withValues(alpha: 0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: UnreadableText(
          buttonText,
          animateOnObfuscate: false,
          style: TextStyle(
            color: ext.cartButtonTextColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ─── TrackingView ─────────────────────────────────────────────────────────────

class _TrackingView extends StatelessWidget {
  const _TrackingView({
    required this.state,
    required this.notifier,
    required this.ext,
    required this.context,
    this.highlightSheet = false,
  });

  final DeliveryAppState state;
  final DeliveryAppNotifier notifier;
  final DeliveryAppTheme ext;
  final BuildContext context;
  final bool highlightSheet;

  @override
  Widget build(BuildContext buildContext) {
    final sq = buildContext.sq;
    return Stack(
      children: [
        // 背面: 簡易地図（CustomPaint）
        Positioned.fill(
          child: CustomPaint(
            painter: _DeliveryMapPainter(
              background: ext.mapBackground,
              roadColor: ext.mapRoadColor,
              parkColor: ext.mapParkColor,
              waterColor: ext.mapWaterColor,
            ),
          ),
        ),
        // 配達員の現在地ピン
        const Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 300,
          child: Center(
            child: _CourierPin(),
          ),
        ),
        // 前面: DraggableScrollableSheet
        NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            notifier.updateTrackingSheetExtent(notification.extent);
            return false;
          },
          child: DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 1.0,
            builder: (ctx, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: ext.courierSheetBackground,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ext.cardBorderColor.withValues(alpha: 0.5),
                      blurRadius: 8,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  children: [
                    // ハンドルバー（掴んで動かせることを示すアフォーダンス）
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: highlightSheet ? 56 : 40,
                          height: highlightSheet ? 6 : 4,
                          decoration: BoxDecoration(
                            color: highlightSheet
                                ? ext.highlightBorderColor
                                : ext.cardBorderColor,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: highlightSheet
                                ? [
                                    BoxShadow(
                                      color: ext.highlightBorderColor
                                          .withValues(alpha: 0.6),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                    ),
                                  ]
                                : null,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UnreadableText(
                            sq.common.trackingTitle,
                            animateOnObfuscate: false,
                            style: TextStyle(
                              color: ext.primaryTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _CourierInfoRow(
                            icon: '🚴',
                            text: sq.common.courierName,
                            ext: ext,
                          ),
                          const SizedBox(height: 8),
                          _CourierInfoRow(
                            icon: '📍',
                            text: sq.common.courierStatus,
                            ext: ext,
                          ),
                          const SizedBox(height: 8),
                          _CourierInfoRow(
                            icon: '⏱️',
                            text: sq.common.estimatedTime,
                            ext: ext,
                          ),
                          const SizedBox(height: 16),
                          Divider(color: ext.cardBorderColor),
                          const SizedBox(height: 12),
                          UnreadableText(
                            sq.common.orderItems,
                            animateOnObfuscate: false,
                            style: TextStyle(
                              color: ext.primaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _CourierInfoRow(
                            icon: '🍔',
                            text: sq.common.itemName,
                            ext: ext,
                          ),
                          const SizedBox(height: 12),
                          UnreadableText(
                            sq.common.orderTotal.replaceAll(
                              '{total}',
                              DeliveryQuizConfig.itemPriceYen.toInt().toString(),
                            ),
                            animateOnObfuscate: false,
                            style: TextStyle(
                              color: ext.primaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ─── DeliveryMapPainter ───────────────────────────────────────────────────────

class _DeliveryMapPainter extends CustomPainter {
  const _DeliveryMapPainter({
    required this.background,
    required this.roadColor,
    required this.parkColor,
    required this.waterColor,
  });

  final Color background;
  final Color roadColor;
  final Color parkColor;
  final Color waterColor;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = background);

    final road = Paint()
      ..color = roadColor
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;
    final roadMinor = Paint()
      ..color = roadColor.withValues(alpha: 0.6)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    for (var i = 1; i <= 9; i++) {
      final frac = i / 10.0;
      final paint = i % 2 == 0 ? road : roadMinor;
      canvas.drawLine(
        Offset(0, size.height * frac),
        Offset(size.width, size.height * frac),
        paint,
      );
      canvas.drawLine(
        Offset(size.width * frac, 0),
        Offset(size.width * frac, size.height),
        paint,
      );
    }

    final parkPaint = Paint()..color = parkColor;
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.10,
        size.height * 0.10,
        size.width * 0.14,
        size.height * 0.10,
      ),
      parkPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.60,
        size.height * 0.55,
        size.width * 0.18,
        size.height * 0.12,
      ),
      parkPaint,
    );

    final waterPaint = Paint()
      ..color = waterColor
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.75, size.height * 0.25),
        width: size.width * 0.10,
        height: size.height * 0.06,
      ),
      waterPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.25, size.height * 0.70),
        width: size.width * 0.08,
        height: size.height * 0.04,
      ),
      waterPaint,
    );
  }

  @override
  bool shouldRepaint(_DeliveryMapPainter old) =>
      old.background != background ||
      old.roadColor != roadColor ||
      old.parkColor != parkColor ||
      old.waterColor != waterColor;
}

// ─── CourierPin ───────────────────────────────────────────────────────────────

class _CourierPin extends StatelessWidget {
  const _CourierPin();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).extension<DeliveryAppTheme>()!.cartButtonColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Text('🚴', style: TextStyle(fontSize: 22)),
        ),
        CustomPaint(
          size: const Size(14, 7),
          painter: _PinTailPainter(
            color: Theme.of(context).extension<DeliveryAppTheme>()!.cartButtonColor,
          ),
        ),
      ],
    );
  }
}

class _PinTailPainter extends CustomPainter {
  const _PinTailPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_PinTailPainter old) => old.color != color;
}

// ─── ItemData ─────────────────────────────────────────────────────────────────

class _ItemData {
  const _ItemData({required this.name, required this.description});

  final String name;
  final String description;
}

class _CourierInfoRow extends StatelessWidget {
  const _CourierInfoRow({
    required this.icon,
    required this.text,
    required this.ext,
  });

  final String icon;
  final String text;
  final DeliveryAppTheme ext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(icon, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        Expanded(
          child: UnreadableText(
            text,
            animateOnObfuscate: false,
            style: TextStyle(color: ext.primaryTextColor, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
