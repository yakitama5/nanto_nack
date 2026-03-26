// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsItemGen {
  const $AssetsItemGen();

  /// File path: assets/item/apple.png
  AssetGenImage get apple => const AssetGenImage('assets/item/apple.png');

  /// File path: assets/item/bakery_bread.png
  AssetGenImage get bakeryBread =>
      const AssetGenImage('assets/item/bakery_bread.png');

  /// File path: assets/item/banana.png
  AssetGenImage get banana => const AssetGenImage('assets/item/banana.png');

  /// File path: assets/item/cocoa_bar.png
  AssetGenImage get cocoaBar =>
      const AssetGenImage('assets/item/cocoa_bar.png');

  /// File path: assets/item/coffee_craft.png
  AssetGenImage get coffeeCraft =>
      const AssetGenImage('assets/item/coffee_craft.png');

  /// File path: assets/item/detergent_daily_wash.png
  AssetGenImage get detergentDailyWash =>
      const AssetGenImage('assets/item/detergent_daily_wash.png');

  /// File path: assets/item/dish_soap_sparkle.png
  AssetGenImage get dishSoapSparkle =>
      const AssetGenImage('assets/item/dish_soap_sparkle.png');

  /// File path: assets/item/eggs.png
  AssetGenImage get eggs => const AssetGenImage('assets/item/eggs.png');

  /// File path: assets/item/haircare_botanic_shine.png
  AssetGenImage get haircareBotanicShine =>
      const AssetGenImage('assets/item/haircare_botanic_shine.png');

  /// File path: assets/item/milk_daily.png
  AssetGenImage get milkDaily =>
      const AssetGenImage('assets/item/milk_daily.png');

  /// File path: assets/item/noodle_bowl.png
  AssetGenImage get noodleBowl =>
      const AssetGenImage('assets/item/noodle_bowl.png');

  /// File path: assets/item/notebook.png
  AssetGenImage get notebook => const AssetGenImage('assets/item/notebook.png');

  /// File path: assets/item/snack_chips.png
  AssetGenImage get snackChips =>
      const AssetGenImage('assets/item/snack_chips.png');

  /// File path: assets/item/soap_wash_power.png
  AssetGenImage get soapWashPower =>
      const AssetGenImage('assets/item/soap_wash_power.png');

  /// File path: assets/item/sponge.png
  AssetGenImage get sponge => const AssetGenImage('assets/item/sponge.png');

  /// File path: assets/item/tea_aqua.png
  AssetGenImage get teaAqua => const AssetGenImage('assets/item/tea_aqua.png');

  /// File path: assets/item/tissue_soft.png
  AssetGenImage get tissueSoft =>
      const AssetGenImage('assets/item/tissue_soft.png');

  /// File path: assets/item/toilet_paper.png
  AssetGenImage get toiletPaper =>
      const AssetGenImage('assets/item/toilet_paper.png');

  /// File path: assets/item/towel.png
  AssetGenImage get towel => const AssetGenImage('assets/item/towel.png');

  /// File path: assets/item/water_pura_aqua.png
  AssetGenImage get waterPuraAqua =>
      const AssetGenImage('assets/item/water_pura_aqua.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    apple,
    bakeryBread,
    banana,
    cocoaBar,
    coffeeCraft,
    detergentDailyWash,
    dishSoapSparkle,
    eggs,
    haircareBotanicShine,
    milkDaily,
    noodleBowl,
    notebook,
    snackChips,
    soapWashPower,
    sponge,
    teaAqua,
    tissueSoft,
    toiletPaper,
    towel,
    waterPuraAqua,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsItemGen item = $AssetsItemGen();
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
