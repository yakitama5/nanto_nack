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

    return Scaffold(
      backgroundColor: const Color(0xFFFF3B3B),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _PaymentFAB(
        label: sq.common.payment,
        highlighted: widget.highlightPaymentButton,
        onTap: widget.onPaymentTap,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
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
                child: _selectedTab == 0
                    ? _HomeTabContent(
                        sq: sq,
                        pageController: _pageController,
                        currentPaymentMethod: widget.currentPaymentMethod,
                        highlightSendTile: widget.highlightSendTile,
                        highlightPaymentCarousel: widget.highlightPaymentCarousel,
                        onSendTap: widget.onSendTap,
                        onPaymentMethodChanged: widget.onPaymentMethodChanged,
                        balance: widget.balance,
                      )
                    : _DummyTabContent(tabIndex: _selectedTab, sq: sq),
              ),
            ],
          ),
          FloatingMissionBubble(
            remainingSeconds: widget.remainingSeconds,
            missionText: widget.missionText,
            hintUsed: false,
            timeLimitSeconds: widget.timeLimitSeconds,
            onGiveUp: widget.onGiveUp,
          ),
          ...widget.overlays,
        ],
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: highlighted
          ? BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withValues(alpha: 0.5),
                  blurRadius: 12,
                  spreadRadius: 4,
                ),
              ],
            )
          : null,
      child: FloatingActionButton(
        onPressed: onTap,
        backgroundColor: highlighted ? const Color(0xFFCC0000) : const Color(0xFFFF3B3B),
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
    final color = selected ? const Color(0xFFFF3B3B) : Colors.grey.shade500;

    return GestureDetector(
      onTap: onTap,
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
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top + 16,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      color: const Color(0xFFFF3B3B),
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
      return Text(
        '${sq.common.yen}$balance',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return Text(
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
    return Container(
      color: Colors.white,
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
    final methods = PaymentMethod.values;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: highlighted
            ? Border.all(color: const Color(0xFFFF3B3B), width: 2)
            : Border.all(color: Colors.grey.shade200),
        color: highlighted
            ? const Color(0xFFFFE5E5)
            : const Color(0xFFF8F8F8),
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
                        ? const Color(0xFFFF3B3B)
                        : Colors.grey.shade300,
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
    final isBalance = method == PaymentMethod.balance;
    final icon = isBalance ? Icons.account_balance_wallet : Icons.credit_card;
    final label = isBalance ? sq.common.balancePayment : sq.common.creditCard;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFF3B3B), size: 20),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UnreadableText(
                sq.common.paymentSource,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade500,
                ),
              ),
              UnreadableText(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const Spacer(),
          // ミニバーコード
          _MiniBarcodeWidget(),
        ],
      ),
    );
  }
}

/// ミニバーコード表示
class _MiniBarcodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 40,
      child: CustomPaint(
        painter: _MiniBarcodePainter(),
      ),
    );
  }
}

class _MiniBarcodePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
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
  bool shouldRepaint(_MiniBarcodePainter oldDelegate) => false;
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
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: highlighted
            ? BoxDecoration(
                color: const Color(0xFFFFE5E5),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFFF3B3B), width: 1.5),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: highlighted
                    ? const Color(0xFFFF3B3B)
                    : const Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: highlighted ? Colors.white : Colors.grey.shade600,
                size: 24,
              ),
            ),
            const SizedBox(height: 6),
            UnreadableText(
              label,
              style: TextStyle(
                fontSize: 12,
                color: highlighted
                    ? const Color(0xFFFF3B3B)
                    : Colors.grey.shade700,
                fontWeight: highlighted ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Row(
            children: [
              Icon(Icons.history, size: 16, color: Colors.grey.shade500),
              const SizedBox(width: 6),
              UnreadableText(
                sq.common.history,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
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
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFF5F5F5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  tx.isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                  size: 18,
                  color: tx.isIncome ? Colors.green : Colors.grey.shade600,
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
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                tx.isIncome
                    ? '+${sq.common.yen}${tx.amount}'
                    : '-${sq.common.yen}${tx.amount.abs()}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: tx.isIncome ? Colors.green : Colors.black87,
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

/// ダミータブコンテンツ（ホーム以外のタブ）
class _DummyTabContent extends StatelessWidget {
  const _DummyTabContent({required this.tabIndex, required this.sq});

  final int tabIndex;
  final $payment.Translations sq;

  @override
  Widget build(BuildContext context) {
    final (icon, label) = switch (tabIndex) {
      1 => (Icons.history, sq.common.history),
      2 => (Icons.stars, sq.common.point),
      3 => (Icons.person, sq.common.account),
      _ => (Icons.home, sq.common.home),
    };

    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: Colors.grey.shade300),
            const SizedBox(height: 12),
            UnreadableText(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
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

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const _MockBarcode(),
                    ),
                    const SizedBox(height: 20),
                    // QRコード
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const _MockQrCode(),
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
          FloatingMissionBubble(
            remainingSeconds: remainingSeconds,
            missionText: missionText,
            hintUsed: false,
            timeLimitSeconds: timeLimitSeconds,
            onGiveUp: onGiveUp,
          ),
          ...overlays,
        ],
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
    final isBalance = currentPaymentMethod == PaymentMethod.balance;
    final icon = isBalance ? Icons.account_balance_wallet : Icons.credit_card;
    final label = isBalance ? sq.common.balancePayment : sq.common.creditCard;

    final isDisabled = onChangePaymentMethod == null;
    return GestureDetector(
      onTap: isDisabled ? null : () => _showPaymentMethodSheet(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isDisabled
              ? const Color(0xFFEEEEEE)
              : highlighted
                  ? const Color(0xFFFFE5E5)
                  : const Color(0xFFF5F5F5),
          border: isDisabled
              ? Border.all(color: Colors.grey.shade300)
              : highlighted
                  ? Border.all(color: const Color(0xFFFF3B3B), width: 2)
                  : Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isDisabled ? Colors.grey : const Color(0xFFFF3B3B),
            ),
            const SizedBox(width: 8),
            UnreadableText(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isDisabled ? Colors.grey : Colors.black87,
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.expand_more,
              size: 18,
              color: isDisabled ? Colors.grey.shade400 : Colors.grey.shade500,
            ),
          ],
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
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
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
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFFF3B3B)
              : const Color(0xFFF5F5F5),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: selected ? Colors.white : Colors.grey.shade600,
          size: 20,
        ),
      ),
      title: UnreadableText(
        label,
        style: TextStyle(
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          color: selected ? const Color(0xFFFF3B3B) : Colors.black87,
        ),
      ),
      trailing: selected
          ? const Icon(Icons.check_circle, color: Color(0xFFFF3B3B))
          : null,
      onTap: onTap,
    );
  }
}

/// バーコードのモックウィジェット
class _MockBarcode extends StatelessWidget {
  const _MockBarcode();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BarcodePainter(),
    );
  }
}

class _BarcodePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
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
  bool shouldRepaint(_BarcodePainter oldDelegate) => false;
}

/// QRコードのモックウィジェット（格子パターン）
class _MockQrCode extends StatelessWidget {
  const _MockQrCode();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _QrPainter(),
    );
  }
}

class _QrPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
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
  bool shouldRepaint(_QrPainter oldDelegate) => false;
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

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final selected =
        contacts.where((c) => c.id == selectedContactId).firstOrNull;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                    return GestureDetector(
                      onTap: () => onContactSelect?.call(contact.id),
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
                                  ? const Color(0xFFFF3B3B)
                                  : const Color(0xFFF0F0F0),
                              border: isSelected
                                  ? Border.all(
                                      color: const Color(0xFFFF3B3B),
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
                                      : Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          UnreadableText(
                            _contactName(sq, index),
                            style: TextStyle(
                              fontSize: 11,
                              color: isSelected
                                  ? const Color(0xFFFF3B3B)
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ],
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
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          sq.common.yen,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: FilledButton(
                  onPressed: selected != null && amount > 0 ? onSend : null,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52),
                    backgroundColor: const Color(0xFFFF3B3B),
                  ),
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
            ],
          ),
          FloatingMissionBubble(
            remainingSeconds: remainingSeconds,
            missionText: missionText,
            hintUsed: false,
            timeLimitSeconds: timeLimitSeconds,
            onGiveUp: onGiveUp,
          ),
          ...overlays,
        ],
      ),
    );
  }

  static String _contactName($payment.Translations sq, int index) {
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: label.isEmpty ? Colors.transparent : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
