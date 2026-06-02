import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/finance_quiz_config.dart';
import '../domain/finance_quiz_type.dart';
import '../i18n/finance_translations_extension.dart';
import '../../i18n/strings.g.dart' as $finance;
import 'stock_app_quiz_notifier.dart';
import 'widgets/interactive_chart_area.dart';
import 'widgets/period_selector.dart';

class StockAppScaffold extends ConsumerStatefulWidget {
  const StockAppScaffold({
    super.key,
    required this.quizType,
    required this.missionText,
    required this.onGiveUp,
    this.overlays = const [],
  });

  final FinanceQuizType quizType;
  final String missionText;
  final VoidCallback onGiveUp;
  final List<Widget> overlays;

  @override
  ConsumerState<StockAppScaffold> createState() => _StockAppScaffoldState();
}

class _StockAppScaffoldState extends ConsumerState<StockAppScaffold> {
  late final TransformationController _transformationController;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    // shift chart to show right (newest) end initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final screenWidth = MediaQuery.widthOf(context);
      final chartWidth = screenWidth * FinanceQuizConfig.chartWidthMultiplier;
      // quiz3はピーク（チャート中央）が画面中央に来るよう初期表示
      final initialDx = widget.quizType == FinanceQuizType.quiz3
          ? -(chartWidth / 2 - screenWidth / 2)
          : -(chartWidth - screenWidth);
      _transformationController.value = Matrix4.translationValues(
        initialDx,
        0,
        0,
      );
    });
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quizStatus = ref.watch(
      stockAppQuizProvider(widget.quizType).select((s) => s.status),
    );
    final remainingSeconds = ref.watch(
      stockAppQuizProvider(widget.quizType).select((s) => s.remainingSeconds),
    );
    final ext = Theme.of(context).extension<FinanceAppTheme>()!;
    final sq = context.sq;

    return PopScope(
      canPop: quizStatus != QuizStatus.playing,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final confirmed = await QuizExitScope.showConfirmDialog(context);
        if ((confirmed ?? false) && mounted) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: ext.scaffoldBackground,
            body: SafeArea(
              child: Column(
                children: [
                  _StockAppBar(quizType: widget.quizType, ext: ext, sq: sq),
                  Expanded(
                    child: InteractiveChartArea(
                      quizType: widget.quizType,
                      transformationController: _transformationController,
                    ),
                  ),
                  _PeriodSelectorRow(quizType: widget.quizType, ext: ext),
                ],
              ),
            ),
          ),
          if (quizStatus == QuizStatus.playing)
            FloatingMissionBubble(
              remainingSeconds: remainingSeconds,
              missionText: widget.missionText,
              hintUsed: false,
              timeLimitSeconds: FinanceQuizConfig.timeLimitSeconds,
              onGiveUp: widget.onGiveUp,
            ),
          ...widget.overlays,
        ],
      ),
    );
  }
}

// App bar showing ticker symbol and current price
class _StockAppBar extends ConsumerWidget {
  const _StockAppBar({
    required this.quizType,
    required this.ext,
    required this.sq,
  });

  final FinanceQuizType quizType;
  final FinanceAppTheme ext;
  final $finance.Translations sq;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartData = ref.watch(
      stockAppQuizProvider(quizType).select((s) => s.chartData),
    );
    final currentPrice = chartData.isNotEmpty ? chartData.last.price : 0.0;

    return Container(
      color: ext.appBarBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UnreadableText(
                sq.common.tickerSymbol,
                animateOnObfuscate: false,
                style: TextStyle(
                  color: ext.appBarTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              UnreadableText(
                sq.common.appTitle,
                animateOnObfuscate: false,
                style: TextStyle(
                  color: ext.subTextColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          UnreadableText(
            '¥${currentPrice.toStringAsFixed(0)}',
            animateOnObfuscate: false,
            style: TextStyle(
              color: ext.currentPriceColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _PeriodSelectorRow extends StatelessWidget {
  const _PeriodSelectorRow({required this.quizType, required this.ext});

  final FinanceQuizType quizType;
  final FinanceAppTheme ext;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ext.appBarBackground,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: PeriodSelector(quizType: quizType),
    );
  }
}
