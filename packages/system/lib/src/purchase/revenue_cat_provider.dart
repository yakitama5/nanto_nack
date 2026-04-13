import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../logger/app_logger.dart';

// ─────────────────────────────────────────
// オファリング Provider
// ─────────────────────────────────────────

/// RevenueCat の現在のオファリングを取得する Provider。
///
/// [Purchases.getOfferings] を呼び出し、`current` オファリングを返す。
/// 取得失敗時は例外を rethrow するため、呼び出し側は [AsyncError] を処理すること。
final offeringsProvider = AsyncNotifierProvider<OfferingsNotifier, Offering?>(
  OfferingsNotifier.new,
);

class OfferingsNotifier extends AsyncNotifier<Offering?> {
  @override
  Future<Offering?> build() async {
    try {
      final offerings = await Purchases.getOfferings();
      return offerings.current;
    } catch (e, s) {
      appLogger.w('IAP: オファリング取得失敗: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}

// ─────────────────────────────────────────
// 顧客情報 Provider
// ─────────────────────────────────────────

/// RevenueCat の顧客情報（購入履歴）を取得・監視する Provider。
///
/// 初回は [Purchases.getCustomerInfo] でフェッチし、
/// その後 [Purchases.addCustomerInfoUpdateListener] で変更を検知して自動更新する。
/// 購入・復元後にも自動的に最新情報へ更新される。
final customerInfoProvider =
    AsyncNotifierProvider<CustomerInfoNotifier, CustomerInfo?>(
  CustomerInfoNotifier.new,
);

class CustomerInfoNotifier extends AsyncNotifier<CustomerInfo?> {
  @override
  Future<CustomerInfo?> build() async {
    // リスナー登録：RevenueCat が更新を検知したとき自動で state を更新する
    Purchases.addCustomerInfoUpdateListener(_onCustomerInfoUpdated);
    ref.onDispose(
      () => Purchases.removeCustomerInfoUpdateListener(_onCustomerInfoUpdated),
    );

    try {
      return await Purchases.getCustomerInfo();
    } catch (e, s) {
      appLogger.w('IAP: 顧客情報取得失敗: $e', error: e, stackTrace: s);
      rethrow;
    }
  }

  void _onCustomerInfoUpdated(CustomerInfo info) {
    state = AsyncData(info);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}

// ─────────────────────────────────────────
// ヘルパー関数
// ─────────────────────────────────────────

/// [CustomerInfo] から累計コーヒー数を計算するヘルパー関数。
///
/// 過去の全非サブスクリプション決済（消耗型）をループし、
/// 各プロダクトIDに応じたコーヒー杯数を合算して返す。
int calculateTotalCoffees(CustomerInfo? customerInfo) {
  if (customerInfo == null) return 0;

  var total = 0;
  for (final transaction in customerInfo.nonSubscriptionTransactions) {
    switch (transaction.productIdentifier) {
      case 'nantonack_coffee_100':
        total += 1;
      case 'nantonack_coffee_300':
        total += 3;
    }
  }
  return total;
}
