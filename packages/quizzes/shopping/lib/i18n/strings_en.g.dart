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
	@override late final _TranslationsWaterEn water = _TranslationsWaterEn._(_root);
	@override late final _TranslationsCartEn cart = _TranslationsCartEn._(_root);
	@override late final _TranslationsCheckoutEn checkout = _TranslationsCheckoutEn._(_root);
	@override late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
	@override late final _TranslationsNavigationEn navigation = _TranslationsNavigationEn._(_root);
	@override late final _TranslationsCategoriesEn categories = _TranslationsCategoriesEn._(_root);
}

// Path: water
class _TranslationsWaterEn extends TranslationsWaterJa {
	_TranslationsWaterEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Buy 2 bottles of water';
	@override String get appTitle => 'nantomall';
	@override String get searchPlaceholder => 'Search items';
	@override String get cartTitle => 'Shopping Cart';
	@override String get cartEmpty => 'Your cart is empty';
	@override String get subtotal => 'Subtotal ({count} items):';
	@override String get confirmOrder => 'Place order';
	@override late final _TranslationsWaterInsightEn insight = _TranslationsWaterInsightEn._(_root);
}

// Path: cart
class _TranslationsCartEn extends TranslationsCartJa {
	_TranslationsCartEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Select the total price of this cart';
	@override String get appTitle => 'Shopping Cart';
	@override String get itemsHeader => 'Cart Items';
	@override String get itemCount => '{count} items';
	@override String get questionTitle => 'What is the total price?';
	@override String get questionSubtitle => 'Calculate the total of items above and select';
	@override String get hint => 'Multiply each unit price by quantity and sum them up';
}

// Path: checkout
class _TranslationsCheckoutEn extends TranslationsCheckoutJa {
	_TranslationsCheckoutEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Complete the checkout process';
	@override String get appTitle => 'Payment Checkout';
	@override String get step1 => 'Cart';
	@override String get step2 => 'Address & Payment';
	@override String get step3 => 'Confirm';
	@override String get addressSection => 'Delivery Address';
	@override String get addressPlaceholder => 'e.g. 1-1 Shibuya, Tokyo...';
	@override String get paymentSection => 'Payment Method';
	@override String get paymentCreditCard => 'Credit Card';
	@override String get paymentConvenience => 'Convenience Store';
	@override String get paymentCOD => 'Cash on Delivery';
	@override String get summarySection => 'Order Summary';
	@override String get subtotal => 'Item Subtotal';
	@override String get shipping => 'Shipping fee';
	@override String get total => 'Order Total';
	@override String get confirmCheck => 'I have confirmed the order details';
	@override String get confirmButton => 'Place Order';
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get addToCart => 'Add to Cart';
	@override String get quantity => 'Qty: {qty}';
	@override String get primeBadge => 'prime';
}

// Path: navigation
class _TranslationsNavigationEn extends TranslationsNavigationJa {
	_TranslationsNavigationEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get search => 'Search';
	@override String get account => 'Account';
	@override String get menu => 'Menu';
}

// Path: categories
class _TranslationsCategoriesEn extends TranslationsCategoriesJa {
	_TranslationsCategoriesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get daily => 'Daily goods';
	@override String get food => 'Food & Drinks';
	@override String get electronics => 'Electronics';
	@override String get fashion => 'Fashion';
	@override String get sports => 'Sports';
	@override String get kitchen => 'Kitchen';
}

// Path: water.insight
class _TranslationsWaterInsightEn extends TranslationsWaterInsightJa {
	_TranslationsWaterInsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Why could you figure it out without reading?';
	@override String get subtitle => 'This UI has 3 tricks that work across languages';
	@override String get iconTitle => 'Icons transcend language';
	@override String get iconDesc => '🛒Cart · 🔍Search · ❤️Favorite. Familiar icons are universal symbols — their meaning is understood without words.';
	@override String get colorTitle => 'Color drives action';
	@override String get colorDesc => 'The yellow \'Place Order\' button has appeared on major e-commerce sites so often that the color itself now signals \'buy\'.';
	@override String get patternTitle => 'UI patterns build intuition';
	@override String get patternDesc => 'Grid of products + prices = online shop. ± buttons = quantity control. Repeated exposure turns patterns into instinct.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'water.missionText' => 'Buy 2 bottles of water',
			'water.appTitle' => 'nantomall',
			'water.searchPlaceholder' => 'Search items',
			'water.cartTitle' => 'Shopping Cart',
			'water.cartEmpty' => 'Your cart is empty',
			'water.subtotal' => 'Subtotal ({count} items):',
			'water.confirmOrder' => 'Place order',
			'water.insight.title' => 'Why could you figure it out without reading?',
			'water.insight.subtitle' => 'This UI has 3 tricks that work across languages',
			'water.insight.iconTitle' => 'Icons transcend language',
			'water.insight.iconDesc' => '🛒Cart · 🔍Search · ❤️Favorite. Familiar icons are universal symbols — their meaning is understood without words.',
			'water.insight.colorTitle' => 'Color drives action',
			'water.insight.colorDesc' => 'The yellow \'Place Order\' button has appeared on major e-commerce sites so often that the color itself now signals \'buy\'.',
			'water.insight.patternTitle' => 'UI patterns build intuition',
			'water.insight.patternDesc' => 'Grid of products + prices = online shop. ± buttons = quantity control. Repeated exposure turns patterns into instinct.',
			'cart.missionText' => 'Select the total price of this cart',
			'cart.appTitle' => 'Shopping Cart',
			'cart.itemsHeader' => 'Cart Items',
			'cart.itemCount' => '{count} items',
			'cart.questionTitle' => 'What is the total price?',
			'cart.questionSubtitle' => 'Calculate the total of items above and select',
			'cart.hint' => 'Multiply each unit price by quantity and sum them up',
			'checkout.missionText' => 'Complete the checkout process',
			'checkout.appTitle' => 'Payment Checkout',
			'checkout.step1' => 'Cart',
			'checkout.step2' => 'Address & Payment',
			'checkout.step3' => 'Confirm',
			'checkout.addressSection' => 'Delivery Address',
			'checkout.addressPlaceholder' => 'e.g. 1-1 Shibuya, Tokyo...',
			'checkout.paymentSection' => 'Payment Method',
			'checkout.paymentCreditCard' => 'Credit Card',
			'checkout.paymentConvenience' => 'Convenience Store',
			'checkout.paymentCOD' => 'Cash on Delivery',
			'checkout.summarySection' => 'Order Summary',
			'checkout.subtotal' => 'Item Subtotal',
			'checkout.shipping' => 'Shipping fee',
			'checkout.total' => 'Order Total',
			'checkout.confirmCheck' => 'I have confirmed the order details',
			'checkout.confirmButton' => 'Place Order',
			'common.addToCart' => 'Add to Cart',
			'common.quantity' => 'Qty: {qty}',
			'common.primeBadge' => 'prime',
			'navigation.home' => 'Home',
			'navigation.search' => 'Search',
			'navigation.account' => 'Account',
			'navigation.menu' => 'Menu',
			'categories.daily' => 'Daily goods',
			'categories.food' => 'Food & Drinks',
			'categories.electronics' => 'Electronics',
			'categories.fashion' => 'Fashion',
			'categories.sports' => 'Sports',
			'categories.kitchen' => 'Kitchen',
			_ => null,
		};
	}
}
