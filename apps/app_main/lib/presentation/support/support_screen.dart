import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

/// 選択されたパッケージ識別子からコーヒーカップ数を返す。
///
/// - `nantonack_coffee_100` → 1杯
/// - `nantonack_coffee_300` → 3杯
/// - それ以外               → 1杯（フォールバック）
int _coffeeCountForPackage(Package? package) {
  if (package == null) return 0;
  final id = package.storeProduct.identifier;
  if (id.contains('300')) return 3;
  return 1;
}

/// 応援画面（Buy Me a Coffee）。
///
/// ユーザーが開発者にコーヒーを贈ることができる画面。
/// RevenueCat のオファリングを表示し、消耗型課金（コーヒー1杯/3杯）を提供する。
/// 選択した商品に応じたLottieコーヒーアニメーションを横並びで表示する。
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

    // オファリングが初めて読み込まれたとき、1杯（100）パッケージをデフォルト選択する
    ref.listen(offeringsProvider, (_, next) {
      next.whenData((offering) {
        if (_selectedPackage != null || offering == null) return;
        final defaultPackage = offering.availablePackages
            .where((p) => p.storeProduct.identifier.contains('100'))
            .firstOrNull;
        if (defaultPackage != null) {
          setState(() => _selectedPackage = defaultPackage);
        }
      });
    });

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
                            ? t.support.totalCoffeesCount.replaceAll(
                                '{count}',
                                currentCount.toString(),
                              )
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
                    color: Theme.of(
                      context,
                    ).scaffoldBackgroundColor.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    t.support.description,
                    textAlign: TextAlign.center,
                  ),
                ),
                // コーヒーLottieアニメーション（選択中のプランに応じて表示数が変化）
                _CoffeeLottieRow(
                  count: _coffeeCountForPackage(_selectedPackage),
                ),
                const SizedBox(height: 8),
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
                          color: Theme.of(
                            context,
                          ).scaffoldBackgroundColor.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: RadioGroup<Package>(
                          groupValue: _selectedPackage,
                          onChanged: (val) =>
                              setState(() => _selectedPackage = val),
                          child: ListView(
                            children: (offering.availablePackages.toList()
                                  ..sort(
                                    (a, b) => a.storeProduct.identifier
                                        .compareTo(b.storeProduct.identifier),
                                  ))
                                .map((package) {
                              return RadioListTile<Package>(
                                title: Text(package.storeProduct.title),
                                subtitle: Text(
                                  package.storeProduct.priceString,
                                ),
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
                        t.support.fetchError.replaceAll(
                          '{error}',
                          err.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
                // 購入の復元ボタン
                TextButton(
                  onPressed: _isBusy ? null : _handleRestore,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).scaffoldBackgroundColor.withValues(alpha: 0.8),
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
            onPressed: (_selectedPackage == null || _isBusy)
                ? null
                : _handlePurchase,
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

// ─────────────────────────────────────────
// 選択プランのコーヒーLottieアニメーション行
// ─────────────────────────────────────────

/// 選択された商品に応じたコーヒーアニメーションを横並びで表示するウィジェット。
///
/// 単一の [AnimationController] を全カップで共有することで再生位置を同期する。
/// [count] が 0 の場合はプレースホルダーとして薄いアイコンを表示し、
/// ユーザーにプランを選ぶよう促す。
class _CoffeeLottieRow extends StatefulWidget {
  const _CoffeeLottieRow({required this.count});

  final int count;

  @override
  State<_CoffeeLottieRow> createState() => _CoffeeLottieRowState();
}

class _CoffeeLottieRowState extends State<_CoffeeLottieRow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const _lottieSize = 140.0;
  static const _placeholderSize = 80.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.count == 0) {
      // 未選択時：薄いプレースホルダー
      return SizedBox(
        height: _lottieSize,
        child: Center(
          child: Opacity(
            opacity: 0.25,
            child: Icon(
              Icons.local_cafe,
              size: _placeholderSize,
              color: Colors.brown,
            ),
          ),
        ),
      );
    }

    // Expanded で画面幅に収め、カップ間は 8px の gap を入れる
    final items = <Widget>[];
    for (var i = 0; i < widget.count; i++) {
      if (i > 0) items.add(const SizedBox(width: 8));
      items.add(
        Expanded(
          child: Lottie.asset(
            'assets/lottie/coffee.json',
            controller: _controller,
            onLoaded: (composition) {
              // 最初の1回だけ duration を設定してループ再生を開始する
              if (_controller.duration == null) {
                _controller
                  ..duration = composition.duration
                  ..repeat();
              }
            },
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: _lottieSize,
        child: Row(children: items),
      ),
    );
  }
}
