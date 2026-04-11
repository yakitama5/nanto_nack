import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/entities/map_place.dart';
import '../domain/map_catalog.dart';
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
    this.onTransportSelect,
    this.highlightLocationButton = false,
    this.highlightSearchBar = false,
    this.highlightDirectionsButton = false,
    this.highlightFavoriteButton = false,
    this.isNavigating = false,
    this.navigationStep = 0,
    this.searchQuery = '',
    this.isFavorite = false,
    this.selectedTransportIndex,
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

  /// 交通手段選択コールバック（インデックスを引数に取る）
  final void Function(int transportIndex)? onTransportSelect;

  final bool highlightLocationButton;
  final bool highlightSearchBar;
  final bool highlightDirectionsButton;
  final bool highlightFavoriteButton;
  final bool isNavigating;
  final int navigationStep;
  final String searchQuery;
  final bool isFavorite;

  /// 現在選択されている交通手段インデックス
  final int? selectedTransportIndex;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final theme = Theme.of(context);
    final ext = theme.extension<NantoNackThemeExtension>()!;
    final mapGreen = ext.mapCategoryColor;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

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
          // 地図エリア（疑似マップ・スクロール可能）
          // RepaintBoundary で囲み、タイマー更新など地図と無関係な rebuild が
          // GPU 再描画（チラつき）に波及しないよう分離する。
          Positioned.fill(
            child: RepaintBoundary(
              child: _MapCanvas(
                places: places,
                selectedPlace: selectedPlace,
                locationShown: locationShown,
                mapColor: mapGreen,
                onPlaceSelect: onPlaceSelect,
              ),
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
            bottom: 160 + bottomInset,
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
            bottom: 220 + bottomInset,
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
              child: SafeArea(
                top: false,
                left: false,
                right: false,
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
                routeDistanceKm: selectedPlace != null
                    ? (MapCatalog.placeDistancesKm[selectedPlace!.id] ??
                        MapCatalog.routeDistanceKm)
                    : MapCatalog.routeDistanceKm,
                routeMinutes: selectedPlace != null &&
                        selectedTransportIndex != null
                    ? MapCatalog.calcRouteMinutes(
                        selectedPlace!.id,
                        selectedTransportIndex!,
                      )
                    : null,
                selectedTransportIndex: selectedTransportIndex,
                onTransportSelect: onTransportSelect,
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

/// 疑似マップキャンバス（パン操作でスクロール可能）
class _MapCanvas extends StatefulWidget {
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
  State<_MapCanvas> createState() => _MapCanvasState();
}

class _MapCanvasState extends State<_MapCanvas> {
  /// スクリーンに対するキャンバスの拡大倍率
  static const double _mapScale = 2.5;

  Offset _mapOffset = Offset.zero;
  bool _offsetInitialized = false;
  double _prevSw = 0;
  double _prevSh = 0;

  /// 場所ごとのタップコールバックキャッシュ。
  /// onPlaceSelect が変わった時だけ再生成し、毎フレームのクロージャ生成による
  /// _PlacePin の不要な更新（チラつき）を防ぐ。
  Map<String, VoidCallback?> _tapCallbacks = {};

  @override
  void initState() {
    super.initState();
    _rebuildTapCallbacks();
  }

  @override
  void didUpdateWidget(_MapCanvas oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.onPlaceSelect != widget.onPlaceSelect) {
      _rebuildTapCallbacks();
    }
  }

  void _rebuildTapCallbacks() {
    _tapCallbacks = {
      for (final place in widget.places)
        place.id: widget.onPlaceSelect != null
            ? () => widget.onPlaceSelect!(place)
            : null,
    };
  }

  void _applyDelta(Offset delta, double maxDx, double maxDy) {
    setState(() {
      _mapOffset = Offset(
        (_mapOffset.dx + delta.dx).clamp(-maxDx, 0),
        (_mapOffset.dy + delta.dy).clamp(-maxDy, 0),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<NantoNackThemeExtension>()!;
    final pinColors = ext.mapPinColors;

    // LayoutBuilder で実際の制約幅を取得する。
    // MediaQuery.sizeOf はデスクトップWeb で ResponsiveFramework の
    // 制約を反映しないことがあるため LayoutBuilder を使用する。
    return LayoutBuilder(
      builder: (context, constraints) {
        final sw = constraints.maxWidth;
        final sh = constraints.maxHeight;
        final maxDx = sw * (_mapScale - 1);
        final maxDy = sh * (_mapScale - 1);
        final canvasWidth = sw * _mapScale;
        final canvasHeight = sh * _mapScale;

        // 初回 build 時のみ: キャンバス中央が画面中央に来るよう設定。
        // setState は呼ばず直接代入（同 build 内で読むため問題なし）。
        // Web ブラウザでは初回フレームで maxHeight が 0 を返す場合があるため、
        // sw > 0 && sh > 0 が確定してから初期化する。
        if (!_offsetInitialized && sw > 0 && sh > 0) {
          _offsetInitialized = true;
          _prevSw = sw;
          _prevSh = sh;
          _mapOffset = Offset(
            -sw * (_mapScale - 1) / 2,
            -sh * (_mapScale - 1) / 2,
          );
        } else if (_offsetInitialized &&
            sw > 0 &&
            sh > 0 &&
            (sw != _prevSw || sh != _prevSh)) {
          // サイズが 0 のフレームは無視する。
          // sh=0 のまま clamp すると maxDy=0 となり _mapOffset が Offset.zero に
          // リセットされて地図が左上に固定されてしまうため。
          _prevSw = sw;
          _prevSh = sh;
          _mapOffset = Offset(
            _mapOffset.dx.clamp(-maxDx, 0),
            _mapOffset.dy.clamp(-maxDy, 0),
          );
        }

        // サイズが未確定または一時的に 0 の場合は空ウィジェットを返す。
        // sw/sh=0 のままキャンバスを生成すると canvasWidth=0 の SizedBox が
        // 一瞬描画されてチラつきの原因になるため。
        if (!_offsetInitialized || sw == 0 || sh == 0) {
          return const SizedBox.expand();
        }

        // GestureDetector の onPanUpdate はデスクトップWeb（Chrome）でマウス
        // ドラッグを拾えないため、ジェスチャーアリーナを介さない Listener を使用。
        // event.buttons != 0 でボタン押下中（タッチ含む）の移動のみ反応させる。
        return Listener(
          behavior: HitTestBehavior.opaque,
          onPointerMove: (event) {
            if (event.buttons != 0) _applyDelta(event.delta, maxDx, maxDy);
          },
          child: ClipRect(
            // Positioned.fill が渡す tight constraints により SizedBox が
            // sw × sh に制限されるのを防ぐため、OverflowBox で制約を解除する。
            // OverflowBox 自身は sw × sh を保持し ClipRect の基準となる。
            child: OverflowBox(
              alignment: Alignment.topLeft,
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: Transform.translate(
                offset: _mapOffset,
                child: SizedBox(
                  width: canvasWidth,
                  height: canvasHeight,
                  child: CustomPaint(
                    painter: _MapPainter(mapColor: widget.mapColor),
                    child: Stack(
                      children: [
                        // 場所のピン
                        for (final place in widget.places)
                          _PlacePin(
                            place: place,
                            isSelected: widget.selectedPlace?.id == place.id,
                            color: pinColors[place.colorSeed % pinColors.length],
                            canvasWidth: canvasWidth,
                            canvasHeight: canvasHeight,
                            onTap: _tapCallbacks[place.id],
                          ),
                        // 現在地インジケータ（キャンバス中央 = 画面初期中央）
                        if (widget.locationShown)
                          Positioned(
                            left: canvasWidth / 2 - 10,
                            top: canvasHeight / 2 - 10,
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
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;
    final roadMinor = Paint()
      ..color = Colors.white70
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    // キャンバス全体を 10% ピッチで均等にグリッド道路を描画する。
    // 10% canvas = 画面幅の 25% 間隔 → 端付近の空白を抑える。
    // 偶数インデックス（0.2, 0.4, ...）は主要道路、奇数は細道。
    for (var i = 1; i <= 9; i++) {
      final frac = i / 10.0;
      final paint = i % 2 == 0 ? road : roadMinor;
      // 横道
      canvas.drawLine(
        Offset(0, size.height * frac),
        Offset(size.width, size.height * frac),
        paint,
      );
      // 縦道
      canvas.drawLine(
        Offset(size.width * frac, 0),
        Offset(size.width * frac, size.height),
        paint,
      );
    }
    // 端付近（5% / 95%）の補助道路: スクロール端でも道がある印象を与える
    for (final frac in [0.05, 0.95]) {
      canvas.drawLine(
        Offset(0, size.height * frac),
        Offset(size.width, size.height * frac),
        roadMinor,
      );
      canvas.drawLine(
        Offset(size.width * frac, 0),
        Offset(size.width * frac, size.height),
        roadMinor,
      );
    }

    final parkPaint = Paint()..color = const Color(0xFFB7DFB5);

    // 公園1: 中央（初期表示で見える位置 = キャンバス中央付近）
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.42,
        size.height * 0.41,
        size.width * 0.16,
        size.height * 0.18,
      ),
      parkPaint,
    );
    // 公園2: 左上（スクロール先）
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.08,
        size.height * 0.08,
        size.width * 0.12,
        size.height * 0.12,
      ),
      parkPaint,
    );
    // 公園3: 右下（スクロール先）
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.72,
        size.height * 0.72,
        size.width * 0.16,
        size.height * 0.16,
      ),
      parkPaint,
    );
    // 公園4: 左下
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.06,
        size.height * 0.74,
        size.width * 0.12,
        size.height * 0.09,
      ),
      parkPaint,
    );
    // 公園5: 右上
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.80,
        size.height * 0.07,
        size.width * 0.12,
        size.height * 0.09,
      ),
      parkPaint,
    );

    // 水域（池）: 2 か所
    final waterPaint = Paint()
      ..color = const Color(0xFF90CAF9)
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.72, size.height * 0.24),
        width: size.width * 0.08,
        height: size.height * 0.05,
      ),
      waterPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.22, size.height * 0.75),
        width: size.width * 0.07,
        height: size.height * 0.04,
      ),
      waterPaint,
    );
  }

  @override
  bool shouldRepaint(_MapPainter oldDelegate) =>
      oldDelegate.mapColor != mapColor;
}

class _PlacePin extends StatelessWidget {
  const _PlacePin({
    required this.place,
    required this.isSelected,
    required this.color,
    required this.canvasWidth,
    required this.canvasHeight,
    this.onTap,
  });

  final MapPlace place;
  final bool isSelected;
  final Color color;
  final double canvasWidth;
  final double canvasHeight;
  final VoidCallback? onTap;

  /// キャンバス座標系でのピン位置
  ///
  /// スクリーン座標系の位置 (dx, dy) を、キャンバスが 2.5 倍・中央起点で
  /// 表示される場合のキャンバス座標 ((dx + 0.75) / 2.5, (dy + 0.75) / 2.5) に変換した値。
  static const _positions = <String, Offset>{
    'p1': Offset(0.40, 0.40),
    'p2': Offset(0.50, 0.492),
    'p3': Offset(0.588, 0.412),
    'p4': Offset(0.60, 0.56),
    'p5': Offset(0.412, 0.58),
  };

  @override
  Widget build(BuildContext context) {
    final pos = _positions[place.id] ?? const Offset(0.5, 0.5);
    return Positioned(
      left: canvasWidth * pos.dx - 18,
      top: canvasHeight * pos.dy - 36,
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
  bool shouldRepaint(_PinTailPainter oldDelegate) =>
      oldDelegate.color != color;
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
    required this.routeDistanceKm,
    this.routeMinutes,
    this.selectedTransportIndex,
    this.onTransportSelect,
    this.onNavigationStart,
  });

  final $map.Translations sq;
  final int step;

  /// 現在選択中の目的地までの距離（km）
  final double routeDistanceKm;

  /// 現在選択中の目的地・交通手段での移動時間（分）。交通手段未選択時は null
  final int? routeMinutes;

  final int? selectedTransportIndex;
  final void Function(int)? onTransportSelect;
  final VoidCallback? onNavigationStart;

  static const _transportIcons = [
    Icons.directions_car,
    Icons.directions_walk,
    Icons.directions_transit,
    Icons.directions_bike,
  ];

  List<String> _transportLabels(BuildContext context) => [
        sq.common.drive,
        sq.common.walk,
        sq.common.transit,
        sq.common.bike,
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 交通手段選択（タップ可能）
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < _transportIcons.length; i++)
                    _TransportOption(
                      icon: _transportIcons[i],
                      label: _transportLabels(context)[i],
                      isSelected: i == selectedTransportIndex,
                      onTap: onTransportSelect != null
                          ? () => onTransportSelect!(i)
                          : null,
                    ),
                ],
              ),
              const SizedBox(height: 12),
              // ルート情報
              Row(
                children: [
                  if (routeMinutes != null) ...[
                    const Icon(Icons.access_time, size: 18, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      '$routeMinutes ${sq.common.min}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                  const Icon(Icons.straighten, size: 18, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(
                    '$routeDistanceKm ${sq.common.km}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // 開始ボタン（交通手段選択後のみ有効）
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: selectedTransportIndex != null ? onNavigationStart : null,
                  icon: const Icon(Icons.navigation, size: 18),
                  label: Text(
                    CustomLanguageEncoder.encode(sq.common.startNavigation),
                    style: const TextStyle(fontSize: 16),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TransportOption extends StatelessWidget {
  const _TransportOption({
    required this.icon,
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  final IconData icon;

  /// スクリーンリーダー向けの音声ラベル（例: 「Drive」「Walk」）
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isSelected,
      label: label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.5),
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
          ),
        ),
      ),
    );
  }
}
