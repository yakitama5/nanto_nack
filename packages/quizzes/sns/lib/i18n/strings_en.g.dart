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
	@override String get missionText => 'Like the cat photo on your timeline';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Close the fullscreen image and return to the timeline';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Scrolled too far! Jump back to the top instantly';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Switch to your secret sub account';
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
	@override String get notifications => 'Notifs';
	@override String get profile => 'Profile';
	@override String get mainAccountName => 'Nanto User';
	@override String get mainAccountId => '@nanto_user';
	@override String get subAccountName => 'Nanto Alt';
	@override String get subAccountId => '@nanto_ura';
	@override String get switchAccountLabel => 'Switch Account';
	@override String get post1UserName => 'Nanto Nyan';
	@override String get post1UserId => '@nanto_nyan';
	@override String get post1Content => 'Got a cute photo today 🐱';
	@override String get post2UserName => 'Nanto Wanko';
	@override String get post2UserId => '@nanto_wanko';
	@override String get post2Content => 'Just got back from a walk 🐶';
	@override String get post3UserName => 'Nanto Piyo';
	@override String get post3UserId => '@nanto_piyo';
	@override String get post3Content => 'Piyo piyo! Full of energy 🐥';
	@override String get post4UserName => 'Nanto Usa';
	@override String get post4UserId => '@nanto_usa';
	@override String get post4Content => 'Ate lots of carrots today 🥕';
	@override String get post5UserName => 'Nanto Hamu';
	@override String get post5UserId => '@nanto_hamu';
	@override String get post5Content => 'The wheel just won\'t stop spinning 🐹';
	@override String get post6UserName => 'Nanto Kame';
	@override String get post6UserId => '@nanto_kame';
	@override String get post6Content => 'Slowly soaking up the sun 🐢';
	@override String get post7UserName => 'Nanto Sakana';
	@override String get post7UserId => '@nanto_sakana';
	@override String get post7Content => 'Cleaned the tank and they look so happy 🐟';
	@override String get post8UserName => 'Nanto Suzume';
	@override String get post8UserId => '@nanto_suzume';
	@override String get post8Content => 'Tweet tweet! Feeling great today 🐦';
	@override String get post9UserName => 'Nanto Neko2';
	@override String get post9UserId => '@nanto_neko2';
	@override String get post9Content => 'Nap time 😴';
	@override String get post10UserName => 'Nanto Kuma';
	@override String get post10UserId => '@nanto_kuma';
	@override String get post10Content => 'Craving some honey 🍯';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Why could you like with a double tap?';
	@override String get subtitle => 'Double tap = like is the standard SNS gesture';
	@override String get doubleTapTitle => 'Double tap is a shortcut for liking';
	@override String get doubleTapDesc => 'On X (formerly Twitter) and Instagram, quickly tapping a photo twice gives it a like. No need to find the heart button — it\'s an intuitive shortcut.';
	@override String get heartTitle => 'The heart animation confirms your action';
	@override String get heartDesc => 'When you double tap, a large heart appears in the center of the image. This is called feedback animation — it lets you know the app recognized your gesture.';
	@override String get gestureTitle => 'SNS gestures are universal across apps';
	@override String get gestureDesc => 'Double tap to like is a common gesture across Instagram, X, TikTok, and many other social apps. Learn it once and use it everywhere.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Why could you close by swiping down?';
	@override String get subtitle => 'Swipe down = close/dismiss is an intuitive gesture';
	@override String get swipeTitle => 'Swipe down is the intuitive gesture to close';
	@override String get swipeDesc => 'Swiping a fullscreen image downward closes it and returns to the previous screen. The gravity-like \'drop\' motion intuitively maps to dismissing content.';
	@override String get fullscreenTitle => 'Fullscreen mode opens with a tap';
	@override String get fullscreenDesc => 'In SNS apps, tapping a post image opens it in fullscreen mode, allowing you to pinch to zoom and view it in detail.';
	@override String get backTitle => 'You can close without an X button';
	@override String get backDesc => 'On smartphones, swipe gestures let you close screens even without a visible X button. Trying gestures even without obvious cues is key.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you jump back to the top so fast?';
	@override String get subtitle => 'Tap status bar or home tab = scroll to top';
	@override String get statusBarTitle => 'Tapping the status bar scrolls to the top';
	@override String get statusBarDesc => 'Tapping the status bar (the clock area on iPhone) instantly scrolls to the top in many apps. It saves you from manually scrolling back up through a long feed.';
	@override String get homeTabTitle => 'Tapping the active home tab also scrolls to top';
	@override String get homeTabDesc => 'Tapping the currently active tab (like the Home button) a second time scrolls the timeline back to the top — a trick that works in many apps beyond just SNS.';
	@override String get efficientTitle => 'Jumping is far faster than scrolling';
	@override String get efficientDesc => 'Manually scrolling back to the top through endless content is inefficient. Knowing the shortcut gesture makes app navigation dramatically faster.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Why could you switch accounts with a long press?';
	@override String get subtitle => 'Long press the profile icon to switch accounts';
	@override String get longPressTitle => 'Long press the profile icon to choose accounts';
	@override String get longPressDesc => 'In many SNS apps, long pressing the profile icon or avatar reveals an account-switching menu. It lets you quickly switch between multiple accounts.';
	@override String get subAccountTitle => 'Sub accounts are kept separate from main accounts';
	@override String get subAccountDesc => 'Many SNS users maintain a main account and a sub account for hobbies or anonymous posting. The long press shortcut makes switching between them quick and easy.';
	@override String get multiAccountTitle => 'Managing multiple accounts is a modern skill';
	@override String get multiAccountDesc => 'Having multiple SNS accounts — for work, personal use, hobbies — has become commonplace. Mastering account switching helps you use SNS more effectively.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Like the cat photo on your timeline',
			'quiz1.insight.title' => 'Why could you like with a double tap?',
			'quiz1.insight.subtitle' => 'Double tap = like is the standard SNS gesture',
			'quiz1.insight.doubleTapTitle' => 'Double tap is a shortcut for liking',
			'quiz1.insight.doubleTapDesc' => 'On X (formerly Twitter) and Instagram, quickly tapping a photo twice gives it a like. No need to find the heart button — it\'s an intuitive shortcut.',
			'quiz1.insight.heartTitle' => 'The heart animation confirms your action',
			'quiz1.insight.heartDesc' => 'When you double tap, a large heart appears in the center of the image. This is called feedback animation — it lets you know the app recognized your gesture.',
			'quiz1.insight.gestureTitle' => 'SNS gestures are universal across apps',
			'quiz1.insight.gestureDesc' => 'Double tap to like is a common gesture across Instagram, X, TikTok, and many other social apps. Learn it once and use it everywhere.',
			'quiz2.missionText' => 'Close the fullscreen image and return to the timeline',
			'quiz2.insight.title' => 'Why could you close by swiping down?',
			'quiz2.insight.subtitle' => 'Swipe down = close/dismiss is an intuitive gesture',
			'quiz2.insight.swipeTitle' => 'Swipe down is the intuitive gesture to close',
			'quiz2.insight.swipeDesc' => 'Swiping a fullscreen image downward closes it and returns to the previous screen. The gravity-like \'drop\' motion intuitively maps to dismissing content.',
			'quiz2.insight.fullscreenTitle' => 'Fullscreen mode opens with a tap',
			'quiz2.insight.fullscreenDesc' => 'In SNS apps, tapping a post image opens it in fullscreen mode, allowing you to pinch to zoom and view it in detail.',
			'quiz2.insight.backTitle' => 'You can close without an X button',
			'quiz2.insight.backDesc' => 'On smartphones, swipe gestures let you close screens even without a visible X button. Trying gestures even without obvious cues is key.',
			'quiz3.missionText' => 'Scrolled too far! Jump back to the top instantly',
			'quiz3.insight.title' => 'How did you jump back to the top so fast?',
			'quiz3.insight.subtitle' => 'Tap status bar or home tab = scroll to top',
			'quiz3.insight.statusBarTitle' => 'Tapping the status bar scrolls to the top',
			'quiz3.insight.statusBarDesc' => 'Tapping the status bar (the clock area on iPhone) instantly scrolls to the top in many apps. It saves you from manually scrolling back up through a long feed.',
			'quiz3.insight.homeTabTitle' => 'Tapping the active home tab also scrolls to top',
			'quiz3.insight.homeTabDesc' => 'Tapping the currently active tab (like the Home button) a second time scrolls the timeline back to the top — a trick that works in many apps beyond just SNS.',
			'quiz3.insight.efficientTitle' => 'Jumping is far faster than scrolling',
			'quiz3.insight.efficientDesc' => 'Manually scrolling back to the top through endless content is inefficient. Knowing the shortcut gesture makes app navigation dramatically faster.',
			'quiz4.missionText' => 'Switch to your secret sub account',
			'quiz4.insight.title' => 'Why could you switch accounts with a long press?',
			'quiz4.insight.subtitle' => 'Long press the profile icon to switch accounts',
			'quiz4.insight.longPressTitle' => 'Long press the profile icon to choose accounts',
			'quiz4.insight.longPressDesc' => 'In many SNS apps, long pressing the profile icon or avatar reveals an account-switching menu. It lets you quickly switch between multiple accounts.',
			'quiz4.insight.subAccountTitle' => 'Sub accounts are kept separate from main accounts',
			'quiz4.insight.subAccountDesc' => 'Many SNS users maintain a main account and a sub account for hobbies or anonymous posting. The long press shortcut makes switching between them quick and easy.',
			'quiz4.insight.multiAccountTitle' => 'Managing multiple accounts is a modern skill',
			'quiz4.insight.multiAccountDesc' => 'Having multiple SNS accounts — for work, personal use, hobbies — has become commonplace. Mastering account switching helps you use SNS more effectively.',
			'common.appTitle' => 'NantoTweet',
			'common.home' => 'Home',
			'common.search' => 'Search',
			'common.notifications' => 'Notifs',
			'common.profile' => 'Profile',
			'common.mainAccountName' => 'Nanto User',
			'common.mainAccountId' => '@nanto_user',
			'common.subAccountName' => 'Nanto Alt',
			'common.subAccountId' => '@nanto_ura',
			'common.switchAccountLabel' => 'Switch Account',
			'common.post1UserName' => 'Nanto Nyan',
			'common.post1UserId' => '@nanto_nyan',
			'common.post1Content' => 'Got a cute photo today 🐱',
			'common.post2UserName' => 'Nanto Wanko',
			'common.post2UserId' => '@nanto_wanko',
			'common.post2Content' => 'Just got back from a walk 🐶',
			'common.post3UserName' => 'Nanto Piyo',
			'common.post3UserId' => '@nanto_piyo',
			'common.post3Content' => 'Piyo piyo! Full of energy 🐥',
			'common.post4UserName' => 'Nanto Usa',
			'common.post4UserId' => '@nanto_usa',
			'common.post4Content' => 'Ate lots of carrots today 🥕',
			'common.post5UserName' => 'Nanto Hamu',
			'common.post5UserId' => '@nanto_hamu',
			'common.post5Content' => 'The wheel just won\'t stop spinning 🐹',
			'common.post6UserName' => 'Nanto Kame',
			'common.post6UserId' => '@nanto_kame',
			'common.post6Content' => 'Slowly soaking up the sun 🐢',
			'common.post7UserName' => 'Nanto Sakana',
			'common.post7UserId' => '@nanto_sakana',
			'common.post7Content' => 'Cleaned the tank and they look so happy 🐟',
			'common.post8UserName' => 'Nanto Suzume',
			'common.post8UserId' => '@nanto_suzume',
			'common.post8Content' => 'Tweet tweet! Feeling great today 🐦',
			'common.post9UserName' => 'Nanto Neko2',
			'common.post9UserId' => '@nanto_neko2',
			'common.post9Content' => 'Nap time 😴',
			'common.post10UserName' => 'Nanto Kuma',
			'common.post10UserId' => '@nanto_kuma',
			'common.post10Content' => 'Craving some honey 🍯',
			_ => null,
		};
	}
}
