import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:slides/slides/background_slide.dart';
import 'package:slides/slides/closing_slide.dart';
import 'package:slides/slides/hook_slide.dart';
import 'package:slides/slides/insight_slide.dart';
import 'package:slides/slides/why_slide.dart';
import 'package:slides/slides/wonder_slide.dart';
import 'package:slides/theme.dart';

/// スライドの見た目を PNG に書き出すプレビュー。
///
/// ```
/// cd apps/slides
/// fvm flutter test --update-goldens test/slide_preview_test.dart
/// ```
///
/// `test/goldens/` に各スライドの画像が出る。ブラウザを開かずに見た目を
/// 確認でき、レビューや共有にも使える。**画像の比較はしない**（常に上書き）。
/// 期待画像を固定してしまうと、スライドを直すたびにテストが落ちて
/// プレビューとして使えなくなるため。
///
/// `apps/slides` はワークスペース外なので `melos run test:all` の対象外。
/// このテストが CI を止めることはない。
///
/// **既知の差異その1 — 書体**: 本文の書体 Kiwi Maru は
/// `google_fonts` が実行時に取得するもので、flutter_test は通信を遮断する。
/// そのためプレビューは**フォールバックの NotoSansJP で描かれる**。
/// レイアウト（改行位置・図の収まり）は確認できるが、**丸みのある字形は
/// 確認できない**。字形は `fvm flutter run -d chrome` で見ること。
///
/// **既知の差異その2 — 絵文字**: スライド5の解説パネルに出る絵文字
/// （🛒🎨📱）は、このプレビューでは豆腐（□）になる。flutter_test の環境に
/// 絵文字フォントが無いため。ブラウザでは CanvasKit が Noto のフォールバックを
/// 取りに行くので表示される見込みだが、
/// **本番の投影前に実ブラウザで必ず確認すること**。
void main() {
  setUpAll(() async {
    // Kiwi Maru の取得を止める。flutter_test は通信を遮断するので必ず
    // 失敗し、google_fonts はその失敗を rethrow してテストごと落とす。
    //
    // `GoogleFonts.config.allowRuntimeFetching = false` でも同じく例外に
    // なる（同梱フォントが無いため）ので、そちらは使えない。
    SlideText.useWebFont = false;

    // flutter_test は既定でグリフを持たないフォントを使う。明示的に
    // 読み込まないと日本語もアイコンも豆腐（□）になり、
    // 「アイコンで意味が分かる」というスライドの主題が確認できない。
    final jp = FontLoader('packages/quiz_core/NotoSansJP');
    for (final weight in ['Regular', 'Bold']) {
      jp.addFont(
        rootBundle.load(
          'packages/quiz_core/assets/fonts/NotoSansJP/NotoSansJP-$weight.ttf',
        ),
      );
    }
    await jp.load();

    await (FontLoader('MaterialIcons')
          ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf')))
        .load();
  });

  /// 本番と同じ 1920x1080 の固定キャンバスで [slide] を描き、PNG に書き出す。
  Future<void> shoot(WidgetTester tester, String name, Widget slide) async {
    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: SlideColors.scheme,
            scaffoldBackgroundColor: SlideColors.background,
            fontFamily: 'packages/quiz_core/NotoSansJP',
          ),
          home: Scaffold(body: slide),
        ),
      ),
    );

    // 商品画像のデコードは非同期なので、待たないと空欄のまま写る。
    await tester.runAsync(() async {
      await Future<void>.delayed(const Duration(milliseconds: 300));
    });

    // AnimatedOpacity（スライド2の手がかりの出現）が終わるまで進める。
    // 残っているのはこの一度きりのアニメーションだけなので、
    // 600ms 進めれば必ず最終状態になる。
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/$name.png'),
    );
  }

  testWidgets('全スライドを書き出す', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1920, 1080));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await shoot(tester, '1_hook', const HookLayout());
    // ステップ提示は最初と最後だけ確認できれば足りる
    // 遷移直後（手がかり0個）・1つ目が出た直後・種明かしの3コマ。
    // 「最初は何も出ていない」ことがプレビューで確認できるようにしておく。
    await shoot(tester, '2_why_step1', const WhyLayout(step: 1));
    await shoot(tester, '2_why_step2', const WhyLayout(step: 2));
    await shoot(
      tester,
      '2_why_step6',
      const WhyLayout(step: WhyLayout.totalSteps),
    );
    await shoot(tester, '3_background', const BackgroundLayout());
    await shoot(tester, '4_wonder', const WonderLayout());
    await shoot(tester, '5_insight', const InsightLayout());
    await shoot(tester, '6_closing', const ClosingLayout());
  });
}
