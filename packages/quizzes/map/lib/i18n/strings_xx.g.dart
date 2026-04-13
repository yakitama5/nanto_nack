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
	@override String get missionText => 'Show school info';
	@override String get failureReason => 'Tap the school icon';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Navigate to park by train';
	@override String get failureReason => 'Select park and train for navigation';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Add station to favorites';
	@override String get failureReason => 'Tap station icon and add to favorites';
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
	@override String get confirmQuitTitle => 'Quit game?';
	@override String get confirmQuitMessage => 'The game will end.';
	@override String get continueGame => 'Continue';
	@override String get quitGame => 'Quit';
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
	@override String get title => 'How did you find the school?';
	@override String get subtitle => 'Icons show place types';
	@override String get iconTitle => 'Icons identify facility types';
	@override String get iconDesc => 'Icons distinguish place types without language.';
	@override String get tapTitle => 'Tap for details';
	@override String get tapDesc => 'Tapping shows place info in bottom panel.';
	@override String get infoTitle => 'Saved places always accessible';
	@override String get infoDesc => 'Tap saved places to view details instantly.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you navigate?';
	@override String get subtitle => '3 steps to navigate';
	@override String get destinationTitle => 'Tap pin for destination';
	@override String get destinationDesc => 'Tap map icon to see place details.';
	@override String get transportTitle => 'Transport icons are universal';
	@override String get transportDesc => 'Car, walk, train, bike icons standard.';
	@override String get startTitle => 'Tap Start to begin';
	@override String get startDesc => 'Select destination and transport, then start.';
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
			'quiz2.missionText' => 'Show school info',
			'quiz2.failureReason' => 'Tap the school icon',
			'quiz2.insight.title' => 'How did you find the school?',
			'quiz2.insight.subtitle' => 'Icons show place types',
			'quiz2.insight.iconTitle' => 'Icons identify facility types',
			'quiz2.insight.iconDesc' => 'Icons distinguish place types without language.',
			'quiz2.insight.tapTitle' => 'Tap for details',
			'quiz2.insight.tapDesc' => 'Tapping shows place info in bottom panel.',
			'quiz2.insight.infoTitle' => 'Saved places always accessible',
			'quiz2.insight.infoDesc' => 'Tap saved places to view details instantly.',
			'quiz3.missionText' => 'Navigate to park by train',
			'quiz3.failureReason' => 'Select park and train for navigation',
			'quiz3.insight.title' => 'How did you navigate?',
			'quiz3.insight.subtitle' => '3 steps to navigate',
			'quiz3.insight.destinationTitle' => 'Tap pin for destination',
			'quiz3.insight.destinationDesc' => 'Tap map icon to see place details.',
			'quiz3.insight.transportTitle' => 'Transport icons are universal',
			'quiz3.insight.transportDesc' => 'Car, walk, train, bike icons standard.',
			'quiz3.insight.startTitle' => 'Tap Start to begin',
			'quiz3.insight.startDesc' => 'Select destination and transport, then start.',
			'quiz4.missionText' => 'Add station to favorites',
			'quiz4.failureReason' => 'Tap station icon and add to favorites',
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
			'common.confirmQuitTitle' => 'Quit game?',
			'common.confirmQuitMessage' => 'The game will end.',
			'common.continueGame' => 'Continue',
			'common.quitGame' => 'Quit',
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
