import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../i18n/strings.g.dart' as $market;
import '../domain/market_quiz_config.dart';
import '../domain/market_quiz_type.dart';
import '../i18n/market_translations_extension.dart';
import 'flea_market_quiz_notifier.dart';

class FleaMarketScaffold extends ConsumerWidget {
  const FleaMarketScaffold({
    super.key,
    required this.quizType,
    required this.missionText,
    required this.onGiveUp,
    this.overlays = const [],
  });

  final MarketQuizType quizType;
  final String missionText;
  final VoidCallback onGiveUp;
  final List<Widget> overlays;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizStatus = ref.watch(
      fleaMarketQuizProvider(quizType).select((s) => s.status),
    );
    final remainingSeconds = ref.watch(
      fleaMarketQuizProvider(quizType).select((s) => s.remainingSeconds),
    );
    final sq = context.sq;

    return PopScope(
      canPop: quizStatus != QuizStatus.playing,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final confirmed = await QuizExitScope.showConfirmDialog(context);
        if ((confirmed ?? false) && context.mounted) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: UnreadableText(
                sq.common.appTitle,
                animateOnObfuscate: false,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.black87),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ImageCarouselArea(quizType: quizType, sq: sq),
                    _ItemHeaderInfo(quizType: quizType, sq: sq),
                    _SellerInfoRow(quizType: quizType, sq: sq),
                    _ItemDescriptionArea(sq: sq),
                    // 下部ボタンのスペースを確保
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: _BuyButton(quizType: quizType, sq: sq),
          ),
          if (quizStatus == QuizStatus.playing)
            FloatingMissionBubble(
              remainingSeconds: remainingSeconds,
              missionText: missionText,
              hintUsed: false,
              timeLimitSeconds: MarketQuizConfig.timeLimitSeconds,
              onGiveUp: onGiveUp,
            ),
          ...overlays,
        ],
      ),
    );
  }
}

/// 商品画像カルーセルエリア（絵文字プレースホルダー + ドットインジケーター）
class _ImageCarouselArea extends ConsumerStatefulWidget {
  const _ImageCarouselArea({required this.quizType, required this.sq});

  final MarketQuizType quizType;
  final $market.Translations sq;

  @override
  ConsumerState<_ImageCarouselArea> createState() => _ImageCarouselAreaState();
}

class _ImageCarouselAreaState extends ConsumerState<_ImageCarouselArea> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 画像ラベルを返す（背景色をインデックスごとに変える）
  static const _bgColors = [
    Color(0xFFE3F0FF),
    Color(0xFFE8F5E9),
    Color(0xFFFFF3E0),
  ];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(fleaMarketQuizProvider(widget.quizType));
    final notifier =
        ref.read(fleaMarketQuizProvider(widget.quizType).notifier);
    final imageEmojis = state.item.imageEmojis;

    return Column(
      children: [
        SizedBox(
          height: 280,
          child: PageView.builder(
            controller: _pageController,
            itemCount: imageEmojis.length,
            onPageChanged: (index) {
              // ページ変更をNotifierに通知してクリア判定を行う
              notifier.updateImageIndex(index);
            },
            itemBuilder: (context, index) {
              final bgColor = _bgColors[index % _bgColors.length];
              return Container(
                color: bgColor,
                child: Center(
                  child: Text(
                    imageEmojis[index],
                    style: const TextStyle(fontSize: 120),
                  ),
                ),
              );
            },
          ),
        ),
        // ドットインジケーター（外部パッケージなしで手動実装）
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(imageEmojis.length, (index) {
            final isActive = state.currentImageIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isActive
                    ? const Color(0xFFD93025)
                    : const Color(0xFFBBBBBB),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

/// 商品名・価格・いいねボタンエリア
class _ItemHeaderInfo extends ConsumerWidget {
  const _ItemHeaderInfo({required this.quizType, required this.sq});

  final MarketQuizType quizType;
  final $market.Translations sq;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = ref.watch(
      fleaMarketQuizProvider(quizType).select((s) => s.isLiked),
    );
    final notifier = ref.read(fleaMarketQuizProvider(quizType).notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UnreadableText(
                  sq.common.itemPrice,
                  animateOnObfuscate: false,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                UnreadableText(
                  sq.common.itemTitle,
                  animateOnObfuscate: false,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          // like_button パッケージを使用（onTap の戻り値は Future<bool?>）
          LikeButton(
            isLiked: isLiked,
            likeBuilder: (liked) => Icon(
              liked ? Icons.favorite : Icons.favorite_border,
              color: liked ? const Color(0xFFD93025) : Colors.grey,
              size: 28,
            ),
            onTap: (current) async {
              notifier.toggleLike();
              // toggleLike 後の状態を返す
              return !current;
            },
          ),
        ],
      ),
    );
  }
}

/// 出品者情報エリア（GestureDetector でタップ可能）
class _SellerInfoRow extends ConsumerWidget {
  const _SellerInfoRow({required this.quizType, required this.sq});

  final MarketQuizType quizType;
  final $market.Translations sq;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellerRating = ref.watch(
      fleaMarketQuizProvider(quizType).select((s) => s.item.sellerRating),
    );
    final notifier = ref.read(fleaMarketQuizProvider(quizType).notifier);

    return GestureDetector(
      onTap: notifier.tapSellerProfile,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFBBBBBB),
              child: Icon(Icons.person, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UnreadableText(
                    sq.common.sellerName,
                    animateOnObfuscate: false,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // 星評価の表示
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFC107),
                        size: 16,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        sellerRating.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.black38,
            ),
          ],
        ),
      ),
    );
  }
}

/// 商品説明エリア
class _ItemDescriptionArea extends StatelessWidget {
  const _ItemDescriptionArea({required this.sq});

  final $market.Translations sq;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: UnreadableText(
        sq.common.itemDescription,
        animateOnObfuscate: false,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
          height: 1.6,
        ),
      ),
    );
  }
}

/// 購入手続きへボタン（画面下部に常駐）
class _BuyButton extends ConsumerWidget {
  const _BuyButton({required this.quizType, required this.sq});

  final MarketQuizType quizType;
  final $market.Translations sq;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(fleaMarketQuizProvider(quizType).notifier);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: notifier.tapBuyButton,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD93025),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: UnreadableText(
              sq.common.buyButton,
              animateOnObfuscate: false,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
