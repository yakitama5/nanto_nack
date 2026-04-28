import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/entities/payment_contact.dart';
import '../domain/entities/payment_transaction.dart';
import '../domain/payment_method.dart';
import '../i18n/payment_translations_extension.dart';
import '../../i18n/strings.g.dart' as $payment;

/// 決済アプリ風ホーム画面（PayPay風ボトムナビ付き）
class PaymentHomeScreen extends StatefulWidget {
  /// コンストラクタ
  const PaymentHomeScreen({
    super.key,
    required this.balance,
    required this.balanceHidden,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.overlays,
    required this.currentPaymentMethod,
    this.onPaymentTap,
    this.onBalanceVisibilityTap,
    this.onSendTap,
    this.onPaymentMethodChanged,
    this.highlightPaymentButton = false,
    this.highlightEyeIcon = false,
    this.highlightSendTile = false,
    this.highlightPaymentCarousel = false,
    this.hintUsed = false,
    this.onHintTap,
  });

  /// 残高
  final int balance;

  /// 残高が非表示か（true なら *** 表示）
  final bool balanceHidden;

  /// クイズステータス
  final QuizStatus quizStatus;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 制限時間（秒）
  final int timeLimitSeconds;

  /// ミッションテキスト
  final String missionText;

  /// ギブアップコールバック
  final VoidCallback onGiveUp;

  /// オーバーレイウィジェット
  final List<Widget> overlays;

  /// 現在の支払い元
  final PaymentMethod currentPaymentMethod;

  /// ボトムナビ中央ボタン（支払い）タップ
  final VoidCallback? onPaymentTap;

  /// 目アイコンタップ（残高表示切替）
  final VoidCallback? onBalanceVisibilityTap;

  /// 送金タイルタップ
  final VoidCallback? onSendTap;

  /// カルーセルスワイプで支払い元変更
  final void Function(PaymentMethod)? onPaymentMethodChanged;

  /// 支払いボタンをハイライト
  final bool highlightPaymentButton;

  /// 目アイコンをハイライト
  final bool highlightEyeIcon;

  /// 送金タイルをハイライト
  final bool highlightSendTile;

  /// 支払い元カルーセルをハイライト
  final bool highlightPaymentCarousel;

  /// ヒントを使用済みか
  final bool hintUsed;

  /// ヒントボタンタップコールバック
  final VoidCallback? onHintTap;

  @override
  State<PaymentHomeScreen> createState() => _PaymentHomeScreenState();
}

class _PaymentHomeScreenState extends State<PaymentHomeScreen> {
  int _selectedTab = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.currentPaymentMethod == PaymentMethod.balance ? 0 : 1,
    );
  }

  @override
  void didUpdateWidget(PaymentHomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPaymentMethod != widget.currentPaymentMethod) {
      final newPage = widget.currentPaymentMethod == PaymentMethod.balance ? 0 : 1;
      _pageController.animateToPage(
        newPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    final ext = Theme.of(context).extension<PaymentAppTheme>()!;

    return QuizExitScope(
      quizStatus: widget.quizStatus,
      child: Scaffold(
      backgroundColor: ext.brandColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _PaymentFAB(
        label: sq.common.payment,
        highlighted: widget.highlightPaymentButton,
        onTap: widget.onPaymentTap,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: ext.surfaceColor,
        elevation: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Icons.home,
                label: sq.common.home,
                selected: _selectedTab == 0,
                onTap: () => setState(() => _selectedTab = 0),
              ),
              _NavItem(
                icon: Icons.history,
                label: sq.common.history,
                selected: _selectedTab == 1,
                onTap: () => setState(() => _selectedTab = 1),
              ),
              const SizedBox(width: 56),
              _NavItem(
                icon: Icons.stars,
                label: sq.common.point,
                selected: _selectedTab == 2,
                onTap: () => setState(() => _selectedTab = 2),
              ),
              _NavItem(
                icon: Icons.person,
                label: sq.common.account,
                selected: _selectedTab == 3,
                onTap: () => setState(() => _selectedTab = 3),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              _PaymentHeader(
                sq: sq,
                balance: widget.balance,
                balanceHidden: widget.balanceHidden,
                highlightEyeIcon: widget.highlightEyeIcon,
                onBalanceVisibilityTap: widget.onBalanceVisibilityTap,
              ),
              Expanded(
                child: switch (_selectedTab) {
                  0 => _HomeTabContent(
                      sq: sq,
                      pageController: _pageController,
                      currentPaymentMethod: widget.currentPaymentMethod,
                      highlightSendTile: widget.highlightSendTile,
                      highlightPaymentCarousel: widget.highlightPaymentCarousel,
                      onSendTap: widget.onSendTap,
                      onPaymentMethodChanged: widget.onPaymentMethodChanged,
                      balance: widget.balance,
                    ),
                  1 => _HistoryTabContent(sq: sq),
                  2 => _PointTabContent(sq: sq),
                  3 => _AccountTabContent(sq: sq),
                  _ => _HomeTabContent(
                      sq: sq,
                      pageController: _pageController,
                      currentPaymentMethod: widget.currentPaymentMethod,
                      highlightSendTile: widget.highlightSendTile,
                      highlightPaymentCarousel: widget.highlightPaymentCarousel,
                      onSendTap: widget.onSendTap,
                      onPaymentMethodChanged: widget.onPaymentMethodChanged,
                      balance: widget.balance,
                    ),
                },
              ),
            ],
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
    ),
    );
  }
}

/// 支払いボタン（ボトムナビ中央突出）
class _PaymentFAB extends StatelessWidget {
  const _PaymentFAB({
    required this.label,
    required this.highlighted,
    this.onTap,
  });

  final String label;
  final bool highlighted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: highlighted
          ? BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: ext.brandColor.withValues(alpha: 0.5),
                  blurRadius: 12,
                  spreadRadius: 4,
                ),
              ],
            )
          : null,
      child: FloatingActionButton(
        onPressed: onTap,
        backgroundColor: highlighted ? ext.brandColorHighlight : ext.brandColor,
        elevation: highlighted ? 12 : 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.credit_card, color: Colors.white, size: 28),
      ),
    );
  }
}

/// ボトムナビのアイテム
class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    final color = selected ? ext.navSelectedColor : ext.navInactiveColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 60,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 22),
              const SizedBox(height: 2),
              UnreadableText(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: color,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ヘッダー（残高エリア）
class _PaymentHeader extends StatelessWidget {
  const _PaymentHeader({
    required this.sq,
    required this.balance,
    required this.balanceHidden,
    required this.highlightEyeIcon,
    this.onBalanceVisibilityTap,
  });

  final $payment.Translations sq;
  final int balance;
  final bool balanceHidden;
  final bool highlightEyeIcon;
  final VoidCallback? onBalanceVisibilityTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top + 16,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      color: ext.brandColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnreadableText(
            sq.common.appTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UnreadableText(
                      sq.common.balance,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _BalanceDisplay(
                      balance: balance,
                      balanceHidden: balanceHidden,
                      sq: sq,
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: highlightEyeIcon
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 2),
                        color: Colors.white.withValues(alpha: 0.2),
                      )
                    : null,
                child: IconButton(
                  icon: Icon(
                    balanceHidden ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                    size: 26,
                  ),
                  onPressed: onBalanceVisibilityTap,
                  tooltip: sq.common.balance,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 残高表示ウィジェット
class _BalanceDisplay extends StatelessWidget {
  const _BalanceDisplay({
    required this.balance,
    required this.balanceHidden,
    required this.sq,
  });

  final int balance;
  final bool balanceHidden;
  final $payment.Translations sq;

  @override
  Widget build(BuildContext context) {
    if (!balanceHidden) {
      return UnreadableText(
        '${sq.common.yen}$balance',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return UnreadableText(
      '*** ${sq.common.yen}',
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// ホームタブのコンテンツ
class _HomeTabContent extends StatelessWidget {
  const _HomeTabContent({
    required this.sq,
    required this.pageController,
    required this.currentPaymentMethod,
    required this.highlightSendTile,
    required this.highlightPaymentCarousel,
    required this.balance,
    this.onSendTap,
    this.onPaymentMethodChanged,
  });

  final $payment.Translations sq;
  final PageController pageController;
  final PaymentMethod currentPaymentMethod;
  final bool highlightSendTile;
  final bool highlightPaymentCarousel;
  final int balance;
  final VoidCallback? onSendTap;
  final void Function(PaymentMethod)? onPaymentMethodChanged;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Container(
      color: ext.surfaceColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 支払い元カルーセル
            _PaymentMethodCarousel(
              sq: sq,
              pageController: pageController,
              currentPaymentMethod: currentPaymentMethod,
              highlighted: highlightPaymentCarousel,
              onPaymentMethodChanged: onPaymentMethodChanged,
              balance: balance,
            ),
            // 機能タイル
            _ActionTileRow(
              sq: sq,
              highlightSendTile: highlightSendTile,
              onSendTap: onSendTap,
            ),
            // ダミー取引履歴
            _DummyTransactionList(sq: sq),
          ],
        ),
      ),
    );
  }
}

/// 支払い元カルーセル
class _PaymentMethodCarousel extends StatelessWidget {
  const _PaymentMethodCarousel({
    required this.sq,
    required this.pageController,
    required this.currentPaymentMethod,
    required this.highlighted,
    required this.balance,
    this.onPaymentMethodChanged,
  });

  final $payment.Translations sq;
  final PageController pageController;
  final PaymentMethod currentPaymentMethod;
  final bool highlighted;
  final int balance;
  final void Function(PaymentMethod)? onPaymentMethodChanged;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    final methods = PaymentMethod.values;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: highlighted
            ? Border.all(color: ext.brandColor, width: 2)
            : Border.all(color: ext.borderColor),
        color: highlighted ? ext.carouselHighlightBg : ext.carouselBackground,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: PageView.builder(
              controller: pageController,
              itemCount: methods.length,
              onPageChanged: (index) {
                onPaymentMethodChanged?.call(methods[index]);
              },
              itemBuilder: (context, index) {
                return _PaymentMethodCard(
                  sq: sq,
                  method: methods[index],
                  balance: balance,
                );
              },
            ),
          ),
          // ドットインジケータ
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: methods.map((m) {
                final isSelected = m == currentPaymentMethod;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: isSelected ? 16 : 6,
                  height: 6,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: isSelected
                        ? ext.brandColor
                        : ext.dotInactiveColor,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// 支払い元カード（カルーセルの1ページ）
class _PaymentMethodCard extends StatelessWidget {
  const _PaymentMethodCard({
    required this.sq,
    required this.method,
    required this.balance,
  });

  final $payment.Translations sq;
  final PaymentMethod method;
  final int balance;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    final isBalance = method == PaymentMethod.balance;
    final icon = isBalance ? Icons.account_balance_wallet : Icons.credit_card;
    final label = isBalance ? sq.common.balancePayment : sq.common.creditCard;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: ext.brandColor, size: 20),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UnreadableText(
                sq.common.paymentSource,
                style: TextStyle(
                  fontSize: 11,
                  color: ext.subTextColor,
                ),
              ),
              UnreadableText(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ext.primaryTextColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          // ミニバーコード
          _MiniBarcodeWidget(barcodeColor: ext.barcodeColor),
        ],
      ),
    );
  }
}

/// ミニバーコード表示
class _MiniBarcodeWidget extends StatelessWidget {
  const _MiniBarcodeWidget({required this.barcodeColor});

  final Color barcodeColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 40,
      child: CustomPaint(
        painter: _MiniBarcodePainter(barcodeColor: barcodeColor),
      ),
    );
  }
}

class _MiniBarcodePainter extends CustomPainter {
  const _MiniBarcodePainter({required this.barcodeColor});

  final Color barcodeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = barcodeColor
      ..style = PaintingStyle.fill;

    final widths = [2.0, 1.0, 3.0, 1.0, 2.0, 1.0, 4.0, 1.0, 2.0, 1.0, 3.0, 1.0, 2.0, 1.0, 4.0, 1.0, 2.0, 1.0];
    final totalWidth = widths.fold(0.0, (a, b) => a + b);
    final scale = size.width / totalWidth;

    var x = 0.0;
    for (var i = 0; i < widths.length; i++) {
      if (i.isEven) {
        canvas.drawRect(
          Rect.fromLTWH(x, 0, widths[i] * scale, size.height),
          paint,
        );
      }
      x += widths[i] * scale;
    }
  }

  @override
  bool shouldRepaint(_MiniBarcodePainter oldDelegate) =>
      oldDelegate.barcodeColor != barcodeColor;
}

/// 機能タイル行
class _ActionTileRow extends StatelessWidget {
  const _ActionTileRow({
    required this.sq,
    required this.highlightSendTile,
    this.onSendTap,
  });

  final $payment.Translations sq;
  final bool highlightSendTile;
  final VoidCallback? onSendTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ActionTile(
            icon: Icons.qr_code_scanner,
            label: sq.common.scan,
            highlighted: false,
          ),
          _ActionTile(
            icon: Icons.send,
            label: sq.common.send,
            highlighted: highlightSendTile,
            onTap: onSendTap,
          ),
          _ActionTile(
            icon: Icons.add,
            label: sq.common.topUp,
            highlighted: false,
          ),
          _ActionTile(
            icon: Icons.more_horiz,
            label: sq.common.more,
            highlighted: false,
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.label,
    required this.highlighted,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool highlighted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          decoration: highlighted
              ? BoxDecoration(
                  color: ext.actionTileHighlightBg,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ext.brandColor, width: 1.5),
                )
              : const BoxDecoration(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: highlighted
                        ? ext.brandColor
                        : ext.actionTileBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: highlighted ? Colors.white : ext.secondaryTextColor,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 6),
                UnreadableText(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: highlighted
                        ? ext.brandColor
                        : ext.secondaryTextColor,
                    fontWeight:
                        highlighted ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ダミー取引履歴リスト
class _DummyTransactionList extends StatelessWidget {
  const _DummyTransactionList({required this.sq});

  final $payment.Translations sq;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Row(
            children: [
              Icon(Icons.history, size: 16, color: ext.subTextColor),
              const SizedBox(width: 6),
              UnreadableText(
                sq.common.history,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: ext.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, indent: 20),
        ..._txData(sq).map((tx) => _TransactionItem(tx: tx, sq: sq)),
      ],
    );
  }

  static List<PaymentTransaction> _txData($payment.Translations sq) => [
        PaymentTransaction(
          id: 'tx_1',
          title: sq.common.txTitle1,
          amount: -580,
          dateLabel: sq.common.txDate1,
          isIncome: false,
        ),
        PaymentTransaction(
          id: 'tx_2',
          title: sq.common.txTitle2,
          amount: -1200,
          dateLabel: sq.common.txDate2,
          isIncome: false,
        ),
        PaymentTransaction(
          id: 'tx_3',
          title: sq.common.txTitle3,
          amount: 3000,
          dateLabel: sq.common.txDate3,
          isIncome: true,
        ),
        PaymentTransaction(
          id: 'tx_4',
          title: sq.common.txTitle4,
          amount: -2800,
          dateLabel: sq.common.txDate4,
          isIncome: false,
        ),
        PaymentTransaction(
          id: 'tx_5',
          title: sq.common.txTitle5,
          amount: -240,
          dateLabel: sq.common.txDate5,
          isIncome: false,
        ),
      ];
}

class _TransactionItem extends StatelessWidget {
  const _TransactionItem({required this.tx, required this.sq});

  final PaymentTransaction tx;
  final $payment.Translations sq;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: tx.isIncome
                      ? ext.incomeBackground
                      : ext.outcomeBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  tx.isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                  size: 18,
                  color: tx.isIncome ? ext.incomeColor : ext.outcomeIconColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UnreadableText(
                      tx.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    UnreadableText(
                      tx.dateLabel,
                      style: TextStyle(
                        fontSize: 12,
                        color: ext.subTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              UnreadableText(
                tx.isIncome
                    ? '+${sq.common.yen}${tx.amount}'
                    : '-${sq.common.yen}${tx.amount.abs()}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: tx.isIncome ? ext.incomeColor : ext.outcomeTextColor,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, indent: 20),
      ],
    );
  }
}

/// 履歴タブのコンテンツ
class _HistoryTabContent extends StatelessWidget {
  const _HistoryTabContent({required this.sq});

  final $payment.Translations sq;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Container(
      color: ext.surfaceColor,
      child: Column(
        children: [
          // フィルタータブ
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                _FilterChip(label: sq.common.txFilterAll, isSelected: true),
                const SizedBox(width: 8),
                _FilterChip(label: sq.common.txFilterOut, isSelected: false),
                const SizedBox(width: 8),
                _FilterChip(label: sq.common.txFilterIn, isSelected: false),
              ],
            ),
          ),
          const Divider(height: 1),
          // 月ヘッダー
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            child: UnreadableText(
              sq.common.txMonthLabel,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: ext.secondaryTextColor,
              ),
            ),
          ),
          // 取引リスト
          Expanded(
            child: ListView(
              children: _DummyTransactionList._txData(sq)
                  .map((tx) => _TransactionItem(tx: tx, sq: sq))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? ext.brandColor : ext.filterChipInactiveBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: UnreadableText(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isSelected ? ext.filterChipActiveText : ext.filterChipInactiveText,
        ),
      ),
    );
  }
}

/// ポイントタブのコンテンツ
class _PointTabContent extends StatelessWidget {
  const _PointTabContent({required this.sq});

  final $payment.Translations sq;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Container(
      color: ext.scaffoldBackground,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ポイント残高カード（グラジェントはブランド赤系で固定・白前景はそのまま）
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ext.brandColor, const Color(0xFFFF6B6B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UnreadableText(
                    sq.common.pointBalance,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      UnreadableText(
                        sq.common.mockPointsBalance,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: UnreadableText(
                          sq.common.pointUnit,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 12,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 4),
                      UnreadableText(
                        sq.common.pointExpiry,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      UnreadableText(
                        sq.common.expiryDate,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // ポイント獲得方法
            Container(
              color: ext.surfaceColor,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UnreadableText(
                    sq.common.earnPoints,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _PointEarnItem(
                        icon: Icons.shopping_bag_outlined,
                        label: sq.common.shopService,
                        color: ext.brandColor,
                      ),
                      _PointEarnItem(
                        icon: Icons.assignment_outlined,
                        label: sq.common.missionService,
                        color: ext.serviceIconOrangeColor,
                      ),
                      _PointEarnItem(
                        icon: Icons.campaign_outlined,
                        label: sq.common.campaignService,
                        color: ext.serviceIconPurpleColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // ポイント履歴
            Container(
              color: ext.surfaceColor,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UnreadableText(
                    sq.common.pointHistory,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _PointHistoryItem(
                    item: sq.common.pointItem1,
                    gained: sq.common.pointGained1,
                    date: sq.common.pointDate1,
                  ),
                  const Divider(height: 1),
                  _PointHistoryItem(
                    item: sq.common.pointItem2,
                    gained: sq.common.pointGained2,
                    date: sq.common.pointDate2,
                  ),
                  const Divider(height: 1),
                  _PointHistoryItem(
                    item: sq.common.pointItem3,
                    gained: sq.common.pointGained3,
                    date: sq.common.pointDate3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PointEarnItem extends StatelessWidget {
  const _PointEarnItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 6),
        UnreadableText(
          label,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}

class _PointHistoryItem extends StatelessWidget {
  const _PointHistoryItem({
    required this.item,
    required this.gained,
    required this.date,
  });

  final String item;
  final String gained;
  final String date;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UnreadableText(
                  item,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 2),
                UnreadableText(
                  date,
                  style: TextStyle(fontSize: 12, color: ext.subTextColor),
                ),
              ],
            ),
          ),
          UnreadableText(
            gained,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: ext.pointHistoryColor,
            ),
          ),
        ],
      ),
    );
  }
}

/// アカウントタブのコンテンツ
class _AccountTabContent extends StatelessWidget {
  const _AccountTabContent({required this.sq});

  final $payment.Translations sq;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Container(
      color: ext.scaffoldBackground,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // プロフィールセクション
            Container(
              color: ext.surfaceColor,
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: ext.brandColor,
                    child: const Icon(Icons.person, size: 36, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UnreadableText(
                          sq.common.myAccount,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            UnreadableText(
                              sq.common.userId,
                              style: TextStyle(
                                fontSize: 12,
                                color: ext.subTextColor,
                              ),
                            ),
                            const SizedBox(width: 4),
                            UnreadableText(
                              sq.common.userIdValue,
                              style: TextStyle(
                                fontSize: 12,
                                color: ext.subTextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: ext.subTextColor),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // 支払い方法セクション
            _AccountSection(
              items: [
                _AccountMenuItem(
                  icon: Icons.credit_card,
                  iconColor: ext.accountMenuIconBlueColor,
                  label: sq.common.paymentMethods,
                  subtitle: sq.common.addedCard,
                ),
                _AccountMenuItem(
                  icon: Icons.account_balance,
                  iconColor: ext.accountMenuIconTealColor,
                  label: sq.common.bankAccount,
                ),
              ],
            ),
            const SizedBox(height: 8),
            // 設定セクション
            _AccountSection(
              items: [
                _AccountMenuItem(
                  icon: Icons.security,
                  iconColor: ext.accountMenuIconRedColor,
                  label: sq.common.securitySettings,
                ),
                _AccountMenuItem(
                  icon: Icons.notifications_outlined,
                  iconColor: ext.serviceIconOrangeColor,
                  label: sq.common.notificationSettings,
                ),
                _AccountMenuItem(
                  icon: Icons.settings_outlined,
                  iconColor: ext.subTextColor,
                  label: sq.common.appSettings,
                ),
              ],
            ),
            const SizedBox(height: 8),
            // ヘルプ・ログアウトセクション
            _AccountSection(
              items: [
                _AccountMenuItem(
                  icon: Icons.help_outline,
                  iconColor: ext.accountMenuIconBlueColor,
                  label: sq.common.helpCenter,
                ),
                _AccountMenuItem(
                  icon: Icons.logout,
                  iconColor: ext.accountMenuIconRedColor,
                  label: sq.common.logOut,
                  isDestructive: true,
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _AccountSection extends StatelessWidget {
  const _AccountSection({required this.items});

  final List<_AccountMenuItem> items;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Container(
      color: ext.surfaceColor,
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0) const Divider(height: 1, indent: 56),
            items[i],
          ],
        ],
      ),
    );
  }
}

class _AccountMenuItem extends StatelessWidget {
  const _AccountMenuItem({
    required this.icon,
    required this.iconColor,
    required this.label,
    this.subtitle,
    this.isDestructive = false,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String? subtitle;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UnreadableText(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDestructive
                        ? ext.accountMenuIconRedColor
                        : ext.primaryTextColor,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  UnreadableText(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 12,
                      color: ext.subTextColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (!isDestructive)
            Icon(Icons.chevron_right, color: ext.subTextColor, size: 18),
        ],
      ),
    );
  }
}

/// 支払い画面（バーコード + QRコード表示）
class PaymentScreen extends StatelessWidget {
  /// コンストラクタ
  const PaymentScreen({
    super.key,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.overlays,
    required this.currentPaymentMethod,
    this.onBack,
    this.onChangePaymentMethod,
    this.highlightPaymentMethodButton = false,
    this.hintUsed = false,
    this.onHintTap,
  });

  /// クイズステータス
  final QuizStatus quizStatus;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 制限時間（秒）
  final int timeLimitSeconds;

  /// ミッションテキスト
  final String missionText;

  /// ギブアップコールバック
  final VoidCallback onGiveUp;

  /// オーバーレイウィジェット
  final List<Widget> overlays;

  /// 現在の支払い元
  final PaymentMethod currentPaymentMethod;

  /// 戻るコールバック
  final VoidCallback? onBack;

  /// 支払い元変更コールバック
  final void Function(PaymentMethod)? onChangePaymentMethod;

  /// 支払い元ボタンをハイライト
  final bool highlightPaymentMethodButton;

  /// ヒントを使用済みか
  final bool hintUsed;

  /// ヒントボタンタップコールバック
  final VoidCallback? onHintTap;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        onBack?.call();
      },
      child: Scaffold(
      backgroundColor: ext.surfaceColor,
      appBar: AppBar(
        backgroundColor: ext.surfaceColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: onBack,
        ),
        title: UnreadableText(
          sq.common.payment,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // バーコード
                    Container(
                      width: 240,
                      height: 72,
                      decoration: BoxDecoration(
                        border: Border.all(color: ext.borderColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: _MockBarcode(barcodeColor: ext.barcodeColor),
                    ),
                    const SizedBox(height: 20),
                    // QRコード
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: ext.primaryTextColor, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _MockQrCode(barcodeColor: ext.barcodeColor),
                    ),
                    const SizedBox(height: 28),
                    // 支払い元変更ボタン
                    _PaymentMethodButton(
                      sq: sq,
                      currentPaymentMethod: currentPaymentMethod,
                      highlighted: highlightPaymentMethodButton,
                      onChangePaymentMethod: onChangePaymentMethod,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (quizStatus == QuizStatus.playing)
            FloatingMissionBubble(
              remainingSeconds: remainingSeconds,
              missionText: missionText,
              hintUsed: hintUsed,
              timeLimitSeconds: timeLimitSeconds,
              onHintTap: onHintTap,
              onGiveUp: onGiveUp,
            ),
          ...overlays,
        ],
      ),
      ),
    );
  }
}

/// 支払い元ボタン（タップでボトムシート表示）
class _PaymentMethodButton extends StatelessWidget {
  const _PaymentMethodButton({
    required this.sq,
    required this.currentPaymentMethod,
    required this.highlighted,
    this.onChangePaymentMethod,
  });

  final $payment.Translations sq;
  final PaymentMethod currentPaymentMethod;
  final bool highlighted;
  final void Function(PaymentMethod)? onChangePaymentMethod;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    final isBalance = currentPaymentMethod == PaymentMethod.balance;
    final icon = isBalance ? Icons.account_balance_wallet : Icons.credit_card;
    final label = isBalance ? sq.common.balancePayment : sq.common.creditCard;

    final isDisabled = onChangePaymentMethod == null;
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : () => _showPaymentMethodSheet(context),
          borderRadius: BorderRadius.circular(24),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: isDisabled
                  ? ext.actionTileBackground
                  : highlighted
                      ? ext.actionTileHighlightBg
                      : ext.actionTileBackground,
              border: isDisabled
                  ? Border.all(color: ext.borderColor)
                  : highlighted
                      ? Border.all(color: ext.brandColor, width: 2)
                      : Border.all(color: ext.borderColor),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: isDisabled ? ext.subTextColor : ext.brandColor,
                  ),
                  const SizedBox(width: 8),
                  UnreadableText(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDisabled ? ext.subTextColor : ext.primaryTextColor,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    Icons.expand_more,
                    size: 18,
                    color: isDisabled ? ext.navInactiveColor : ext.subTextColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showPaymentMethodSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetContext) {
        final ext = Theme.of(sheetContext).extension<PaymentAppTheme>()!;
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: ext.borderColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              UnreadableText(
                sq.common.paymentSource,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(height: 24),
              _PaymentMethodOption(
                icon: Icons.account_balance_wallet,
                label: sq.common.balancePayment,
                selected: currentPaymentMethod == PaymentMethod.balance,
                onTap: () {
                  Navigator.pop(sheetContext);
                  onChangePaymentMethod?.call(PaymentMethod.balance);
                },
              ),
              _PaymentMethodOption(
                icon: Icons.credit_card,
                label: sq.common.creditCard,
                selected: currentPaymentMethod == PaymentMethod.creditCard,
                onTap: () {
                  Navigator.pop(sheetContext);
                  onChangePaymentMethod?.call(PaymentMethod.creditCard);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

/// 支払い方法の選択肢
class _PaymentMethodOption extends StatelessWidget {
  const _PaymentMethodOption({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: selected ? ext.brandColor : ext.actionTileBackground,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: selected ? Colors.white : ext.secondaryTextColor,
          size: 20,
        ),
      ),
      title: UnreadableText(
        label,
        style: TextStyle(
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          color: selected ? ext.brandColor : ext.primaryTextColor,
        ),
      ),
      trailing: selected
          ? Icon(Icons.check_circle, color: ext.brandColor)
          : null,
      onTap: onTap,
    );
  }
}

/// バーコードのモックウィジェット
class _MockBarcode extends StatelessWidget {
  const _MockBarcode({required this.barcodeColor});

  final Color barcodeColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BarcodePainter(barcodeColor: barcodeColor),
    );
  }
}

class _BarcodePainter extends CustomPainter {
  const _BarcodePainter({required this.barcodeColor});

  final Color barcodeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = barcodeColor
      ..style = PaintingStyle.fill;

    final widths = [
      3.0, 1.0, 3.0, 2.0, 1.0, 4.0, 1.0, 2.0, 3.0, 1.0,
      1.0, 3.0, 2.0, 1.0, 4.0, 2.0, 1.0, 3.0, 1.0, 2.0,
      3.0, 1.0, 2.0, 4.0, 1.0, 1.0, 3.0, 2.0, 1.0, 3.0,
    ];
    final totalWidth = widths.fold(0.0, (a, b) => a + b);
    final scale = size.width / totalWidth;

    var x = 0.0;
    for (var i = 0; i < widths.length; i++) {
      if (i.isEven) {
        canvas.drawRect(
          Rect.fromLTWH(x, 0, widths[i] * scale, size.height),
          paint,
        );
      }
      x += widths[i] * scale;
    }
  }

  @override
  bool shouldRepaint(_BarcodePainter oldDelegate) =>
      oldDelegate.barcodeColor != barcodeColor;
}

/// QRコードのモックウィジェット（格子パターン）
class _MockQrCode extends StatelessWidget {
  const _MockQrCode({required this.barcodeColor});

  final Color barcodeColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _QrPainter(barcodeColor: barcodeColor),
    );
  }
}

class _QrPainter extends CustomPainter {
  const _QrPainter({required this.barcodeColor});

  final Color barcodeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = barcodeColor
      ..style = PaintingStyle.fill;

    final cellSize = size.width / 10;

    const pattern = [
      [1, 1, 1, 1, 1, 1, 1, 0, 1, 0],
      [1, 0, 0, 0, 0, 0, 1, 0, 1, 1],
      [1, 0, 1, 1, 1, 0, 1, 0, 0, 1],
      [1, 0, 1, 1, 1, 0, 1, 0, 1, 0],
      [1, 0, 1, 1, 1, 0, 1, 0, 0, 1],
      [1, 0, 0, 0, 0, 0, 1, 0, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 0, 1, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 1, 1],
      [1, 0, 1, 1, 0, 1, 1, 0, 0, 1],
      [0, 1, 1, 0, 1, 0, 1, 0, 1, 0],
    ];

    for (var row = 0; row < pattern.length; row++) {
      for (var col = 0; col < pattern[row].length; col++) {
        if (pattern[row][col] == 1) {
          canvas.drawRect(
            Rect.fromLTWH(
              col * cellSize,
              row * cellSize,
              cellSize,
              cellSize,
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(_QrPainter oldDelegate) =>
      oldDelegate.barcodeColor != barcodeColor;
}

/// 送金画面
class SendMoneyScreen extends StatelessWidget {
  /// コンストラクタ
  const SendMoneyScreen({
    super.key,
    required this.contacts,
    required this.selectedContactId,
    required this.amount,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.overlays,
    this.onContactSelect,
    this.onAmountKey,
    this.onSend,
    this.onBack,
    this.hintUsed = false,
    this.onHintTap,
  });

  final List<PaymentContact> contacts;
  final String? selectedContactId;
  final int amount;
  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;
  final List<Widget> overlays;

  final void Function(String contactId)? onContactSelect;
  final void Function(String key)? onAmountKey;
  final VoidCallback? onSend;
  final VoidCallback? onBack;

  /// ヒントを使用済みか
  final bool hintUsed;

  /// ヒントボタンタップコールバック
  final VoidCallback? onHintTap;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    final selected =
        contacts.where((c) => c.id == selectedContactId).firstOrNull;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        onBack?.call();
      },
      child: Scaffold(
      backgroundColor: ext.surfaceColor,
      appBar: AppBar(
        backgroundColor: ext.surfaceColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
        title: UnreadableText(
          sq.common.send,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // コンタクト選択
              SizedBox(
                height: 100,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: contacts.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    final isSelected = contact.id == selectedContactId;
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => onContactSelect?.call(contact.id),
                        borderRadius: BorderRadius.circular(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? ext.brandColor
                                    : ext.actionTileBackground,
                                border: isSelected
                                    ? Border.all(
                                        color: ext.brandColor,
                                        width: 3,
                                      )
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  contact.initial,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : ext.secondaryTextColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            UnreadableText(
                              _sendMoneyContactName(sq, index),
                              style: TextStyle(
                                fontSize: 11,
                                color: isSelected
                                    ? ext.brandColor
                                    : ext.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              // 金額表示
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    UnreadableText(
                      sq.common.amount,
                      style: TextStyle(
                        fontSize: 13,
                        color: ext.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        UnreadableText(
                          sq.common.yen,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        UnreadableText(
                          amount.toString(),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // テンキー
              Expanded(
                child: _NumPad(onKey: onAmountKey),
              ),
              // 送金ボタン
              SafeArea(
                top: false,
                child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: FilledButton(
                  onPressed: selected != null && amount > 0 && onSend != null
                      ? () => _showSendConfirmSheet(
                            context,
                            sq,
                            selected,
                            contacts,
                            amount,
                            onSend,
                          )
                      : null,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52),
                    backgroundColor: ext.brandColor,
                  ),
                  child: Semantics(
                    label: sq.common.sendMoney,
                    child: UnreadableText(
                      sq.common.sendMoney,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              ),
            ],
          ),
          if (quizStatus == QuizStatus.playing)
            FloatingMissionBubble(
              remainingSeconds: remainingSeconds,
              missionText: missionText,
              hintUsed: hintUsed,
              timeLimitSeconds: timeLimitSeconds,
              onHintTap: onHintTap,
              onGiveUp: onGiveUp,
            ),
          ...overlays,
        ],
      ),
      ),
    );
  }

}

/// 送金確認ボトムシートを表示する
void _showSendConfirmSheet(
  BuildContext context,
  $payment.Translations sq,
  PaymentContact? contact,
  List<PaymentContact> contacts,
  int amount,
  VoidCallback? onConfirm,
) {
  if (contact == null) return;
  final contactIndex = contacts.indexWhere((c) => c.id == contact.id);
  final contactName = _sendMoneyContactName(sq, contactIndex);

  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) => _SendConfirmSheet(
      sq: sq,
      contact: contact,
      contactName: contactName,
      amount: amount,
      onConfirm: () {
        Navigator.of(ctx).pop();
        onConfirm?.call();
      },
      onCancel: () => Navigator.of(ctx).pop(),
    ),
  );
}

/// 送金画面のコンタクト名を返す
String _sendMoneyContactName($payment.Translations sq, int index) {
  if (index < 0) return sq.common.contact1;
  switch (index) {
    case 0:
      return sq.common.contact1;
    case 1:
      return sq.common.contact2;
    case 2:
      return sq.common.contact3;
    default:
      return sq.common.contact4;
  }
}

/// 送金確認ボトムシート
class _SendConfirmSheet extends StatelessWidget {
  const _SendConfirmSheet({
    required this.sq,
    required this.contact,
    required this.contactName,
    required this.amount,
    required this.onConfirm,
    required this.onCancel,
  });

  final $payment.Translations sq;
  final PaymentContact contact;
  final String contactName;
  final int amount;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          24,
          16,
          24,
          24 + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ドラッグハンドル
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: ext.borderColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            // タイトル
            UnreadableText(
              sq.common.confirm,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            // 送金先
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UnreadableText(
                  sq.common.sendTo,
                  style: TextStyle(fontSize: 14, color: ext.secondaryTextColor),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: ext.actionTileBackground,
                      child: Text(
                        contact.initial,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    UnreadableText(
                      contactName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // 金額
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UnreadableText(
                  sq.common.amount,
                  style: TextStyle(fontSize: 14, color: ext.secondaryTextColor),
                ),
                UnreadableText(
                  '${sq.common.yen}$amount',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 32),
            // 送金するボタン
            FilledButton(
              onPressed: onConfirm,
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
                backgroundColor: ext.brandColor,
              ),
              child: Semantics(
                label: sq.common.sendMoney,
                child: UnreadableText(
                  sq.common.sendMoney,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // キャンセル
            TextButton(
              onPressed: onCancel,
              child: Semantics(
                label: sq.common.cancel,
                child: UnreadableText(
                  sq.common.cancel,
                  style: TextStyle(fontSize: 15, color: ext.secondaryTextColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// テンキー
class _NumPad extends StatelessWidget {
  const _NumPad({this.onKey});

  final void Function(String)? onKey;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 2.0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        for (final key in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '',
            '0', '⌫'])
          _NumKey(label: key, onTap: key.isEmpty ? null : () => onKey?.call(key)),
      ],
    );
  }
}

class _NumKey extends StatelessWidget {
  const _NumKey({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<PaymentAppTheme>()!;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        color: label.isEmpty ? Colors.transparent : ext.actionTileBackground,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: UnreadableText(
              label,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}