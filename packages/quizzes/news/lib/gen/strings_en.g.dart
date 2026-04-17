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
}

// Path: quiz1
class TranslationsQuiz1En {
	TranslationsQuiz1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Refresh the news to get the latest updates'
	String get missionText => 'Refresh the news to get the latest updates';

	late final TranslationsQuiz1InsightEn insight = TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class TranslationsQuiz2En {
	TranslationsQuiz2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Check the top news in the Sports category'
	String get missionText => 'Check the top news in the Sports category';

	late final TranslationsQuiz2InsightEn insight = TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class TranslationsQuiz3En {
	TranslationsQuiz3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The text in this article is too small to read. Change the font size to Large.'
	String get missionText => 'The text in this article is too small to read. Change the font size to Large.';

	late final TranslationsQuiz3InsightEn insight = TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class TranslationsQuiz4En {
	TranslationsQuiz4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hide the movie review article that contains spoilers from the list'
	String get missionText => 'Hide the movie review article that contains spoilers from the list';

	late final TranslationsQuiz4InsightEn insight = TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News'
	String get appTitle => 'News';

	/// en: 'Top'
	String get tabTop => 'Top';

	/// en: 'Entertainment'
	String get tabEntertainment => 'Entertainment';

	/// en: 'Sports'
	String get tabSports => 'Sports';

	/// en: 'No articles'
	String get noArticles => 'No articles';

	/// en: 'Hide this article'
	String get hideArticle => 'Hide this article';

	/// en: 'Font size'
	String get fontSizeLabel => 'Font size';

	/// en: 'Small'
	String get fontSizeSmall => 'Small';

	/// en: 'Medium'
	String get fontSizeMedium => 'Medium';

	/// en: 'Large'
	String get fontSizeLarge => 'Large';

	/// en: 'More options'
	String get moreOptions => 'More options';

	/// en: 'Article detail'
	String get articleDetailTitle => 'Article detail';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightEn {
	TranslationsQuiz1InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know pulling down would refresh the news?'
	String get title => 'How did you know pulling down would refresh the news?';

	/// en: 'Pulling down is the universal refresh gesture'
	String get subtitle => 'Pulling down is the universal refresh gesture';

	/// en: 'Pull to Refresh'
	String get pullTitle => 'Pull to Refresh';

	/// en: 'Pulling down on a list screen is a refresh gesture popularized by Twitter and mail apps. It is now adopted by apps worldwide.'
	String get pullDesc => 'Pulling down on a list screen is a refresh gesture popularized by Twitter and mail apps. It is now adopted by apps worldwide.';

	/// en: 'Spinning circle means loading'
	String get spinnerTitle => 'Spinning circle means loading';

	/// en: 'The rotating circular indicator is a common visual language used worldwide in apps to indicate processing or loading.'
	String get spinnerDesc => 'The rotating circular indicator is a common visual language used worldwide in apps to indicate processing or loading.';

	/// en: 'Feeds always need the latest info'
	String get feedTitle => 'Feeds always need the latest info';

	/// en: 'Information feed screens like news, social media, and mail are designed to trigger a manual refresh when pulled from top to bottom.'
	String get feedDesc => 'Information feed screens like news, social media, and mail are designed to trigger a manual refresh when pulled from top to bottom.';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightEn {
	TranslationsQuiz2InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know swiping sideways would switch categories?'
	String get title => 'How did you know swiping sideways would switch categories?';

	/// en: 'Tabs are a sign of horizontally arranged pages'
	String get subtitle => 'Tabs are a sign of horizontally arranged pages';

	/// en: 'Tab UI supports horizontal swiping'
	String get tabTitle => 'Tab UI supports horizontal swiping';

	/// en: 'Tabs lined up at the top are a table of contents for categories. It is standard design to switch between them by swiping horizontally like turning pages.'
	String get tabDesc => 'Tabs lined up at the top are a table of contents for categories. It is standard design to switch between them by swiping horizontally like turning pages.';

	/// en: 'Moving a finger sideways feels like turning a page'
	String get swipeTitle => 'Moving a finger sideways feels like turning a page';

	/// en: 'Swiping left and right like turning the pages of a book is the most natural page-switching gesture in mobile apps.'
	String get swipeDesc => 'Swiping left and right like turning the pages of a book is the most natural page-switching gesture in mobile apps.';

	/// en: 'Tab labels point to the target category'
	String get labelTitle => 'Tab labels point to the target category';

	/// en: 'You can reach the information you need by tapping the tab labeled Sports or swiping to it.'
	String get labelDesc => 'You can reach the information you need by tapping the tab labeled Sports or swiping to it.';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightEn {
	TranslationsQuiz3InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know the Aa icon could change the font size?'
	String get title => 'How did you know the Aa icon could change the font size?';

	/// en: 'Aa is the universal icon for font settings'
	String get subtitle => 'Aa is the universal icon for font settings';

	/// en: 'Aa is the world-standard icon for changing font size'
	String get aaTitle => 'Aa is the world-standard icon for changing font size';

	/// en: 'An icon showing an uppercase A and lowercase a together is adopted by browsers and apps worldwide as a symbol for font size and display settings.'
	String get aaDesc => 'An icon showing an uppercase A and lowercase a together is adopted by browsers and apps worldwide as a symbol for font size and display settings.';

	/// en: 'Accessibility and user preferences'
	String get accessTitle => 'Accessibility and user preferences';

	/// en: 'Many apps have a feature that lets you adjust text visibility yourself when the text is too small to read comfortably.'
	String get accessDesc => 'Many apps have a feature that lets you adjust text visibility yourself when the text is too small to read comfortably.';

	/// en: 'Small, medium, large is the classic set'
	String get sizeTitle => 'Small, medium, large is the classic set';

	/// en: 'Font size options with three levels of small, medium, and large are the standard. It is standard design to let users choose according to their preference or eyesight.'
	String get sizeDesc => 'Font size options with three levels of small, medium, and large are the standard. It is standard design to let users choose according to their preference or eyesight.';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightEn {
	TranslationsQuiz4InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know long pressing would let you hide the article?'
	String get title => 'How did you know long pressing would let you hide the article?';

	/// en: 'Long press is a gesture that reveals hidden options'
	String get subtitle => 'Long press is a gesture that reveals hidden options';

	/// en: 'Long press opens additional menu options'
	String get longPressTitle => 'Long press opens additional menu options';

	/// en: 'Pressing and holding an icon or item to reveal additional options is an interaction pattern common to both Android and iOS.'
	String get longPressDesc => 'Pressing and holding an icon or item to reveal additional options is an interaction pattern common to both Android and iOS.';

	/// en: 'The ... icon is a sign of hidden actions'
	String get menuTitle => 'The ... icon is a sign of hidden actions';

	/// en: 'The ellipsis or vertical three-dot icon is a universal UI symbol meaning More Options. Tapping it expands a menu.'
	String get menuDesc => 'The ellipsis or vertical three-dot icon is a universal UI symbol meaning More Options. Tapping it expands a menu.';

	/// en: 'Control your information with the hide feature'
	String get hideTitle => 'Control your information with the hide feature';

	/// en: 'The ability to individually hide articles and notifications you do not want to see is a standard feature of modern news apps and social media.'
	String get hideDesc => 'The ability to individually hide articles and notifications you do not want to see is a standard feature of modern news apps and social media.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
			_ => null,
		};
	}
}
