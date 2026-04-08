import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// チュートリアルが表示される画面を表す。
enum TutorialScreen {
  /// ホーム画面（Step 1〜3）
  home,

  /// カテゴリ一覧画面（Step 4）
  categoryList,

  /// WaterQuiz 画面（Step 5〜7）
  waterQuiz,

  /// チュートリアル完了
  done,
}

class TutorialState {
  const TutorialState({
    required this.screen,
    required this.isCompleted,
  });

  final TutorialScreen screen;
  final bool isCompleted;

  TutorialState copyWith({
    TutorialScreen? screen,
    bool? isCompleted,
  }) {
    return TutorialState(
      screen: screen ?? this.screen,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

final tutorialNotifierProvider =
    AsyncNotifierProvider<TutorialNotifier, TutorialState>(
  TutorialNotifier.new,
);

class TutorialNotifier extends AsyncNotifier<TutorialState> {
  static const _completedKey = 'is_tutorial_completed';

  @override
  Future<TutorialState> build() async {
    final prefs = await SharedPreferences.getInstance();
    final completed = prefs.getBool(_completedKey) ?? false;
    return TutorialState(
      screen: completed ? TutorialScreen.done : TutorialScreen.home,
      isCompleted: completed,
    );
  }

  /// 次の画面に進む。
  void advanceTo(TutorialScreen screen) {
    final current = state.valueOrNull;
    if (current == null || current.isCompleted) return;
    state = AsyncData(current.copyWith(screen: screen));
  }

  /// チュートリアルを完了（またはスキップ）する。
  Future<void> complete() async {
    final current = state.valueOrNull;
    if (current == null) return;
    state = AsyncData(current.copyWith(
      screen: TutorialScreen.done,
      isCompleted: true,
    ));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_completedKey, true);
  }
}
