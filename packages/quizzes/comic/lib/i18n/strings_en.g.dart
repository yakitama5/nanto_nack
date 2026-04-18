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
	@override late final _TranslationsEndPageEn endPage = _TranslationsEndPageEn._(_root);
}

// Path: quiz1
class _TranslationsQuiz1En extends TranslationsQuiz1Ja {
	_TranslationsQuiz1En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get mission => 'I skipped some pages! Go back 3 pages.';
	@override String get hint => 'Tap the right edge of the screen or swipe left to go back a page.';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get mission => 'I can\'t read the small text in the corner... Zoom in!';
	@override String get hint => 'Pinch out with two fingers or double-tap to zoom in.';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get mission => 'Let\'s stop reading for now. Show the menu.';
	@override String get hint => 'Tap the center of the screen to show the menu.';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get mission => 'That was great! Tap the support button 10 times to send power to the creator!';
	@override String get hint => 'Quickly tap the large heart button on the last page 10 times.';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: endPage
class _TranslationsEndPageEn extends TranslationsEndPageJa {
	_TranslationsEndPageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get complete => '完';
	@override String get theEnd => 'The End';
	@override String get supportLabel => 'Support';
	@override String get supportCount => '{count} / {target}';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Page Navigation in Manga Apps';
	@override String get subtitle => 'Japanese manga reads right to left, so \'going back\' means tapping the right side.';
	@override String get step1Title => 'Tap right edge or swipe left';
	@override String get step1Desc => 'Tap the right edge or swipe left to go back one page.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zoom In / Out';
	@override String get subtitle => 'You can zoom in on small text or fine details using pinch or double-tap.';
	@override String get step1Title => 'Pinch Out';
	@override String get step1Desc => 'Spread two fingers on the screen to zoom in on the manga.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Showing the Menu';
	@override String get subtitle => 'Most manga apps show the header/footer menu when you tap the center of the screen.';
	@override String get step1Title => 'Tap the Center';
	@override String get step1Desc => 'Tap the center of the screen to show the header and footer menu.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Support / Like Feature';
	@override String get subtitle => 'Many manga apps have a \'rapid-tap support\' feature to send encouragement to creators.';
	@override String get step1Title => 'Rapid-tap the support button';
	@override String get step1Desc => 'Quickly tap the heart button multiple times to send your support to the creator.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.mission' => 'I skipped some pages! Go back 3 pages.',
			'quiz1.hint' => 'Tap the right edge of the screen or swipe left to go back a page.',
			'quiz1.insight.title' => 'Page Navigation in Manga Apps',
			'quiz1.insight.subtitle' => 'Japanese manga reads right to left, so \'going back\' means tapping the right side.',
			'quiz1.insight.step1Title' => 'Tap right edge or swipe left',
			'quiz1.insight.step1Desc' => 'Tap the right edge or swipe left to go back one page.',
			'quiz2.mission' => 'I can\'t read the small text in the corner... Zoom in!',
			'quiz2.hint' => 'Pinch out with two fingers or double-tap to zoom in.',
			'quiz2.insight.title' => 'Zoom In / Out',
			'quiz2.insight.subtitle' => 'You can zoom in on small text or fine details using pinch or double-tap.',
			'quiz2.insight.step1Title' => 'Pinch Out',
			'quiz2.insight.step1Desc' => 'Spread two fingers on the screen to zoom in on the manga.',
			'quiz3.mission' => 'Let\'s stop reading for now. Show the menu.',
			'quiz3.hint' => 'Tap the center of the screen to show the menu.',
			'quiz3.insight.title' => 'Showing the Menu',
			'quiz3.insight.subtitle' => 'Most manga apps show the header/footer menu when you tap the center of the screen.',
			'quiz3.insight.step1Title' => 'Tap the Center',
			'quiz3.insight.step1Desc' => 'Tap the center of the screen to show the header and footer menu.',
			'quiz4.mission' => 'That was great! Tap the support button 10 times to send power to the creator!',
			'quiz4.hint' => 'Quickly tap the large heart button on the last page 10 times.',
			'quiz4.insight.title' => 'Support / Like Feature',
			'quiz4.insight.subtitle' => 'Many manga apps have a \'rapid-tap support\' feature to send encouragement to creators.',
			'quiz4.insight.step1Title' => 'Rapid-tap the support button',
			'quiz4.insight.step1Desc' => 'Quickly tap the heart button multiple times to send your support to the creator.',
			'endPage.complete' => '完',
			'endPage.theEnd' => 'The End',
			'endPage.supportLabel' => 'Support',
			'endPage.supportCount' => '{count} / {target}',
			_ => null,
		};
	}
}
