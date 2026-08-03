import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/shopping.dart';

/// 端末フレームの論理サイズ。
///
/// [ShoppingApp] は電話の縦画面前提のレイアウトなので、スライドに載せるには
/// このサイズに固定してから拡大縮小する。注釈の座標もこの座標系で持つ。
const kDeviceSize = Size(390, 844);

/// アプリ本体の EC 画面を、スライド上に実物として描画する。
///
/// スクリーンショットではなく [ShoppingApp] そのものを描く。クイズの進行は
/// 不要なのでコールバックは全て空にし、静的な引数だけを渡している。
/// これにより Notifier・Firebase・Drift の経路を一切通さずに済む。
class AppScreen extends StatelessWidget {
  const AppScreen({super.key, this.missionText = '水を2つ買おう'});

  final String missionText;

  @override
  Widget build(BuildContext context) {
    // ShoppingApp は ShoppingAppTheme などの ThemeExtension を
    // Theme.of(context) から読むため、アプリ本体と同じ AppTheme が必須。
    // NotoSansJP もここから供給される。
    return Theme(
      data: AppTheme.light(),
      child: MediaQuery(
        data: MediaQueryData(size: kDeviceSize),
        child: ShoppingApp(
          cart: const ShoppingCart(),
          onAddToCart: (_) {},
          onUpdateQuantity: (_, __) {},
          onRemoveFromCart: (_) {},
          onPurchase: () {},
          quizStatus: QuizStatus.playing,
          remainingSeconds: 56,
          missionText: missionText,
          hintUsed: false,
          timeLimitSeconds: 60,
          cartBottomSheetBuilder: (context) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}

/// 端末の外枠。[kDeviceSize] に固定した中身を、与えられた領域いっぱいに拡大する。
///
/// [overlay] には注釈などを重ねる。[kDeviceSize] の座標系で配置できるよう、
/// 中身と同じ [SizedBox] の中に置いている。
class DeviceFrame extends StatelessWidget {
  const DeviceFrame({super.key, required this.child, this.overlay});

  final Widget child;
  final Widget? overlay;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: kDeviceSize.width,
        height: kDeviceSize.height,
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: const Color(0xFF1A1A1A), width: 6),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 32,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: child,
            ),
            if (overlay != null) Positioned.fill(child: overlay!),
          ],
        ),
      ),
    );
  }
}
