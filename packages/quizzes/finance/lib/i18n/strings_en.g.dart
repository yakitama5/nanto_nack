///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsQuiz1En quiz1 = _TranslationsQuiz1En._(_root);
	@override late final _TranslationsQuiz2En quiz2 = _TranslationsQuiz2En._(_root);
	@override late final _TranslationsQuiz3En quiz3 = _TranslationsQuiz3En._(_root);
	@override late final _TranslationsQuiz4En quiz4 = _TranslationsQuiz4En._(_root);
	@override late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
}

// Path: quiz1
class _TranslationsQuiz1En extends TranslationsQuiz1Ja {
	_TranslationsQuiz1En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'How did the prices move yesterday? Try swiping the chart to go back in time';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'I can\'t see the big picture. Let\'s zoom out to see the full chart';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'I wonder what the exact price was at the peak. Long press to find out!';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Daily charts are hard to read. Let\'s switch to a weekly chart';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Stock Chart';
	@override String get tickerSymbol => 'MOCK';
	@override String get periodOneDay => '1D';
	@override String get periodOneWeek => '1W';
	@override String get periodOneMonth => '1M';
	@override String get periodOneYear => '1Y';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did panning reveal the past?';
	@override String get subtitle => 'Left is past, right is present — a universal rule for charts';
	@override String get panTitle => 'Swipe left or right to move through time';
	@override String get panDesc => 'In chart apps, you can drag the chart left or right to browse different time periods. This is a standard gesture in stock, forex, and crypto chart apps worldwide.';
	@override String get leftTitle => 'Left = Past is standard in financial charts';
	@override String get leftDesc => 'Since time flows from left to right, the left side of a chart represents older data and the right side shows the most recent data. This rule applies universally.';
	@override String get viewTitle => 'Scroll to reveal hidden data';
	@override String get viewDesc => 'Historical data that doesn\'t fit on screen can be revealed by swiping right. This is the standard UI design in major chart apps like TradingView.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did pinch-in zoom out?';
	@override String get subtitle => 'Closing two fingers = zoom out is the world standard gesture';
	@override String get pinchTitle => 'Pinch-in is the intuitive zoom-out gesture';
	@override String get pinchDesc => 'Pinching in (closing two fingers) to zoom out is a universally established touch operation shared across both iOS and Android.';
	@override String get zoomTitle => 'Zooming out reveals the big picture';
	@override String get zoomDesc => 'Zooming out on a stock chart makes long-term trends and patterns easier to see. Seeing the bigger picture is fundamental to trading decisions.';
	@override String get overviewTitle => 'Find the optimal view with zoom in/out';
	@override String get overviewDesc => 'Pinch-in for a macro perspective, pinch-out for micro analysis. This is a core technique that investors use to master chart apps.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did long press reveal the price?';
	@override String get subtitle => 'The crosshair is a precision tool for reading exact prices';
	@override String get crosshairTitle => 'Touch to reveal the crosshair';
	@override String get crosshairDesc => 'Long pressing a chart displays horizontal and vertical crosshairs, with the exact price shown in a tooltip. This is adopted by TradingView and many other chart apps.';
	@override String get tooltipTitle => 'Tooltip gives you the exact price';
	@override String get tooltipDesc => 'The tooltip that appears with the crosshair shows the precise price at that moment. Even values that are hard to read visually can be confirmed accurately.';
	@override String get longpressTitle => 'Long press is the gesture to switch to precision mode';
	@override String get longpressDesc => 'By distinguishing it from a normal tap, it lets users signal their intent to investigate. Long press is a universal gesture for precision operations.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did tapping a chip change the period?';
	@override String get subtitle => '1D, 1W, 1M chips are a universal chart app UI';
	@override String get chipTitle => 'Short-label chips are the period switching UI';
	@override String get chipDesc => 'Chips like 1D (1 day), 1W (1 week), 1M (1 month), and 1Y (1 year) are used in chart apps worldwide including TradingView and Yahoo Finance.';
	@override String get periodTitle => 'Switching periods changes the resolution of your view';
	@override String get periodDesc => 'A 1-day chart is great for detailed price movements, but a 1-week or 1-month chart is more effective for understanding trends.';
	@override String get activeTitle => 'Active state shows which period you\'re viewing';
	@override String get activeDesc => 'The selected chip is highlighted so you can see at a glance which time period\'s data you\'re viewing. This is the principle of current position display in UI design.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'How did the prices move yesterday? Try swiping the chart to go back in time',
			'quiz1.insight.title' => 'How did panning reveal the past?',
			'quiz1.insight.subtitle' => 'Left is past, right is present — a universal rule for charts',
			'quiz1.insight.panTitle' => 'Swipe left or right to move through time',
			'quiz1.insight.panDesc' => 'In chart apps, you can drag the chart left or right to browse different time periods. This is a standard gesture in stock, forex, and crypto chart apps worldwide.',
			'quiz1.insight.leftTitle' => 'Left = Past is standard in financial charts',
			'quiz1.insight.leftDesc' => 'Since time flows from left to right, the left side of a chart represents older data and the right side shows the most recent data. This rule applies universally.',
			'quiz1.insight.viewTitle' => 'Scroll to reveal hidden data',
			'quiz1.insight.viewDesc' => 'Historical data that doesn\'t fit on screen can be revealed by swiping right. This is the standard UI design in major chart apps like TradingView.',
			'quiz2.missionText' => 'I can\'t see the big picture. Let\'s zoom out to see the full chart',
			'quiz2.insight.title' => 'How did pinch-in zoom out?',
			'quiz2.insight.subtitle' => 'Closing two fingers = zoom out is the world standard gesture',
			'quiz2.insight.pinchTitle' => 'Pinch-in is the intuitive zoom-out gesture',
			'quiz2.insight.pinchDesc' => 'Pinching in (closing two fingers) to zoom out is a universally established touch operation shared across both iOS and Android.',
			'quiz2.insight.zoomTitle' => 'Zooming out reveals the big picture',
			'quiz2.insight.zoomDesc' => 'Zooming out on a stock chart makes long-term trends and patterns easier to see. Seeing the bigger picture is fundamental to trading decisions.',
			'quiz2.insight.overviewTitle' => 'Find the optimal view with zoom in/out',
			'quiz2.insight.overviewDesc' => 'Pinch-in for a macro perspective, pinch-out for micro analysis. This is a core technique that investors use to master chart apps.',
			'quiz3.missionText' => 'I wonder what the exact price was at the peak. Long press to find out!',
			'quiz3.insight.title' => 'How did long press reveal the price?',
			'quiz3.insight.subtitle' => 'The crosshair is a precision tool for reading exact prices',
			'quiz3.insight.crosshairTitle' => 'Touch to reveal the crosshair',
			'quiz3.insight.crosshairDesc' => 'Long pressing a chart displays horizontal and vertical crosshairs, with the exact price shown in a tooltip. This is adopted by TradingView and many other chart apps.',
			'quiz3.insight.tooltipTitle' => 'Tooltip gives you the exact price',
			'quiz3.insight.tooltipDesc' => 'The tooltip that appears with the crosshair shows the precise price at that moment. Even values that are hard to read visually can be confirmed accurately.',
			'quiz3.insight.longpressTitle' => 'Long press is the gesture to switch to precision mode',
			'quiz3.insight.longpressDesc' => 'By distinguishing it from a normal tap, it lets users signal their intent to investigate. Long press is a universal gesture for precision operations.',
			'quiz4.missionText' => 'Daily charts are hard to read. Let\'s switch to a weekly chart',
			'quiz4.insight.title' => 'How did tapping a chip change the period?',
			'quiz4.insight.subtitle' => '1D, 1W, 1M chips are a universal chart app UI',
			'quiz4.insight.chipTitle' => 'Short-label chips are the period switching UI',
			'quiz4.insight.chipDesc' => 'Chips like 1D (1 day), 1W (1 week), 1M (1 month), and 1Y (1 year) are used in chart apps worldwide including TradingView and Yahoo Finance.',
			'quiz4.insight.periodTitle' => 'Switching periods changes the resolution of your view',
			'quiz4.insight.periodDesc' => 'A 1-day chart is great for detailed price movements, but a 1-week or 1-month chart is more effective for understanding trends.',
			'quiz4.insight.activeTitle' => 'Active state shows which period you\'re viewing',
			'quiz4.insight.activeDesc' => 'The selected chip is highlighted so you can see at a glance which time period\'s data you\'re viewing. This is the principle of current position display in UI design.',
			'common.appTitle' => 'Stock Chart',
			'common.tickerSymbol' => 'MOCK',
			'common.periodOneDay' => '1D',
			'common.periodOneWeek' => '1W',
			'common.periodOneMonth' => '1M',
			'common.periodOneYear' => '1Y',
			_ => null,
		};
	}
}
