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
	@override late final _TranslationsEndPageXx endPage = _TranslationsEndPageXx._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Xx extends TranslationsQuiz1Ja {
	_TranslationsQuiz1Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get mission => 'I skipped some pages! Go back 3 pages.';
	@override String get hint => 'Tap the right edge of the screen or swipe left to go back a page.';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get mission => 'I can not read the small text in the corner. Zoom in!';
	@override String get hint => 'Pinch out with two fingers or double-tap to zoom in.';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get mission => 'Let us stop reading for now. Show the menu.';
	@override String get hint => 'Tap the center of the screen to show the menu.';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get mission => 'That was great! Tap the support button ten times to send power to the creator!';
	@override String get hint => 'Quickly tap the large heart button on the last page ten times.';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: endPage
class _TranslationsEndPageXx extends TranslationsEndPageJa {
	_TranslationsEndPageXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get complete => 'Complete';
	@override String get theEnd => 'The End';
	@override String get supportLabel => 'Support';
	@override String get supportCount => '{count} / {target}';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Page Navigation in Manga Apps';
	@override String get subtitle => 'Japanese manga reads right to left, so going back means tapping the right side.';
	@override String get step1Title => 'Tap right edge or swipe left';
	@override String get step1Desc => 'Tap the right edge or swipe left to go back one page.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zoom In and Out';
	@override String get subtitle => 'You can zoom in on small text or fine details using pinch or double-tap.';
	@override String get step1Title => 'Pinch Out';
	@override String get step1Desc => 'Spread two fingers on the screen to zoom in on the manga.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Showing the Menu';
	@override String get subtitle => 'Most manga apps show the header and footer menu when you tap the center of the screen.';
	@override String get step1Title => 'Tap the Center';
	@override String get step1Desc => 'Tap the center of the screen to show the header and footer menu.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Support and Like Feature';
	@override String get subtitle => 'Many manga apps have a rapid-tap support feature to send encouragement to creators.';
	@override String get step1Title => 'Rapid-tap the support button';
	@override String get step1Desc => 'Quickly tap the heart button multiple times to send your support to the creator.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.mission' => 'I skipped some pages! Go back 3 pages.',
			'quiz1.hint' => 'Tap the right edge of the screen or swipe left to go back a page.',
			'quiz1.insight.title' => 'Page Navigation in Manga Apps',
			'quiz1.insight.subtitle' => 'Japanese manga reads right to left, so going back means tapping the right side.',
			'quiz1.insight.step1Title' => 'Tap right edge or swipe left',
			'quiz1.insight.step1Desc' => 'Tap the right edge or swipe left to go back one page.',
			'quiz2.mission' => 'I can not read the small text in the corner. Zoom in!',
			'quiz2.hint' => 'Pinch out with two fingers or double-tap to zoom in.',
			'quiz2.insight.title' => 'Zoom In and Out',
			'quiz2.insight.subtitle' => 'You can zoom in on small text or fine details using pinch or double-tap.',
			'quiz2.insight.step1Title' => 'Pinch Out',
			'quiz2.insight.step1Desc' => 'Spread two fingers on the screen to zoom in on the manga.',
			'quiz3.mission' => 'Let us stop reading for now. Show the menu.',
			'quiz3.hint' => 'Tap the center of the screen to show the menu.',
			'quiz3.insight.title' => 'Showing the Menu',
			'quiz3.insight.subtitle' => 'Most manga apps show the header and footer menu when you tap the center of the screen.',
			'quiz3.insight.step1Title' => 'Tap the Center',
			'quiz3.insight.step1Desc' => 'Tap the center of the screen to show the header and footer menu.',
			'quiz4.mission' => 'That was great! Tap the support button ten times to send power to the creator!',
			'quiz4.hint' => 'Quickly tap the large heart button on the last page ten times.',
			'quiz4.insight.title' => 'Support and Like Feature',
			'quiz4.insight.subtitle' => 'Many manga apps have a rapid-tap support feature to send encouragement to creators.',
			'quiz4.insight.step1Title' => 'Rapid-tap the support button',
			'quiz4.insight.step1Desc' => 'Quickly tap the heart button multiple times to send your support to the creator.',
			'endPage.complete' => 'Complete',
			'endPage.theEnd' => 'The End',
			'endPage.supportLabel' => 'Support',
			'endPage.supportCount' => '{count} / {target}',
			_ => null,
		};
	}
}
