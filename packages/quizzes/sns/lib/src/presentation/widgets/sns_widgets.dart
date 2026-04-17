import 'package:flutter/material.dart';

/// SNSクイズ用のテキストウィジェット
class SnsText extends StatelessWidget {
  const SnsText(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style, maxLines: maxLines, overflow: overflow);
  }
}
