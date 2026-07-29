import 'package:flutter/material.dart';

/// 「左に文言・右に端末」という共通レイアウト。
///
/// 端末画像を Expanded で伸ばすと文言との間に大きな空白ができるため、
/// 文言の幅を [textWidth] に固定し、全体を中央に寄せている。
class SplitSlide extends StatelessWidget {
  const SplitSlide({
    super.key,
    required this.text,
    required this.device,
    this.textWidth = 760,
  });

  final Widget text;
  final Widget device;
  final double textWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: textWidth,
            child: Align(alignment: Alignment.centerLeft, child: text),
          ),
          const SizedBox(width: 72),
          device,
        ],
      ),
    );
  }
}
