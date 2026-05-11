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
	@override late final _TranslationsCitiesEn cities = _TranslationsCitiesEn._(_root);
	@override late final _TranslationsWeekdaysEn weekdays = _TranslationsWeekdaysEn._(_root);
}

// Path: quiz1
class _TranslationsQuiz1En extends TranslationsQuiz1Ja {
	_TranslationsQuiz1En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Going to Osaka tomorrow. Swipe to check the weather there!';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'The data looks a bit old... pull down to refresh the weather!';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Wednesday looks rainy... what time does it start? Check the hourly forecast!';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'The sky is getting dark! Open the radar map to check the rain clouds!';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Weather';
	@override String get cityTitle => '{cityName} Weather';
	@override String get currentTemp => 'Current Temp';
	@override String get tempUnit => '{temp}°C';
	@override String get weeklyForecast => '7-Day Forecast';
	@override String get hourlyDetail => 'Hourly Forecast';
	@override String get radarMap => 'Radar Map';
	@override String get radarMapDetail => 'Radar Map';
	@override String get refreshing => 'Refreshing...';
	@override String get lastUpdated => 'Last Updated';
	@override String get pullToRefresh => 'Pull to Refresh';
	@override String get sunny => 'Sunny';
	@override String get cloudy => 'Cloudy';
	@override String get rainy => 'Rainy';
	@override String get partlyCloudy => 'Partly Cloudy';
	@override String get quitConfirmTitle => 'Quit Game?';
	@override String get quitConfirmMessage => 'Your current game will end.';
	@override String get continueButton => 'Continue';
	@override String get quitButton => 'Quit';
}

// Path: cities
class _TranslationsCitiesEn extends TranslationsCitiesJa {
	_TranslationsCitiesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tokyo => 'Tokyo';
	@override String get osaka => 'Osaka';
	@override String get sapporo => 'Sapporo';
}

// Path: weekdays
class _TranslationsWeekdaysEn extends TranslationsWeekdaysJa {
	_TranslationsWeekdaysEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get mon => 'Mon';
	@override String get tue => 'Tue';
	@override String get wed => 'Wed';
	@override String get thu => 'Thu';
	@override String get fri => 'Fri';
	@override String get sat => 'Sat';
	@override String get sun => 'Sun';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know swiping changes the city?';
	@override String get subtitle => 'Left/right swipe to switch pages in PageView';
	@override String get swipeTitle => 'Left/right swipe to switch';
	@override String get swipeDesc => 'Weather apps typically use PageView to manage multiple cities and switch between them with left/right swipe. A small peek of the next page at the screen edge intuitively signals \'there\'s more\'.';
	@override String get dotTitle => 'Page indicator (dots)';
	@override String get dotDesc => 'The dots at the bottom show the current page number. The filled dot represents your current position and lets you see the total number of pages at a glance.';
	@override String get cityTitle => 'City list and index';
	@override String get cityDesc => 'Managing weather for multiple cities requires a list of cities and an index tracking which one is currently displayed. The index updates every time the page changes.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know pulling updates the data?';
	@override String get subtitle => 'Pull to Refresh pattern';
	@override String get pullTitle => 'Pull to refresh';
	@override String get pullDesc => 'Pulling down past the top of a list to refresh data — Pull to Refresh — is a standard pattern popularized on iOS/Android. The physical sensation of \'pulling and releasing\' maps to the concept of fetching new data.';
	@override String get indicatorTitle => 'Loading indicator';
	@override String get indicatorDesc => 'Pulling far enough shows a circular loading animation. This feedback tells the user that the refresh action has been accepted.';
	@override String get thresholdTitle => 'Pull threshold';
	@override String get thresholdDesc => 'Requiring a minimum pull distance before triggering a refresh prevents accidental refreshes while distinguishing the action from normal scrolling.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know tapping shows hourly details?';
	@override String get subtitle => 'ExpansionTile (accordion) to reveal details';
	@override String get expandTitle => 'Tap to expand the accordion';
	@override String get expandDesc => 'Tapping a day row to expand hourly details is a standard accordion UI pattern used when there\'s too much data to show at once. It lets users open only what they need.';
	@override String get arrowTitle => 'Arrow icon signals expandability';
	@override String get arrowDesc => 'The \'∨\' or \'›\' icon on the right edge signals that this UI is expandable. It changes to \'∧\' when open, showing the current state (open/closed).';
	@override String get hourlyTitle => 'Reading the hourly forecast';
	@override String get hourlyDesc => 'The hourly forecast shown inside the accordion tells you when rain is expected to start. It\'s a core feature of weather apps that helps users plan their day.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know tapping the image opens it fullscreen?';
	@override String get subtitle => 'Tap to fullscreen with Hero animation';
	@override String get tapTitle => 'Tap image to go fullscreen';
	@override String get tapDesc => 'Tapping a thumbnail image to expand it fullscreen is a common pattern in gallery and map apps. The shared understanding is: \'small things can be tapped to enlarge\'.';
	@override String get heroTitle => 'Hero animation';
	@override String get heroDesc => 'The Hero animation makes the tapped image smoothly expand to fill the screen. By maintaining visual continuity, it eliminates the jarring feeling of an abrupt transition.';
	@override String get radarTitle => 'Reading the radar map';
	@override String get radarDesc => 'Radar maps use color gradients to show rain intensity: blue→green→yellow→red→purple for increasing strength. Fullscreen view helps you accurately track the movement and position of rain clouds.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Going to Osaka tomorrow. Swipe to check the weather there!',
			'quiz1.insight.title' => 'How did you know swiping changes the city?',
			'quiz1.insight.subtitle' => 'Left/right swipe to switch pages in PageView',
			'quiz1.insight.swipeTitle' => 'Left/right swipe to switch',
			'quiz1.insight.swipeDesc' => 'Weather apps typically use PageView to manage multiple cities and switch between them with left/right swipe. A small peek of the next page at the screen edge intuitively signals \'there\'s more\'.',
			'quiz1.insight.dotTitle' => 'Page indicator (dots)',
			'quiz1.insight.dotDesc' => 'The dots at the bottom show the current page number. The filled dot represents your current position and lets you see the total number of pages at a glance.',
			'quiz1.insight.cityTitle' => 'City list and index',
			'quiz1.insight.cityDesc' => 'Managing weather for multiple cities requires a list of cities and an index tracking which one is currently displayed. The index updates every time the page changes.',
			'quiz2.missionText' => 'The data looks a bit old... pull down to refresh the weather!',
			'quiz2.insight.title' => 'How did you know pulling updates the data?',
			'quiz2.insight.subtitle' => 'Pull to Refresh pattern',
			'quiz2.insight.pullTitle' => 'Pull to refresh',
			'quiz2.insight.pullDesc' => 'Pulling down past the top of a list to refresh data — Pull to Refresh — is a standard pattern popularized on iOS/Android. The physical sensation of \'pulling and releasing\' maps to the concept of fetching new data.',
			'quiz2.insight.indicatorTitle' => 'Loading indicator',
			'quiz2.insight.indicatorDesc' => 'Pulling far enough shows a circular loading animation. This feedback tells the user that the refresh action has been accepted.',
			'quiz2.insight.thresholdTitle' => 'Pull threshold',
			'quiz2.insight.thresholdDesc' => 'Requiring a minimum pull distance before triggering a refresh prevents accidental refreshes while distinguishing the action from normal scrolling.',
			'quiz3.missionText' => 'Wednesday looks rainy... what time does it start? Check the hourly forecast!',
			'quiz3.insight.title' => 'How did you know tapping shows hourly details?',
			'quiz3.insight.subtitle' => 'ExpansionTile (accordion) to reveal details',
			'quiz3.insight.expandTitle' => 'Tap to expand the accordion',
			'quiz3.insight.expandDesc' => 'Tapping a day row to expand hourly details is a standard accordion UI pattern used when there\'s too much data to show at once. It lets users open only what they need.',
			'quiz3.insight.arrowTitle' => 'Arrow icon signals expandability',
			'quiz3.insight.arrowDesc' => 'The \'∨\' or \'›\' icon on the right edge signals that this UI is expandable. It changes to \'∧\' when open, showing the current state (open/closed).',
			'quiz3.insight.hourlyTitle' => 'Reading the hourly forecast',
			'quiz3.insight.hourlyDesc' => 'The hourly forecast shown inside the accordion tells you when rain is expected to start. It\'s a core feature of weather apps that helps users plan their day.',
			'quiz4.missionText' => 'The sky is getting dark! Open the radar map to check the rain clouds!',
			'quiz4.insight.title' => 'How did you know tapping the image opens it fullscreen?',
			'quiz4.insight.subtitle' => 'Tap to fullscreen with Hero animation',
			'quiz4.insight.tapTitle' => 'Tap image to go fullscreen',
			'quiz4.insight.tapDesc' => 'Tapping a thumbnail image to expand it fullscreen is a common pattern in gallery and map apps. The shared understanding is: \'small things can be tapped to enlarge\'.',
			'quiz4.insight.heroTitle' => 'Hero animation',
			'quiz4.insight.heroDesc' => 'The Hero animation makes the tapped image smoothly expand to fill the screen. By maintaining visual continuity, it eliminates the jarring feeling of an abrupt transition.',
			'quiz4.insight.radarTitle' => 'Reading the radar map',
			'quiz4.insight.radarDesc' => 'Radar maps use color gradients to show rain intensity: blue→green→yellow→red→purple for increasing strength. Fullscreen view helps you accurately track the movement and position of rain clouds.',
			'common.appTitle' => 'Weather',
			'common.cityTitle' => '{cityName} Weather',
			'common.currentTemp' => 'Current Temp',
			'common.tempUnit' => '{temp}°C',
			'common.weeklyForecast' => '7-Day Forecast',
			'common.hourlyDetail' => 'Hourly Forecast',
			'common.radarMap' => 'Radar Map',
			'common.radarMapDetail' => 'Radar Map',
			'common.refreshing' => 'Refreshing...',
			'common.lastUpdated' => 'Last Updated',
			'common.pullToRefresh' => 'Pull to Refresh',
			'common.sunny' => 'Sunny',
			'common.cloudy' => 'Cloudy',
			'common.rainy' => 'Rainy',
			'common.partlyCloudy' => 'Partly Cloudy',
			'common.quitConfirmTitle' => 'Quit Game?',
			'common.quitConfirmMessage' => 'Your current game will end.',
			'common.continueButton' => 'Continue',
			'common.quitButton' => 'Quit',
			'cities.tokyo' => 'Tokyo',
			'cities.osaka' => 'Osaka',
			'cities.sapporo' => 'Sapporo',
			'weekdays.mon' => 'Mon',
			'weekdays.tue' => 'Tue',
			'weekdays.wed' => 'Wed',
			'weekdays.thu' => 'Thu',
			'weekdays.fri' => 'Fri',
			'weekdays.sat' => 'Sat',
			'weekdays.sun' => 'Sun',
			_ => null,
		};
	}
}
