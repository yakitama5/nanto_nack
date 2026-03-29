import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// クリア効果音のキャッシュファイルパスを保持する Provider。
///
/// アプリ起動時に事前ロードしておくことで、クイズ正解時の再生遅延を防ぐ。
///
/// [AssetSource] は内部で "assets/" プレフィックスを付加するため、
/// パッケージアセットキー "packages/quiz_core/assets/sounds/clear.mp3" と
/// 合わせると誤ったパスになる。
/// 代わりに [AudioCache] を prefix 空で使用し、rootBundle から正しいキーで
/// 読み込んだ上で、拡張子 .mp3 が保たれた一時ファイルへ書き出す。
/// iOS の AVPlayer はファイル拡張子でフォーマットを判別するため、
/// この方法が最も確実に動作する。
final clearSoundProvider = FutureProvider<String>((ref) async {
  // prefix を空にすることで rootBundle.load のキーがそのまま使われる。
  // キャッシュファイルは tempDir/<cacheId>/packages/quiz_core/assets/sounds/clear.mp3
  // として保存されるため .mp3 拡張子が保たれる。
  final cache = AudioCache(prefix: '');
  final uri = await cache.load('packages/quiz_core/assets/sounds/clear.mp3');
  return uri.toFilePath();
});
