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
	@override late final _TranslationsVideosXx videos = _TranslationsVideosXx._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Xx extends TranslationsQuiz1Ja {
	_TranslationsQuiz1Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please turn on subtitles for the video';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Go to the next video and seek to the middle';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Play at 2x speed';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Highest quality and download';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
	@override String get subscribers => 'subscribers';
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
	@override String get quitConfirmTitle => 'Quit Game?';
	@override String get quitConfirmMessage => 'End current game.';
	@override String get continueButton => 'Continue';
	@override String get quitButton => 'Quit';
}

// Path: videos
class _TranslationsVideosXx extends TranslationsVideosJa {
	_TranslationsVideosXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Subtitle Setting';
	@override String get subtitle => 'CC icon';
	@override String get ccTitle => 'CC Standard';
	@override String get ccDesc => 'CC icon is universal.';
	@override String get visibilityTitle => 'Hidden controls';
	@override String get visibilityDesc => 'Tap to show controls.';
	@override String get feedbackTitle => 'Visual feedback';
	@override String get feedbackDesc => 'Color changes indicate state.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Player UI';
	@override String get subtitle => 'Layout';
	@override String get skipTitle => 'Skip icon';
	@override String get skipDesc => 'Next track symbol.';
	@override String get seekTitle => 'Seek bar';
	@override String get seekDesc => 'Time flow metaphor.';
	@override String get targetTitle => 'Targeting';
	@override String get targetDesc => 'Middle is easy to find.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hidden Gestures';
	@override String get subtitle => 'Long press';
	@override String get gestureTitle => 'Fast-forward';
	@override String get gestureDesc => 'Long press for 2x speed.';
	@override String get gearTitle => 'Settings icon';
	@override String get gearDesc => 'Gear means settings.';
	@override String get speedTitle => 'Speed notation';
	@override String get speedDesc => '2x notation is universal.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Visual Association';
	@override String get subtitle => 'Symbols';
	@override String get qualityTitle => 'Numbers';
	@override String get qualityDesc => 'High number means quality.';
	@override String get downloadTitle => 'Download icon';
	@override String get downloadDesc => 'Arrow means download.';
	@override String get locationTitle => 'Order';
	@override String get locationDesc => 'Button order matters.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Please turn on subtitles for the video',
			'quiz1.insight.title' => 'Subtitle Setting',
			'quiz1.insight.subtitle' => 'CC icon',
			'quiz1.insight.ccTitle' => 'CC Standard',
			'quiz1.insight.ccDesc' => 'CC icon is universal.',
			'quiz1.insight.visibilityTitle' => 'Hidden controls',
			'quiz1.insight.visibilityDesc' => 'Tap to show controls.',
			'quiz1.insight.feedbackTitle' => 'Visual feedback',
			'quiz1.insight.feedbackDesc' => 'Color changes indicate state.',
			'quiz2.missionText' => 'Go to the next video and seek to the middle',
			'quiz2.insight.title' => 'Player UI',
			'quiz2.insight.subtitle' => 'Layout',
			'quiz2.insight.skipTitle' => 'Skip icon',
			'quiz2.insight.skipDesc' => 'Next track symbol.',
			'quiz2.insight.seekTitle' => 'Seek bar',
			'quiz2.insight.seekDesc' => 'Time flow metaphor.',
			'quiz2.insight.targetTitle' => 'Targeting',
			'quiz2.insight.targetDesc' => 'Middle is easy to find.',
			'quiz3.missionText' => 'Play at 2x speed',
			'quiz3.insight.title' => 'Hidden Gestures',
			'quiz3.insight.subtitle' => 'Long press',
			'quiz3.insight.gestureTitle' => 'Fast-forward',
			'quiz3.insight.gestureDesc' => 'Long press for 2x speed.',
			'quiz3.insight.gearTitle' => 'Settings icon',
			'quiz3.insight.gearDesc' => 'Gear means settings.',
			'quiz3.insight.speedTitle' => 'Speed notation',
			'quiz3.insight.speedDesc' => '2x notation is universal.',
			'quiz4.missionText' => 'Highest quality and download',
			'quiz4.insight.title' => 'Visual Association',
			'quiz4.insight.subtitle' => 'Symbols',
			'quiz4.insight.qualityTitle' => 'Numbers',
			'quiz4.insight.qualityDesc' => 'High number means quality.',
			'quiz4.insight.downloadTitle' => 'Download icon',
			'quiz4.insight.downloadDesc' => 'Arrow means download.',
			'quiz4.insight.locationTitle' => 'Order',
			'quiz4.insight.locationDesc' => 'Button order matters.',
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
			'common.subscribers' => 'subscribers',
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
			'common.quitConfirmTitle' => 'Quit Game?',
			'common.quitConfirmMessage' => 'End current game.',
			'common.continueButton' => 'Continue',
			'common.quitButton' => 'Quit',
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
