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
	@override String get missionText => 'Please play a video';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please share a video';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please save the video to favorites';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please turn on subtitles for the video';
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
	@override String get title => 'How did you know the play button?';
	@override String get subtitle => '▶ is the universal play symbol';
	@override String get playTitle => 'The ▶ mark has not changed for 60+ years';
	@override String get playDesc => 'Used since the tape recorder era (1960s), ▶ (right-pointing triangle) remains universally understood as play even in the digital age.';
	@override String get thumbnailTitle => 'Thumbnails preview content';
	@override String get thumbnailDesc => 'Thumbnails showing video previews communicate content without text descriptions.';
	@override String get progressTitle => 'Progress bar shows remaining time';
	@override String get progressDesc => 'The thin bar at the bottom shows how much has been watched. This seek bar pattern is standard in media players worldwide.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the share button?';
	@override String get subtitle => 'Share icons visualize connection';
	@override String get shareTitle => 'Share icon shape tells its meaning';
	@override String get shareDesc => 'Three dots connected by lines (Android) or upward arrow (iOS) visualize sending outward. Unified across global apps.';
	@override String get actionTitle => 'Action button row arranges functions';
	@override String get actionDesc => 'Like, share, save, more arranged horizontally is standard on YouTube, TikTok, Twitter.';
	@override String get modalTitle => 'Share sheet presents options';
	@override String get modalDesc => 'The bottom sheet showing app icons for sharing is an OS standard component, consistent across iOS and Android.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the save button?';
	@override String get subtitle => 'Flag symbols are the universal language for save';
	@override String get saveTitle => 'Flag/bookmark icons mean save';
	@override String get saveDesc => 'Flags, ribbons, + icons used for favorites and watch later consistently mean hold this item.';
	@override String get feedbackTitle => 'Color change communicates completion';
	@override String get feedbackDesc => 'Icons changing from gray to red/yellow/blue show the registered state transition visually.';
	@override String get listTitle => 'Watch later list creates motivation';
	@override String get listDesc => 'List functionality to store content is common across Netflix, YouTube, Spotify.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the subtitle setting?';
	@override String get subtitle => 'Settings are hidden behind ⋮ or ⚙';
	@override String get menuTitle => '⋮ menu is the gateway to hidden features';
	@override String get menuDesc => 'Three dots ⋮ or hamburger ≡ indicate more features exist. Advanced settings like subtitles are often hidden here.';
	@override String get ccTitle => 'CC is an international standard symbol';
	@override String get ccDesc => 'CC or subtitle icon (box with lines) is an international standard symbol for subtitles from broadcast TV era.';
	@override String get settingsTitle => 'Toggle switch UI is intuitive';
	@override String get settingsDesc => 'Toggle switches modeled on physical switches communicate state through color and position without language.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Please play a video',
			'quiz1.insight.title' => 'How did you know the play button?',
			'quiz1.insight.subtitle' => '▶ is the universal play symbol',
			'quiz1.insight.playTitle' => 'The ▶ mark has not changed for 60+ years',
			'quiz1.insight.playDesc' => 'Used since the tape recorder era (1960s), ▶ (right-pointing triangle) remains universally understood as play even in the digital age.',
			'quiz1.insight.thumbnailTitle' => 'Thumbnails preview content',
			'quiz1.insight.thumbnailDesc' => 'Thumbnails showing video previews communicate content without text descriptions.',
			'quiz1.insight.progressTitle' => 'Progress bar shows remaining time',
			'quiz1.insight.progressDesc' => 'The thin bar at the bottom shows how much has been watched. This seek bar pattern is standard in media players worldwide.',
			'quiz2.missionText' => 'Please share a video',
			'quiz2.insight.title' => 'How did you find the share button?',
			'quiz2.insight.subtitle' => 'Share icons visualize connection',
			'quiz2.insight.shareTitle' => 'Share icon shape tells its meaning',
			'quiz2.insight.shareDesc' => 'Three dots connected by lines (Android) or upward arrow (iOS) visualize sending outward. Unified across global apps.',
			'quiz2.insight.actionTitle' => 'Action button row arranges functions',
			'quiz2.insight.actionDesc' => 'Like, share, save, more arranged horizontally is standard on YouTube, TikTok, Twitter.',
			'quiz2.insight.modalTitle' => 'Share sheet presents options',
			'quiz2.insight.modalDesc' => 'The bottom sheet showing app icons for sharing is an OS standard component, consistent across iOS and Android.',
			'quiz3.missionText' => 'Please save the video to favorites',
			'quiz3.insight.title' => 'How did you find the save button?',
			'quiz3.insight.subtitle' => 'Flag symbols are the universal language for save',
			'quiz3.insight.saveTitle' => 'Flag/bookmark icons mean save',
			'quiz3.insight.saveDesc' => 'Flags, ribbons, + icons used for favorites and watch later consistently mean hold this item.',
			'quiz3.insight.feedbackTitle' => 'Color change communicates completion',
			'quiz3.insight.feedbackDesc' => 'Icons changing from gray to red/yellow/blue show the registered state transition visually.',
			'quiz3.insight.listTitle' => 'Watch later list creates motivation',
			'quiz3.insight.listDesc' => 'List functionality to store content is common across Netflix, YouTube, Spotify.',
			'quiz4.missionText' => 'Please turn on subtitles for the video',
			'quiz4.insight.title' => 'How did you find the subtitle setting?',
			'quiz4.insight.subtitle' => 'Settings are hidden behind ⋮ or ⚙',
			'quiz4.insight.menuTitle' => '⋮ menu is the gateway to hidden features',
			'quiz4.insight.menuDesc' => 'Three dots ⋮ or hamburger ≡ indicate more features exist. Advanced settings like subtitles are often hidden here.',
			'quiz4.insight.ccTitle' => 'CC is an international standard symbol',
			'quiz4.insight.ccDesc' => 'CC or subtitle icon (box with lines) is an international standard symbol for subtitles from broadcast TV era.',
			'quiz4.insight.settingsTitle' => 'Toggle switch UI is intuitive',
			'quiz4.insight.settingsDesc' => 'Toggle switches modeled on physical switches communicate state through color and position without language.',
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
