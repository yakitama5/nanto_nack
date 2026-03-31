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
	@override String get missionText => 'Play a video';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Share a video';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Save this video to favorites';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Turn on subtitles';
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
	@override String get title => 'How did you know the play button?';
	@override String get subtitle => 'The triangle is the universal play symbol';
	@override String get playTitle => 'The play triangle has not changed for 60 years';
	@override String get playDesc => 'The right-pointing triangle remains universally understood as play.';
	@override String get thumbnailTitle => 'Thumbnails preview content';
	@override String get thumbnailDesc => 'Visual previews communicate content without text.';
	@override String get progressTitle => 'Progress bar shows position';
	@override String get progressDesc => 'The seek bar pattern is standard in media players worldwide.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the share button?';
	@override String get subtitle => 'Share icons visualize connection';
	@override String get shareTitle => 'Share icon shape tells its meaning';
	@override String get shareDesc => 'Connected dots or upward arrows visualize sending outward.';
	@override String get actionTitle => 'Action buttons are arranged in a row';
	@override String get actionDesc => 'Like, share, save arranged horizontally is a standard pattern.';
	@override String get modalTitle => 'Share sheet presents options';
	@override String get modalDesc => 'The bottom sheet for sharing is an OS standard component.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the save button?';
	@override String get subtitle => 'Flag symbols mean save universally';
	@override String get saveTitle => 'Bookmark icons mean save';
	@override String get saveDesc => 'Flags and ribbons consistently mean hold this item.';
	@override String get feedbackTitle => 'Color change shows completion';
	@override String get feedbackDesc => 'Icons changing color show the registration state transition.';
	@override String get listTitle => 'Watch later list stores content';
	@override String get listDesc => 'Watch later lists are common across streaming platforms.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the subtitle setting?';
	@override String get subtitle => 'Settings hide behind the three dots menu';
	@override String get menuTitle => 'Three dots is the gateway to more features';
	@override String get menuDesc => 'Three dots indicate more features exist including subtitles.';
	@override String get ccTitle => 'CC is an international subtitle symbol';
	@override String get ccDesc => 'CC box is an international standard symbol for subtitles.';
	@override String get settingsTitle => 'Toggle switches are intuitive';
	@override String get settingsDesc => 'Toggle switches communicate state through color and position.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Play a video',
			'quiz1.insight.title' => 'How did you know the play button?',
			'quiz1.insight.subtitle' => 'The triangle is the universal play symbol',
			'quiz1.insight.playTitle' => 'The play triangle has not changed for 60 years',
			'quiz1.insight.playDesc' => 'The right-pointing triangle remains universally understood as play.',
			'quiz1.insight.thumbnailTitle' => 'Thumbnails preview content',
			'quiz1.insight.thumbnailDesc' => 'Visual previews communicate content without text.',
			'quiz1.insight.progressTitle' => 'Progress bar shows position',
			'quiz1.insight.progressDesc' => 'The seek bar pattern is standard in media players worldwide.',
			'quiz2.missionText' => 'Share a video',
			'quiz2.insight.title' => 'How did you find the share button?',
			'quiz2.insight.subtitle' => 'Share icons visualize connection',
			'quiz2.insight.shareTitle' => 'Share icon shape tells its meaning',
			'quiz2.insight.shareDesc' => 'Connected dots or upward arrows visualize sending outward.',
			'quiz2.insight.actionTitle' => 'Action buttons are arranged in a row',
			'quiz2.insight.actionDesc' => 'Like, share, save arranged horizontally is a standard pattern.',
			'quiz2.insight.modalTitle' => 'Share sheet presents options',
			'quiz2.insight.modalDesc' => 'The bottom sheet for sharing is an OS standard component.',
			'quiz3.missionText' => 'Save this video to favorites',
			'quiz3.insight.title' => 'How did you find the save button?',
			'quiz3.insight.subtitle' => 'Flag symbols mean save universally',
			'quiz3.insight.saveTitle' => 'Bookmark icons mean save',
			'quiz3.insight.saveDesc' => 'Flags and ribbons consistently mean hold this item.',
			'quiz3.insight.feedbackTitle' => 'Color change shows completion',
			'quiz3.insight.feedbackDesc' => 'Icons changing color show the registration state transition.',
			'quiz3.insight.listTitle' => 'Watch later list stores content',
			'quiz3.insight.listDesc' => 'Watch later lists are common across streaming platforms.',
			'quiz4.missionText' => 'Turn on subtitles',
			'quiz4.insight.title' => 'How did you find the subtitle setting?',
			'quiz4.insight.subtitle' => 'Settings hide behind the three dots menu',
			'quiz4.insight.menuTitle' => 'Three dots is the gateway to more features',
			'quiz4.insight.menuDesc' => 'Three dots indicate more features exist including subtitles.',
			'quiz4.insight.ccTitle' => 'CC is an international subtitle symbol',
			'quiz4.insight.ccDesc' => 'CC box is an international standard symbol for subtitles.',
			'quiz4.insight.settingsTitle' => 'Toggle switches are intuitive',
			'quiz4.insight.settingsDesc' => 'Toggle switches communicate state through color and position.',
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
