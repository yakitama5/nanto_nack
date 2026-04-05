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
	@override late final _TranslationsPlacesXx places = _TranslationsPlacesXx._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Xx extends TranslationsQuiz1Ja {
	_TranslationsQuiz1Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Show current location';
	@override String get failureReason => 'Tap the current location button';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Search for a destination';
	@override String get failureReason => 'Search for a destination in the search bar';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Start navigation';
	@override String get failureReason => 'Start route navigation';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Add to favorites';
	@override String get failureReason => 'Add the place to favorites';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'MapNavi';
	@override String get searchHint => 'Search here';
	@override String get currentLocation => 'Current location';
	@override String get directions => 'Directions';
	@override String get startNavigation => 'Start';
	@override String get savePlace => 'Save';
	@override String get savedPlaces => 'Saved places';
	@override String get drive => 'Drive';
	@override String get walk => 'Walk';
	@override String get transit => 'Transit';
	@override String get bike => 'Bike';
	@override String get nearby => 'Nearby';
	@override String get explore => 'Explore';
	@override String get go => 'Go';
	@override String get min => 'min';
	@override String get km => 'km';
}

// Path: places
class _TranslationsPlacesXx extends TranslationsPlacesJa {
	_TranslationsPlacesXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get p1Name => 'City Hall';
	@override String get p1Address => '1-1 Central Ave';
	@override String get p2Name => 'Grand Park';
	@override String get p2Address => '2-5 Park Blvd';
	@override String get p3Name => 'Main Station';
	@override String get p3Address => '3-10 Station St';
	@override String get p4Name => 'Shopping Mall';
	@override String get p4Address => '4-2 Commerce Rd';
	@override String get p5Name => 'University';
	@override String get p5Address => '5-8 Campus Dr';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the location button?';
	@override String get subtitle => 'Location icon is universal';
	@override String get locationTitle => 'Pin icon means here';
	@override String get locationDesc => 'The pin icon is a world standard symbol for current location.';
	@override String get compassTitle => 'Compass shows direction';
	@override String get compassDesc => 'Compass icon resets orientation to north.';
	@override String get zoomTitle => 'Pinch to zoom';
	@override String get zoomDesc => 'Two-finger pinch gesture is standard worldwide.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the search bar?';
	@override String get subtitle => 'Magnifying glass means search';
	@override String get searchTitle => 'Magnifying glass icon means search';
	@override String get searchDesc => 'Unified search icon across all apps.';
	@override String get suggestTitle => 'Suggestions aid navigation';
	@override String get suggestDesc => 'Suggestion lists standard in map apps.';
	@override String get pinTitle => 'Pin placed on map';
	@override String get pinDesc => 'Tapping result shows pin on map.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find navigation?';
	@override String get subtitle => 'Arrow represents navigate';
	@override String get routeTitle => 'Arrow means navigation';
	@override String get routeDesc => 'Upper-right arrow is standard navigation button.';
	@override String get transportTitle => 'Transport options';
	@override String get transportDesc => 'Car, train, walk icons in a row.';
	@override String get stepTitle => 'Turn-by-turn is intuitive';
	@override String get stepDesc => 'Large turn instructions continue from car navigation era.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find favorites?';
	@override String get subtitle => 'Star mark means favorites';
	@override String get starTitle => 'Star is the international favorites symbol';
	@override String get starDesc => 'Star unified for favorites across maps and SNS.';
	@override String get savedTitle => 'Saved list accessible';
	@override String get savedDesc => 'Saved places found in the list.';
	@override String get colorTitle => 'Color change shows completion';
	@override String get colorDesc => 'Gray to yellow star transition.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Show current location',
			'quiz1.failureReason' => 'Tap the current location button',
			'quiz1.insight.title' => 'How did you find the location button?',
			'quiz1.insight.subtitle' => 'Location icon is universal',
			'quiz1.insight.locationTitle' => 'Pin icon means here',
			'quiz1.insight.locationDesc' => 'The pin icon is a world standard symbol for current location.',
			'quiz1.insight.compassTitle' => 'Compass shows direction',
			'quiz1.insight.compassDesc' => 'Compass icon resets orientation to north.',
			'quiz1.insight.zoomTitle' => 'Pinch to zoom',
			'quiz1.insight.zoomDesc' => 'Two-finger pinch gesture is standard worldwide.',
			'quiz2.missionText' => 'Search for a destination',
			'quiz2.failureReason' => 'Search for a destination in the search bar',
			'quiz2.insight.title' => 'How did you find the search bar?',
			'quiz2.insight.subtitle' => 'Magnifying glass means search',
			'quiz2.insight.searchTitle' => 'Magnifying glass icon means search',
			'quiz2.insight.searchDesc' => 'Unified search icon across all apps.',
			'quiz2.insight.suggestTitle' => 'Suggestions aid navigation',
			'quiz2.insight.suggestDesc' => 'Suggestion lists standard in map apps.',
			'quiz2.insight.pinTitle' => 'Pin placed on map',
			'quiz2.insight.pinDesc' => 'Tapping result shows pin on map.',
			'quiz3.missionText' => 'Start navigation',
			'quiz3.failureReason' => 'Start route navigation',
			'quiz3.insight.title' => 'How did you find navigation?',
			'quiz3.insight.subtitle' => 'Arrow represents navigate',
			'quiz3.insight.routeTitle' => 'Arrow means navigation',
			'quiz3.insight.routeDesc' => 'Upper-right arrow is standard navigation button.',
			'quiz3.insight.transportTitle' => 'Transport options',
			'quiz3.insight.transportDesc' => 'Car, train, walk icons in a row.',
			'quiz3.insight.stepTitle' => 'Turn-by-turn is intuitive',
			'quiz3.insight.stepDesc' => 'Large turn instructions continue from car navigation era.',
			'quiz4.missionText' => 'Add to favorites',
			'quiz4.failureReason' => 'Add the place to favorites',
			'quiz4.insight.title' => 'How did you find favorites?',
			'quiz4.insight.subtitle' => 'Star mark means favorites',
			'quiz4.insight.starTitle' => 'Star is the international favorites symbol',
			'quiz4.insight.starDesc' => 'Star unified for favorites across maps and SNS.',
			'quiz4.insight.savedTitle' => 'Saved list accessible',
			'quiz4.insight.savedDesc' => 'Saved places found in the list.',
			'quiz4.insight.colorTitle' => 'Color change shows completion',
			'quiz4.insight.colorDesc' => 'Gray to yellow star transition.',
			'common.appTitle' => 'MapNavi',
			'common.searchHint' => 'Search here',
			'common.currentLocation' => 'Current location',
			'common.directions' => 'Directions',
			'common.startNavigation' => 'Start',
			'common.savePlace' => 'Save',
			'common.savedPlaces' => 'Saved places',
			'common.drive' => 'Drive',
			'common.walk' => 'Walk',
			'common.transit' => 'Transit',
			'common.bike' => 'Bike',
			'common.nearby' => 'Nearby',
			'common.explore' => 'Explore',
			'common.go' => 'Go',
			'common.min' => 'min',
			'common.km' => 'km',
			'places.p1Name' => 'City Hall',
			'places.p1Address' => '1-1 Central Ave',
			'places.p2Name' => 'Grand Park',
			'places.p2Address' => '2-5 Park Blvd',
			'places.p3Name' => 'Main Station',
			'places.p3Address' => '3-10 Station St',
			'places.p4Name' => 'Shopping Mall',
			'places.p4Address' => '4-2 Commerce Rd',
			'places.p5Name' => 'University',
			'places.p5Address' => '5-8 Campus Dr',
			_ => null,
		};
	}
}
