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
	@override late final _TranslationsAppEn app = _TranslationsAppEn._(_root);
	@override late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
	@override late final _TranslationsStageEn stage = _TranslationsStageEn._(_root);
	@override late final _TranslationsQuizEn quiz = _TranslationsQuizEn._(_root);
	@override late final _TranslationsPurchaseEn purchase = _TranslationsPurchaseEn._(_root);
	@override late final _TranslationsErrorEn error = _TranslationsErrorEn._(_root);
	@override late final _TranslationsDashboardEn dashboard = _TranslationsDashboardEn._(_root);
	@override late final _TranslationsPlayEn play = _TranslationsPlayEn._(_root);
	@override late final _TranslationsShoppingEn shopping = _TranslationsShoppingEn._(_root);
}

// Path: app
class _TranslationsAppEn extends TranslationsAppJa {
	_TranslationsAppEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'NantoNack';
	@override String get subtitle => 'UI/UX Intuition Quiz';
}

// Path: home
class _TranslationsHomeEn extends TranslationsHomeJa {
	_TranslationsHomeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get stageList => 'Stage List';
	@override String get playCount => 'Played {count} times';
}

// Path: stage
class _TranslationsStageEn extends TranslationsStageJa {
	_TranslationsStageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get cleared => 'Cleared';
	@override String get available => 'Available';
	@override String get locked => 'Complete previous stage';
	@override String get play => 'Play';
	@override String get clearTime => 'Clear Time: {time}';
	@override String get score => 'Score: {score}pts';
}

// Path: quiz
class _TranslationsQuizEn extends TranslationsQuizJa {
	_TranslationsQuizEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get correct => 'Correct!';
	@override String get incorrect => 'Incorrect';
	@override String get timeUp => 'Time\'s Up';
	@override String get result => 'Result';
	@override String get retry => 'Retry';
	@override String get next => 'Next';
	@override String get back => 'Back';
}

// Path: purchase
class _TranslationsPurchaseEn extends TranslationsPurchaseJa {
	_TranslationsPurchaseEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get limitReached => 'Daily play limit reached';
	@override String get unlockDescription => 'Upgrade to Premium to play\nwithout limits';
	@override String get upgrade => 'Upgrade';
	@override String get later => 'Later';
}

// Path: error
class _TranslationsErrorEn extends TranslationsErrorJa {
	_TranslationsErrorEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get unknown => 'An error occurred';
	@override String get retry => 'Retry';
}

// Path: dashboard
class _TranslationsDashboardEn extends TranslationsDashboardJa {
	_TranslationsDashboardEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dashboard';
	@override String get todayTip => 'Today\'s UI/UX Tip';
	@override String get remainingPlays => 'Remaining Plays';
	@override String get remainingPlaysCount => '{count} remaining';
	@override String get unlimitedPlays => 'Unlimited';
	@override String get streak => 'Streak';
	@override String get streakDays => '{days} days streak';
	@override String get activityHistory => 'Play History';
	@override String get noActivity => 'No play history yet';
}

// Path: play
class _TranslationsPlayEn extends TranslationsPlayJa {
	_TranslationsPlayEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get startPlay => 'Play Now';
	@override String get selectCategory => 'Select Category';
	@override String get selectCategoryDescription => 'Choose a category to challenge';
	@override String get selectStage => 'Select Stage';
	@override String get stageCount => '{count} stages';
}

// Path: shopping
class _TranslationsShoppingEn extends TranslationsShoppingJa {
	_TranslationsShoppingEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsShoppingWaterEn water = _TranslationsShoppingWaterEn._(_root);
	@override late final _TranslationsShoppingCartEn cart = _TranslationsShoppingCartEn._(_root);
	@override late final _TranslationsShoppingCheckoutEn checkout = _TranslationsShoppingCheckoutEn._(_root);
	@override late final _TranslationsShoppingCommonEn common = _TranslationsShoppingCommonEn._(_root);
	@override late final _TranslationsShoppingNavigationEn navigation = _TranslationsShoppingNavigationEn._(_root);
	@override late final _TranslationsShoppingCategoriesEn categories = _TranslationsShoppingCategoriesEn._(_root);
}

// Path: shopping.water
class _TranslationsShoppingWaterEn extends TranslationsShoppingWaterJa {
	_TranslationsShoppingWaterEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Buy 2 bottles of water';
	@override String get appTitle => 'nantomall';
	@override String get searchPlaceholder => 'Search items';
	@override String get cartTitle => 'Shopping Cart';
	@override String get cartEmpty => 'Your cart is empty';
	@override String get subtotal => 'Subtotal ({count} items):';
	@override String get confirmOrder => 'Place order';
}

// Path: shopping.cart
class _TranslationsShoppingCartEn extends TranslationsShoppingCartJa {
	_TranslationsShoppingCartEn._(TranslationsEn root) : this._root = root, super.internal(root);

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

// Path: shopping.checkout
class _TranslationsShoppingCheckoutEn extends TranslationsShoppingCheckoutJa {
	_TranslationsShoppingCheckoutEn._(TranslationsEn root) : this._root = root, super.internal(root);

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

// Path: shopping.common
class _TranslationsShoppingCommonEn extends TranslationsShoppingCommonJa {
	_TranslationsShoppingCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get addToCart => 'Add to Cart';
	@override String get quantity => 'Qty: {qty}';
	@override String get primeBadge => 'prime';
}

// Path: shopping.navigation
class _TranslationsShoppingNavigationEn extends TranslationsShoppingNavigationJa {
	_TranslationsShoppingNavigationEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get search => 'Search';
	@override String get account => 'Account';
	@override String get menu => 'Menu';
}

// Path: shopping.categories
class _TranslationsShoppingCategoriesEn extends TranslationsShoppingCategoriesJa {
	_TranslationsShoppingCategoriesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get daily => 'Daily goods';
	@override String get food => 'Food & Drinks';
	@override String get electronics => 'Electronics';
	@override String get fashion => 'Fashion';
	@override String get sports => 'Sports';
	@override String get kitchen => 'Kitchen';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
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
