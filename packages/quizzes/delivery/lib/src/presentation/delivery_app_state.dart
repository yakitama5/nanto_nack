import '../domain/delivery_quiz_config.dart';
import '../domain/delivery_view_state.dart';
import '../domain/food_category.dart';

/// デリバリーアプリの共通UI状態。
///
/// 全4クイズで共有されるモックアプリの状態を一元管理する。
/// クイズごとの初期 viewState は [DeliveryAppNotifier] の family 引数で制御する。
class DeliveryAppState {
  const DeliveryAppState({
    required this.categories,
    required this.viewState,
    this.selectedCategoryId = 'burger',
    this.orderQuantity = 1,
    this.trackingSheetExtent = 0.0,
    this.lastTappedCategoryId,
    this.cartTapCount = 0,
  });

  final List<FoodCategory> categories;
  final DeliveryViewState viewState;

  /// 現在選択中のカテゴリID（商品詳細の表示切り替えに使用）
  final String selectedCategoryId;

  /// 注文個数（最小1）
  final int orderQuantity;

  /// ボトムシートの引き上げ割合（0.0〜1.0）
  final double trackingSheetExtent;

  /// 最後にタップされたカテゴリID（Quiz1 のクリア判定に使用）
  final String? lastTappedCategoryId;

  /// カートボタンのタップ累計回数（Quiz3 のクリア判定に使用）
  final int cartTapCount;

  /// 合計金額（注文個数 × 単価）
  int get totalPrice =>
      orderQuantity * DeliveryQuizConfig.itemPriceYen.toInt();

  /// 選択中カテゴリの絵文字アイコン
  String get selectedCategoryIcon {
    return categories
            .where((c) => c.id == selectedCategoryId)
            .firstOrNull
            ?.icon ??
        '🍔';
  }

  DeliveryAppState copyWith({
    List<FoodCategory>? categories,
    DeliveryViewState? viewState,
    String? selectedCategoryId,
    int? orderQuantity,
    double? trackingSheetExtent,
    String? lastTappedCategoryId,
    bool clearLastTappedCategoryId = false,
    int? cartTapCount,
  }) {
    return DeliveryAppState(
      categories: categories ?? this.categories,
      viewState: viewState ?? this.viewState,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      orderQuantity: orderQuantity ?? this.orderQuantity,
      trackingSheetExtent: trackingSheetExtent ?? this.trackingSheetExtent,
      lastTappedCategoryId: clearLastTappedCategoryId
          ? null
          : (lastTappedCategoryId ?? this.lastTappedCategoryId),
      cartTapCount: cartTapCount ?? this.cartTapCount,
    );
  }
}
