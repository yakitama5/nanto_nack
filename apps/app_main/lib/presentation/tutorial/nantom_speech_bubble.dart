import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// ナントムの表情パターン。
enum NantomExpression {
  normal,
  surprised,
  sad,
  smile,
}

/// ナントムのキャラクター画像と吹き出しテキストを横並びで表示するウィジェット。
///
/// チュートリアルコーチマークのコンテンツとして使用する。
class NantomSpeechBubble extends StatelessWidget {
  const NantomSpeechBubble({
    super.key,
    required this.expression,
    required this.text,
  });

  final NantomExpression expression;
  final String text;

  String get _assetPath {
    return switch (expression) {
      NantomExpression.normal =>
        'packages/quiz_core/assets/images/ghost/normal.svg',
      NantomExpression.surprised =>
        'packages/quiz_core/assets/images/ghost/surprised.svg',
      NantomExpression.sad =>
        'packages/quiz_core/assets/images/ghost/cry.svg',
      NantomExpression.smile =>
        'packages/quiz_core/assets/images/ghost/Smile.svg',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          _assetPath,
          width: 72,
          height: 72,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: _SpeechBubble(text: text),
        ),
      ],
    );
  }
}

class _SpeechBubble extends StatelessWidget {
  const _SpeechBubble({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF1A1A1A),
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
      ),
    );
  }
}
