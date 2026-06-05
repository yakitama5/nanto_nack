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
	@override String get missionText => 'I wonder if there are any scratches on the back. Swipe to the last photo to check';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'I want to compare this later — let me save it with a like for now';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Can I trust this seller? Let me check their profile and ratings';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Alright, I\'ve decided! Let\'s proceed to the purchase';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Flea Market';
	@override String get itemTitle => 'Vintage Denim Jacket';
	@override String get itemPrice => '¥3,800';
	@override String get itemDescription => 'A 1990s denim jacket purchased at a vintage store. Shows slight signs of use but no notable scratches or stains. Size M.';
	@override String get sellerName => 'Vintage Enthusiast';
	@override String get buyButton => 'Proceed to Purchase';
	@override String get imageLabel1 => 'Front';
	@override String get imageLabel2 => 'Side';
	@override String get imageLabel3 => 'Back';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did swiping let you check it?';
	@override String get subtitle => 'Checking multiple photos of a product is standard practice';
	@override String get swipeTitle => 'Swipe left to see the next photo';
	@override String get swipeDesc => 'Flea market apps allow sellers to upload multiple product photos. Swiping through all photos before buying is essential.';
	@override String get checkTitle => 'Always check the back, scratches, and stains';
	@override String get checkDesc => 'Not just the front — check the back, bottom, and areas near logos in all photos. This is the first step to avoiding disputes.';
	@override String get dotTitle => 'Dot indicators show how many photos there are';
	@override String get dotDesc => 'The dots below the image show which photo you are currently viewing. You can tell at a glance whether you have checked all of them.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did the heart save it?';
	@override String get subtitle => 'The like button is a wish list feature in flea market apps';
	@override String get heartTitle => 'Heart saves items for later comparison';
	@override String get heartDesc => 'Liked items are saved to a dedicated list so you can compare multiple candidates at once. A smart way to avoid impulse buying.';
	@override String get priceTitle => 'Get notified of price drops';
	@override String get priceDesc => 'When you like an item, you may receive a notification if the seller lowers the price. Just adding to favorites means you won\'t miss a deal.';
	@override String get sellTitle => 'Gauge demand from like counts';
	@override String get sellDesc => 'Items with many likes are popular and may sell out quickly. Checking the like count of other users helps you judge demand.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did the profile reveal trustworthiness?';
	@override String get subtitle => 'A seller\'s rating is directly tied to transaction confidence';
	@override String get ratingTitle => 'Star ratings show trustworthiness at a glance';
	@override String get ratingDesc => 'Flea market apps accumulate ratings for every transaction. A highly rated seller is more likely to have an honest transaction history, giving you peace of mind.';
	@override String get profileTitle => 'Tap the profile for detailed information';
	@override String get profileDesc => 'Tapping the seller\'s name or rating area takes you to their detailed profile. Check their transaction history and comments to verify their track record.';
	@override String get trustTitle => 'Number of ratings is also a trust indicator';
	@override String get trustDesc => 'A high rating with few reviews is hard to judge. The more ratings a seller has, the more you can trust they have a consistent record.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did the bottom button let you buy?';
	@override String get subtitle => 'A fixed purchase button is a universal design pattern in e-commerce apps';
	@override String get fixedTitle => 'The fixed button at the bottom is the purchase funnel';
	@override String get fixedDesc => 'Flea market apps and e-commerce sites commonly fix the purchase button at the bottom of the screen. You can proceed to purchase anytime regardless of scroll position.';
	@override String get ctaTitle => 'Eye-catching colors boost purchase intent';
	@override String get ctaDesc => 'Purchase buttons are often implemented in eye-catching colors like red or orange. They draw the user\'s attention and serve as a CTA (call to action) to prompt purchases.';
	@override String get safeTitle => 'The purchase process has multiple steps';
	@override String get safeDesc => 'This button is just the entry point to the purchase process. Steps like address confirmation and payment method selection follow, so accidental taps do not immediately complete a purchase.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'I wonder if there are any scratches on the back. Swipe to the last photo to check',
			'quiz1.insight.title' => 'How did swiping let you check it?',
			'quiz1.insight.subtitle' => 'Checking multiple photos of a product is standard practice',
			'quiz1.insight.swipeTitle' => 'Swipe left to see the next photo',
			'quiz1.insight.swipeDesc' => 'Flea market apps allow sellers to upload multiple product photos. Swiping through all photos before buying is essential.',
			'quiz1.insight.checkTitle' => 'Always check the back, scratches, and stains',
			'quiz1.insight.checkDesc' => 'Not just the front — check the back, bottom, and areas near logos in all photos. This is the first step to avoiding disputes.',
			'quiz1.insight.dotTitle' => 'Dot indicators show how many photos there are',
			'quiz1.insight.dotDesc' => 'The dots below the image show which photo you are currently viewing. You can tell at a glance whether you have checked all of them.',
			'quiz2.missionText' => 'I want to compare this later — let me save it with a like for now',
			'quiz2.insight.title' => 'How did the heart save it?',
			'quiz2.insight.subtitle' => 'The like button is a wish list feature in flea market apps',
			'quiz2.insight.heartTitle' => 'Heart saves items for later comparison',
			'quiz2.insight.heartDesc' => 'Liked items are saved to a dedicated list so you can compare multiple candidates at once. A smart way to avoid impulse buying.',
			'quiz2.insight.priceTitle' => 'Get notified of price drops',
			'quiz2.insight.priceDesc' => 'When you like an item, you may receive a notification if the seller lowers the price. Just adding to favorites means you won\'t miss a deal.',
			'quiz2.insight.sellTitle' => 'Gauge demand from like counts',
			'quiz2.insight.sellDesc' => 'Items with many likes are popular and may sell out quickly. Checking the like count of other users helps you judge demand.',
			'quiz3.missionText' => 'Can I trust this seller? Let me check their profile and ratings',
			'quiz3.insight.title' => 'How did the profile reveal trustworthiness?',
			'quiz3.insight.subtitle' => 'A seller\'s rating is directly tied to transaction confidence',
			'quiz3.insight.ratingTitle' => 'Star ratings show trustworthiness at a glance',
			'quiz3.insight.ratingDesc' => 'Flea market apps accumulate ratings for every transaction. A highly rated seller is more likely to have an honest transaction history, giving you peace of mind.',
			'quiz3.insight.profileTitle' => 'Tap the profile for detailed information',
			'quiz3.insight.profileDesc' => 'Tapping the seller\'s name or rating area takes you to their detailed profile. Check their transaction history and comments to verify their track record.',
			'quiz3.insight.trustTitle' => 'Number of ratings is also a trust indicator',
			'quiz3.insight.trustDesc' => 'A high rating with few reviews is hard to judge. The more ratings a seller has, the more you can trust they have a consistent record.',
			'quiz4.missionText' => 'Alright, I\'ve decided! Let\'s proceed to the purchase',
			'quiz4.insight.title' => 'How did the bottom button let you buy?',
			'quiz4.insight.subtitle' => 'A fixed purchase button is a universal design pattern in e-commerce apps',
			'quiz4.insight.fixedTitle' => 'The fixed button at the bottom is the purchase funnel',
			'quiz4.insight.fixedDesc' => 'Flea market apps and e-commerce sites commonly fix the purchase button at the bottom of the screen. You can proceed to purchase anytime regardless of scroll position.',
			'quiz4.insight.ctaTitle' => 'Eye-catching colors boost purchase intent',
			'quiz4.insight.ctaDesc' => 'Purchase buttons are often implemented in eye-catching colors like red or orange. They draw the user\'s attention and serve as a CTA (call to action) to prompt purchases.',
			'quiz4.insight.safeTitle' => 'The purchase process has multiple steps',
			'quiz4.insight.safeDesc' => 'This button is just the entry point to the purchase process. Steps like address confirmation and payment method selection follow, so accidental taps do not immediately complete a purchase.',
			'common.appTitle' => 'Flea Market',
			'common.itemTitle' => 'Vintage Denim Jacket',
			'common.itemPrice' => '¥3,800',
			'common.itemDescription' => 'A 1990s denim jacket purchased at a vintage store. Shows slight signs of use but no notable scratches or stains. Size M.',
			'common.sellerName' => 'Vintage Enthusiast',
			'common.buyButton' => 'Proceed to Purchase',
			'common.imageLabel1' => 'Front',
			'common.imageLabel2' => 'Side',
			'common.imageLabel3' => 'Back',
			_ => null,
		};
	}
}
