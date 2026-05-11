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
class TranslationsXx extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsXx({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.xx,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <xx>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsXx _root = this; // ignore: unused_field

	@override 
	TranslationsXx $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsXx(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsQuiz1Xx quiz1 = _TranslationsQuiz1Xx._(_root);
	@override late final _TranslationsQuiz2Xx quiz2 = _TranslationsQuiz2Xx._(_root);
	@override late final _TranslationsQuiz3Xx quiz3 = _TranslationsQuiz3Xx._(_root);
	@override late final _TranslationsQuiz4Xx quiz4 = _TranslationsQuiz4Xx._(_root);
	@override late final _TranslationsCommonXx common = _TranslationsCommonXx._(_root);
	@override late final _TranslationsCitiesXx cities = _TranslationsCitiesXx._(_root);
	@override late final _TranslationsWeekdaysXx weekdays = _TranslationsWeekdaysXx._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Xx extends TranslationsQuiz1Ja {
	_TranslationsQuiz1Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Swipe to switch city';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Pull down to refresh';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Tap to expand';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Tap to open radar';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Wzgkyzx';
	@override String get cityTitle => '{cityName} Wzgkyzx';
	@override String get currentTemp => 'Kteexyk Zxtr';
	@override String get tempUnit => '{temp}°C';
	@override String get weeklyForecast => '7-Vgi Foxzksaz';
	@override String get hourlyDetail => 'Uotofi Foxzksaz';
	@override String get radarMap => 'Xsvsx Ksw';
	@override String get radarMapDetail => 'Xsvsx Ksw';
	@override String get refreshing => 'Xzfxzaujpk...';
	@override String get lastUpdated => 'Lsaz Hrvsazv';
	@override String get pullToRefresh => 'Woll zo Xzfxzau';
	@override String get sunny => 'Aoppg';
	@override String get cloudy => 'Klosvi';
	@override String get rainy => 'Xsopg';
	@override String get partlyCloudy => 'Wsxzfi Klosvi';
	@override String get quitConfirmTitle => 'Qooz?';
	@override String get quitConfirmMessage => 'Gskz zioa.';
	@override String get continueButton => 'Kopzopoz';
	@override String get quitButton => 'Qooz';
}

// Path: cities
class _TranslationsCitiesXx extends TranslationsCitiesJa {
	_TranslationsCitiesXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get tokyo => 'Zoqgo';
	@override String get osaka => 'Oasqs';
	@override String get sapporo => 'Asrroxo';
}

// Path: weekdays
class _TranslationsWeekdaysXx extends TranslationsWeekdaysJa {
	_TranslationsWeekdaysXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get mon => 'Mop';
	@override String get tue => 'Zoz';
	@override String get wed => 'Wzi';
	@override String get thu => 'Zuox';
	@override String get fri => 'Fxo';
	@override String get sat => 'Asz';
	@override String get sun => 'Aop';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How to switch cities?';
	@override String get subtitle => 'Swipe left or right';
	@override String get swipeTitle => 'Left/right swipe';
	@override String get swipeDesc => 'Swipe pages to switch.';
	@override String get dotTitle => 'Dot indicators';
	@override String get dotDesc => 'Dots show pages.';
	@override String get cityTitle => 'City index';
	@override String get cityDesc => 'Index tracks city.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How to refresh?';
	@override String get subtitle => 'Pull to refresh';
	@override String get pullTitle => 'Pull refresh';
	@override String get pullDesc => 'Pull to update.';
	@override String get indicatorTitle => 'Loading';
	@override String get indicatorDesc => 'Spinner shows loading.';
	@override String get thresholdTitle => 'Pull threshold';
	@override String get thresholdDesc => 'Pull enough to trigger.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How to expand?';
	@override String get subtitle => 'Tap row to expand';
	@override String get expandTitle => 'Tap to expand';
	@override String get expandDesc => 'Tap for details.';
	@override String get arrowTitle => 'Arrow icon';
	@override String get arrowDesc => 'Arrow shows expand.';
	@override String get hourlyTitle => 'Hourly forecast';
	@override String get hourlyDesc => 'See hourly detail.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How to open radar?';
	@override String get subtitle => 'Tap to fullscreen';
	@override String get tapTitle => 'Tap for fullscreen';
	@override String get tapDesc => 'Tap image to expand.';
	@override String get heroTitle => 'Hero animation';
	@override String get heroDesc => 'Smooth transition.';
	@override String get radarTitle => 'Radar map';
	@override String get radarDesc => 'Color shows intensity.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Swipe to switch city',
			'quiz1.insight.title' => 'How to switch cities?',
			'quiz1.insight.subtitle' => 'Swipe left or right',
			'quiz1.insight.swipeTitle' => 'Left/right swipe',
			'quiz1.insight.swipeDesc' => 'Swipe pages to switch.',
			'quiz1.insight.dotTitle' => 'Dot indicators',
			'quiz1.insight.dotDesc' => 'Dots show pages.',
			'quiz1.insight.cityTitle' => 'City index',
			'quiz1.insight.cityDesc' => 'Index tracks city.',
			'quiz2.missionText' => 'Pull down to refresh',
			'quiz2.insight.title' => 'How to refresh?',
			'quiz2.insight.subtitle' => 'Pull to refresh',
			'quiz2.insight.pullTitle' => 'Pull refresh',
			'quiz2.insight.pullDesc' => 'Pull to update.',
			'quiz2.insight.indicatorTitle' => 'Loading',
			'quiz2.insight.indicatorDesc' => 'Spinner shows loading.',
			'quiz2.insight.thresholdTitle' => 'Pull threshold',
			'quiz2.insight.thresholdDesc' => 'Pull enough to trigger.',
			'quiz3.missionText' => 'Tap to expand',
			'quiz3.insight.title' => 'How to expand?',
			'quiz3.insight.subtitle' => 'Tap row to expand',
			'quiz3.insight.expandTitle' => 'Tap to expand',
			'quiz3.insight.expandDesc' => 'Tap for details.',
			'quiz3.insight.arrowTitle' => 'Arrow icon',
			'quiz3.insight.arrowDesc' => 'Arrow shows expand.',
			'quiz3.insight.hourlyTitle' => 'Hourly forecast',
			'quiz3.insight.hourlyDesc' => 'See hourly detail.',
			'quiz4.missionText' => 'Tap to open radar',
			'quiz4.insight.title' => 'How to open radar?',
			'quiz4.insight.subtitle' => 'Tap to fullscreen',
			'quiz4.insight.tapTitle' => 'Tap for fullscreen',
			'quiz4.insight.tapDesc' => 'Tap image to expand.',
			'quiz4.insight.heroTitle' => 'Hero animation',
			'quiz4.insight.heroDesc' => 'Smooth transition.',
			'quiz4.insight.radarTitle' => 'Radar map',
			'quiz4.insight.radarDesc' => 'Color shows intensity.',
			'common.appTitle' => 'Wzgkyzx',
			'common.cityTitle' => '{cityName} Wzgkyzx',
			'common.currentTemp' => 'Kteexyk Zxtr',
			'common.tempUnit' => '{temp}°C',
			'common.weeklyForecast' => '7-Vgi Foxzksaz',
			'common.hourlyDetail' => 'Uotofi Foxzksaz',
			'common.radarMap' => 'Xsvsx Ksw',
			'common.radarMapDetail' => 'Xsvsx Ksw',
			'common.refreshing' => 'Xzfxzaujpk...',
			'common.lastUpdated' => 'Lsaz Hrvsazv',
			'common.pullToRefresh' => 'Woll zo Xzfxzau',
			'common.sunny' => 'Aoppg',
			'common.cloudy' => 'Klosvi',
			'common.rainy' => 'Xsopg',
			'common.partlyCloudy' => 'Wsxzfi Klosvi',
			'common.quitConfirmTitle' => 'Qooz?',
			'common.quitConfirmMessage' => 'Gskz zioa.',
			'common.continueButton' => 'Kopzopoz',
			'common.quitButton' => 'Qooz',
			'cities.tokyo' => 'Zoqgo',
			'cities.osaka' => 'Oasqs',
			'cities.sapporo' => 'Asrroxo',
			'weekdays.mon' => 'Mop',
			'weekdays.tue' => 'Zoz',
			'weekdays.wed' => 'Wzi',
			'weekdays.thu' => 'Zuox',
			'weekdays.fri' => 'Fxo',
			'weekdays.sat' => 'Asz',
			'weekdays.sun' => 'Aop',
			_ => null,
		};
	}
}
