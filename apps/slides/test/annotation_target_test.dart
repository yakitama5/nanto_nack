import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/shopping.dart';
import 'package:slides/widgets/annotation_marker.dart';
import 'package:slides/widgets/app_screen.dart';

/// スライド2の注釈（赤い楕円）の座標が、実際の画面と合っているかを検査する。
///
/// [AnnotationTarget] は固定座標を持っている。`ShoppingApp` は注釈用の
/// GlobalKey を差し込む口を持たず、アプリ本体には手を入れない方針のため、
/// 実測値をハードコードするしかない。
///
/// 問題は**アプリ側の UI が変わっても気づけない**こと。円が静かにズレる。
/// このテストは実レイアウトを計測して定数と突き合わせ、ズレたら
/// **正しい値を出力して落ちる**。手で測り直す必要はない。
void main() {
  setUpAll(() async {
    // 文字のサイズがレイアウトを左右するので、本番と同じフォントを読む。
    // 読まないと計測値が実際の表示とずれる。
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

  testWidgets('注釈の座標が実際の画面と一致する', (tester) async {
    // 端末と同じ大きさで描くと FittedBox の拡大率が 1 になり、
    // 画面全体の座標がそのまま端末座標系になる。
    await tester.binding.setSurfaceSize(kDeviceSize);
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      TranslationProvider(
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(body: DeviceFrame(child: AppScreen())),
        ),
      ),
    );
    await tester.runAsync(() async {
      await Future<void>.delayed(const Duration(milliseconds: 300));
    });
    await tester.pumpAndSettle();

    // DeviceFrame の左上を原点にすると、注釈オーバーレイと同じ座標系になる。
    final origin = tester.getTopLeft(find.byType(DeviceFrame));

    Rect? measure(Finder finder) {
      if (finder.evaluate().isEmpty) return null;
      return _round(tester.getRect(finder.first).shift(-origin));
    }

    final actual = <String, Rect?>{
      'cart': measure(find.byType(CartBadge)),
      'price': measure(
        find.byWidgetPredicate(
          (w) => w is UnreadableText && w.text.startsWith('¥'),
        ),
      ),
      // アイコン自体は 16x16 なので、黄色い丸ボタンそのものを取る
      'addButton': measure(
        find.ancestor(
          of: find.byIcon(Icons.add_shopping_cart),
          matching: find.byType(ElevatedButton),
        ),
      ),
      // 下部タブは標準の BottomNavigationBar ではなく独自ウィジェットなので、
      // Scaffold に渡されたインスタンスから引き当てる。
      'bottomNav': measure(
        find.byWidget(
          tester
              .widget<Scaffold>(find.byType(Scaffold).last)
              .bottomNavigationBar!,
        ),
      ),
    };

    final expected = <String, Rect>{
      'cart': AnnotationTarget.cart.rect,
      'price': AnnotationTarget.price.rect,
      'addButton': AnnotationTarget.addButton.rect,
      'bottomNav': AnnotationTarget.bottomNav.rect,
    };

    final drifted = <String>[];
    for (final name in expected.keys) {
      if (actual[name] == null) {
        drifted.add('  $name: 対象のウィジェットが見つかりません');
        continue;
      }
      if (actual[name] != expected[name]) {
        drifted.add(
          '  $name:\n'
          '    定数: ${_fmt(expected[name]!)}\n'
          '    実測: ${_fmt(actual[name]!)}',
        );
      }
    }

    expect(
      drifted,
      isEmpty,
      reason: 'AnnotationTarget の座標が実際の画面とズレています。\n'
          'annotation_marker.dart の定数を下の「実測」の値に直してください。\n'
          '${drifted.join('\n')}\n',
    );
  });
}

/// 小数のブレで毎回落ちないよう、0.5 単位に丸める
Rect _round(Rect r) => Rect.fromLTWH(
      (r.left * 2).roundToDouble() / 2,
      (r.top * 2).roundToDouble() / 2,
      (r.width * 2).roundToDouble() / 2,
      (r.height * 2).roundToDouble() / 2,
    );

String _fmt(Rect r) =>
    'Rect.fromLTWH(${r.left}, ${r.top}, ${r.width}, ${r.height})';
