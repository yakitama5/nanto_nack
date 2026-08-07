import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:slides/theme.dart';

/// ストアのURL。QRはここから描く。
///
/// Google Play は `apps/app_main/dart_define/prod.json` の
/// `androidPackageName` から組み立てたもの。
/// App Store は数値の App ID が必要で Bundle ID からは導出できないため、
/// ストアの実際のURLをそのまま持つ。
///
/// 空文字にすると QR の代わりに「URL 未設定」の枠を出す。
/// QRらしい模様を置くと、誤って読み取られて別の場所へ飛ばしかねないため。
abstract final class StoreLinks {
  static const appStore = 'https://apps.apple.com/jp/app/nantonack/id6761988301';

  static const googlePlay =
      'https://play.google.com/store/apps/details?id=com.yakuran.nanto_nack';
}

/// 6枚目 (2:45-3:00)
///
/// 言い切って終わる15秒。
///
/// 本編は全て左寄せの2カラムなので、ここだけ中央寄せにして「終わり」を
/// 形で伝える。紫の全面はコンセプトのスライド4に取ってあるので、
/// ここは背景を変えずに文字の大きさだけで締める。
class ClosingSlide extends FlutterDeckSlideWidget {
  const ClosingSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(route: '/closing'),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(builder: (context) => const ClosingLayout());
  }
}

/// [ClosingSlide] の中身。`FlutterDeckApp` の外でも組めるよう切り出している。
class ClosingLayout extends StatelessWidget {
  const ClosingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 96, vertical: 48),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _Statement(),
            const SizedBox(height: 28),
            // QRだけだと名前が記憶に残らないので、アプリ名は残す
            Text('NantoNack', style: SlideText.lead),
            const SizedBox(height: 44),
            const _Stores(),
          ],
        ),
      ),
    );
  }
}

/// 言い切りの一文。最後の視線を集める。
class _Statement extends StatelessWidget {
  const _Statement();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: '読めなくても伝わるUIが、\n'),
          TextSpan(
            text: 'いいUI。',
            style: TextStyle(color: SlideColors.primary),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      style: SlideText.title.copyWith(height: 1.35),
    );
  }
}

/// マスコットと2つのストアQRを横一列に並べる。
class _Stores extends StatelessWidget {
  const _Stores();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/smile.png',
          width: 200,
          filterQuality: FilterQuality.medium,
        ),
        const SizedBox(width: 56),
        const _StoreQr(
          label: 'App Store',
          icon: Icons.phone_iphone,
          url: StoreLinks.appStore,
        ),
        const SizedBox(width: 48),
        const _StoreQr(
          label: 'Google Play',
          icon: Icons.shop,
          url: StoreLinks.googlePlay,
        ),
      ],
    );
  }
}

/// ストア1つ分のQRカード。
///
/// QRは画像ではなくコードから描くので、投影で拡大しても粗くならない。
class _StoreQr extends StatelessWidget {
  const _StoreQr({
    required this.label,
    required this.icon,
    required this.url,
  });

  final String label;
  final IconData icon;
  final String url;

  /// 読み取れる大きさを確保する。投影では小さいと読めない。
  static const _size = 210.0;

  @override
  Widget build(BuildContext context) {
    // QR の下地は白のまま。読み取り精度が落ちるので、
    // ここだけは配色より**カメラが認識できること**を優先する。
    const qrBackground = Colors.white;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: qrBackground,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: url.isEmpty
              ? const _QrPlaceholder(size: _size)
              : QrImageView(
                  data: url,
                  size: _size,
                  // 投影では余白が足りないと読み取りに失敗しやすい
                  padding: EdgeInsets.zero,
                  backgroundColor: qrBackground,
                  eyeStyle: QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: SlideColors.text,
                  ),
                  dataModuleStyle: QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: SlideColors.text,
                  ),
                ),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 30, color: SlideColors.subText),
            const SizedBox(width: 10),
            Text(label, style: SlideText.caption),
          ],
        ),
      ],
    );
  }
}

/// URL 未設定のときの表示。**QRらしく見せてはいけない**ので、
/// 読み取れない図形であることが一目で分かる形にする。
class _QrPlaceholder extends StatelessWidget {
  const _QrPlaceholder({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: SlideColors.subText, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'URL 未設定',
            textAlign: TextAlign.center,
            style: SlideText.caption,
          ),
        ),
      ),
    );
  }
}
