import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../domain/entities/weather_city.dart';
import 'components/radar_map_full_screen.dart';
import 'components/weather_scroll_view.dart';
import 'weather_app_notifier.dart';

class WeatherAppScaffold extends ConsumerStatefulWidget {
  const WeatherAppScaffold({
    super.key,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    this.hintUsed = false,
    this.onHintTap,
    this.overlays = const [],
    this.highlightCitySwipe = false,
    this.highlightRefresh = false,
    this.highlightWednesdayForecast = false,
    this.highlightRadarMap = false,
  });

  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;
  final bool hintUsed;
  final VoidCallback? onHintTap;
  final List<Widget> overlays;
  final bool highlightCitySwipe;
  final bool highlightRefresh;
  final bool highlightWednesdayForecast;
  final bool highlightRadarMap;

  @override
  ConsumerState<WeatherAppScaffold> createState() => _WeatherAppScaffoldState();
}

class _WeatherAppScaffoldState extends ConsumerState<WeatherAppScaffold> {
  late final PageController _pageController;
  bool _isRadarMapOpen = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didUpdateWidget(WeatherAppScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.quizStatus != widget.quizStatus &&
        widget.quizStatus == QuizStatus.idle) {
      _isRadarMapOpen = false;
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherAppProvider);
    final notifier = ref.read(weatherAppProvider.notifier);
    final ext = Theme.of(context).extension<WeatherAppTheme>()!;

    return PopScope(
      canPop: widget.quizStatus != QuizStatus.playing,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        if (_isRadarMapOpen) {
          setState(() => _isRadarMapOpen = false);
          return;
        }
        final confirmed = await QuizExitScope.showConfirmDialog(context);
        if ((confirmed ?? false) && mounted) {
          // mounted チェック後のため BuildContext 利用は安全
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: ext.scaffoldBackground,
            appBar: _WeatherAppBar(
              currentCity: weatherState.currentCity,
              cities: weatherState.cities,
              currentIndex: weatherState.currentCityIndex,
              highlightCitySwipe: widget.highlightCitySwipe,
            ),
            body: PageView.builder(
              controller: _pageController,
              itemCount: weatherState.cities.length,
              onPageChanged: notifier.changeCity,
              itemBuilder: (context, index) {
                final city = weatherState.cities[index];
                return WeatherScrollView(
                  city: city,
                  onRefresh: notifier.refreshWeather,
                  onExpandForecast: notifier.expandDailyForecast,
                  onRadarMapTap: () {
                    notifier.openRadarMap();
                    setState(() => _isRadarMapOpen = true);
                  },
                  cityWidget: _CityHeaderCard(city: city),
                  highlightRefresh: widget.highlightRefresh,
                  highlightWednesdayForecast: widget.highlightWednesdayForecast,
                  highlightRadarMap: widget.highlightRadarMap,
                );
              },
            ),
          ),
          if (widget.quizStatus == QuizStatus.playing)
            FloatingMissionBubble(
              remainingSeconds: widget.remainingSeconds,
              missionText: widget.missionText,
              hintUsed: widget.hintUsed,
              timeLimitSeconds: widget.timeLimitSeconds,
              onHintTap: widget.onHintTap,
              onGiveUp: widget.onGiveUp,
            ),
          if (_isRadarMapOpen)
            Positioned.fill(
              child: RadarMapFullScreen(
                onBack: () => setState(() => _isRadarMapOpen = false),
              ),
            ),
          ...widget.overlays,
        ],
      ),
    );
  }
}

class _WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _WeatherAppBar({
    required this.currentCity,
    required this.cities,
    required this.currentIndex,
    this.highlightCitySwipe = false,
  });

  final WeatherCity currentCity;
  final List<WeatherCity> cities;
  final int currentIndex;
  final bool highlightCitySwipe;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<WeatherAppTheme>()!;

    final dotsRow = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(cities.length, (i) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: currentIndex == i ? 16 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: currentIndex == i
                ? ext.appBarTextColor
                : ext.appBarTextColor.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );

    return AppBar(
      backgroundColor: ext.appBarColor,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          UnreadableText(
            currentCity.name,
            animateOnObfuscate: false,
            style: TextStyle(
              color: ext.appBarTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (highlightCitySwipe)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ext.highlightBorderColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
                color: ext.highlightBorderColor.withValues(alpha: 0.1),
              ),
              child: dotsRow,
            )
          else
            dotsRow,
        ],
      ),
      iconTheme: IconThemeData(color: ext.appBarTextColor),
    );
  }
}

class _CityHeaderCard extends StatelessWidget {
  const _CityHeaderCard({required this.city});

  final WeatherCity city;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<WeatherAppTheme>()!;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: ext.headerGradient,
      ),
      child: Column(
        children: [
          const Text('🌤️', style: TextStyle(fontSize: 64)),
          const SizedBox(height: 8),
          UnreadableText(
            '${city.currentTemp}°C',
            animateOnObfuscate: false,
            style: TextStyle(
              color: ext.appBarTextColor,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
