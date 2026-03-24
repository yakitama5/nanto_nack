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
	late final TranslationsAppEn app = TranslationsAppEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsStageEn stage = TranslationsStageEn._(_root);
	late final TranslationsQuizEn quiz = TranslationsQuizEn._(_root);
	late final TranslationsPurchaseEn purchase = TranslationsPurchaseEn._(_root);
	late final TranslationsErrorEn error = TranslationsErrorEn._(_root);
	late final TranslationsDashboardEn dashboard = TranslationsDashboardEn._(_root);
	late final TranslationsPlayEn play = TranslationsPlayEn._(_root);
	late final TranslationsShoppingEn shopping = TranslationsShoppingEn._(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'NantoNack'
	String get title => 'NantoNack';

	/// en: 'UI/UX Intuition Quiz'
	String get subtitle => 'UI/UX Intuition Quiz';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Stage List'
	String get stageList => 'Stage List';

	/// en: 'Played {count} times'
	String get playCount => 'Played {count} times';
}

// Path: stage
class TranslationsStageEn {
	TranslationsStageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cleared'
	String get cleared => 'Cleared';

	/// en: 'Available'
	String get available => 'Available';

	/// en: 'Complete previous stage'
	String get locked => 'Complete previous stage';

	/// en: 'Play'
	String get play => 'Play';

	/// en: 'Clear Time: {time}'
	String get clearTime => 'Clear Time: {time}';

	/// en: 'Score: {score}pts'
	String get score => 'Score: {score}pts';
}

// Path: quiz
class TranslationsQuizEn {
	TranslationsQuizEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Correct!'
	String get correct => 'Correct!';

	/// en: 'Incorrect'
	String get incorrect => 'Incorrect';

	/// en: 'Time's Up'
	String get timeUp => 'Time\'s Up';

	/// en: 'Result'
	String get result => 'Result';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Back'
	String get back => 'Back';
}

// Path: purchase
class TranslationsPurchaseEn {
	TranslationsPurchaseEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Daily play limit reached'
	String get limitReached => 'Daily play limit reached';

	/// en: 'Upgrade to Premium to play without limits'
	String get unlockDescription => 'Upgrade to Premium to play\nwithout limits';

	/// en: 'Upgrade'
	String get upgrade => 'Upgrade';

	/// en: 'Later'
	String get later => 'Later';
}

// Path: error
class TranslationsErrorEn {
	TranslationsErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'An error occurred'
	String get unknown => 'An error occurred';

	/// en: 'Retry'
	String get retry => 'Retry';
}

// Path: dashboard
class TranslationsDashboardEn {
	TranslationsDashboardEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dashboard'
	String get title => 'Dashboard';

	/// en: 'Today's UI/UX Tip'
	String get todayTip => 'Today\'s UI/UX Tip';

	/// en: 'Remaining Plays'
	String get remainingPlays => 'Remaining Plays';

	/// en: '{count} remaining'
	String get remainingPlaysCount => '{count} remaining';

	/// en: 'Unlimited'
	String get unlimitedPlays => 'Unlimited';

	/// en: 'Streak'
	String get streak => 'Streak';

	/// en: '{days} days streak'
	String get streakDays => '{days} days streak';

	/// en: 'Play History'
	String get activityHistory => 'Play History';

	/// en: 'No play history yet'
	String get noActivity => 'No play history yet';
}

// Path: play
class TranslationsPlayEn {
	TranslationsPlayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Play Now'
	String get startPlay => 'Play Now';

	/// en: 'Select Category'
	String get selectCategory => 'Select Category';

	/// en: 'Choose a category to challenge'
	String get selectCategoryDescription => 'Choose a category to challenge';

	/// en: 'Select Stage'
	String get selectStage => 'Select Stage';

	/// en: '{count} stages'
	String get stageCount => '{count} stages';
}

// Path: shopping
class TranslationsShoppingEn {
	TranslationsShoppingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsShoppingWaterEn water = TranslationsShoppingWaterEn._(_root);
	late final TranslationsShoppingCartEn cart = TranslationsShoppingCartEn._(_root);
	late final TranslationsShoppingCheckoutEn checkout = TranslationsShoppingCheckoutEn._(_root);
	late final TranslationsShoppingCommonEn common = TranslationsShoppingCommonEn._(_root);
	late final TranslationsShoppingNavigationEn navigation = TranslationsShoppingNavigationEn._(_root);
	late final TranslationsShoppingCategoriesEn categories = TranslationsShoppingCategoriesEn._(_root);
}

// Path: shopping.water
class TranslationsShoppingWaterEn {
	TranslationsShoppingWaterEn._(this._root);

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
}

// Path: shopping.cart
class TranslationsShoppingCartEn {
	TranslationsShoppingCartEn._(this._root);

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

// Path: shopping.checkout
class TranslationsShoppingCheckoutEn {
	TranslationsShoppingCheckoutEn._(this._root);

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

// Path: shopping.common
class TranslationsShoppingCommonEn {
	TranslationsShoppingCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add to Cart'
	String get addToCart => 'Add to Cart';

	/// en: 'Qty: {qty}'
	String get quantity => 'Qty: {qty}';

	/// en: 'prime'
	String get primeBadge => 'prime';
}

// Path: shopping.navigation
class TranslationsShoppingNavigationEn {
	TranslationsShoppingNavigationEn._(this._root);

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

// Path: shopping.categories
class TranslationsShoppingCategoriesEn {
	TranslationsShoppingCategoriesEn._(this._root);

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

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'NantoNack',
			'app.subtitle' => 'UI/UX Intuition Quiz',
			'home.stageList' => 'Stage List',
			'home.playCount' => 'Played {count} times',
			'stage.cleared' => 'Cleared',
			'stage.available' => 'Available',
			'stage.locked' => 'Complete previous stage',
			'stage.play' => 'Play',
			'stage.clearTime' => 'Clear Time: {time}',
			'stage.score' => 'Score: {score}pts',
			'quiz.correct' => 'Correct!',
			'quiz.incorrect' => 'Incorrect',
			'quiz.timeUp' => 'Time\'s Up',
			'quiz.result' => 'Result',
			'quiz.retry' => 'Retry',
			'quiz.next' => 'Next',
			'quiz.back' => 'Back',
			'purchase.limitReached' => 'Daily play limit reached',
			'purchase.unlockDescription' => 'Upgrade to Premium to play\nwithout limits',
			'purchase.upgrade' => 'Upgrade',
			'purchase.later' => 'Later',
			'error.unknown' => 'An error occurred',
			'error.retry' => 'Retry',
			'dashboard.title' => 'Dashboard',
			'dashboard.todayTip' => 'Today\'s UI/UX Tip',
			'dashboard.remainingPlays' => 'Remaining Plays',
			'dashboard.remainingPlaysCount' => '{count} remaining',
			'dashboard.unlimitedPlays' => 'Unlimited',
			'dashboard.streak' => 'Streak',
			'dashboard.streakDays' => '{days} days streak',
			'dashboard.activityHistory' => 'Play History',
			'dashboard.noActivity' => 'No play history yet',
			'play.startPlay' => 'Play Now',
			'play.selectCategory' => 'Select Category',
			'play.selectCategoryDescription' => 'Choose a category to challenge',
			'play.selectStage' => 'Select Stage',
			'play.stageCount' => '{count} stages',
			'shopping.water.missionText' => 'Buy 2 bottles of water',
			'shopping.water.appTitle' => 'nantomall',
			'shopping.water.searchPlaceholder' => 'Search items',
			'shopping.water.cartTitle' => 'Shopping Cart',
			'shopping.water.cartEmpty' => 'Your cart is empty',
			'shopping.water.subtotal' => 'Subtotal ({count} items):',
			'shopping.water.confirmOrder' => 'Place order',
			'shopping.cart.missionText' => 'Select the total price of this cart',
			'shopping.cart.appTitle' => 'Shopping Cart',
			'shopping.cart.itemsHeader' => 'Cart Items',
			'shopping.cart.itemCount' => '{count} items',
			'shopping.cart.questionTitle' => 'What is the total price?',
			'shopping.cart.questionSubtitle' => 'Calculate the total of items above and select',
			'shopping.cart.hint' => 'Multiply each unit price by quantity and sum them up',
			'shopping.checkout.missionText' => 'Complete the checkout process',
			'shopping.checkout.appTitle' => 'Payment Checkout',
			'shopping.checkout.step1' => 'Cart',
			'shopping.checkout.step2' => 'Address & Payment',
			'shopping.checkout.step3' => 'Confirm',
			'shopping.checkout.addressSection' => 'Delivery Address',
			'shopping.checkout.addressPlaceholder' => 'e.g. 1-1 Shibuya, Tokyo...',
			'shopping.checkout.paymentSection' => 'Payment Method',
			'shopping.checkout.paymentCreditCard' => 'Credit Card',
			'shopping.checkout.paymentConvenience' => 'Convenience Store',
			'shopping.checkout.paymentCOD' => 'Cash on Delivery',
			'shopping.checkout.summarySection' => 'Order Summary',
			'shopping.checkout.subtotal' => 'Item Subtotal',
			'shopping.checkout.shipping' => 'Shipping fee',
			'shopping.checkout.total' => 'Order Total',
			'shopping.checkout.confirmCheck' => 'I have confirmed the order details',
			'shopping.checkout.confirmButton' => 'Place Order',
			'shopping.common.addToCart' => 'Add to Cart',
			'shopping.common.quantity' => 'Qty: {qty}',
			'shopping.common.primeBadge' => 'prime',
			'shopping.navigation.home' => 'Home',
			'shopping.navigation.search' => 'Search',
			'shopping.navigation.account' => 'Account',
			'shopping.navigation.menu' => 'Menu',
			'shopping.categories.daily' => 'Daily goods',
			'shopping.categories.food' => 'Food & Drinks',
			'shopping.categories.electronics' => 'Electronics',
			'shopping.categories.fashion' => 'Fashion',
			'shopping.categories.sports' => 'Sports',
			'shopping.categories.kitchen' => 'Kitchen',
			_ => null,
		};
	}
}
