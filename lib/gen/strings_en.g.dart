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

	/// en: 'Please play a video'
	String get missionText => 'Please play a video';

	late final TranslationsQuiz1InsightEn insight = TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class TranslationsQuiz2En {
	TranslationsQuiz2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please share a video'
	String get missionText => 'Please share a video';

	late final TranslationsQuiz2InsightEn insight = TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class TranslationsQuiz3En {
	TranslationsQuiz3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please save the video to favorites'
	String get missionText => 'Please save the video to favorites';

	late final TranslationsQuiz3InsightEn insight = TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class TranslationsQuiz4En {
	TranslationsQuiz4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please turn on subtitles for the video'
	String get missionText => 'Please turn on subtitles for the video';

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

	/// en: 'More'
	String get moreButton => 'More';

	/// en: 'Subscribe'
	String get subscribeButton => 'Subscribe';

	/// en: '{count} views'
	String get views => '{count} views';

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

	/// en: 'How did you know the play button?'
	String get title => 'How did you know the play button?';

	/// en: '▶ is the universal play symbol'
	String get subtitle => '▶ is the universal play symbol';

	/// en: 'The ▶ mark has not changed for 60+ years'
	String get playTitle => 'The ▶ mark has not changed for 60+ years';

	/// en: 'Used since the tape recorder era (1960s), ▶ (right-pointing triangle) remains universally understood as play even in the digital age.'
	String get playDesc => 'Used since the tape recorder era (1960s), ▶ (right-pointing triangle) remains universally understood as play even in the digital age.';

	/// en: 'Thumbnails preview content'
	String get thumbnailTitle => 'Thumbnails preview content';

	/// en: 'Thumbnails showing video previews communicate content without text descriptions.'
	String get thumbnailDesc => 'Thumbnails showing video previews communicate content without text descriptions.';

	/// en: 'Progress bar shows remaining time'
	String get progressTitle => 'Progress bar shows remaining time';

	/// en: 'The thin bar at the bottom shows how much has been watched. This seek bar pattern is standard in media players worldwide.'
	String get progressDesc => 'The thin bar at the bottom shows how much has been watched. This seek bar pattern is standard in media players worldwide.';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightEn {
	TranslationsQuiz2InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the share button?'
	String get title => 'How did you find the share button?';

	/// en: 'Share icons visualize connection'
	String get subtitle => 'Share icons visualize connection';

	/// en: 'Share icon shape tells its meaning'
	String get shareTitle => 'Share icon shape tells its meaning';

	/// en: 'Three dots connected by lines (Android) or upward arrow (iOS) visualize sending outward. Unified across global apps.'
	String get shareDesc => 'Three dots connected by lines (Android) or upward arrow (iOS) visualize sending outward. Unified across global apps.';

	/// en: 'Action button row arranges functions'
	String get actionTitle => 'Action button row arranges functions';

	/// en: 'Like, share, save, more arranged horizontally is standard on YouTube, TikTok, Twitter.'
	String get actionDesc => 'Like, share, save, more arranged horizontally is standard on YouTube, TikTok, Twitter.';

	/// en: 'Share sheet presents options'
	String get modalTitle => 'Share sheet presents options';

	/// en: 'The bottom sheet showing app icons for sharing is an OS standard component, consistent across iOS and Android.'
	String get modalDesc => 'The bottom sheet showing app icons for sharing is an OS standard component, consistent across iOS and Android.';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightEn {
	TranslationsQuiz3InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the save button?'
	String get title => 'How did you find the save button?';

	/// en: 'Flag symbols are the universal language for save'
	String get subtitle => 'Flag symbols are the universal language for save';

	/// en: 'Flag/bookmark icons mean save'
	String get saveTitle => 'Flag/bookmark icons mean save';

	/// en: 'Flags, ribbons, + icons used for favorites and watch later consistently mean hold this item.'
	String get saveDesc => 'Flags, ribbons, + icons used for favorites and watch later consistently mean hold this item.';

	/// en: 'Color change communicates completion'
	String get feedbackTitle => 'Color change communicates completion';

	/// en: 'Icons changing from gray to red/yellow/blue show the registered state transition visually.'
	String get feedbackDesc => 'Icons changing from gray to red/yellow/blue show the registered state transition visually.';

	/// en: 'Watch later list creates motivation'
	String get listTitle => 'Watch later list creates motivation';

	/// en: 'List functionality to store content is common across Netflix, YouTube, Spotify.'
	String get listDesc => 'List functionality to store content is common across Netflix, YouTube, Spotify.';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightEn {
	TranslationsQuiz4InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the subtitle setting?'
	String get title => 'How did you find the subtitle setting?';

	/// en: 'Settings are hidden behind ⋮ or ⚙'
	String get subtitle => 'Settings are hidden behind ⋮ or ⚙';

	/// en: '⋮ menu is the gateway to hidden features'
	String get menuTitle => '⋮ menu is the gateway to hidden features';

	/// en: 'Three dots ⋮ or hamburger ≡ indicate more features exist. Advanced settings like subtitles are often hidden here.'
	String get menuDesc => 'Three dots ⋮ or hamburger ≡ indicate more features exist. Advanced settings like subtitles are often hidden here.';

	/// en: 'CC is an international standard symbol'
	String get ccTitle => 'CC is an international standard symbol';

	/// en: 'CC or subtitle icon (box with lines) is an international standard symbol for subtitles from broadcast TV era.'
	String get ccDesc => 'CC or subtitle icon (box with lines) is an international standard symbol for subtitles from broadcast TV era.';

	/// en: 'Toggle switch UI is intuitive'
	String get settingsTitle => 'Toggle switch UI is intuitive';

	/// en: 'Toggle switches modeled on physical switches communicate state through color and position without language.'
	String get settingsDesc => 'Toggle switches modeled on physical switches communicate state through color and position without language.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
			'common.views' => '{count} views',
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
