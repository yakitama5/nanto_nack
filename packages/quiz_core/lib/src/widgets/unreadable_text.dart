import 'package:flutter/material.dart';

/// テキストを「解読不能な文字列」に見せるウィジェット
///
/// [isObfuscated] が false なら通常テキストを表示し、
/// true なら各文字を記号文字（Unicode ブロック要素）に置き換えて表示する。
///
/// [animateOnObfuscate] を true にすると、[isObfuscated] が false → true に
/// 変化したとき [duration] かけてスゥーッと文字が崩れるアニメーションを行う。
class UnreadableText extends StatefulWidget {
  const UnreadableText(
    this.text, {
    super.key,
    this.style,
    this.isObfuscated = true,
    this.animateOnObfuscate = true,
    this.duration = const Duration(milliseconds: 1200),
  });

  /// 表示するテキスト（非表示時も長さの計算に使用）
  final String text;

  /// テキストのスタイル
  final TextStyle? style;

  /// true のとき文字を記号に置き換えて表示する
  final bool isObfuscated;

  /// isObfuscated が切り替わるときにアニメーションするか
  final bool animateOnObfuscate;

  /// アニメーション時間
  final Duration duration;

  @override
  State<UnreadableText> createState() => _UnreadableTextState();
}

class _UnreadableTextState extends State<UnreadableText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progress;

  // 0.0 = 通常テキスト、1.0 = 完全に文字化け
  double _obfuscationLevel = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _progress = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    )..addListener(() {
        setState(() => _obfuscationLevel = _progress.value);
      });

    if (widget.isObfuscated) {
      // アニメーションなしで初期状態を文字化け済みにする。
      // _controller.value も同期させないと reverse() が 0 から始まってしまう。
      _obfuscationLevel = 1.0;
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(UnreadableText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isObfuscated != widget.isObfuscated) {
      if (widget.animateOnObfuscate) {
        if (widget.isObfuscated) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      } else {
        // アニメーションなしで即時切り替え。
        // _controller.value も同期させないと次回アニメーション時に
        // 不正な開始位置から再生される。
        final target = widget.isObfuscated ? 1.0 : 0.0;
        _controller.value = target;
        setState(() => _obfuscationLevel = target);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 文字化けレベルに応じて各文字を記号に置換する
  String _buildDisplayText() {
    if (_obfuscationLevel <= 0) return widget.text;
    if (_obfuscationLevel >= 1) return _obfuscate(widget.text);

    // 先頭から (_obfuscationLevel * 文字数) 分だけ文字化け
    final chars = widget.text.characters.toList();
    final obfuscatedCount = (_obfuscationLevel * chars.length).round();
    final result = StringBuffer();
    for (var i = 0; i < chars.length; i++) {
      if (i < obfuscatedCount) {
        result.write(_obfuscateChar(chars[i]));
      } else {
        result.write(chars[i]);
      }
    }
    return result.toString();
  }

  /// 文字列全体を記号に変換する
  String _obfuscate(String text) {
    return text.characters.map(_obfuscateChar).join();
  }

  /// 1文字を記号に変換する（スペース・改行はそのまま）
  String _obfuscateChar(String char) {
    if (char == ' ' || char == '\n' || char == '\t') return char;
    // Unicode ブロック要素（U+2580〜U+259F）や記号をランダムに使用
    final code = char.codeUnitAt(0);
    // 文字コードから決定論的に記号を選ぶ（再現性のため）
    const symbols = ['▪', '▫', '◆', '◇', '■', '□', '●', '○', '▲', '△'];
    return symbols[code % symbols.length];
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _buildDisplayText(),
      style: widget.style,
    );
  }
}
