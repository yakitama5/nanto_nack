import 'package:app_main/application/tutorial/tutorial_notifier.dart';
import 'package:app_main/presentation/play/category_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';

/// spec/8.tutorial/bugfix_category_coachmark_misalignment.md の回帰テスト。
///
/// [CategoryListScreen] は `_waitForRouteTransition()` により、
/// ページ遷移アニメーション完了後にのみチュートリアルのコーチマークを表示する。
/// - 遷移アニメーション中はコーチマークが表示されないこと
/// - 遷移完了後にコーチマークが表示されること
/// - チュートリアル完了済みの場合は表示されないこと（回帰確認）
/// を検証する。

/// テスト用に任意の [TutorialState] を同期的に返すフェイク Notifier。
///
/// 本物の [TutorialNotifier] は SharedPreferences から
/// `completed` のみを読み込み `screen` は常に home/done になるため、
/// `TutorialScreen.categoryList` 状態を再現するにはこのフェイクが必要。
class _FakeTutorialNotifier extends AsyncNotifier<TutorialState>
    implements TutorialNotifier {
  _FakeTutorialNotifier(this._initialState);

  final TutorialState _initialState;

  @override
  Future<TutorialState> build() async => _initialState;

  @override
  void advanceTo(TutorialScreen screen) {
    final current = state.valueOrNull;
    if (current == null) return;
    state = AsyncData(current.copyWith(screen: screen));
  }

  @override
  Future<void> complete() async {
    final current = state.valueOrNull;
    if (current == null) return;
    state = AsyncData(
      current.copyWith(screen: TutorialScreen.done, isCompleted: true),
    );
  }
}

/// CategoryListScreen へ push 遷移するためのテストホスト画面。
///
/// 初期ルートを素の Scaffold にし、[navigatorKey] 経由で
/// [CategoryListScreen] を push することで、実際の画面遷移アニメーション
/// （MaterialPageRoute のデフォルト所要時間 300ms）を再現する。
Widget _buildTestApp({
  required TutorialState tutorialState,
  required GlobalKey<NavigatorState> navigatorKey,
}) {
  return ProviderScope(
    overrides: [
      tutorialNotifierProvider.overrideWith(
        () => _FakeTutorialNotifier(tutorialState),
      ),
    ],
    child: TranslationProvider(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: AppTheme.light(),
        home: const Scaffold(body: SizedBox.shrink()),
      ),
    ),
  );
}

/// ページ遷移アニメーション・コーチマーク表示に関わる非同期処理を
/// 決定論的に完了させるためのヘルパー。
///
/// `tutorial_coach_mark` はパルスアニメーションを `AnimationController.repeat()`
/// で無限ループさせているため `tester.pumpAndSettle()` は完了せず、
/// またオーバーレイ挿入に `Future.delayed(Duration.zero, ...)` を使っている
/// 関係でタイマーが残ったまま次のテストへ進むと
/// 「A Timer is still pending」という失敗になる。
/// そのため固定回数・固定間隔の `pump` で必要な時間を経過させる。
///
/// 300ms の遷移アニメーションと、コーチマーク自身のフォーカスイン
/// アニメーション（既定 `Durations.long4` ≒ 450ms）を合わせても
/// 十分な 2000ms 分を経過させる。
Future<void> _pumpThroughTransitionAndTutorial(WidgetTester tester) async {
  for (var i = 0; i < 40; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

void main() {
  // コーチマークの本文（Step4）はロケール依存のため、日本語ロケールに固定して
  // 期待文字列を取得する（ハードコードした文言のコピー差分に依存しないため）。
  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.ja);
  });

  final step4Text = AppLocale.ja.translations.tutorial.step4;

  group('CategoryListScreen コーチマーク表示タイミング', () {
    testWidgets(
      'given チュートリアル未完了状態, when push 遷移アニメーション中, '
      'then コーチマークは表示されない',
      (tester) async {
        // given: チュートリアル未完了・対象画面がカテゴリ一覧
        final navigatorKey = GlobalKey<NavigatorState>();
        await tester.pumpWidget(
          _buildTestApp(
            tutorialState: const TutorialState(
              screen: TutorialScreen.categoryList,
              isCompleted: false,
            ),
            navigatorKey: navigatorKey,
          ),
        );
        await tester.pump();

        // when: push 遷移で CategoryListScreen を表示し、
        // 遷移アニメーションの途中（完了前）でフレームを止める
        navigatorKey.currentState!.push(
          MaterialPageRoute<void>(
            builder: (_) => const CategoryListScreen(),
          ),
        );
        await tester.pump(); // 遷移開始（1フレーム目）
        await tester.pump(const Duration(milliseconds: 100)); // 300ms中の途中

        // then: アニメーション完了を待っているため、コーチマークはまだ出ない
        expect(find.text(step4Text), findsNothing);

        // 後片付け: 進行中のアニメーション・タイマーを完了させておく
        await _pumpThroughTransitionAndTutorial(tester);
      },
    );

    testWidgets(
      'given チュートリアル未完了状態, when push 遷移が完了, '
      'then コーチマークが表示される',
      (tester) async {
        // given
        final navigatorKey = GlobalKey<NavigatorState>();
        await tester.pumpWidget(
          _buildTestApp(
            tutorialState: const TutorialState(
              screen: TutorialScreen.categoryList,
              isCompleted: false,
            ),
            navigatorKey: navigatorKey,
          ),
        );
        await tester.pump();

        // when: push 遷移を行い、遷移アニメーション＋コーチマーク自体の
        // フォーカスアニメーションが完了するまで進める
        navigatorKey.currentState!.push(
          MaterialPageRoute<void>(
            builder: (_) => const CategoryListScreen(),
          ),
        );
        await _pumpThroughTransitionAndTutorial(tester);

        // then: Step4 のコーチマークが表示されている
        expect(find.text(step4Text), findsOneWidget);
      },
    );

    testWidgets(
      'given チュートリアル完了済み状態, when push 遷移が完了, '
      'then コーチマークは表示されない（回帰確認）',
      (tester) async {
        // given: チュートリアル完了済み
        final navigatorKey = GlobalKey<NavigatorState>();
        await tester.pumpWidget(
          _buildTestApp(
            tutorialState: const TutorialState(
              screen: TutorialScreen.done,
              isCompleted: true,
            ),
            navigatorKey: navigatorKey,
          ),
        );
        await tester.pump();

        // when
        navigatorKey.currentState!.push(
          MaterialPageRoute<void>(
            builder: (_) => const CategoryListScreen(),
          ),
        );
        await _pumpThroughTransitionAndTutorial(tester);

        // then
        expect(find.text(step4Text), findsNothing);
      },
    );
  });
}
