import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail/src/i18n/mail_translations_extension.dart';
import 'package:mail/src/presentation/mail_list_item.dart';
import 'package:mail/src/presentation/quiz4_search/search_quiz_notifier.dart';
import 'package:mail/src/presentation/quiz4_search/search_quiz_state.dart';
import 'package:quiz_core/quiz_core.dart';

class SearchQuizScreen extends ConsumerStatefulWidget {
  const SearchQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<SearchQuizScreen> createState() => _SearchQuizScreenState();
}

class _SearchQuizScreenState extends ConsumerState<SearchQuizScreen> {
  bool _showCutIn = true;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchQuizProvider.notifier).startQuiz();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showHintSnackBar(BuildContext context, String hint) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(hint),
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchQuizProvider);
    final s = context.s;
    final sq = context.sq;
    final missionText = s.quiz4.missionText;
    final hint = s.quiz4.hint;

    return QuizExitScope(
      quizStatus: state.status,
      child: Scaffold(
        appBar: _SearchAppBar(
          state: state,
          searchController: _searchController,
          hint: hint,
          onOpenSearch: () =>
              ref.read(searchQuizProvider.notifier).openSearch(),
          onCancelSearch: () {
            _searchController.clear();
            ref.read(searchQuizProvider.notifier).cancelSearch();
          },
          onQueryChanged: (text) =>
              ref.read(searchQuizProvider.notifier).updateQuery(text),
          onSubmitSearch: () =>
              ref.read(searchQuizProvider.notifier).submitSearch(),
          onShowHint: () => _showHintSnackBar(context, hint),
        ),
        body: Stack(
          children: [
            state.isSearching
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'Enter a search query and press Enter',
                        style: TextStyle(color: Color(0xFF5F6368)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: state.mailApp.currentFolderMails.length,
                    separatorBuilder: (_, __) =>
                        const Divider(height: 1, indent: 72),
                    itemBuilder: (context, index) {
                      final mail = state.mailApp.currentFolderMails[index];
                      return MailListItem(
                        mail: mail,
                        isSelected: false,
                        archiveLabel: sq.common.archiveAction,
                      );
                    },
                  ),
            FloatingMissionBubble(
              missionText: missionText,
              remainingSeconds: 0,
              hintUsed: false,
            ),
            if (_showCutIn)
              MissionCutIn(
                missionText: missionText,
                timeLimitSeconds: 0,
                onFinished: () => setState(() => _showCutIn = false),
              ),
            if (state.status == QuizStatus.correct ||
                state.status == QuizStatus.giveUp)
              Positioned.fill(
                child: QuizResultOverlay(
                  status: state.status,
                  score: state.score,
                  elapsedMs: state.elapsedMs,
                  onRetry: () {
                    setState(() => _showCutIn = true);
                    _searchController.clear();
                    ref.read(searchQuizProvider.notifier).retry();
                  },
                  onNext: state.status == QuizStatus.correct
                      ? widget.onCompleted
                      : null,
                  onBack: () => Navigator.of(context).pop(),
                  insight: const _SearchInsight(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 検索AppBar
///
/// 通常時はヒントボタン付きの検索バー、検索モード時はTextField付きのAppBar。
class _SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SearchAppBar({
    required this.state,
    required this.searchController,
    required this.hint,
    required this.onOpenSearch,
    required this.onCancelSearch,
    required this.onQueryChanged,
    required this.onSubmitSearch,
    required this.onShowHint,
  });

  final SearchQuizState state;
  final TextEditingController searchController;
  final String hint;
  final VoidCallback onOpenSearch;
  final VoidCallback onCancelSearch;
  final ValueChanged<String> onQueryChanged;
  final VoidCallback onSubmitSearch;
  final VoidCallback onShowHint;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    if (state.isSearching) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF5F6368)),
          onPressed: onCancelSearch,
        ),
        title: TextField(
          controller: searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: context.sq.common.searchHint,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Color(0xFF5F6368)),
          ),
          onChanged: onQueryChanged,
          onSubmitted: (_) => onSubmitSearch(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF5F6368)),
            onPressed: onSubmitSearch,
          ),
        ],
      );
    }

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      shadowColor: Colors.grey.withAlpha(76),
      title: GestureDetector(
        onTap: onOpenSearch,
        child: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F3F4),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Color(0xFF5F6368), size: 20),
              const SizedBox(width: 8),
              Text(
                context.sq.common.searchHint,
                style: const TextStyle(
                  color: Color(0xFF5F6368),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline, color: Color(0xFF5F6368)),
          onPressed: onShowHint,
          tooltip: 'Hint',
        ),
      ],
    );
  }
}

class _SearchInsight extends StatelessWidget {
  const _SearchInsight();

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz4.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.lightbulb, color: Color(0xFFFFD814), size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                insight.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          insight.subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: const Color(0xFF757575),
              ),
        ),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '🔍',
          title: insight.operatorTitle,
          desc: insight.operatorDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '📦',
          title: insight.sizeTitle,
          desc: insight.sizeDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '💡',
          title: insight.hintTitle,
          desc: insight.hintDesc,
        ),
      ],
    );
  }
}

class _InsightItem extends StatelessWidget {
  const _InsightItem({
    required this.emoji,
    required this.title,
    required this.desc,
  });

  final String emoji;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF757575),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
