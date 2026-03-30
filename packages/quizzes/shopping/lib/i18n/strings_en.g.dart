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
	@override late final _TranslationsReorderEn reorder = _TranslationsReorderEn._(_root);
	@override late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
	@override late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
	@override late final _TranslationsSearchEn search = _TranslationsSearchEn._(_root);
	@override late final _TranslationsMenuEn menu = _TranslationsMenuEn._(_root);
	@override late final _TranslationsNavigationEn navigation = _TranslationsNavigationEn._(_root);
	@override late final _TranslationsCategoriesEn categories = _TranslationsCategoriesEn._(_root);
	@override late final _TranslationsCatalogEn catalog = _TranslationsCatalogEn._(_root);
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
	@override String get decoderLabel => 'Number Decoder';
	@override String get hintTableLabel => 'Number Cipher Table';
	@override late final _TranslationsCartInsightEn insight = _TranslationsCartInsightEn._(_root);
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
	@override late final _TranslationsCheckoutInsightEn insight = _TranslationsCheckoutInsightEn._(_root);
}

// Path: reorder
class _TranslationsReorderEn extends TranslationsReorderJa {
	_TranslationsReorderEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

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
	@override late final _TranslationsReorderInsightEn insight = _TranslationsReorderInsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get addToCart => 'Add to Cart';
	@override String get quantity => 'Qty: {qty}';
	@override String get primeBadge => 'prime';
	@override String get noResults => 'No items found';
}

// Path: home
class _TranslationsHomeEn extends TranslationsHomeJa {
	_TranslationsHomeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get banner1 => 'Seasonal Recommendations';
	@override String get banner2 => 'New Arrivals';
	@override String get banner3 => 'Save More with Bundles';
	@override String get recommended => 'Recommended for You';
	@override String get categories => 'Shop by Category';
	@override String get dealOfTheDay => 'Deal of the Day';
}

// Path: search
class _TranslationsSearchEn extends TranslationsSearchJa {
	_TranslationsSearchEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get popularCategories => 'Popular Categories';
	@override String get trendingItems => 'Trending Items';
}

// Path: menu
class _TranslationsMenuEn extends TranslationsMenuJa {
	_TranslationsMenuEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

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

// Path: catalog
class _TranslationsCatalogEn extends TranslationsCatalogJa {
	_TranslationsCatalogEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

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

// Path: cart.insight
class _TranslationsCartInsightEn extends TranslationsCartInsightJa {
	_TranslationsCartInsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you figure it out despite the scrambled text?';
	@override String get subtitle => 'Numbers and layout guide you — just like decoding a cipher';
	@override String get cipherTitle => 'It works like decoding a cipher';
	@override String get cipherDesc => 'Even without reading the text, a symbol-to-number mapping (the hint) lets you decode and calculate. As long as you know the rules, meaning can be extracted — exactly like cracking a code.';
	@override String get priceTitle => '¥ + numbers transcend language';
	@override String get priceDesc => 'A currency symbol combined with numbers communicates price regardless of language. Price display is one of the most universal UI patterns across cultures.';
	@override String get layoutTitle => 'Cart layout acts as a visual instruction';
	@override String get layoutDesc => 'Items → quantity → amount stacked vertically visually implies \'multiply and sum\'. The layout itself becomes a language-free instruction manual.';
}

// Path: checkout.insight
class _TranslationsCheckoutInsightEn extends TranslationsCheckoutInsightJa {
	_TranslationsCheckoutInsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know what to do?';
	@override String get subtitle => 'Checkout flow is a universal UI pattern shared across e-commerce worldwide';
	@override String get stepTitle => 'Step indicators show the path';
	@override String get stepDesc => 'A 1→2→3 progress bar tells you exactly what to do next at a glance. Flow-based UI is intuitively understood regardless of language — the UI itself guides you.';
	@override String get iconTitle => 'Icons identify the options';
	@override String get iconDesc => 'Credit card, convenience store, and delivery truck icons communicate payment methods without reading labels. Icon-based categorization is a universal UI pattern.';
	@override String get confirmTitle => '\'Confirm then submit\' pattern builds trust';
	@override String get confirmDesc => 'Checking a box before pressing the final button is a safety mechanism for irreversible actions, established by major e-commerce platforms. Knowing this pattern lets you navigate even without reading the text.';
}

// Path: reorder.insight
class _TranslationsReorderInsightEn extends TranslationsReorderInsightJa {
	_TranslationsReorderInsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Why could you figure it out without reading?';
	@override String get subtitle => 'Visual patterns make reordering intuitive';
	@override String get imageTitle => 'Product images trigger memory';
	@override String get imageDesc => 'A product\'s appearance, color, and design link visually to past purchase experiences — visual memory transcends language.';
	@override String get priceTitle => 'Price brings confirmation';
	@override String get priceDesc => 'Matching prices confirm \'this is the same product\'. Numbers are a universal language that helps you recognize items at a glance.';
	@override String get patternTitle => '\'Buy again\' completes the experience';
	@override String get patternDesc => 'Reorder buttons are a standard pattern on major e-commerce sites. Familiar UI is intuitive — no searching needed to reorder quickly.';
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
			'cart.decoderLabel' => 'Number Decoder',
			'cart.hintTableLabel' => 'Number Cipher Table',
			'cart.insight.title' => 'How did you figure it out despite the scrambled text?',
			'cart.insight.subtitle' => 'Numbers and layout guide you — just like decoding a cipher',
			'cart.insight.cipherTitle' => 'It works like decoding a cipher',
			'cart.insight.cipherDesc' => 'Even without reading the text, a symbol-to-number mapping (the hint) lets you decode and calculate. As long as you know the rules, meaning can be extracted — exactly like cracking a code.',
			'cart.insight.priceTitle' => '¥ + numbers transcend language',
			'cart.insight.priceDesc' => 'A currency symbol combined with numbers communicates price regardless of language. Price display is one of the most universal UI patterns across cultures.',
			'cart.insight.layoutTitle' => 'Cart layout acts as a visual instruction',
			'cart.insight.layoutDesc' => 'Items → quantity → amount stacked vertically visually implies \'multiply and sum\'. The layout itself becomes a language-free instruction manual.',
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
			'checkout.insight.title' => 'How did you know what to do?',
			'checkout.insight.subtitle' => 'Checkout flow is a universal UI pattern shared across e-commerce worldwide',
			'checkout.insight.stepTitle' => 'Step indicators show the path',
			'checkout.insight.stepDesc' => 'A 1→2→3 progress bar tells you exactly what to do next at a glance. Flow-based UI is intuitively understood regardless of language — the UI itself guides you.',
			'checkout.insight.iconTitle' => 'Icons identify the options',
			'checkout.insight.iconDesc' => 'Credit card, convenience store, and delivery truck icons communicate payment methods without reading labels. Icon-based categorization is a universal UI pattern.',
			'checkout.insight.confirmTitle' => '\'Confirm then submit\' pattern builds trust',
			'checkout.insight.confirmDesc' => 'Checking a box before pressing the final button is a safety mechanism for irreversible actions, established by major e-commerce platforms. Knowing this pattern lets you navigate even without reading the text.',
			'reorder.missionText' => 'Purchase your recently ordered item again',
			'reorder.appTitle' => 'Order History',
			'reorder.orderHistoryTitle' => 'Recent Orders',
			'reorder.reorderButton' => 'Buy again',
			'reorder.lastOrderDate' => 'Ordered 3 days ago',
			'reorder.cartTitle' => 'Shopping Cart',
			'reorder.cartEmpty' => 'Your cart is empty',
			'reorder.subtotal' => 'Subtotal ({count} items):',
			'reorder.confirmOrder' => 'Place order',
			'reorder.insight.title' => 'Why could you figure it out without reading?',
			'reorder.insight.subtitle' => 'Visual patterns make reordering intuitive',
			'reorder.insight.imageTitle' => 'Product images trigger memory',
			'reorder.insight.imageDesc' => 'A product\'s appearance, color, and design link visually to past purchase experiences — visual memory transcends language.',
			'reorder.insight.priceTitle' => 'Price brings confirmation',
			'reorder.insight.priceDesc' => 'Matching prices confirm \'this is the same product\'. Numbers are a universal language that helps you recognize items at a glance.',
			'reorder.insight.patternTitle' => '\'Buy again\' completes the experience',
			'reorder.insight.patternDesc' => 'Reorder buttons are a standard pattern on major e-commerce sites. Familiar UI is intuitive — no searching needed to reorder quickly.',
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
