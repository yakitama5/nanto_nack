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
	late final TranslationsWaterEn water = TranslationsWaterEn._(_root);
	late final TranslationsCartEn cart = TranslationsCartEn._(_root);
	late final TranslationsCheckoutEn checkout = TranslationsCheckoutEn._(_root);
	late final TranslationsReorderEn reorder = TranslationsReorderEn._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsSearchEn search = TranslationsSearchEn._(_root);
	late final TranslationsMenuEn menu = TranslationsMenuEn._(_root);
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(_root);
	late final TranslationsCategoriesEn categories = TranslationsCategoriesEn._(_root);
	late final TranslationsCatalogEn catalog = TranslationsCatalogEn._(_root);
}

// Path: water
class TranslationsWaterEn {
	TranslationsWaterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Buy 2 bottles of water'
	String get missionText => 'Buy 2 bottles of water';

	/// en: 'nantomall'
	String get appTitle => 'nantomall';

	/// en: 'Search items'
	String get searchPlaceholder => 'Search items';

	/// en: 'Shopping Cart'
	String get cartTitle => 'Shopping Cart';

	/// en: 'Your cart is empty'
	String get cartEmpty => 'Your cart is empty';

	/// en: 'Subtotal ({count} items):'
	String get subtotal => 'Subtotal ({count} items):';

	/// en: 'Place order'
	String get confirmOrder => 'Place order';

	late final TranslationsWaterInsightEn insight = TranslationsWaterInsightEn._(_root);
}

// Path: cart
class TranslationsCartEn {
	TranslationsCartEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Select the total price of this cart'
	String get missionText => 'Select the total price of this cart';

	/// en: 'Shopping Cart'
	String get appTitle => 'Shopping Cart';

	/// en: 'Cart Items'
	String get itemsHeader => 'Cart Items';

	/// en: '{count} items'
	String get itemCount => '{count} items';

	/// en: 'What is the total price?'
	String get questionTitle => 'What is the total price?';

	/// en: 'Calculate the total of items above and select'
	String get questionSubtitle => 'Calculate the total of items above and select';

	/// en: 'Multiply each unit price by quantity and sum them up'
	String get hint => 'Multiply each unit price by quantity and sum them up';
}

// Path: checkout
class TranslationsCheckoutEn {
	TranslationsCheckoutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Complete the checkout process'
	String get missionText => 'Complete the checkout process';

	/// en: 'Payment Checkout'
	String get appTitle => 'Payment Checkout';

	/// en: 'Cart'
	String get step1 => 'Cart';

	/// en: 'Address & Payment'
	String get step2 => 'Address & Payment';

	/// en: 'Confirm'
	String get step3 => 'Confirm';

	/// en: 'Delivery Address'
	String get addressSection => 'Delivery Address';

	/// en: 'e.g. 1-1 Shibuya, Tokyo...'
	String get addressPlaceholder => 'e.g. 1-1 Shibuya, Tokyo...';

	/// en: 'Payment Method'
	String get paymentSection => 'Payment Method';

	/// en: 'Credit Card'
	String get paymentCreditCard => 'Credit Card';

	/// en: 'Convenience Store'
	String get paymentConvenience => 'Convenience Store';

	/// en: 'Cash on Delivery'
	String get paymentCOD => 'Cash on Delivery';

	/// en: 'Order Summary'
	String get summarySection => 'Order Summary';

	/// en: 'Item Subtotal'
	String get subtotal => 'Item Subtotal';

	/// en: 'Shipping fee'
	String get shipping => 'Shipping fee';

	/// en: 'Order Total'
	String get total => 'Order Total';

	/// en: 'I have confirmed the order details'
	String get confirmCheck => 'I have confirmed the order details';

	/// en: 'Place Order'
	String get confirmButton => 'Place Order';
}

// Path: reorder
class TranslationsReorderEn {
	TranslationsReorderEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Purchase your recently ordered item again'
	String get missionText => 'Purchase your recently ordered item again';

	/// en: 'Order History'
	String get appTitle => 'Order History';

	/// en: 'Recent Orders'
	String get orderHistoryTitle => 'Recent Orders';

	/// en: 'Buy again'
	String get reorderButton => 'Buy again';

	/// en: 'Ordered 3 days ago'
	String get lastOrderDate => 'Ordered 3 days ago';

	/// en: 'Shopping Cart'
	String get cartTitle => 'Shopping Cart';

	/// en: 'Your cart is empty'
	String get cartEmpty => 'Your cart is empty';

	/// en: 'Subtotal ({count} items):'
	String get subtotal => 'Subtotal ({count} items):';

	/// en: 'Place order'
	String get confirmOrder => 'Place order';

	late final TranslationsReorderInsightEn insight = TranslationsReorderInsightEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add to Cart'
	String get addToCart => 'Add to Cart';

	/// en: 'Qty: {qty}'
	String get quantity => 'Qty: {qty}';

	/// en: 'prime'
	String get primeBadge => 'prime';

	/// en: 'No items found'
	String get noResults => 'No items found';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Seasonal Recommendations'
	String get banner1 => 'Seasonal Recommendations';

	/// en: 'New Arrivals'
	String get banner2 => 'New Arrivals';

	/// en: 'Save More with Bundles'
	String get banner3 => 'Save More with Bundles';

	/// en: 'Recommended for You'
	String get recommended => 'Recommended for You';

	/// en: 'Shop by Category'
	String get categories => 'Shop by Category';

	/// en: 'Deal of the Day'
	String get dealOfTheDay => 'Deal of the Day';
}

// Path: search
class TranslationsSearchEn {
	TranslationsSearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Popular Categories'
	String get popularCategories => 'Popular Categories';

	/// en: 'Trending Items'
	String get trendingItems => 'Trending Items';
}

// Path: menu
class TranslationsMenuEn {
	TranslationsMenuEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Programs & Features'
	String get programs => 'Programs & Features';

	/// en: 'Join Prime'
	String get prime => 'Join Prime';

	/// en: 'Digital Content'
	String get digitalContent => 'Digital Content';

	/// en: 'Settings'
	String get settingsSection => 'Settings';

	/// en: 'Notification Settings'
	String get notification => 'Notification Settings';

	/// en: 'Customer Service'
	String get customerService => 'Customer Service';

	/// en: 'Help'
	String get help => 'Help';

	/// en: 'Terms of Use'
	String get terms => 'Terms of Use';
}

// Path: navigation
class TranslationsNavigationEn {
	TranslationsNavigationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Account'
	String get account => 'Account';

	/// en: 'Menu'
	String get menu => 'Menu';
}

// Path: categories
class TranslationsCategoriesEn {
	TranslationsCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Daily goods'
	String get daily => 'Daily goods';

	/// en: 'Food & Drinks'
	String get food => 'Food & Drinks';

	/// en: 'Electronics'
	String get electronics => 'Electronics';

	/// en: 'Fashion'
	String get fashion => 'Fashion';

	/// en: 'Sports'
	String get sports => 'Sports';

	/// en: 'Kitchen'
	String get kitchen => 'Kitchen';
}

// Path: catalog
class TranslationsCatalogEn {
	TranslationsCatalogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Natural Water 500ml'
	String get waterPuraAqua => 'Natural Water 500ml';

	/// en: 'Green Tea 500ml'
	String get teaAqua => 'Green Tea 500ml';

	/// en: 'Craft Coffee'
	String get coffeeCraft => 'Craft Coffee';

	/// en: 'Whole Milk 1L'
	String get milkDaily => 'Whole Milk 1L';

	/// en: 'Potato Chips'
	String get snackChips => 'Potato Chips';

	/// en: 'Chocolate Bar'
	String get cocoaBar => 'Chocolate Bar';

	/// en: 'Sliced Bread'
	String get bakeryBread => 'Sliced Bread';

	/// en: 'Eggs 10pk'
	String get eggs => 'Eggs 10pk';

	/// en: 'Cup Noodle'
	String get noodleBowl => 'Cup Noodle';

	/// en: 'Apple'
	String get apple => 'Apple';

	/// en: 'Banana'
	String get banana => 'Banana';

	/// en: 'Laundry Detergent'
	String get detergentDailyWash => 'Laundry Detergent';

	/// en: 'Hand Soap'
	String get soapWashPower => 'Hand Soap';

	/// en: 'Dish Soap'
	String get dishSoapSparkle => 'Dish Soap';

	/// en: 'Kitchen Sponge'
	String get sponge => 'Kitchen Sponge';

	/// en: 'Tissue Paper 5box'
	String get tissueSoft => 'Tissue Paper 5box';

	/// en: 'Toilet Paper 12roll'
	String get toiletPaper => 'Toilet Paper 12roll';

	/// en: 'Hair Oil'
	String get haircareBotanicShine => 'Hair Oil';

	/// en: 'Ring Notebook'
	String get notebook => 'Ring Notebook';

	/// en: 'Face Towel'
	String get towel => 'Face Towel';

	/// en: 'Natural Water 500ml'
	String get water500ml => 'Natural Water 500ml';

	/// en: 'Green Tea 500ml'
	String get tea500ml => 'Green Tea 500ml';

	/// en: 'Black Coffee 500ml'
	String get coffee500ml => 'Black Coffee 500ml';
}

// Path: water.insight
class TranslationsWaterInsightEn {
	TranslationsWaterInsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Why could you figure it out without reading?'
	String get title => 'Why could you figure it out without reading?';

	/// en: 'This UI has 3 tricks that work across languages'
	String get subtitle => 'This UI has 3 tricks that work across languages';

	/// en: 'Icons transcend language'
	String get iconTitle => 'Icons transcend language';

	/// en: '🛒Cart · 🔍Search · ❤️Favorite. Familiar icons are universal symbols — their meaning is understood without words.'
	String get iconDesc => '🛒Cart · 🔍Search · ❤️Favorite. Familiar icons are universal symbols — their meaning is understood without words.';

	/// en: 'Color drives action'
	String get colorTitle => 'Color drives action';

	/// en: 'The yellow 'Place Order' button has appeared on major e-commerce sites so often that the color itself now signals 'buy'.'
	String get colorDesc => 'The yellow \'Place Order\' button has appeared on major e-commerce sites so often that the color itself now signals \'buy\'.';

	/// en: 'UI patterns build intuition'
	String get patternTitle => 'UI patterns build intuition';

	/// en: 'Grid of products + prices = online shop. ± buttons = quantity control. Repeated exposure turns patterns into instinct.'
	String get patternDesc => 'Grid of products + prices = online shop. ± buttons = quantity control. Repeated exposure turns patterns into instinct.';
}

// Path: reorder.insight
class TranslationsReorderInsightEn {
	TranslationsReorderInsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Why could you figure it out without reading?'
	String get title => 'Why could you figure it out without reading?';

	/// en: 'Visual patterns make reordering intuitive'
	String get subtitle => 'Visual patterns make reordering intuitive';

	/// en: 'Product images trigger memory'
	String get imageTitle => 'Product images trigger memory';

	/// en: 'A product's appearance, color, and design link visually to past purchase experiences — visual memory transcends language.'
	String get imageDesc => 'A product\'s appearance, color, and design link visually to past purchase experiences — visual memory transcends language.';

	/// en: 'Price brings confirmation'
	String get priceTitle => 'Price brings confirmation';

	/// en: 'Matching prices confirm 'this is the same product'. Numbers are a universal language that helps you recognize items at a glance.'
	String get priceDesc => 'Matching prices confirm \'this is the same product\'. Numbers are a universal language that helps you recognize items at a glance.';

	/// en: ''Buy again' completes the experience'
	String get patternTitle => '\'Buy again\' completes the experience';

	/// en: 'Reorder buttons are a standard pattern on major e-commerce sites. Familiar UI is intuitive — no searching needed to reorder quickly.'
	String get patternDesc => 'Reorder buttons are a standard pattern on major e-commerce sites. Familiar UI is intuitive — no searching needed to reorder quickly.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
