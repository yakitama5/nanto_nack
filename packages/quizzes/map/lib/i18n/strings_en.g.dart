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
	@override late final _TranslationsPlacesEn places = _TranslationsPlacesEn._(_root);
}

// Path: quiz1
class _TranslationsQuiz1En extends TranslationsQuiz1Ja {
	_TranslationsQuiz1En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please show your current location';
	@override String get failureReason => 'Please tap the current location button';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please show the information of a registered school';
	@override String get failureReason => 'Please tap the place with the school icon';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please start route navigation';
	@override String get failureReason => 'Please start route navigation';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please add this place to favorites';
	@override String get failureReason => 'Please add the place to favorites';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

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
class _TranslationsPlacesEn extends TranslationsPlacesJa {
	_TranslationsPlacesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

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
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the current location button?';
	@override String get subtitle => 'Location icon is the universal symbol for \'here\'';
	@override String get locationTitle => 'Pin icon means \'I am here\'';
	@override String get locationDesc => 'The pin icon modeled after real map pins is a world standard symbol for current location in digital maps.';
	@override String get compassTitle => 'Compass indicates direction';
	@override String get compassDesc => 'Tapping the compass icon resets to north-up. A UI pattern that intuitively conveys orientation.';
	@override String get zoomTitle => 'Pinch to zoom the map';
	@override String get zoomDesc => 'Two-finger pinch in/out is the standard gesture for smartphone map apps, used worldwide across languages.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you recognize the school icon?';
	@override String get subtitle => 'Icons communicate the type of place';
	@override String get iconTitle => 'Icons indicate the type of facility';
	@override String get iconDesc => 'In map apps, icons for schools, hospitals, and stations let you identify facility types at a glance — even without reading the language.';
	@override String get tapTitle => 'Tap to show detailed information';
	@override String get tapDesc => 'Tapping a pin or icon displays the place details (name, address) in a bottom panel. The fundamental operation pattern of map apps.';
	@override String get infoTitle => 'Saved information accessible instantly';
	@override String get infoDesc => 'Saved places are always shown as icons on the map and tapping them instantly reveals details. Intuitive UI for bookmarked locations.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the navigation button?';
	@override String get subtitle => 'Arrow represents \'navigate\'';
	@override String get routeTitle => 'Arrow icon represents navigation';
	@override String get routeDesc => 'The upper-right arrow has become the standard navigation start button common to Google Maps and Apple Maps.';
	@override String get transportTitle => 'Transport options lined up';
	@override String get transportDesc => 'Car, train, walk, bike icons in a row is a UI common across major map apps.';
	@override String get stepTitle => 'Turn-by-turn navigation is intuitive';
	@override String get stepDesc => 'Large turn-left/right instructions at the next intersection — turn-by-turn navigation continues from the car navigation era.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the favorites button?';
	@override String get subtitle => 'Star mark is the universal symbol for favorites';
	@override String get starTitle => 'Star mark is the international standard for favorites';
	@override String get starDesc => 'Star (★) is unified as an icon meaning bookmark, favorites, and rating in maps, reviews, and SNS.';
	@override String get savedTitle => 'Saved list accessible anytime';
	@override String get savedDesc => 'Places added to favorites can be found in the Saved list. Basic pattern for content management UI.';
	@override String get colorTitle => 'Color change communicates completion';
	@override String get colorDesc => 'Star changing from gray to yellow visually communicates the state transition from unregistered to registered.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Please show your current location',
			'quiz1.failureReason' => 'Please tap the current location button',
			'quiz1.insight.title' => 'How did you find the current location button?',
			'quiz1.insight.subtitle' => 'Location icon is the universal symbol for \'here\'',
			'quiz1.insight.locationTitle' => 'Pin icon means \'I am here\'',
			'quiz1.insight.locationDesc' => 'The pin icon modeled after real map pins is a world standard symbol for current location in digital maps.',
			'quiz1.insight.compassTitle' => 'Compass indicates direction',
			'quiz1.insight.compassDesc' => 'Tapping the compass icon resets to north-up. A UI pattern that intuitively conveys orientation.',
			'quiz1.insight.zoomTitle' => 'Pinch to zoom the map',
			'quiz1.insight.zoomDesc' => 'Two-finger pinch in/out is the standard gesture for smartphone map apps, used worldwide across languages.',
			'quiz2.missionText' => 'Please show the information of a registered school',
			'quiz2.failureReason' => 'Please tap the place with the school icon',
			'quiz2.insight.title' => 'How did you recognize the school icon?',
			'quiz2.insight.subtitle' => 'Icons communicate the type of place',
			'quiz2.insight.iconTitle' => 'Icons indicate the type of facility',
			'quiz2.insight.iconDesc' => 'In map apps, icons for schools, hospitals, and stations let you identify facility types at a glance — even without reading the language.',
			'quiz2.insight.tapTitle' => 'Tap to show detailed information',
			'quiz2.insight.tapDesc' => 'Tapping a pin or icon displays the place details (name, address) in a bottom panel. The fundamental operation pattern of map apps.',
			'quiz2.insight.infoTitle' => 'Saved information accessible instantly',
			'quiz2.insight.infoDesc' => 'Saved places are always shown as icons on the map and tapping them instantly reveals details. Intuitive UI for bookmarked locations.',
			'quiz3.missionText' => 'Please start route navigation',
			'quiz3.failureReason' => 'Please start route navigation',
			'quiz3.insight.title' => 'How did you find the navigation button?',
			'quiz3.insight.subtitle' => 'Arrow represents \'navigate\'',
			'quiz3.insight.routeTitle' => 'Arrow icon represents navigation',
			'quiz3.insight.routeDesc' => 'The upper-right arrow has become the standard navigation start button common to Google Maps and Apple Maps.',
			'quiz3.insight.transportTitle' => 'Transport options lined up',
			'quiz3.insight.transportDesc' => 'Car, train, walk, bike icons in a row is a UI common across major map apps.',
			'quiz3.insight.stepTitle' => 'Turn-by-turn navigation is intuitive',
			'quiz3.insight.stepDesc' => 'Large turn-left/right instructions at the next intersection — turn-by-turn navigation continues from the car navigation era.',
			'quiz4.missionText' => 'Please add this place to favorites',
			'quiz4.failureReason' => 'Please add the place to favorites',
			'quiz4.insight.title' => 'How did you find the favorites button?',
			'quiz4.insight.subtitle' => 'Star mark is the universal symbol for favorites',
			'quiz4.insight.starTitle' => 'Star mark is the international standard for favorites',
			'quiz4.insight.starDesc' => 'Star (★) is unified as an icon meaning bookmark, favorites, and rating in maps, reviews, and SNS.',
			'quiz4.insight.savedTitle' => 'Saved list accessible anytime',
			'quiz4.insight.savedDesc' => 'Places added to favorites can be found in the Saved list. Basic pattern for content management UI.',
			'quiz4.insight.colorTitle' => 'Color change communicates completion',
			'quiz4.insight.colorDesc' => 'Star changing from gray to yellow visually communicates the state transition from unregistered to registered.',
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
