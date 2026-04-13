import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

/// 応援画面（Buy Me a Coffee）。
///
/// ユーザーが開発者にコーヒーを贈ることができる画面。
/// RevenueCat のオファリングを表示し、消耗型課金（コーヒー1杯/3杯）を提供する。
/// 累計贈呈数は背景のコーヒーアイコンで視覚的に表示される。
class SupportScreen extends ConsumerStatefulWidget {
  const SupportScreen({super.key});

  @override
  ConsumerState<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends ConsumerState<SupportScreen> {
  Package? _selectedPackage;
  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final offeringsAsync = ref.watch(offeringsProvider);
    final customerInfoAsync = ref.watch(customerInfoProvider);

    final int? currentCount = customerInfoAsync.when<int?>(
      data: (info) => calculateTotalCoffees(info),
      loading: () => null,
      error: (_, __) => null,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(t.support.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // ── 背景：積み重なるコーヒーアイコン ──
          Positioned.fill(
            child: _CoffeeBackground(count: currentCount ?? 0),
          ),
          // ── メインコンテンツ ──
          SafeArea(
            child: Column(
              children: [
                // 累計カウント表示
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      Text(
                        t.support.totalCoffeesLabel,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        currentCount != null
                            ? t.support.totalCoffeesCount
                                .replaceAll('{count}', currentCount.toString())
                            : '--',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // 説明エリア
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    t.support.description,
                    textAlign: TextAlign.center,
                  ),
                ),
                // プラン選択リスト（RevenueCat データを元に表示）
                offeringsAsync.when(
                  data: (offering) {
                    if (offering == null ||
                        offering.availablePackages.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text(t.support.noOfferings),
                        ),
                      );
                    }
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: RadioGroup<Package>(
                          groupValue: _selectedPackage,
                          onChanged: (val) =>
                              setState(() => _selectedPackage = val),
                          child: ListView(
                            children: offering.availablePackages.map((package) {
                              return RadioListTile<Package>(
                                title: Text(package.storeProduct.title),
                                subtitle:
                                    Text(package.storeProduct.priceString),
                                value: package,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                  loading: () => const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (err, _) => Expanded(
                    child: Center(
                      child: Text(
                        t.support.fetchError
                            .replaceAll('{error}', err.toString()),
                      ),
                    ),
                  ),
                ),
                // 購入の復元ボタン
                TextButton(
                  onPressed: _isBusy ? null : _handleRestore,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      t.support.restoreButton,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed:
                (_selectedPackage == null || _isBusy) ? null : _handlePurchase,
            child: Text(t.support.sendCoffeeButton),
          ),
        ),
      ),
    );
  }

  Future<void> _handlePurchase() async {
    final package = _selectedPackage;
    if (package == null || _isBusy) return;
    setState(() => _isBusy = true);

    try {
      await Purchases.purchase(PurchaseParams.package(package));
      // 購入成功後に顧客情報を更新
      ref.invalidate(customerInfoProvider);
      if (!mounted) return;
      final t = Translations.of(context);
      await showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(t.support.thankYouTitle),
          content: Text(t.support.thankYouMessage),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(t.support.close),
            ),
          ],
        ),
      );
    } catch (e, s) {
      // ユーザーが購入をキャンセルした場合は静かに無視する
      if (e is PlatformException) {
        final errorCode = PurchasesErrorHelper.getErrorCode(e);
        if (errorCode == PurchasesErrorCode.purchaseCancelledError) return;
      }
      appLogger.w('購入失敗: $e', error: e, stackTrace: s);
      if (!mounted) return;
      final t = Translations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.support.purchaseError)),
      );
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  Future<void> _handleRestore() async {
    if (_isBusy) return;
    setState(() => _isBusy = true);

    try {
      await Purchases.restorePurchases();
      // 復元成功後に顧客情報を更新
      ref.invalidate(customerInfoProvider);
      if (!mounted) return;
      final t = Translations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.support.restoreSuccess)),
      );
    } catch (e, s) {
      appLogger.w('復元失敗: $e', error: e, stackTrace: s);
      if (!mounted) return;
      final t = Translations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.support.restoreError)),
      );
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }
}

// ─────────────────────────────────────────
// 背景コーヒーアイコン
// ─────────────────────────────────────────

/// 贈ったコーヒー数に応じてコーヒーアイコンを積み重ねる背景ウィジェット。
class _CoffeeBackground extends StatelessWidget {
  const _CoffeeBackground({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    if (count == 0) return const SizedBox.shrink();
    final displayCount = math.min(count, 150);

    return Opacity(
      opacity: 0.15,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.end,
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
            displayCount,
            (_) => const Icon(Icons.local_cafe, size: 48, color: Colors.brown),
          ),
        ),
      ),
    );
  }
}
