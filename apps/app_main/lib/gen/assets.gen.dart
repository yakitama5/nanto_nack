// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/weather
  $AssetsImagesWeatherGen get weather => const $AssetsImagesWeatherGen();
}

class $AssetsLauncherIconGen {
  const $AssetsLauncherIconGen();

  /// File path: assets/launcher_icon/icon_adaptive_dev.png
  AssetGenImage get iconAdaptiveDev =>
      const AssetGenImage('assets/launcher_icon/icon_adaptive_dev.png');

  /// File path: assets/launcher_icon/icon_adaptive_monochrome_dev.png
  AssetGenImage get iconAdaptiveMonochromeDev => const AssetGenImage(
    'assets/launcher_icon/icon_adaptive_monochrome_dev.png',
  );

  /// File path: assets/launcher_icon/icon_adaptive_monochrome_prod.png
  AssetGenImage get iconAdaptiveMonochromeProd => const AssetGenImage(
    'assets/launcher_icon/icon_adaptive_monochrome_prod.png',
  );

  /// File path: assets/launcher_icon/icon_adaptive_prod.png
  AssetGenImage get iconAdaptiveProd =>
      const AssetGenImage('assets/launcher_icon/icon_adaptive_prod.png');

  /// File path: assets/launcher_icon/icon_dev.png
  AssetGenImage get iconDev =>
      const AssetGenImage('assets/launcher_icon/icon_dev.png');

  /// File path: assets/launcher_icon/icon_prod.png
  AssetGenImage get iconProd =>
      const AssetGenImage('assets/launcher_icon/icon_prod.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    iconAdaptiveDev,
    iconAdaptiveMonochromeDev,
    iconAdaptiveMonochromeProd,
    iconAdaptiveProd,
    iconDev,
    iconProd,
  ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/coffee.json
  String get coffee => 'assets/lottie/coffee.json';

  /// File path: assets/lottie/splash.json
  String get splashJson => 'assets/lottie/splash.json';

  /// File path: assets/lottie/splash.lottie
  String get splashLottie => 'assets/lottie/splash.lottie';

  /// List of all assets
  List<String> get values => [coffee, splashJson, splashLottie];
}

class $AssetsImagesWeatherGen {
  const $AssetsImagesWeatherGen();

  /// File path: assets/images/weather/cloudy_day.png
  AssetGenImage get cloudyDay =>
      const AssetGenImage('assets/images/weather/cloudy_day.png');

  /// File path: assets/images/weather/cloudy_evening.png
  AssetGenImage get cloudyEvening =>
      const AssetGenImage('assets/images/weather/cloudy_evening.png');

  /// File path: assets/images/weather/cloudy_night.png
  AssetGenImage get cloudyNight =>
      const AssetGenImage('assets/images/weather/cloudy_night.png');

  /// File path: assets/images/weather/rainy_day.png
  AssetGenImage get rainyDay =>
      const AssetGenImage('assets/images/weather/rainy_day.png');

  /// File path: assets/images/weather/rainy_evening.png
  AssetGenImage get rainyEvening =>
      const AssetGenImage('assets/images/weather/rainy_evening.png');

  /// File path: assets/images/weather/rainy_night.png
  AssetGenImage get rainyNight =>
      const AssetGenImage('assets/images/weather/rainy_night.png');

  /// File path: assets/images/weather/snowy_day.png
  AssetGenImage get snowyDay =>
      const AssetGenImage('assets/images/weather/snowy_day.png');

  /// File path: assets/images/weather/snowy_evening.png
  AssetGenImage get snowyEvening =>
      const AssetGenImage('assets/images/weather/snowy_evening.png');

  /// File path: assets/images/weather/snowy_night.png
  AssetGenImage get snowyNight =>
      const AssetGenImage('assets/images/weather/snowy_night.png');

  /// File path: assets/images/weather/sunny_day.png
  AssetGenImage get sunnyDay =>
      const AssetGenImage('assets/images/weather/sunny_day.png');

  /// File path: assets/images/weather/sunny_evening.png
  AssetGenImage get sunnyEvening =>
      const AssetGenImage('assets/images/weather/sunny_evening.png');

  /// File path: assets/images/weather/sunny_night.png
  AssetGenImage get sunnyNight =>
      const AssetGenImage('assets/images/weather/sunny_night.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    cloudyDay,
    cloudyEvening,
    cloudyNight,
    rainyDay,
    rainyEvening,
    rainyNight,
    snowyDay,
    snowyEvening,
    snowyNight,
    sunnyDay,
    sunnyEvening,
    sunnyNight,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLauncherIconGen launcherIcon = $AssetsLauncherIconGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
