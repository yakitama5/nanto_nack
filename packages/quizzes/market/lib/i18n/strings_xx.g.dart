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
}

// Path: quiz1
class _TranslationsQuiz1Xx extends TranslationsQuiz1Ja {
	_TranslationsQuiz1Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Swipe to check the last photo';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Like to save for later';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Check seller profile and rating';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Tap the button to purchase';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Flea Market';
	@override String get itemTitle => 'Vintage Denim Jacket';
	@override String get itemPrice => '¥3,800';
	@override String get itemDescription => 'A vintage denim jacket. Size M.';
	@override String get sellerName => 'Vintage Enthusiast';
	@override String get buyButton => 'Proceed to Purchase';
	@override String get imageLabel1 => 'Front';
	@override String get imageLabel2 => 'Side';
	@override String get imageLabel3 => 'Back';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Why swiping worked';
	@override String get subtitle => 'Multiple photos show item condition';
	@override String get swipeTitle => 'Swipe to next photo';
	@override String get swipeDesc => 'Swipe through all photos before buying.';
	@override String get checkTitle => 'Check back and scratches';
	@override String get checkDesc => 'All angles matter for condition check.';
	@override String get dotTitle => 'Dots show photo count';
	@override String get dotDesc => 'Dots indicate current and total photos.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Heart saves the item';
	@override String get subtitle => 'Like is the wish list feature';
	@override String get heartTitle => 'Heart for later comparison';
	@override String get heartDesc => 'Liked items go to a saved list.';
	@override String get priceTitle => 'Get price drop alerts';
	@override String get priceDesc => 'Notifications when price drops.';
	@override String get sellTitle => 'Like count shows demand';
	@override String get sellDesc => 'Popular items sell out fast.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profile shows trustworthiness';
	@override String get subtitle => 'Ratings equal transaction confidence';
	@override String get ratingTitle => 'Stars show trust at a glance';
	@override String get ratingDesc => 'High ratings mean reliable sellers.';
	@override String get profileTitle => 'Tap profile for details';
	@override String get profileDesc => 'See history and comments.';
	@override String get trustTitle => 'Review count matters too';
	@override String get trustDesc => 'More reviews mean stable track record.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bottom button starts purchase';
	@override String get subtitle => 'Fixed button is universal e-commerce UI';
	@override String get fixedTitle => 'Fixed bottom button leads to purchase';
	@override String get fixedDesc => 'Always reachable regardless of scroll.';
	@override String get ctaTitle => 'Bright color boosts purchase intent';
	@override String get ctaDesc => 'Red or orange buttons draw user attention.';
	@override String get safeTitle => 'Purchase has multiple steps';
	@override String get safeDesc => 'One tap does not instantly complete a buy.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Swipe to check the last photo',
			'quiz1.insight.title' => 'Why swiping worked',
			'quiz1.insight.subtitle' => 'Multiple photos show item condition',
			'quiz1.insight.swipeTitle' => 'Swipe to next photo',
			'quiz1.insight.swipeDesc' => 'Swipe through all photos before buying.',
			'quiz1.insight.checkTitle' => 'Check back and scratches',
			'quiz1.insight.checkDesc' => 'All angles matter for condition check.',
			'quiz1.insight.dotTitle' => 'Dots show photo count',
			'quiz1.insight.dotDesc' => 'Dots indicate current and total photos.',
			'quiz2.missionText' => 'Like to save for later',
			'quiz2.insight.title' => 'Heart saves the item',
			'quiz2.insight.subtitle' => 'Like is the wish list feature',
			'quiz2.insight.heartTitle' => 'Heart for later comparison',
			'quiz2.insight.heartDesc' => 'Liked items go to a saved list.',
			'quiz2.insight.priceTitle' => 'Get price drop alerts',
			'quiz2.insight.priceDesc' => 'Notifications when price drops.',
			'quiz2.insight.sellTitle' => 'Like count shows demand',
			'quiz2.insight.sellDesc' => 'Popular items sell out fast.',
			'quiz3.missionText' => 'Check seller profile and rating',
			'quiz3.insight.title' => 'Profile shows trustworthiness',
			'quiz3.insight.subtitle' => 'Ratings equal transaction confidence',
			'quiz3.insight.ratingTitle' => 'Stars show trust at a glance',
			'quiz3.insight.ratingDesc' => 'High ratings mean reliable sellers.',
			'quiz3.insight.profileTitle' => 'Tap profile for details',
			'quiz3.insight.profileDesc' => 'See history and comments.',
			'quiz3.insight.trustTitle' => 'Review count matters too',
			'quiz3.insight.trustDesc' => 'More reviews mean stable track record.',
			'quiz4.missionText' => 'Tap the button to purchase',
			'quiz4.insight.title' => 'Bottom button starts purchase',
			'quiz4.insight.subtitle' => 'Fixed button is universal e-commerce UI',
			'quiz4.insight.fixedTitle' => 'Fixed bottom button leads to purchase',
			'quiz4.insight.fixedDesc' => 'Always reachable regardless of scroll.',
			'quiz4.insight.ctaTitle' => 'Bright color boosts purchase intent',
			'quiz4.insight.ctaDesc' => 'Red or orange buttons draw user attention.',
			'quiz4.insight.safeTitle' => 'Purchase has multiple steps',
			'quiz4.insight.safeDesc' => 'One tap does not instantly complete a buy.',
			'common.appTitle' => 'Flea Market',
			'common.itemTitle' => 'Vintage Denim Jacket',
			'common.itemPrice' => '¥3,800',
			'common.itemDescription' => 'A vintage denim jacket. Size M.',
			'common.sellerName' => 'Vintage Enthusiast',
			'common.buyButton' => 'Proceed to Purchase',
			'common.imageLabel1' => 'Front',
			'common.imageLabel2' => 'Side',
			'common.imageLabel3' => 'Back',
			_ => null,
		};
	}
}
