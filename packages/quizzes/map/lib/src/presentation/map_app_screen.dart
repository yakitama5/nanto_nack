import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/entities/map_place.dart';
import '../i18n/map_translations_extension.dart';
import '../../i18n/strings.g.dart' as $map;

/// Google マップ風の地図UIベーススクリーン
///
/// 各クイズはこのウィジェットを共通UIとして使用し、
/// コールバックを通じて固有のインタラクションを実装する。
class MapAppScreen extends StatelessWidget {
  const MapAppScreen({
    super.key,
    required this.places,
    required this.selectedPlace,
    required this.locationShown,
    required this.showSearchBar,
    required this.showDirectionsButton,
    required this.showFavoriteButton,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.overlays,
    this.onLocationTap,
    this.onSearchTap,
    this.onPlaceSelect,
    this.onDirectionsTap,
    this.onNavigationStart,
    this.onFavoriteTap,
    this.highlightLocationButton = false,
    this.highlightSearchBar = false,
    this.highlightDirectionsButton = false,
    this.highlightFavoriteButton = false,
    this.isNavigating = false,
    this.navigationStep = 0,
    this.searchQuery = '',
    this.isFavorite = false,
  });

  final List<MapPlace> places;
  final MapPlace? selectedPlace;
  final bool locationShown;
  final bool showSearchBar;
  final bool showDirectionsButton;
  final bool showFavoriteButton;
  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;
  final List<Widget> overlays;

  final VoidCallback? onLocationTap;
  final VoidCallback? onSearchTap;
  final void Function(MapPlace place)? onPlaceSelect;
  final VoidCallback? onDirectionsTap;
  final VoidCallback? onNavigationStart;
  final VoidCallback? onFavoriteTap;

  final bool highlightLocationButton;
  final bool highlightSearchBar;
  final bool highlightDirectionsButton;
  final bool highlightFavoriteButton;
  final bool isNavigating;
  final int navigationStep;
  final String searchQuery;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final theme = Theme.of(context);
    final ext = theme.extension<NantoNackThemeExtension>()!;
    final mapGreen = ext.mapCategoryColor;

    return PopScope(
      canPop: quizStatus != QuizStatus.playing,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('ゲームを中断しますか？'),
            content: const Text('プレイ中のゲームを終了します。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('続ける'),
              ),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: const Text('終了する'),
              ),
            ],
          ),
        );
        if (confirmed == true && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFE8F0E9),
      body: Stack(
        children: [
          // 地図エリア（疑似マップ）
          Positioned.fill(
            child: _MapCanvas(
              places: places,
              selectedPlace: selectedPlace,
              locationShown: locationShown,
              mapColor: mapGreen,
              onPlaceSelect: onPlaceSelect,
            ),
          ),
          // 検索バー
          if (showSearchBar)
            Positioned(
              top: MediaQuery.paddingOf(context).top + 8,
              left: 12,
              right: 56,
              child: _SearchBar(
                query: searchQuery,
                hint: sq.common.searchHint,
                highlighted: highlightSearchBar,
                onTap: onSearchTap,
                places: places,
                onPlaceSelect: onPlaceSelect,
              ),
            ),
          // 現在地ボタン
          Positioned(
            bottom: 160,
            right: 12,
            child: _MapFab(
              icon: Icons.my_location,
              tooltip: sq.common.currentLocation,
              highlighted: highlightLocationButton,
              onTap: onLocationTap,
            ),
          ),
          // コンパスボタン
          Positioned(
            bottom: 220,
            right: 12,
            child: _MapFab(
              icon: Icons.explore,
              tooltip: sq.common.explore,
              highlighted: false,
              onTap: () {},
            ),
          ),
          // 選択された場所の詳細パネル
          if (selectedPlace != null && !isNavigating)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _PlaceDetailPanel(
                place: selectedPlace!,
                sq: sq,
                showDirectionsButton: showDirectionsButton,
                showFavoriteButton: showFavoriteButton,
                isFavorite: isFavorite,
                highlightDirectionsButton: highlightDirectionsButton,
                highlightFavoriteButton: highlightFavoriteButton,
                onDirectionsTap: onDirectionsTap,
                onFavoriteTap: onFavoriteTap,
              ),
            ),
          // ナビゲーション中パネル
          if (isNavigating)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _NavigationPanel(
                sq: sq,
                step: navigationStep,
                onNavigationStart: onNavigationStart,
              ),
            ),
          // ミッションバブル
          FloatingMissionBubble(
            remainingSeconds: remainingSeconds,
            missionText: missionText,
            hintUsed: false,
            timeLimitSeconds: timeLimitSeconds,
            onGiveUp: onGiveUp,
          ),
          // オーバーレイ（クリア演出など）
          ...overlays,
        ],
      ),
    ),
    );
  }
}

/// 疑似マップキャンバス
class _MapCanvas extends StatelessWidget {
  const _MapCanvas({
    required this.places,
    required this.selectedPlace,
    required this.locationShown,
    required this.mapColor,
    this.onPlaceSelect,
  });

  final List<MapPlace> places;
  final MapPlace? selectedPlace;
  final bool locationShown;
  final Color mapColor;
  final void Function(MapPlace)? onPlaceSelect;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<NantoNackThemeExtension>()!;
    final pinColors = ext.mapPinColors;

    return CustomPaint(
      painter: _MapPainter(mapColor: mapColor),
      child: Stack(
        children: [
          // 場所のピン
          for (final place in places)
            _PlacePin(
              place: place,
              isSelected: selectedPlace?.id == place.id,
              color: pinColors[place.colorSeed % pinColors.length],
              onTap: onPlaceSelect != null ? () => onPlaceSelect!(place) : null,
            ),
          // 現在地インジケータ
          if (locationShown)
            Center(
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimary,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.4),
                      blurRadius: 12,
                      spreadRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _MapPainter extends CustomPainter {
  const _MapPainter({required this.mapColor});

  final Color mapColor;

  @override
  void paint(Canvas canvas, Size size) {
    final road = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;
    final roadMinor = Paint()
      ..color = Colors.white70
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // 横道
    canvas.drawLine(
      Offset(0, size.height * 0.3),
      Offset(size.width, size.height * 0.3),
      road,
    );
    canvas.drawLine(
      Offset(0, size.height * 0.6),
      Offset(size.width, size.height * 0.6),
      road,
    );
    // 縦道
    canvas.drawLine(
      Offset(size.width * 0.3, 0),
      Offset(size.width * 0.3, size.height),
      road,
    );
    canvas.drawLine(
      Offset(size.width * 0.7, 0),
      Offset(size.width * 0.7, size.height),
      road,
    );
    // 斜め道路
    canvas.drawLine(
      Offset(0, size.height * 0.1),
      Offset(size.width * 0.4, size.height * 0.5),
      roadMinor,
    );
    canvas.drawLine(
      Offset(size.width * 0.6, size.height * 0.5),
      Offset(size.width, size.height * 0.9),
      roadMinor,
    );

    // 公園エリア
    final park = Paint()..color = const Color(0xFFB7DFB5);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.32,
        size.height * 0.32,
        size.width * 0.36,
        size.height * 0.26,
      ),
      park,
    );
  }

  @override
  bool shouldRepaint(_MapPainter oldDelegate) => false;
}

class _PlacePin extends StatelessWidget {
  const _PlacePin({
    required this.place,
    required this.isSelected,
    required this.color,
    this.onTap,
  });

  final MapPlace place;
  final bool isSelected;
  final Color color;
  final VoidCallback? onTap;

  static const _positions = <String, Offset>{
    'p1': Offset(0.25, 0.25),
    'p2': Offset(0.5, 0.48),
    'p3': Offset(0.72, 0.28),
    'p4': Offset(0.75, 0.65),
    'p5': Offset(0.28, 0.7),
  };

  @override
  Widget build(BuildContext context) {
    final pos = _positions[place.id] ?? const Offset(0.5, 0.5);
    return Positioned(
      left: MediaQuery.widthOf(context) * pos.dx - 18,
      top: MediaQuery.heightOf(context) * pos.dy - 36,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isSelected
                  ? color
                  : color.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(8),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Icon(place.icon, color: Colors.white, size: 18),
          ),
          CustomPaint(
            size: const Size(12, 6),
            painter: _PinTailPainter(color: color),
          ),
        ],
        ),
      ),
    );
  }
}

class _PinTailPainter extends CustomPainter {
  const _PinTailPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_PinTailPainter oldDelegate) => false;
}

/// 検索バー
class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.query,
    required this.hint,
    required this.highlighted,
    required this.places,
    this.onTap,
    this.onPlaceSelect,
  });

  final String query;
  final String hint;
  final bool highlighted;
  final List<MapPlace> places;
  final VoidCallback? onTap;
  final void Function(MapPlace)? onPlaceSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              border: highlighted
                  ? Border.all(
                      color:
                          Theme.of(context).colorScheme.primary,
                      width: 2,
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: highlighted
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    query.isEmpty
                        ? CustomLanguageEncoder.encode(hint)
                        : CustomLanguageEncoder.encode(query),
                    style: TextStyle(
                      color:
                          query.isEmpty ? Colors.grey : Colors.black87,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        // 検索候補リスト（タップ後）
        if (query.isNotEmpty && onPlaceSelect != null)
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                for (final place in places)
                  ListTile(
                    leading: Icon(
                      place.icon,
                      size: 20,
                      color: Colors.grey,
                    ),
                    title: UnreadableText(
                      place.name,
                      style: const TextStyle(fontSize: 14),
                    ),
                    subtitle: UnreadableText(
                      place.address,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    dense: true,
                    onTap: () => onPlaceSelect!(place),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

/// 丸ボタン（FAB風）
class _MapFab extends StatelessWidget {
  const _MapFab({
    required this.icon,
    required this.tooltip,
    required this.highlighted,
    this.onTap,
  });

  final IconData icon;
  final String tooltip;
  final bool highlighted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: highlighted
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 22,
          color: highlighted
              ? Theme.of(context).colorScheme.primary
              : Colors.grey.shade700,
        ),
      ),
    );
  }
}

/// 場所詳細パネル（下部に表示）
class _PlaceDetailPanel extends StatelessWidget {
  const _PlaceDetailPanel({
    required this.place,
    required this.sq,
    required this.showDirectionsButton,
    required this.showFavoriteButton,
    required this.isFavorite,
    required this.highlightDirectionsButton,
    required this.highlightFavoriteButton,
    this.onDirectionsTap,
    this.onFavoriteTap,
  });

  final MapPlace place;
  final $map.Translations sq;
  final bool showDirectionsButton;
  final bool showFavoriteButton;
  final bool isFavorite;
  final bool highlightDirectionsButton;
  final bool highlightFavoriteButton;
  final VoidCallback? onDirectionsTap;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(place.icon, size: 24, color: Colors.grey.shade700),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UnreadableText(
                      place.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    UnreadableText(
                      place.address,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              if (showFavoriteButton)
                GestureDetector(
                  onTap: onFavoriteTap,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(8),
                    decoration: highlightFavoriteButton
                        ? BoxDecoration(
                            color: Colors.yellow.shade50,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.yellow.shade600,
                              width: 2,
                            ),
                          )
                        : null,
                    child: Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                      color: isFavorite
                          ? Colors.yellow.shade700
                          : highlightFavoriteButton
                              ? Colors.yellow.shade600
                              : Colors.grey,
                      size: 28,
                    ),
                  ),
                ),
            ],
          ),
          if (showDirectionsButton) ...[
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: onDirectionsTap,
              icon: const Icon(Icons.directions, size: 18),
              label: Text(
                CustomLanguageEncoder.encode(sq.common.directions),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: highlightDirectionsButton
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primaryContainer,
                padding: const EdgeInsets.symmetric(vertical: 10),
                minimumSize: const Size(double.infinity, 0),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// ナビゲーション中パネル
class _NavigationPanel extends StatelessWidget {
  const _NavigationPanel({
    required this.sq,
    required this.step,
    this.onNavigationStart,
  });

  final $map.Translations sq;
  final int step;
  final VoidCallback? onNavigationStart;

  static const _transportIcons = [
    Icons.directions_car,
    Icons.directions_walk,
    Icons.directions_transit,
    Icons.directions_bike,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 交通手段選択
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < _transportIcons.length; i++)
                _TransportOption(
                  icon: _transportIcons[i],
                  isSelected: i == 0,
                ),
            ],
          ),
          const SizedBox(height: 12),
          // ルート情報
          Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                '${MapCatalogConstants.routeMinutes} ${sq.common.min}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.straighten, size: 18, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                '${MapCatalogConstants.routeDistanceKm} ${sq.common.km}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // 開始ボタン
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onNavigationStart,
              icon: const Icon(Icons.navigation, size: 18),
              label: Text(
                CustomLanguageEncoder.encode(sq.common.startNavigation),
                style: const TextStyle(fontSize: 16),
              ),
              style: FilledButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TransportOption extends StatelessWidget {
  const _TransportOption({
    required this.icon,
    required this.isSelected,
  });

  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primaryContainer
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border.all(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
              )
            : null,
      ),
      child: Icon(
        icon,
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.grey,
        size: 24,
      ),
    );
  }
}

/// [MapCatalog] のルート情報定数をビュー側で参照するためのヘルパー
abstract class MapCatalogConstants {
  static const double routeDistanceKm = 2.3;
  static const int routeMinutes = 8;
}
