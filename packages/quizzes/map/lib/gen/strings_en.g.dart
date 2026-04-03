///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsQuiz1En quiz1 = TranslationsQuiz1En._(_root);
	late final TranslationsQuiz2En quiz2 = TranslationsQuiz2En._(_root);
	late final TranslationsQuiz3En quiz3 = TranslationsQuiz3En._(_root);
	late final TranslationsQuiz4En quiz4 = TranslationsQuiz4En._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsPlacesEn places = TranslationsPlacesEn._(_root);
}

// Path: quiz1
class TranslationsQuiz1En {
	TranslationsQuiz1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please show your current location'
	String get missionText => 'Please show your current location';

	/// en: 'Please tap the current location button'
	String get failureReason => 'Please tap the current location button';

	late final TranslationsQuiz1InsightEn insight = TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class TranslationsQuiz2En {
	TranslationsQuiz2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please search for a destination'
	String get missionText => 'Please search for a destination';

	/// en: 'Please search for a destination in the search bar'
	String get failureReason => 'Please search for a destination in the search bar';

	late final TranslationsQuiz2InsightEn insight = TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class TranslationsQuiz3En {
	TranslationsQuiz3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please start route navigation'
	String get missionText => 'Please start route navigation';

	/// en: 'Please start route navigation'
	String get failureReason => 'Please start route navigation';

	late final TranslationsQuiz3InsightEn insight = TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class TranslationsQuiz4En {
	TranslationsQuiz4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please add this place to favorites'
	String get missionText => 'Please add this place to favorites';

	/// en: 'Please add the place to favorites'
	String get failureReason => 'Please add the place to favorites';

	late final TranslationsQuiz4InsightEn insight = TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'MapNavi'
	String get appTitle => 'MapNavi';

	/// en: 'Search here'
	String get searchHint => 'Search here';

	/// en: 'Current location'
	String get currentLocation => 'Current location';

	/// en: 'Directions'
	String get directions => 'Directions';

	/// en: 'Start'
	String get startNavigation => 'Start';

	/// en: 'Save'
	String get savePlace => 'Save';

	/// en: 'Saved places'
	String get savedPlaces => 'Saved places';

	/// en: 'Drive'
	String get drive => 'Drive';

	/// en: 'Walk'
	String get walk => 'Walk';

	/// en: 'Transit'
	String get transit => 'Transit';

	/// en: 'Bike'
	String get bike => 'Bike';

	/// en: 'Nearby'
	String get nearby => 'Nearby';

	/// en: 'Explore'
	String get explore => 'Explore';

	/// en: 'Go'
	String get go => 'Go';

	/// en: 'min'
	String get min => 'min';

	/// en: 'km'
	String get km => 'km';
}

// Path: places
class TranslationsPlacesEn {
	TranslationsPlacesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'City Hall'
	String get p1Name => 'City Hall';

	/// en: '1-1 Central Ave'
	String get p1Address => '1-1 Central Ave';

	/// en: 'Grand Park'
	String get p2Name => 'Grand Park';

	/// en: '2-5 Park Blvd'
	String get p2Address => '2-5 Park Blvd';

	/// en: 'Main Station'
	String get p3Name => 'Main Station';

	/// en: '3-10 Station St'
	String get p3Address => '3-10 Station St';

	/// en: 'Shopping Mall'
	String get p4Name => 'Shopping Mall';

	/// en: '4-2 Commerce Rd'
	String get p4Address => '4-2 Commerce Rd';

	/// en: 'University'
	String get p5Name => 'University';

	/// en: '5-8 Campus Dr'
	String get p5Address => '5-8 Campus Dr';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightEn {
	TranslationsQuiz1InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the current location button?'
	String get title => 'How did you find the current location button?';

	/// en: 'Location icon is the universal symbol for 'here''
	String get subtitle => 'Location icon is the universal symbol for \'here\'';

	/// en: 'Pin icon means 'I am here''
	String get locationTitle => 'Pin icon means \'I am here\'';

	/// en: 'The pin icon modeled after real map pins is a world standard symbol for current location in digital maps.'
	String get locationDesc => 'The pin icon modeled after real map pins is a world standard symbol for current location in digital maps.';

	/// en: 'Compass indicates direction'
	String get compassTitle => 'Compass indicates direction';

	/// en: 'Tapping the compass icon resets to north-up. A UI pattern that intuitively conveys orientation.'
	String get compassDesc => 'Tapping the compass icon resets to north-up. A UI pattern that intuitively conveys orientation.';

	/// en: 'Pinch to zoom the map'
	String get zoomTitle => 'Pinch to zoom the map';

	/// en: 'Two-finger pinch in/out is the standard gesture for smartphone map apps, used worldwide across languages.'
	String get zoomDesc => 'Two-finger pinch in/out is the standard gesture for smartphone map apps, used worldwide across languages.';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightEn {
	TranslationsQuiz2InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the search bar?'
	String get title => 'How did you find the search bar?';

	/// en: 'Magnifying glass is the universal symbol for search'
	String get subtitle => 'Magnifying glass is the universal symbol for search';

	/// en: 'Magnifying glass icon means search'
	String get searchTitle => 'Magnifying glass icon means search';

	/// en: 'The magnifying glass is unified as a search icon from Google to SNS across all apps.'
	String get searchDesc => 'The magnifying glass is unified as a search icon from Google to SNS across all apps.';

	/// en: 'Search suggestions aid navigation'
	String get suggestTitle => 'Search suggestions aid navigation';

	/// en: 'Suggestion lists appearing while typing is a standard operation pattern in map apps.'
	String get suggestDesc => 'Suggestion lists appearing while typing is a standard operation pattern in map apps.';

	/// en: 'Result selection places a pin on the map'
	String get pinTitle => 'Result selection places a pin on the map';

	/// en: 'Tapping a search result shows a pin on the map. A visual feedback pattern for destinations.'
	String get pinDesc => 'Tapping a search result shows a pin on the map. A visual feedback pattern for destinations.';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightEn {
	TranslationsQuiz3InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the navigation button?'
	String get title => 'How did you find the navigation button?';

	/// en: 'Arrow represents 'navigate''
	String get subtitle => 'Arrow represents \'navigate\'';

	/// en: 'Arrow icon represents navigation'
	String get routeTitle => 'Arrow icon represents navigation';

	/// en: 'The upper-right arrow has become the standard navigation start button common to Google Maps and Apple Maps.'
	String get routeDesc => 'The upper-right arrow has become the standard navigation start button common to Google Maps and Apple Maps.';

	/// en: 'Transport options lined up'
	String get transportTitle => 'Transport options lined up';

	/// en: 'Car, train, walk, bike icons in a row is a UI common across major map apps.'
	String get transportDesc => 'Car, train, walk, bike icons in a row is a UI common across major map apps.';

	/// en: 'Turn-by-turn navigation is intuitive'
	String get stepTitle => 'Turn-by-turn navigation is intuitive';

	/// en: 'Large turn-left/right instructions at the next intersection — turn-by-turn navigation continues from the car navigation era.'
	String get stepDesc => 'Large turn-left/right instructions at the next intersection — turn-by-turn navigation continues from the car navigation era.';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightEn {
	TranslationsQuiz4InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the favorites button?'
	String get title => 'How did you find the favorites button?';

	/// en: 'Star mark is the universal symbol for favorites'
	String get subtitle => 'Star mark is the universal symbol for favorites';

	/// en: 'Star mark is the international standard for favorites'
	String get starTitle => 'Star mark is the international standard for favorites';

	/// en: 'Star (★) is unified as an icon meaning bookmark, favorites, and rating in maps, reviews, and SNS.'
	String get starDesc => 'Star (★) is unified as an icon meaning bookmark, favorites, and rating in maps, reviews, and SNS.';

	/// en: 'Saved list accessible anytime'
	String get savedTitle => 'Saved list accessible anytime';

	/// en: 'Places added to favorites can be found in the Saved list. Basic pattern for content management UI.'
	String get savedDesc => 'Places added to favorites can be found in the Saved list. Basic pattern for content management UI.';

	/// en: 'Color change communicates completion'
	String get colorTitle => 'Color change communicates completion';

	/// en: 'Star changing from gray to yellow visually communicates the state transition from unregistered to registered.'
	String get colorDesc => 'Star changing from gray to yellow visually communicates the state transition from unregistered to registered.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
			'quiz2.missionText' => 'Please search for a destination',
			'quiz2.failureReason' => 'Please search for a destination in the search bar',
			'quiz2.insight.title' => 'How did you find the search bar?',
			'quiz2.insight.subtitle' => 'Magnifying glass is the universal symbol for search',
			'quiz2.insight.searchTitle' => 'Magnifying glass icon means search',
			'quiz2.insight.searchDesc' => 'The magnifying glass is unified as a search icon from Google to SNS across all apps.',
			'quiz2.insight.suggestTitle' => 'Search suggestions aid navigation',
			'quiz2.insight.suggestDesc' => 'Suggestion lists appearing while typing is a standard operation pattern in map apps.',
			'quiz2.insight.pinTitle' => 'Result selection places a pin on the map',
			'quiz2.insight.pinDesc' => 'Tapping a search result shows a pin on the map. A visual feedback pattern for destinations.',
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
