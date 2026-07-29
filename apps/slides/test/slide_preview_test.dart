import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:slides/slides/hook_slide.dart';
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
void main() {
  setUpAll(() async {
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
    await tester.pumpAndSettle();

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
    await shoot(tester, '2_why_step1', const WhyLayout(step: 1));
    await shoot(tester, '2_why_step5', const WhyLayout(step: 5));
    await shoot(tester, '4_wonder', const WonderLayout());
  });
}
