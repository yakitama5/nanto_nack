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
	@override late final _TranslationsVideosEn videos = _TranslationsVideosEn._(_root);
}

// Path: quiz1
class _TranslationsQuiz1En extends TranslationsQuiz1Ja {
	_TranslationsQuiz1En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please turn on subtitles for the video';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Go to the next video and seek to the middle';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Play the video at \'2x speed\'';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Change to highest quality and download to device';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'StreamHub';
	@override String get homeTab => 'Home';
	@override String get exploreTab => 'Explore';
	@override String get shortsTab => 'Shorts';
	@override String get subsTab => 'Subscriptions';
	@override String get youTab => 'You';
	@override String get likeButton => 'Like';
	@override String get dislikeButton => 'Dislike';
	@override String get shareButton => 'Share';
	@override String get saveButton => 'Save';
	@override String get downloadButton => 'Download';
	@override String get moreButton => 'More';
	@override String get subscribeButton => 'Subscribe';
	@override String get views => 'views';
	@override String get subtitles => 'Subtitles';
	@override String get quality => 'Quality';
	@override String get playbackSpeed => 'Playback speed';
	@override String get reportButton => 'Report';
	@override String get subtitlesOff => 'Off';
	@override String get subtitlesOn => 'On (Auto)';
	@override String get shareTitle => 'Share to';
	@override String get linkCopied => 'Link copied';
	@override String get savedToList => 'Saved to playlist';
}

// Path: videos
class _TranslationsVideosEn extends TranslationsVideosJa {
	_TranslationsVideosEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get v1Title => 'Amazing Nature Documentary 4K';
	@override String get v1Channel => 'NatureWorld';
	@override String get v2Title => 'Learn Programming in 10 Minutes';
	@override String get v2Channel => 'CodeMaster';
	@override String get v3Title => 'Top 10 Travel Destinations 2026';
	@override String get v3Channel => 'TravelVlog';
	@override String get v4Title => 'Cooking Easy Pasta Recipe';
	@override String get v4Channel => 'ChefKitchen';
	@override String get v5Title => 'Morning Yoga for Beginners';
	@override String get v5Channel => 'YogaLife';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the subtitle setting?';
	@override String get subtitle => 'CC is an international standard symbol';
	@override String get ccTitle => 'CC (Closed Captions) is universal';
	@override String get ccDesc => 'The \'CC\' or subtitle icon (box with lines) is an international standard for subtitles since the TV broadcast era. It\'s recognized regardless of language.';
	@override String get visibilityTitle => 'Controls are \'hidden\'';
	@override String get visibilityDesc => 'Most video players hide controls to avoid blocking the view. However, the \'tap to show\' convention is deeply rooted in modern users.';
	@override String get feedbackTitle => 'Underlines or color changes indicate \'ON\'';
	@override String get feedbackDesc => 'Changes like a red underline or brighter color indicate a feature is active, helping users understand state without reading labels.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you operate without hesitation?';
	@override String get subtitle => 'Player UI layout is key';
	@override String get skipTitle => 'Right arrow + bar = Next';
	@override String get skipDesc => 'The \'▶︎▶︎|\' symbol has meant \'skip to next track\' since the cassette era. Placing it next to the play button is a global standard.';
	@override String get seekTitle => 'Red line is a metaphor for flow of time';
	@override String get seekDesc => 'The progress bar represents time flowing from left to right. Red highlights the \'current position\', intuitively showing how to jump to past or future.';
	@override String get targetTitle => 'Middle is easy to target visually';
	@override String get targetDesc => 'Targeting the middle of the bar by sensing half of its physical length allows users to accurately reach 40-60% without text info.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Did you notice the hidden operation?';
	@override String get subtitle => 'Long press is a shortcut for acceleration';
	@override String get gestureTitle => 'Long press gesture on video area';
	@override String get gestureDesc => 'In many video apps, long pressing the screen triggers \'2x speed\' playback. This \'Aha!\' moment shortcut saves time opening menus.';
	@override String get gearTitle => '⚙ icon is the gateway to settings';
	@override String get gearDesc => 'The gear icon means \'settings\' or \'customization\' across all OS/apps. It builds trust that detailed changes happen here without reading text.';
	@override String get speedTitle => 'Numbers combined with \'x\'';
	@override String get speedDesc => '\'1.5x\' or \'2x\' are international mathematical symbols for magnification, serving as a language-free way to express speed.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Highest difficulty cleared!';
	@override String get subtitle => 'Symbol association is key';
	@override String get qualityTitle => 'Larger numbers = Higher quality';
	@override String get qualityDesc => 'Numbers like 1080p or 2160p represent vertical resolution. Users know larger numbers mean better quality from experience, even without reading.';
	@override String get downloadTitle => '↓ icon means \'getting\' action';
	@override String get downloadDesc => 'The downward arrow visualizes the physical action of dropping data from the cloud to your device (downloading), establishing its role as a save button.';
	@override String get locationTitle => 'Importance of button \'order\'';
	@override String get locationDesc => 'The menu row under the title often lists Like, Share, and Save (Download) from left to right. This familiar order helps decode unreadable text.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
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
