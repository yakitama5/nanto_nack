import 'package:flutter/material.dart';

/// 設定オーバーレイ用の背景付きメニューコンテナ。
///
/// 外側タップで [onDismiss] を呼び、内側タップは伝播させない。
class StreamingOverlayMenu extends StatelessWidget {
  const StreamingOverlayMenu({
    super.key,
    required this.onDismiss,
    required this.child,
  });

  final VoidCallback onDismiss;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: onDismiss,
        child: ColoredBox(
          color: Colors.black45,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {}, // メニュー内タップで閉じないように
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
