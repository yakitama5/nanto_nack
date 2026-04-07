import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping/shopping.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../application/stage_list_provider.dart';
import '../../application/tutorial/tutorial_notifier.dart';
import 'nantom_speech_bubble.dart';

/// チュートリアル用の WaterQuiz 画面ラッパー。
///
/// WaterQuizScreen の上にチュートリアルコーチマーク（Step 5〜7）を重ねる。
/// MissionCutIn 完了後にコーチマークを表示し、タイマーを制御する。
class TutorialWaterQuizScreen extends ConsumerStatefulWidget {
  const TutorialWaterQuizScreen({super.key});

  @override
  ConsumerState<TutorialWaterQuizScreen> createState() =>
      _TutorialWaterQuizScreenState();
}

class _TutorialWaterQuizScreenState
    extends ConsumerState<TutorialWaterQuizScreen> {
  final _timerBubbleKey = GlobalKey();
  final _waterItemKey = GlobalKey();

  void _onMissionCutInFinished() {
    // MissionCutIn が終わったタイミングでタイマーを止め、コーチマーク表示
    ref.read(waterQuizProvider.notifier).pauseTimer();
    // タイマー停止後、次フレームでコーチマークを表示する
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _showTutorial();
    });
  }

  void _showTutorial() {
    final targets = _buildTargets();
    TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black,
      opacityShadow: 0.85,
      textSkip: 'スキップ',
      skipWidget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
        ),
        child: const Text(
          'スキップ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onFinish: _completeTutorial,
      onSkip: () {
        _completeTutorial();
        return true;
      },
    ).show(context: context);
  }

  List<TargetFocus> _buildTargets() {
    return [
      // Step 5: 水商品カード（驚き）- 水の商品カードにフォーカス
      TargetFocus(
        identify: 'quiz_water_surprised',
        keyTarget: _waterItemKey,
        shape: ShapeLightFocus.RRect,
        radius: 16,
        paddingFocus: 8,
        enableOverlayTab: true,
        // Step 5 → 6 の遷移でフォーカスアニメーションを省く
        unFocusAnimationDuration: Duration.zero,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (ctx, ctl) => const NantomSpeechBubble(
              expression: NantomExpression.surprised,
              text: 'うわー！文字が読めなくなっちゃってる',
            ),
          ),
        ],
      ),
      // Step 6: 同じ水商品カード（悲しい）- フォーカス位置はそのまま、テキストと表情だけ変わる
      TargetFocus(
        identify: 'quiz_water_sad',
        keyTarget: _waterItemKey,
        shape: ShapeLightFocus.RRect,
        radius: 16,
        paddingFocus: 8,
        enableOverlayTab: true,
        // Step 5 → 6 はアニメーションなし（フォーカスが戻る演出なし）
        focusAnimationDuration: Duration.zero,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (ctx, ctl) => const NantomSpeechBubble(
              expression: NantomExpression.sad,
              text: 'ボクのノロいが伝染ったのかも',
            ),
          ),
        ],
      ),
      // Step 7: タイマーバブル（笑顔）
      TargetFocus(
        identify: 'quiz_timer_hint',
        keyTarget: _timerBubbleKey,
        shape: ShapeLightFocus.Circle,
        paddingFocus: 16,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (ctx, ctl) => const NantomSpeechBubble(
              expression: NantomExpression.smile,
              text:
                  'でも大丈夫！文字が読めなくても、アイコンや色を見れば「なんとなく」わかるはず。さあ、やってみて！',
            ),
          ),
        ],
      ),
    ];
  }

  void _completeTutorial() {
    // タイマーを再開してチュートリアル完了
    ref.read(waterQuizProvider.notifier).resumeTimer();
    ref.read(tutorialNotifierProvider.notifier).complete();
  }

  @override
  Widget build(BuildContext context) {
    return WaterQuizScreen(
      timerBubbleKey: _timerBubbleKey,
      waterItemKey: _waterItemKey,
      onMissionCutInFinished: _onMissionCutInFinished,
      onCompleted: () {
        // チュートリアル経由のクリアでは StageListScreen の invalidate が行われないため、
        // ここでキャッシュを無効化してショッピングクイズ2が解放されるようにする
        ref.invalidate(stageListProvider);
        context.pop();
      },
    );
  }
}
