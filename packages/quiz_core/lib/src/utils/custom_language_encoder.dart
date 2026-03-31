/// カスタム言語エンコーダー
///
/// 仕様書（docs/custom-language-design.md）に基づき、テキストをカスタム言語に変換する。
///
/// - A〜Z / a〜z: 1対1のランダムマッピングで別のアルファベットに置換
/// - 0〜9: ギリシャ文字（小文字）に置換
/// - 記号・スペース・非ASCII文字: そのまま保持
abstract final class CustomLanguageEncoder {
  static const _upperMap = <String, String>{
    'A': 'K', 'B': 'D', 'C': 'U', 'D': 'M', 'E': 'X',
    'F': 'B', 'G': 'P', 'H': 'Y', 'I': 'R', 'J': 'V',
    'K': 'A', 'L': 'C', 'M': 'E', 'N': 'J', 'O': 'S',
    'P': 'O', 'Q': 'L', 'R': 'F', 'S': 'W', 'T': 'Z',
    'U': 'H', 'V': 'N', 'W': 'G', 'X': 'T', 'Y': 'I', 'Z': 'Q',
  };

  static const _lowerMap = <String, String>{
    'a': 'k', 'b': 'd', 'c': 'u', 'd': 'm', 'e': 'x',
    'f': 'b', 'g': 'p', 'h': 'y', 'i': 'r', 'j': 'v',
    'k': 'a', 'l': 'c', 'm': 'e', 'n': 'j', 'o': 's',
    'p': 'o', 'q': 'l', 'r': 'f', 's': 'w', 't': 'z',
    'u': 'h', 'v': 'n', 'w': 'g', 'x': 't', 'y': 'i', 'z': 'q',
  };

  static const _digitMap = <String, String>{
    '0': 'η', '1': 'γ', '2': 'π', '3': 'α', '4': 'ε',
    '5': 'θ', '6': 'β', '7': 'λ', '8': 'ζ', '9': 'δ',
  };

  /// 数字（0〜9）とカスタム言語の対応表
  static Map<String, String> get digitMap => _digitMap;

  /// テキストをカスタム言語にエンコードする
  static String encode(String text) {
    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      buffer.write(encodeChar(text[i]));
    }
    return buffer.toString();
  }

  /// 1文字をカスタム言語に変換する
  ///
  /// - A-Z: マッピングに従って大文字ラテン文字に変換
  /// - a-z: マッピングに従って小文字ラテン文字に変換
  /// - 0-9: ギリシャ文字に変換
  /// - それ以外（記号・スペース・非ASCII）: そのまま返す
  static String encodeChar(String char) {
    return _upperMap[char] ?? _lowerMap[char] ?? _digitMap[char] ?? char;
  }
}
