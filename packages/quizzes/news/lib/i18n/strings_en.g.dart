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
	@override String get missionText => 'Refresh the news to get the latest updates';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Check the top news in the Sports category';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'The text in this article is too small to read. Change the font size to Large.';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Hide the movie review article that contains spoilers from the list';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'News';
	@override String get tabTop => 'Top';
	@override String get tabEntertainment => 'Entertainment';
	@override String get tabSports => 'Sports';
	@override String get noArticles => 'No articles';
	@override String get hideArticle => 'Hide this article';
	@override String get fontSizeLabel => 'Font size';
	@override String get fontSizeSmall => 'Small';
	@override String get fontSizeMedium => 'Medium';
	@override String get fontSizeLarge => 'Large';
	@override String get moreOptions => 'More options';
	@override String get articleDetailTitle => 'Article detail';
	@override String get spoilerLabel => 'Spoiler';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know pulling down would refresh the news?';
	@override String get subtitle => 'Pulling down is the universal refresh gesture';
	@override String get pullTitle => 'Pull to Refresh';
	@override String get pullDesc => 'Pulling down on a list screen is a refresh gesture popularized by Twitter and mail apps. It is now adopted by apps worldwide.';
	@override String get spinnerTitle => 'Spinning circle means loading';
	@override String get spinnerDesc => 'The rotating circular indicator is a common visual language used worldwide in apps to indicate processing or loading.';
	@override String get feedTitle => 'Feeds always need the latest info';
	@override String get feedDesc => 'Information feed screens like news, social media, and mail are designed to trigger a manual refresh when pulled from top to bottom.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know swiping sideways would switch categories?';
	@override String get subtitle => 'Tabs are a sign of horizontally arranged pages';
	@override String get tabTitle => 'Tab UI supports horizontal swiping';
	@override String get tabDesc => 'Tabs lined up at the top are a table of contents for categories. It is standard design to switch between them by swiping horizontally like turning pages.';
	@override String get swipeTitle => 'Moving a finger sideways feels like turning a page';
	@override String get swipeDesc => 'Swiping left and right like turning the pages of a book is the most natural page-switching gesture in mobile apps.';
	@override String get labelTitle => 'Tab labels point to the target category';
	@override String get labelDesc => 'You can reach the information you need by tapping the tab labeled Sports or swiping to it.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know the Aa icon could change the font size?';
	@override String get subtitle => 'Aa is the universal icon for font settings';
	@override String get aaTitle => 'Aa is the world-standard icon for changing font size';
	@override String get aaDesc => 'An icon showing an uppercase A and lowercase a together is adopted by browsers and apps worldwide as a symbol for font size and display settings.';
	@override String get accessTitle => 'Accessibility and user preferences';
	@override String get accessDesc => 'Many apps have a feature that lets you adjust text visibility yourself when the text is too small to read comfortably.';
	@override String get sizeTitle => 'Small, medium, large is the classic set';
	@override String get sizeDesc => 'Font size options with three levels of small, medium, and large are the standard. It is standard design to let users choose according to their preference or eyesight.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know long pressing would let you hide the article?';
	@override String get subtitle => 'Long press is a gesture that reveals hidden options';
	@override String get longPressTitle => 'Long press opens additional menu options';
	@override String get longPressDesc => 'Pressing and holding an icon or item to reveal additional options is an interaction pattern common to both Android and iOS.';
	@override String get menuTitle => 'The ... icon is a sign of hidden actions';
	@override String get menuDesc => 'The ellipsis or vertical three-dot icon is a universal UI symbol meaning More Options. Tapping it expands a menu.';
	@override String get hideTitle => 'Control your information with the hide feature';
	@override String get hideDesc => 'The ability to individually hide articles and notifications you do not want to see is a standard feature of modern news apps and social media.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Refresh the news to get the latest updates',
			'quiz1.insight.title' => 'How did you know pulling down would refresh the news?',
			'quiz1.insight.subtitle' => 'Pulling down is the universal refresh gesture',
			'quiz1.insight.pullTitle' => 'Pull to Refresh',
			'quiz1.insight.pullDesc' => 'Pulling down on a list screen is a refresh gesture popularized by Twitter and mail apps. It is now adopted by apps worldwide.',
			'quiz1.insight.spinnerTitle' => 'Spinning circle means loading',
			'quiz1.insight.spinnerDesc' => 'The rotating circular indicator is a common visual language used worldwide in apps to indicate processing or loading.',
			'quiz1.insight.feedTitle' => 'Feeds always need the latest info',
			'quiz1.insight.feedDesc' => 'Information feed screens like news, social media, and mail are designed to trigger a manual refresh when pulled from top to bottom.',
			'quiz2.missionText' => 'Check the top news in the Sports category',
			'quiz2.insight.title' => 'How did you know swiping sideways would switch categories?',
			'quiz2.insight.subtitle' => 'Tabs are a sign of horizontally arranged pages',
			'quiz2.insight.tabTitle' => 'Tab UI supports horizontal swiping',
			'quiz2.insight.tabDesc' => 'Tabs lined up at the top are a table of contents for categories. It is standard design to switch between them by swiping horizontally like turning pages.',
			'quiz2.insight.swipeTitle' => 'Moving a finger sideways feels like turning a page',
			'quiz2.insight.swipeDesc' => 'Swiping left and right like turning the pages of a book is the most natural page-switching gesture in mobile apps.',
			'quiz2.insight.labelTitle' => 'Tab labels point to the target category',
			'quiz2.insight.labelDesc' => 'You can reach the information you need by tapping the tab labeled Sports or swiping to it.',
			'quiz3.missionText' => 'The text in this article is too small to read. Change the font size to Large.',
			'quiz3.insight.title' => 'How did you know the Aa icon could change the font size?',
			'quiz3.insight.subtitle' => 'Aa is the universal icon for font settings',
			'quiz3.insight.aaTitle' => 'Aa is the world-standard icon for changing font size',
			'quiz3.insight.aaDesc' => 'An icon showing an uppercase A and lowercase a together is adopted by browsers and apps worldwide as a symbol for font size and display settings.',
			'quiz3.insight.accessTitle' => 'Accessibility and user preferences',
			'quiz3.insight.accessDesc' => 'Many apps have a feature that lets you adjust text visibility yourself when the text is too small to read comfortably.',
			'quiz3.insight.sizeTitle' => 'Small, medium, large is the classic set',
			'quiz3.insight.sizeDesc' => 'Font size options with three levels of small, medium, and large are the standard. It is standard design to let users choose according to their preference or eyesight.',
			'quiz4.missionText' => 'Hide the movie review article that contains spoilers from the list',
			'quiz4.insight.title' => 'How did you know long pressing would let you hide the article?',
			'quiz4.insight.subtitle' => 'Long press is a gesture that reveals hidden options',
			'quiz4.insight.longPressTitle' => 'Long press opens additional menu options',
			'quiz4.insight.longPressDesc' => 'Pressing and holding an icon or item to reveal additional options is an interaction pattern common to both Android and iOS.',
			'quiz4.insight.menuTitle' => 'The ... icon is a sign of hidden actions',
			'quiz4.insight.menuDesc' => 'The ellipsis or vertical three-dot icon is a universal UI symbol meaning More Options. Tapping it expands a menu.',
			'quiz4.insight.hideTitle' => 'Control your information with the hide feature',
			'quiz4.insight.hideDesc' => 'The ability to individually hide articles and notifications you do not want to see is a standard feature of modern news apps and social media.',
			'common.appTitle' => 'News',
			'common.tabTop' => 'Top',
			'common.tabEntertainment' => 'Entertainment',
			'common.tabSports' => 'Sports',
			'common.noArticles' => 'No articles',
			'common.hideArticle' => 'Hide this article',
			'common.fontSizeLabel' => 'Font size',
			'common.fontSizeSmall' => 'Small',
			'common.fontSizeMedium' => 'Medium',
			'common.fontSizeLarge' => 'Large',
			'common.moreOptions' => 'More options',
			'common.articleDetailTitle' => 'Article detail',
			'common.spoilerLabel' => 'Spoiler',
			_ => null,
		};
	}
}
