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
	@override late final _TranslationsWaterXx water = _TranslationsWaterXx._(_root);
	@override late final _TranslationsCartXx cart = _TranslationsCartXx._(_root);
	@override late final _TranslationsCheckoutXx checkout = _TranslationsCheckoutXx._(_root);
	@override late final _TranslationsReorderXx reorder = _TranslationsReorderXx._(_root);
	@override late final _TranslationsCommonXx common = _TranslationsCommonXx._(_root);
	@override late final _TranslationsHomeXx home = _TranslationsHomeXx._(_root);
	@override late final _TranslationsSearchXx search = _TranslationsSearchXx._(_root);
	@override late final _TranslationsMenuXx menu = _TranslationsMenuXx._(_root);
	@override late final _TranslationsNavigationXx navigation = _TranslationsNavigationXx._(_root);
	@override late final _TranslationsCategoriesXx categories = _TranslationsCategoriesXx._(_root);
	@override late final _TranslationsCatalogXx catalog = _TranslationsCatalogXx._(_root);
}

// Path: water
class _TranslationsWaterXx extends TranslationsWaterJa {
	_TranslationsWaterXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Buy 2 bottles of water';
	@override String get appTitle => 'nantomall';
	@override String get searchPlaceholder => 'Search items';
	@override String get cartTitle => 'Shopping Cart';
	@override String get cartEmpty => 'Your cart is empty';
	@override String get subtotal => 'Subtotal ({count} items):';
	@override String get confirmOrder => 'Place order';
}

// Path: cart
class _TranslationsCartXx extends TranslationsCartJa {
	_TranslationsCartXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Select the total price of this cart';
	@override String get appTitle => 'Shopping Cart';
	@override String get itemsHeader => 'Cart Items';
	@override String get itemCount => '{count} items';
	@override String get questionTitle => 'What is the total price?';
	@override String get questionSubtitle => 'Calculate the total of items above and select';
	@override String get hint => 'Multiply each unit price by quantity and sum them up';
	@override String get decoderLabel => 'Number Decoder';
	@override String get hintTableLabel => 'Number Cipher Table';
}

// Path: checkout
class _TranslationsCheckoutXx extends TranslationsCheckoutJa {
	_TranslationsCheckoutXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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

// Path: reorder
class _TranslationsReorderXx extends TranslationsReorderJa {
	_TranslationsReorderXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Purchase your recently ordered item again';
	@override String get appTitle => 'Order History';
	@override String get orderHistoryTitle => 'Recent Orders';
	@override String get reorderButton => 'Buy again';
	@override String get lastOrderDate => 'Ordered 3 days ago';
	@override String get cartTitle => 'Shopping Cart';
	@override String get cartEmpty => 'Your cart is empty';
	@override String get subtotal => 'Subtotal ({count} items):';
	@override String get confirmOrder => 'Place order';
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get addToCart => 'Add to Cart';
	@override String get quantity => 'Qty: {qty}';
	@override String get primeBadge => 'prime';
	@override String get noResults => 'No items found';
}

// Path: home
class _TranslationsHomeXx extends TranslationsHomeJa {
	_TranslationsHomeXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get banner1 => 'Seasonal Recommendations';
	@override String get banner2 => 'New Arrivals';
	@override String get banner3 => 'Save More with Bundles';
	@override String get recommended => 'Recommended for You';
	@override String get categories => 'Shop by Category';
	@override String get dealOfTheDay => 'Deal of the Day';
}

// Path: search
class _TranslationsSearchXx extends TranslationsSearchJa {
	_TranslationsSearchXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get popularCategories => 'Popular Categories';
	@override String get trendingItems => 'Trending Items';
}

// Path: menu
class _TranslationsMenuXx extends TranslationsMenuJa {
	_TranslationsMenuXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get programs => 'Programs & Features';
	@override String get prime => 'Join Prime';
	@override String get digitalContent => 'Digital Content';
	@override String get settingsSection => 'Settings';
	@override String get notification => 'Notification Settings';
	@override String get customerService => 'Customer Service';
	@override String get help => 'Help';
	@override String get terms => 'Terms of Use';
}

// Path: navigation
class _TranslationsNavigationXx extends TranslationsNavigationJa {
	_TranslationsNavigationXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get search => 'Search';
	@override String get account => 'Account';
	@override String get menu => 'Menu';
}

// Path: categories
class _TranslationsCategoriesXx extends TranslationsCategoriesJa {
	_TranslationsCategoriesXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get daily => 'Daily goods';
	@override String get food => 'Food & Drinks';
	@override String get electronics => 'Electronics';
	@override String get fashion => 'Fashion';
	@override String get sports => 'Sports';
	@override String get kitchen => 'Kitchen';
}

// Path: catalog
class _TranslationsCatalogXx extends TranslationsCatalogJa {
	_TranslationsCatalogXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get waterPuraAqua => 'Natural Water 500ml';
	@override String get teaAqua => 'Green Tea 500ml';
	@override String get coffeeCraft => 'Craft Coffee';
	@override String get milkDaily => 'Whole Milk 1L';
	@override String get snackChips => 'Potato Chips';
	@override String get cocoaBar => 'Chocolate Bar';
	@override String get bakeryBread => 'Sliced Bread';
	@override String get eggs => 'Eggs 10pk';
	@override String get noodleBowl => 'Cup Noodle';
	@override String get apple => 'Apple';
	@override String get banana => 'Banana';
	@override String get detergentDailyWash => 'Laundry Detergent';
	@override String get soapWashPower => 'Hand Soap';
	@override String get dishSoapSparkle => 'Dish Soap';
	@override String get sponge => 'Kitchen Sponge';
	@override String get tissueSoft => 'Tissue Paper 5box';
	@override String get toiletPaper => 'Toilet Paper 12roll';
	@override String get haircareBotanicShine => 'Hair Oil';
	@override String get notebook => 'Ring Notebook';
	@override String get towel => 'Face Towel';
	@override String get water500ml => 'Natural Water 500ml';
	@override String get tea500ml => 'Green Tea 500ml';
	@override String get coffee500ml => 'Black Coffee 500ml';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'water.missionText' => 'Buy 2 bottles of water',
			'water.appTitle' => 'nantomall',
			'water.searchPlaceholder' => 'Search items',
			'water.cartTitle' => 'Shopping Cart',
			'water.cartEmpty' => 'Your cart is empty',
			'water.subtotal' => 'Subtotal ({count} items):',
			'water.confirmOrder' => 'Place order',
			'cart.missionText' => 'Select the total price of this cart',
			'cart.appTitle' => 'Shopping Cart',
			'cart.itemsHeader' => 'Cart Items',
			'cart.itemCount' => '{count} items',
			'cart.questionTitle' => 'What is the total price?',
			'cart.questionSubtitle' => 'Calculate the total of items above and select',
			'cart.hint' => 'Multiply each unit price by quantity and sum them up',
			'cart.decoderLabel' => 'Number Decoder',
			'cart.hintTableLabel' => 'Number Cipher Table',
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
			'reorder.missionText' => 'Purchase your recently ordered item again',
			'reorder.appTitle' => 'Order History',
			'reorder.orderHistoryTitle' => 'Recent Orders',
			'reorder.reorderButton' => 'Buy again',
			'reorder.lastOrderDate' => 'Ordered 3 days ago',
			'reorder.cartTitle' => 'Shopping Cart',
			'reorder.cartEmpty' => 'Your cart is empty',
			'reorder.subtotal' => 'Subtotal ({count} items):',
			'reorder.confirmOrder' => 'Place order',
			'common.addToCart' => 'Add to Cart',
			'common.quantity' => 'Qty: {qty}',
			'common.primeBadge' => 'prime',
			'common.noResults' => 'No items found',
			'home.banner1' => 'Seasonal Recommendations',
			'home.banner2' => 'New Arrivals',
			'home.banner3' => 'Save More with Bundles',
			'home.recommended' => 'Recommended for You',
			'home.categories' => 'Shop by Category',
			'home.dealOfTheDay' => 'Deal of the Day',
			'search.popularCategories' => 'Popular Categories',
			'search.trendingItems' => 'Trending Items',
			'menu.programs' => 'Programs & Features',
			'menu.prime' => 'Join Prime',
			'menu.digitalContent' => 'Digital Content',
			'menu.settingsSection' => 'Settings',
			'menu.notification' => 'Notification Settings',
			'menu.customerService' => 'Customer Service',
			'menu.help' => 'Help',
			'menu.terms' => 'Terms of Use',
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
			'catalog.waterPuraAqua' => 'Natural Water 500ml',
			'catalog.teaAqua' => 'Green Tea 500ml',
			'catalog.coffeeCraft' => 'Craft Coffee',
			'catalog.milkDaily' => 'Whole Milk 1L',
			'catalog.snackChips' => 'Potato Chips',
			'catalog.cocoaBar' => 'Chocolate Bar',
			'catalog.bakeryBread' => 'Sliced Bread',
			'catalog.eggs' => 'Eggs 10pk',
			'catalog.noodleBowl' => 'Cup Noodle',
			'catalog.apple' => 'Apple',
			'catalog.banana' => 'Banana',
			'catalog.detergentDailyWash' => 'Laundry Detergent',
			'catalog.soapWashPower' => 'Hand Soap',
			'catalog.dishSoapSparkle' => 'Dish Soap',
			'catalog.sponge' => 'Kitchen Sponge',
			'catalog.tissueSoft' => 'Tissue Paper 5box',
			'catalog.toiletPaper' => 'Toilet Paper 12roll',
			'catalog.haircareBotanicShine' => 'Hair Oil',
			'catalog.notebook' => 'Ring Notebook',
			'catalog.towel' => 'Face Towel',
			'catalog.water500ml' => 'Natural Water 500ml',
			'catalog.tea500ml' => 'Green Tea 500ml',
			'catalog.coffee500ml' => 'Black Coffee 500ml',
			_ => null,
		};
	}
}
