import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/delivery_mock_data.dart';
import '../domain/delivery_view_state.dart';
import 'delivery_app_state.dart';

/// デリバリーアプリの共通状態を管理する Notifier。
///
/// family で初期 [DeliveryViewState] を受け取ることで、
/// Quiz1〜3（browsing）と Quiz4（tracking）の初期画面を分けている。
/// 全4クイズで共有される UI 状態（注文数、ボトムシートの開き具合など）を一元管理する。
final deliveryAppProvider = AutoDisposeNotifierProvider.family<
    DeliveryAppNotifier, DeliveryAppState, DeliveryViewState>(
  DeliveryAppNotifier.new,
);

class DeliveryAppNotifier
    extends AutoDisposeFamilyNotifier<DeliveryAppState, DeliveryViewState> {
  bool _disposed = false;

  @override
  DeliveryAppState build(DeliveryViewState arg) {
    ref.onDispose(() => _disposed = true);
    // arg が初期 viewState となる（Quiz4 では tracking で開始）
    return DeliveryAppState(
      categories: buildMockCategories(),
      viewState: arg,
    );
  }

  /// カテゴリがタップされたことを記録し、選択カテゴリを切り替える。
  ///
  /// selectedCategoryId を更新して商品表示を切り替えるとともに、
  /// lastTappedCategoryId を更新することで Quiz1 側の listen がクリア判定を行う。
  void tapCategory(String id) {
    if (_disposed) return;
    state = state.copyWith(
      selectedCategoryId: id,
      lastTappedCategoryId: id,
      orderQuantity: id != state.selectedCategoryId ? 1 : null,
    );
  }

  /// 注文個数を +1 する。
  void incrementQuantity() {
    if (_disposed) return;
    state = state.copyWith(orderQuantity: state.orderQuantity + 1);
  }

  /// 注文個数を -1 する（最小1）。
  void decrementQuantity() {
    if (_disposed) return;
    if (state.orderQuantity <= 1) return;
    state = state.copyWith(orderQuantity: state.orderQuantity - 1);
  }

  /// カートボタンがタップされたことを記録する。
  ///
  /// cartTapCount を +1 することで Quiz3 側の listen がクリア判定を行う。
  void tapCartButton() {
    if (_disposed) return;
    state = state.copyWith(cartTapCount: state.cartTapCount + 1);
  }

  /// ボトムシートの引き上げ割合を更新する。
  void updateTrackingSheetExtent(double extent) {
    if (_disposed) return;
    state = state.copyWith(trackingSheetExtent: extent);
  }

  /// 状態を初期値にリセットする。
  ///
  /// ref.invalidate と異なりプロバイダーを破棄しないため、
  /// 各クイズ Notifier が build() で登録した ref.listen が
  /// 再接続されず壊れる問題を回避できる。
  void reset() {
    if (_disposed) return;
    state = DeliveryAppState(
      categories: buildMockCategories(),
      viewState: arg,
    );
  }
}
