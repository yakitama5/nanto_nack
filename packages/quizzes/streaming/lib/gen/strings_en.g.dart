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
	late final TranslationsVideosEn videos = TranslationsVideosEn._(_root);
}

// Path: quiz1
class TranslationsQuiz1En {
	TranslationsQuiz1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please turn on subtitles for the video'
	String get missionText => 'Please turn on subtitles for the video';

	late final TranslationsQuiz1InsightEn insight = TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class TranslationsQuiz2En {
	TranslationsQuiz2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Go to the next video and seek to the middle'
	String get missionText => 'Go to the next video and seek to the middle';

	late final TranslationsQuiz2InsightEn insight = TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class TranslationsQuiz3En {
	TranslationsQuiz3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Play the video at '2x speed''
	String get missionText => 'Play the video at \'2x speed\'';

	late final TranslationsQuiz3InsightEn insight = TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class TranslationsQuiz4En {
	TranslationsQuiz4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Change to highest quality and download to device'
	String get missionText => 'Change to highest quality and download to device';

	late final TranslationsQuiz4InsightEn insight = TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'StreamHub'
	String get appTitle => 'StreamHub';

	/// en: 'Home'
	String get homeTab => 'Home';

	/// en: 'Explore'
	String get exploreTab => 'Explore';

	/// en: 'Shorts'
	String get shortsTab => 'Shorts';

	/// en: 'Subscriptions'
	String get subsTab => 'Subscriptions';

	/// en: 'You'
	String get youTab => 'You';

	/// en: 'Like'
	String get likeButton => 'Like';

	/// en: 'Dislike'
	String get dislikeButton => 'Dislike';

	/// en: 'Share'
	String get shareButton => 'Share';

	/// en: 'Save'
	String get saveButton => 'Save';

	/// en: 'Download'
	String get downloadButton => 'Download';

	/// en: 'More'
	String get moreButton => 'More';

	/// en: 'Subscribe'
	String get subscribeButton => 'Subscribe';

	/// en: 'views'
	String get views => 'views';

	/// en: 'Subtitles'
	String get subtitles => 'Subtitles';

	/// en: 'Quality'
	String get quality => 'Quality';

	/// en: 'Playback speed'
	String get playbackSpeed => 'Playback speed';

	/// en: 'Report'
	String get reportButton => 'Report';

	/// en: 'Off'
	String get subtitlesOff => 'Off';

	/// en: 'On (Auto)'
	String get subtitlesOn => 'On (Auto)';

	/// en: 'Share to'
	String get shareTitle => 'Share to';

	/// en: 'Link copied'
	String get linkCopied => 'Link copied';

	/// en: 'Saved to playlist'
	String get savedToList => 'Saved to playlist';
}

// Path: videos
class TranslationsVideosEn {
	TranslationsVideosEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Amazing Nature Documentary 4K'
	String get v1Title => 'Amazing Nature Documentary 4K';

	/// en: 'NatureWorld'
	String get v1Channel => 'NatureWorld';

	/// en: 'Learn Programming in 10 Minutes'
	String get v2Title => 'Learn Programming in 10 Minutes';

	/// en: 'CodeMaster'
	String get v2Channel => 'CodeMaster';

	/// en: 'Top 10 Travel Destinations 2026'
	String get v3Title => 'Top 10 Travel Destinations 2026';

	/// en: 'TravelVlog'
	String get v3Channel => 'TravelVlog';

	/// en: 'Cooking Easy Pasta Recipe'
	String get v4Title => 'Cooking Easy Pasta Recipe';

	/// en: 'ChefKitchen'
	String get v4Channel => 'ChefKitchen';

	/// en: 'Morning Yoga for Beginners'
	String get v5Title => 'Morning Yoga for Beginners';

	/// en: 'YogaLife'
	String get v5Channel => 'YogaLife';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightEn {
	TranslationsQuiz1InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the subtitle setting?'
	String get title => 'How did you find the subtitle setting?';

	/// en: 'CC is an international standard symbol'
	String get subtitle => 'CC is an international standard symbol';

	/// en: 'CC (Closed Captions) is universal'
	String get ccTitle => 'CC (Closed Captions) is universal';

	/// en: 'The 'CC' or subtitle icon (box with lines) is an international standard for subtitles since the TV broadcast era. It's recognized regardless of language.'
	String get ccDesc => 'The \'CC\' or subtitle icon (box with lines) is an international standard for subtitles since the TV broadcast era. It\'s recognized regardless of language.';

	/// en: 'Controls are 'hidden''
	String get visibilityTitle => 'Controls are \'hidden\'';

	/// en: 'Most video players hide controls to avoid blocking the view. However, the 'tap to show' convention is deeply rooted in modern users.'
	String get visibilityDesc => 'Most video players hide controls to avoid blocking the view. However, the \'tap to show\' convention is deeply rooted in modern users.';

	/// en: 'Underlines or color changes indicate 'ON''
	String get feedbackTitle => 'Underlines or color changes indicate \'ON\'';

	/// en: 'Changes like a red underline or brighter color indicate a feature is active, helping users understand state without reading labels.'
	String get feedbackDesc => 'Changes like a red underline or brighter color indicate a feature is active, helping users understand state without reading labels.';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightEn {
	TranslationsQuiz2InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you operate without hesitation?'
	String get title => 'How did you operate without hesitation?';

	/// en: 'Player UI layout is key'
	String get subtitle => 'Player UI layout is key';

	/// en: 'Right arrow + bar = Next'
	String get skipTitle => 'Right arrow + bar = Next';

	/// en: 'The '▶︎▶︎|' symbol has meant 'skip to next track' since the cassette era. Placing it next to the play button is a global standard.'
	String get skipDesc => 'The \'▶︎▶︎|\' symbol has meant \'skip to next track\' since the cassette era. Placing it next to the play button is a global standard.';

	/// en: 'Red line is a metaphor for flow of time'
	String get seekTitle => 'Red line is a metaphor for flow of time';

	/// en: 'The progress bar represents time flowing from left to right. Red highlights the 'current position', intuitively showing how to jump to past or future.'
	String get seekDesc => 'The progress bar represents time flowing from left to right. Red highlights the \'current position\', intuitively showing how to jump to past or future.';

	/// en: 'Middle is easy to target visually'
	String get targetTitle => 'Middle is easy to target visually';

	/// en: 'Targeting the middle of the bar by sensing half of its physical length allows users to accurately reach 40-60% without text info.'
	String get targetDesc => 'Targeting the middle of the bar by sensing half of its physical length allows users to accurately reach 40-60% without text info.';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightEn {
	TranslationsQuiz3InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Did you notice the hidden operation?'
	String get title => 'Did you notice the hidden operation?';

	/// en: 'Long press is a shortcut for acceleration'
	String get subtitle => 'Long press is a shortcut for acceleration';

	/// en: 'Long press gesture on video area'
	String get gestureTitle => 'Long press gesture on video area';

	/// en: 'In many video apps, long pressing the screen triggers '2x speed' playback. This 'Aha!' moment shortcut saves time opening menus.'
	String get gestureDesc => 'In many video apps, long pressing the screen triggers \'2x speed\' playback. This \'Aha!\' moment shortcut saves time opening menus.';

	/// en: '⚙ icon is the gateway to settings'
	String get gearTitle => '⚙ icon is the gateway to settings';

	/// en: 'The gear icon means 'settings' or 'customization' across all OS/apps. It builds trust that detailed changes happen here without reading text.'
	String get gearDesc => 'The gear icon means \'settings\' or \'customization\' across all OS/apps. It builds trust that detailed changes happen here without reading text.';

	/// en: 'Numbers combined with 'x''
	String get speedTitle => 'Numbers combined with \'x\'';

	/// en: ''1.5x' or '2x' are international mathematical symbols for magnification, serving as a language-free way to express speed.'
	String get speedDesc => '\'1.5x\' or \'2x\' are international mathematical symbols for magnification, serving as a language-free way to express speed.';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightEn {
	TranslationsQuiz4InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Highest difficulty cleared!'
	String get title => 'Highest difficulty cleared!';

	/// en: 'Symbol association is key'
	String get subtitle => 'Symbol association is key';

	/// en: 'Larger numbers = Higher quality'
	String get qualityTitle => 'Larger numbers = Higher quality';

	/// en: 'Numbers like 1080p or 2160p represent vertical resolution. Users know larger numbers mean better quality from experience, even without reading.'
	String get qualityDesc => 'Numbers like 1080p or 2160p represent vertical resolution. Users know larger numbers mean better quality from experience, even without reading.';

	/// en: '↓ icon means 'getting' action'
	String get downloadTitle => '↓ icon means \'getting\' action';

	/// en: 'The downward arrow visualizes the physical action of dropping data from the cloud to your device (downloading), establishing its role as a save button.'
	String get downloadDesc => 'The downward arrow visualizes the physical action of dropping data from the cloud to your device (downloading), establishing its role as a save button.';

	/// en: 'Importance of button 'order''
	String get locationTitle => 'Importance of button \'order\'';

	/// en: 'The menu row under the title often lists Like, Share, and Save (Download) from left to right. This familiar order helps decode unreadable text.'
	String get locationDesc => 'The menu row under the title often lists Like, Share, and Save (Download) from left to right. This familiar order helps decode unreadable text.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Please turn on subtitles for the video',
			'quiz1.insight.title' => 'How did you find the subtitle setting?',
			'quiz1.insight.subtitle' => 'CC is an international standard symbol',
			'quiz1.insight.ccTitle' => 'CC (Closed Captions) is universal',
			'quiz1.insight.ccDesc' => 'The \'CC\' or subtitle icon (box with lines) is an international standard for subtitles since the TV broadcast era. It\'s recognized regardless of language.',
			'quiz1.insight.visibilityTitle' => 'Controls are \'hidden\'',
			'quiz1.insight.visibilityDesc' => 'Most video players hide controls to avoid blocking the view. However, the \'tap to show\' convention is deeply rooted in modern users.',
			'quiz1.insight.feedbackTitle' => 'Underlines or color changes indicate \'ON\'',
			'quiz1.insight.feedbackDesc' => 'Changes like a red underline or brighter color indicate a feature is active, helping users understand state without reading labels.',
			'quiz2.missionText' => 'Go to the next video and seek to the middle',
			'quiz2.insight.title' => 'How did you operate without hesitation?',
			'quiz2.insight.subtitle' => 'Player UI layout is key',
			'quiz2.insight.skipTitle' => 'Right arrow + bar = Next',
			'quiz2.insight.skipDesc' => 'The \'▶︎▶︎|\' symbol has meant \'skip to next track\' since the cassette era. Placing it next to the play button is a global standard.',
			'quiz2.insight.seekTitle' => 'Red line is a metaphor for flow of time',
			'quiz2.insight.seekDesc' => 'The progress bar represents time flowing from left to right. Red highlights the \'current position\', intuitively showing how to jump to past or future.',
			'quiz2.insight.targetTitle' => 'Middle is easy to target visually',
			'quiz2.insight.targetDesc' => 'Targeting the middle of the bar by sensing half of its physical length allows users to accurately reach 40-60% without text info.',
			'quiz3.missionText' => 'Play the video at \'2x speed\'',
			'quiz3.insight.title' => 'Did you notice the hidden operation?',
			'quiz3.insight.subtitle' => 'Long press is a shortcut for acceleration',
			'quiz3.insight.gestureTitle' => 'Long press gesture on video area',
			'quiz3.insight.gestureDesc' => 'In many video apps, long pressing the screen triggers \'2x speed\' playback. This \'Aha!\' moment shortcut saves time opening menus.',
			'quiz3.insight.gearTitle' => '⚙ icon is the gateway to settings',
			'quiz3.insight.gearDesc' => 'The gear icon means \'settings\' or \'customization\' across all OS/apps. It builds trust that detailed changes happen here without reading text.',
			'quiz3.insight.speedTitle' => 'Numbers combined with \'x\'',
			'quiz3.insight.speedDesc' => '\'1.5x\' or \'2x\' are international mathematical symbols for magnification, serving as a language-free way to express speed.',
			'quiz4.missionText' => 'Change to highest quality and download to device',
			'quiz4.insight.title' => 'Highest difficulty cleared!',
			'quiz4.insight.subtitle' => 'Symbol association is key',
			'quiz4.insight.qualityTitle' => 'Larger numbers = Higher quality',
			'quiz4.insight.qualityDesc' => 'Numbers like 1080p or 2160p represent vertical resolution. Users know larger numbers mean better quality from experience, even without reading.',
			'quiz4.insight.downloadTitle' => '↓ icon means \'getting\' action',
			'quiz4.insight.downloadDesc' => 'The downward arrow visualizes the physical action of dropping data from the cloud to your device (downloading), establishing its role as a save button.',
			'quiz4.insight.locationTitle' => 'Importance of button \'order\'',
			'quiz4.insight.locationDesc' => 'The menu row under the title often lists Like, Share, and Save (Download) from left to right. This familiar order helps decode unreadable text.',
			'common.appTitle' => 'StreamHub',
			'common.homeTab' => 'Home',
			'common.exploreTab' => 'Explore',
			'common.shortsTab' => 'Shorts',
			'common.subsTab' => 'Subscriptions',
			'common.youTab' => 'You',
			'common.likeButton' => 'Like',
			'common.dislikeButton' => 'Dislike',
			'common.shareButton' => 'Share',
			'common.saveButton' => 'Save',
			'common.downloadButton' => 'Download',
			'common.moreButton' => 'More',
			'common.subscribeButton' => 'Subscribe',
			'common.views' => 'views',
			'common.subtitles' => 'Subtitles',
			'common.quality' => 'Quality',
			'common.playbackSpeed' => 'Playback speed',
			'common.reportButton' => 'Report',
			'common.subtitlesOff' => 'Off',
			'common.subtitlesOn' => 'On (Auto)',
			'common.shareTitle' => 'Share to',
			'common.linkCopied' => 'Link copied',
			'common.savedToList' => 'Saved to playlist',
			'videos.v1Title' => 'Amazing Nature Documentary 4K',
			'videos.v1Channel' => 'NatureWorld',
			'videos.v2Title' => 'Learn Programming in 10 Minutes',
			'videos.v2Channel' => 'CodeMaster',
			'videos.v3Title' => 'Top 10 Travel Destinations 2026',
			'videos.v3Channel' => 'TravelVlog',
			'videos.v4Title' => 'Cooking Easy Pasta Recipe',
			'videos.v4Channel' => 'ChefKitchen',
			'videos.v5Title' => 'Morning Yoga for Beginners',
			'videos.v5Channel' => 'YogaLife',
			_ => null,
		};
	}
}
