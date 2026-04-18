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
}

// Path: quiz1
class _TranslationsQuiz1En extends TranslationsQuiz1Ja {
	_TranslationsQuiz1En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Give a \'Like\' to the cat photo in your timeline!';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Try posting something!';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Open an image and then return to the previous screen.';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Find @nantom\'s posts by searching!';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'NantoTweet';
	@override String get home => 'Home';
	@override String get search => 'Search';
	@override String get notifications => 'Notifications';
	@override String get profile => 'Profile';
	@override String get mainAccountName => 'Nanto User';
	@override String get mainAccountId => '@nanto_user';
	@override String get subAccountName => 'Nanto\'s Alt';
	@override String get subAccountId => '@nanto_ura';
	@override String get switchAccountLabel => 'Switch Account';
	@override String get post1UserName => 'Nanto Nyanta';
	@override String get post1UserId => '@nanto_nyan';
	@override String get post1Content => 'Took a cute photo today 🐱';
	@override String get post2UserName => 'Nanto Wanko';
	@override String get post2UserId => '@nanto_wanko';
	@override String get post2Content => 'Just back from a walk 🐶';
	@override String get post3UserName => 'Nanto Piyoko';
	@override String get post3UserId => '@nanto_piyo';
	@override String get post3Content => 'Piyo piyo! So full of energy 🐥';
	@override String get post4UserName => 'Nanto Usakichi';
	@override String get post4UserId => '@nanto_usa';
	@override String get post4Content => 'Ate lots of carrots today 🥕';
	@override String get post5UserName => 'Nanto Hamusuke';
	@override String get post5UserId => '@nanto_hamu';
	@override String get post5Content => 'Can\'t stop running in my wheel 🐹';
	@override String get post6UserName => 'Nanto Kamejiro';
	@override String get post6UserId => '@nanto_kame';
	@override String get post6Content => 'Taking a slow sunbath 🐢';
	@override String get post7UserName => 'Nanto Sakanaman';
	@override String get post7UserId => '@nanto_sakana';
	@override String get post7Content => 'Swimming happily after the tank was cleaned 🐟';
	@override String get post8UserName => 'Nanto Suzume';
	@override String get post8UserId => '@nanto_suzume';
	@override String get post8Content => 'Chirp chirp! Doing great today 🐦';
	@override String get post9UserName => 'Nanto Nekohira';
	@override String get post9UserId => '@nanto_neko2';
	@override String get post9Content => 'Nap time... 😴';
	@override String get post10UserName => 'Nanto Kumataro';
	@override String get post10UserId => '@nanto_kuma';
	@override String get post10Content => 'I\'m starting to crave some honey 🍯';
	@override String get post => 'Post';
	@override String get cancel => 'Cancel';
	@override String get composeHint => 'What\'s happening?';
	@override String get composePlaceholder => 'Compose screen (Twitter-like UI planned)';
	@override late final _TranslationsCommonTrendsEn trends = _TranslationsCommonTrendsEn._(_root);
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did a double-tap \'Like\' the post?';
	@override String get subtitle => 'Double-tap = \'Like\' is a standard SNS gesture';
	@override String get doubleTapTitle => 'Double-tap is a shortcut for \'Like\'';
	@override String get doubleTapDesc => 'On X (formerly Twitter) and Instagram, you can quickly double-tap a post\'s photo to \'Like\' it. It\'s an intuitive way to interact without searching for the heart button.';
	@override String get heartTitle => 'Heart animation confirms your action';
	@override String get heartDesc => 'When you double-tap, a large heart appears in the center of the image. This feedback animation tells you that your action was correctly recognized.';
	@override String get gestureTitle => 'SNS gestures are global standards';
	@override String get gestureDesc => 'Common gestures like \'double-tap to like\' are used across many platforms like Instagram, X, and TikTok. Once learned, they can be used in many apps.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Why did the post screen appear from the bottom?';
	@override String get subtitle => 'The \'+\' button is a sign for \'Create New\'';
	@override String get swipeTitle => 'The role of the FAB (Floating Action Button)';
	@override String get swipeDesc => 'The \'+\' button floating at the bottom right indicates the most important action (posting in SNS). It\'s placed where your thumb can easily reach it.';
	@override String get fullscreenTitle => 'Keyboard opens automatically';
	@override String get fullscreenDesc => 'When you open the post screen, the input field is automatically focused, and the keyboard appears, allowing you to start typing immediately.';
	@override String get backTitle => 'Post button color changes';
	@override String get backDesc => 'The post button is dimmed when no text is entered. As you type, the color deepens, visually signaling that the action is now possible.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did swiping down close the image?';
	@override String get subtitle => 'Swipe down = \'Back/Close\' intuitive action';
	@override String get swipeTitle => 'Swipe down is an intuitive \'Close\' gesture';
	@override String get swipeDesc => 'Swiping (flicking) down on a full-screen image returns you to the previous screen. The \'dropping\' sensation ties intuitively to the act of closing.';
	@override String get fullscreenTitle => 'Full screen mode opens with a tap';
	@override String get fullscreenDesc => 'In SNS apps, tapping an image opens it in full-screen mode, allowing you to zoom in or view it in more detail.';
	@override String get backTitle => 'Closeable even without an \'X\' button';
	@override String get backDesc => 'On mobile UIs, you can often close screens with swipe gestures even without an \'X\' button. Trying different gestures is key.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did \'from:\' work for searching?';
	@override String get subtitle => 'Search commands for efficient filtering';
	@override String get longPressTitle => 'The convenience of search commands (from:)';
	@override String get longPressDesc => 'Typing \'from:username\' allows you to search for posts from a specific user. SNS search bars often support such commands for advanced filtering.';
	@override String get subAccountTitle => 'Switching tabs via icons';
	@override String get subAccountDesc => 'The magnifying glass icon is a global symbol for \'Search\'. You can intuitively switch functions using the icons in the tab bar.';
	@override String get multiAccountTitle => 'Smooth search with auto-focus';
	@override String get multiAccountDesc => 'The cursor automatically moves to the search bar when you switch to the search tab, allowing you to start typing without an extra tap.';
}

// Path: common.trends
class _TranslationsCommonTrendsEn extends TranslationsCommonTrendsJa {
	_TranslationsCommonTrendsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get trendingInJapan => 'Trending in Japan';
	@override String get technologyTrending => 'Technology · Trending';
	@override String get gamingTrending => 'Gaming · Trending';
	@override String get postsCountSuffix => ' posts';
	@override String get nantoNack => 'Nanto Nack';
	@override String get flutter => 'Flutter';
	@override String get retroGames => 'Retro Games';
	@override String get uiUxQuiz => 'UI/UX Quiz';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Give a \'Like\' to the cat photo in your timeline!',
			'quiz1.insight.title' => 'How did a double-tap \'Like\' the post?',
			'quiz1.insight.subtitle' => 'Double-tap = \'Like\' is a standard SNS gesture',
			'quiz1.insight.doubleTapTitle' => 'Double-tap is a shortcut for \'Like\'',
			'quiz1.insight.doubleTapDesc' => 'On X (formerly Twitter) and Instagram, you can quickly double-tap a post\'s photo to \'Like\' it. It\'s an intuitive way to interact without searching for the heart button.',
			'quiz1.insight.heartTitle' => 'Heart animation confirms your action',
			'quiz1.insight.heartDesc' => 'When you double-tap, a large heart appears in the center of the image. This feedback animation tells you that your action was correctly recognized.',
			'quiz1.insight.gestureTitle' => 'SNS gestures are global standards',
			'quiz1.insight.gestureDesc' => 'Common gestures like \'double-tap to like\' are used across many platforms like Instagram, X, and TikTok. Once learned, they can be used in many apps.',
			'quiz2.missionText' => 'Try posting something!',
			'quiz2.insight.title' => 'Why did the post screen appear from the bottom?',
			'quiz2.insight.subtitle' => 'The \'+\' button is a sign for \'Create New\'',
			'quiz2.insight.swipeTitle' => 'The role of the FAB (Floating Action Button)',
			'quiz2.insight.swipeDesc' => 'The \'+\' button floating at the bottom right indicates the most important action (posting in SNS). It\'s placed where your thumb can easily reach it.',
			'quiz2.insight.fullscreenTitle' => 'Keyboard opens automatically',
			'quiz2.insight.fullscreenDesc' => 'When you open the post screen, the input field is automatically focused, and the keyboard appears, allowing you to start typing immediately.',
			'quiz2.insight.backTitle' => 'Post button color changes',
			'quiz2.insight.backDesc' => 'The post button is dimmed when no text is entered. As you type, the color deepens, visually signaling that the action is now possible.',
			'quiz3.missionText' => 'Open an image and then return to the previous screen.',
			'quiz3.insight.title' => 'How did swiping down close the image?',
			'quiz3.insight.subtitle' => 'Swipe down = \'Back/Close\' intuitive action',
			'quiz3.insight.swipeTitle' => 'Swipe down is an intuitive \'Close\' gesture',
			'quiz3.insight.swipeDesc' => 'Swiping (flicking) down on a full-screen image returns you to the previous screen. The \'dropping\' sensation ties intuitively to the act of closing.',
			'quiz3.insight.fullscreenTitle' => 'Full screen mode opens with a tap',
			'quiz3.insight.fullscreenDesc' => 'In SNS apps, tapping an image opens it in full-screen mode, allowing you to zoom in or view it in more detail.',
			'quiz3.insight.backTitle' => 'Closeable even without an \'X\' button',
			'quiz3.insight.backDesc' => 'On mobile UIs, you can often close screens with swipe gestures even without an \'X\' button. Trying different gestures is key.',
			'quiz4.missionText' => 'Find @nantom\'s posts by searching!',
			'quiz4.insight.title' => 'How did \'from:\' work for searching?',
			'quiz4.insight.subtitle' => 'Search commands for efficient filtering',
			'quiz4.insight.longPressTitle' => 'The convenience of search commands (from:)',
			'quiz4.insight.longPressDesc' => 'Typing \'from:username\' allows you to search for posts from a specific user. SNS search bars often support such commands for advanced filtering.',
			'quiz4.insight.subAccountTitle' => 'Switching tabs via icons',
			'quiz4.insight.subAccountDesc' => 'The magnifying glass icon is a global symbol for \'Search\'. You can intuitively switch functions using the icons in the tab bar.',
			'quiz4.insight.multiAccountTitle' => 'Smooth search with auto-focus',
			'quiz4.insight.multiAccountDesc' => 'The cursor automatically moves to the search bar when you switch to the search tab, allowing you to start typing without an extra tap.',
			'common.appTitle' => 'NantoTweet',
			'common.home' => 'Home',
			'common.search' => 'Search',
			'common.notifications' => 'Notifications',
			'common.profile' => 'Profile',
			'common.mainAccountName' => 'Nanto User',
			'common.mainAccountId' => '@nanto_user',
			'common.subAccountName' => 'Nanto\'s Alt',
			'common.subAccountId' => '@nanto_ura',
			'common.switchAccountLabel' => 'Switch Account',
			'common.post1UserName' => 'Nanto Nyanta',
			'common.post1UserId' => '@nanto_nyan',
			'common.post1Content' => 'Took a cute photo today 🐱',
			'common.post2UserName' => 'Nanto Wanko',
			'common.post2UserId' => '@nanto_wanko',
			'common.post2Content' => 'Just back from a walk 🐶',
			'common.post3UserName' => 'Nanto Piyoko',
			'common.post3UserId' => '@nanto_piyo',
			'common.post3Content' => 'Piyo piyo! So full of energy 🐥',
			'common.post4UserName' => 'Nanto Usakichi',
			'common.post4UserId' => '@nanto_usa',
			'common.post4Content' => 'Ate lots of carrots today 🥕',
			'common.post5UserName' => 'Nanto Hamusuke',
			'common.post5UserId' => '@nanto_hamu',
			'common.post5Content' => 'Can\'t stop running in my wheel 🐹',
			'common.post6UserName' => 'Nanto Kamejiro',
			'common.post6UserId' => '@nanto_kame',
			'common.post6Content' => 'Taking a slow sunbath 🐢',
			'common.post7UserName' => 'Nanto Sakanaman',
			'common.post7UserId' => '@nanto_sakana',
			'common.post7Content' => 'Swimming happily after the tank was cleaned 🐟',
			'common.post8UserName' => 'Nanto Suzume',
			'common.post8UserId' => '@nanto_suzume',
			'common.post8Content' => 'Chirp chirp! Doing great today 🐦',
			'common.post9UserName' => 'Nanto Nekohira',
			'common.post9UserId' => '@nanto_neko2',
			'common.post9Content' => 'Nap time... 😴',
			'common.post10UserName' => 'Nanto Kumataro',
			'common.post10UserId' => '@nanto_kuma',
			'common.post10Content' => 'I\'m starting to crave some honey 🍯',
			'common.post' => 'Post',
			'common.cancel' => 'Cancel',
			'common.composeHint' => 'What\'s happening?',
			'common.composePlaceholder' => 'Compose screen (Twitter-like UI planned)',
			'common.trends.trendingInJapan' => 'Trending in Japan',
			'common.trends.technologyTrending' => 'Technology · Trending',
			'common.trends.gamingTrending' => 'Gaming · Trending',
			'common.trends.postsCountSuffix' => ' posts',
			'common.trends.nantoNack' => 'Nanto Nack',
			'common.trends.flutter' => 'Flutter',
			'common.trends.retroGames' => 'Retro Games',
			'common.trends.uiUxQuiz' => 'UI/UX Quiz',
			_ => null,
		};
	}
}
