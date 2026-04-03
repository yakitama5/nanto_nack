import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/entities/payment_contact.dart';
import '../domain/entities/payment_transaction.dart';
import '../i18n/payment_translations_extension.dart';
import '../../i18n/strings.g.dart' as $payment;

/// 決済アプリ風ホーム画面
class PaymentHomeScreen extends StatelessWidget {
  /// コンストラクタ
  const PaymentHomeScreen({
    super.key,
    required this.balance,
    required this.balanceRevealed,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.overlays,
    this.onQrTap,
    this.onBalanceTap,
    this.onSendTap,
    this.onHistoryTap,
    this.highlightQrButton = false,
    this.highlightBalance = false,
    this.highlightSendButton = false,
    this.highlightHistoryTab = false,
  });

  final int balance;
  final bool balanceRevealed;
  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;
  final List<Widget> overlays;

  final VoidCallback? onQrTap;
  final VoidCallback? onBalanceTap;
  final VoidCallback? onSendTap;
  final VoidCallback? onHistoryTap;

  final bool highlightQrButton;
  final bool highlightBalance;
  final bool highlightSendButton;
  final bool highlightHistoryTab;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return Scaffold(
      backgroundColor: const Color(0xFFFF3B3B),
      body: Stack(
        children: [
          Column(
            children: [
              // ヘッダー（赤い背景）
              _PaymentHeader(
                sq: sq,
                balance: balance,
                balanceRevealed: balanceRevealed,
                highlightBalance: highlightBalance,
                highlightQrButton: highlightQrButton,
                onQrTap: onQrTap,
                onBalanceTap: onBalanceTap,
              ),
              // アクションボタン行
              _ActionRow(
                sq: sq,
                highlightSendButton: highlightSendButton,
                onSendTap: onSendTap,
              ),
              // 取引履歴セクション
              Expanded(
                child: _HistorySection(
                  sq: sq,
                  highlightHistoryTab: highlightHistoryTab,
                  onHistoryTap: onHistoryTap,
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
}

class _PaymentHeader extends StatelessWidget {
  const _PaymentHeader({
    required this.sq,
    required this.balance,
    required this.balanceRevealed,
    required this.highlightBalance,
    required this.highlightQrButton,
    this.onQrTap,
    this.onBalanceTap,
  });

  final $payment.Translations sq;
  final int balance;
  final bool balanceRevealed;
  final bool highlightBalance;
  final bool highlightQrButton;
  final VoidCallback? onQrTap;
  final VoidCallback? onBalanceTap;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UnreadableText(
                sq.common.appTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: highlightQrButton
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 2),
                        color: Colors.white.withValues(alpha: 0.2),
                      )
                    : null,
                child: IconButton(
                  icon: const Icon(Icons.qr_code, color: Colors.white, size: 28),
                  onPressed: onQrTap,
                  tooltip: sq.common.qrCode,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: onBalanceTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: highlightBalance
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.white.withValues(alpha: 0.8), width: 2),
                      color: Colors.white.withValues(alpha: 0.15),
                    )
                  : null,
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
                    revealed: balanceRevealed,
                    sq: sq,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BalanceDisplay extends StatelessWidget {
  const _BalanceDisplay({
    required this.balance,
    required this.revealed,
    required this.sq,
  });

  final int balance;
  final bool revealed;
  final $payment.Translations sq;

  @override
  Widget build(BuildContext context) {
    final balanceText = '${sq.common.yen}$balance';

    if (revealed) {
      return Text(
        balanceText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return Stack(
      children: [
        Text(
          balanceText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        Positioned.fill(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: UnreadableText(
              sq.common.tapToReveal,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.sq,
    required this.highlightSendButton,
    this.onSendTap,
  });

  final $payment.Translations sq;
  final bool highlightSendButton;
  final VoidCallback? onSendTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ActionButton(
            icon: Icons.arrow_upward,
            label: sq.common.send,
            highlighted: highlightSendButton,
            onTap: onSendTap,
          ),
          _ActionButton(
            icon: Icons.arrow_downward,
            label: sq.common.receive,
            highlighted: false,
          ),
          _ActionButton(
            icon: Icons.add,
            label: sq.common.topUp,
            highlighted: false,
          ),
          _ActionButton(
            icon: Icons.stars,
            label: sq.common.point,
            highlighted: false,
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
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
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: highlighted
                    ? const Color(0xFFFF3B3B)
                    : const Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: highlighted ? Colors.white : Colors.grey.shade600,
                size: 22,
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
                fontWeight:
                    highlighted ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistorySection extends StatelessWidget {
  const _HistorySection({
    required this.sq,
    required this.highlightHistoryTab,
    this.onHistoryTap,
  });

  final $payment.Translations sq;
  final bool highlightHistoryTab;
  final VoidCallback? onHistoryTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // 「履歴」ヘッダー
          GestureDetector(
            onTap: onHistoryTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: highlightHistoryTab
                  ? BoxDecoration(
                      color: const Color(0xFFFFE5E5),
                      border: Border(
                        bottom: BorderSide(
                          color: const Color(0xFFFF3B3B),
                          width: 2,
                        ),
                      ),
                    )
                  : const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFEEEEEE)),
                      ),
                    ),
              child: Row(
                children: [
                  Icon(
                    Icons.history,
                    size: 18,
                    color: highlightHistoryTab
                        ? const Color(0xFFFF3B3B)
                        : Colors.grey.shade600,
                  ),
                  const SizedBox(width: 8),
                  UnreadableText(
                    sq.common.history,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: highlightHistoryTab
                          ? const Color(0xFFFF3B3B)
                          : Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 取引履歴リスト
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 20),
              itemBuilder: (context, index) {
                final txData = _txData(sq)[index];
                return _TransactionItem(tx: txData, sq: sq);
              },
            ),
          ),
        ],
      ),
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
    return Padding(
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
                : '${sq.common.yen}${tx.amount.abs()}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: tx.isIncome ? Colors.green : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

/// QRコード表示画面
class QrCodeScreen extends StatelessWidget {
  /// コンストラクタ
  const QrCodeScreen({
    super.key,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.overlays,
    this.onBack,
  });

  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;
  final List<Widget> overlays;
  final VoidCallback? onBack;

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
          sq.common.qrCode,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // QRコードのモック
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const _MockQrCode(),
                ),
                const SizedBox(height: 24),
                UnreadableText(
                  sq.common.qrCode,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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

    // シンプルなQRコード風パターン
    final pattern = [
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

    for (int row = 0; row < pattern.length; row++) {
      for (int col = 0; col < pattern[row].length; col++) {
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
