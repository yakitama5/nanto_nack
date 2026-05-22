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
	@override late final _TranslationsCategoriesEn categories = _TranslationsCategoriesEn._(_root);
	@override late final _TranslationsItemsEn items = _TranslationsItemsEn._(_root);
}

// Path: quiz1
class _TranslationsQuiz1En extends TranslationsQuiz1Ja {
	_TranslationsQuiz1En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Feeling like pizza today! Find pizza in the categories';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Order some for a friend too. Increase the quantity to 2';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Ready to order? Check your cart';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Where is the courier? Expand the map to full screen';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Food Delivery';
	@override String get searchHint => 'Search restaurants & menus';
	@override String get categories => 'Categories';
	@override String get itemName => 'Burger Set';
	@override String get itemDescription => 'Juicy beef patty with fresh vegetables';
	@override String get itemPrice => '¥890';
	@override String get itemPriceValue => '890';
	@override String get cartButton => 'Check Cart ¥{total}';
	@override String get trackingTitle => 'Delivery Status';
	@override String get courierName => 'Courier: Nantom';
	@override String get courierStatus => 'Arriving soon';
	@override String get estimatedTime => 'ETA: ~10 min';
	@override String get orderItems => 'Order Items';
	@override String get orderTotal => 'Total: ¥{total}';
}

// Path: categories
class _TranslationsCategoriesEn extends TranslationsCategoriesJa {
	_TranslationsCategoriesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get burger => 'Burger';
	@override String get sushi => 'Sushi';
	@override String get pizza => 'Pizza';
	@override String get ramen => 'Ramen';
	@override String get curry => 'Curry';
}

// Path: items
class _TranslationsItemsEn extends TranslationsItemsJa {
	_TranslationsItemsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsItemsBurgerEn burger = _TranslationsItemsBurgerEn._(_root);
	@override late final _TranslationsItemsSushiEn sushi = _TranslationsItemsSushiEn._(_root);
	@override late final _TranslationsItemsPizzaEn pizza = _TranslationsItemsPizzaEn._(_root);
	@override late final _TranslationsItemsRamenEn ramen = _TranslationsItemsRamenEn._(_root);
	@override late final _TranslationsItemsCurryEn curry = _TranslationsItemsCurryEn._(_root);
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know pizza was hidden?';
	@override String get subtitle => 'Horizontal scroll to discover hidden content';
	@override String get scrollTitle => 'Swipe to scroll';
	@override String get scrollDesc => 'Categories that don\'t fit on screen can be found by horizontal scrolling. The peeking icons at the edge signal there\'s more content.';
	@override String get iconTitle => 'Category icons';
	@override String get iconDesc => 'Round icons represent categories. Tapping filters the menu by that category.';
	@override String get affordanceTitle => 'Affordance';
	@override String get affordanceDesc => 'Icons peeking at the edge serve as an affordance, signaling that the list is horizontally scrollable.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know + increases the quantity?';
	@override String get subtitle => 'Stepper UI for quantity adjustment';
	@override String get stepperTitle => 'Stepper UI';
	@override String get stepperDesc => 'The \'−\', number, \'+\' control is called a stepper. Decrease on the left, increase on the right.';
	@override String get minTitle => 'Minimum limit';
	@override String get minDesc => 'The quantity cannot go below 1, preventing zero-item orders.';
	@override String get feedbackTitle => 'Instant feedback';
	@override String get feedbackDesc => 'The number and total price update instantly with each tap, visually confirming the action.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know the bottom button was the cart?';
	@override String get subtitle => 'Floating action button to proceed to next step';
	@override String get fabTitle => 'Floating cart button';
	@override String get fabDesc => 'The prominent button always visible at the bottom shows the total price, signaling readiness to purchase.';
	@override String get priceTitle => 'Price display';
	@override String get priceDesc => 'The auto-calculated total appears on the button, letting users confirm the amount before ordering.';
	@override String get actionTitle => 'Primary action emphasis';
	@override String get actionDesc => 'Placing the main action (proceed to cart) prominently at the bottom makes the next step obvious.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know dragging the sheet expands the map?';
	@override String get subtitle => 'Draggable bottom sheet to reveal details';
	@override String get sheetTitle => 'Draggable bottom sheet';
	@override String get sheetDesc => 'A sheet that can be dragged from the bottom upward is called a draggable bottom sheet. It lets you balance the map and detail views.';
	@override String get handleTitle => 'Handle bar';
	@override String get handleDesc => 'The horizontal bar at the top of the sheet is an affordance showing it can be grabbed and moved.';
	@override String get expandTitle => 'Full screen expand';
	@override String get expandDesc => 'Dragging the sheet to maximum makes it full screen, showing detailed courier information.';
}

// Path: items.burger
class _TranslationsItemsBurgerEn extends TranslationsItemsBurgerJa {
	_TranslationsItemsBurgerEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Burger Set';
	@override String get description => 'Juicy beef patty with fresh vegetables';
}

// Path: items.sushi
class _TranslationsItemsSushiEn extends TranslationsItemsSushiJa {
	_TranslationsItemsSushiEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Nigiri Sushi 10pc';
	@override String get description => 'Fresh sushi carefully crafted by our chef';
}

// Path: items.pizza
class _TranslationsItemsPizzaEn extends TranslationsItemsPizzaJa {
	_TranslationsItemsPizzaEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Margherita Pizza';
	@override String get description => 'Mozzarella cheese and fresh basil on tomato sauce';
}

// Path: items.ramen
class _TranslationsItemsRamenEn extends TranslationsItemsRamenJa {
	_TranslationsItemsRamenEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Soy Sauce Ramen';
	@override String get description => 'Rich pork & chicken broth with soy sauce tare';
}

// Path: items.curry
class _TranslationsItemsCurryEn extends TranslationsItemsCurryJa {
	_TranslationsItemsCurryEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Chicken Curry';
	@override String get description => 'Aromatic butter chicken curry with steamed rice';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Feeling like pizza today! Find pizza in the categories',
			'quiz1.insight.title' => 'How did you know pizza was hidden?',
			'quiz1.insight.subtitle' => 'Horizontal scroll to discover hidden content',
			'quiz1.insight.scrollTitle' => 'Swipe to scroll',
			'quiz1.insight.scrollDesc' => 'Categories that don\'t fit on screen can be found by horizontal scrolling. The peeking icons at the edge signal there\'s more content.',
			'quiz1.insight.iconTitle' => 'Category icons',
			'quiz1.insight.iconDesc' => 'Round icons represent categories. Tapping filters the menu by that category.',
			'quiz1.insight.affordanceTitle' => 'Affordance',
			'quiz1.insight.affordanceDesc' => 'Icons peeking at the edge serve as an affordance, signaling that the list is horizontally scrollable.',
			'quiz2.missionText' => 'Order some for a friend too. Increase the quantity to 2',
			'quiz2.insight.title' => 'How did you know + increases the quantity?',
			'quiz2.insight.subtitle' => 'Stepper UI for quantity adjustment',
			'quiz2.insight.stepperTitle' => 'Stepper UI',
			'quiz2.insight.stepperDesc' => 'The \'−\', number, \'+\' control is called a stepper. Decrease on the left, increase on the right.',
			'quiz2.insight.minTitle' => 'Minimum limit',
			'quiz2.insight.minDesc' => 'The quantity cannot go below 1, preventing zero-item orders.',
			'quiz2.insight.feedbackTitle' => 'Instant feedback',
			'quiz2.insight.feedbackDesc' => 'The number and total price update instantly with each tap, visually confirming the action.',
			'quiz3.missionText' => 'Ready to order? Check your cart',
			'quiz3.insight.title' => 'How did you know the bottom button was the cart?',
			'quiz3.insight.subtitle' => 'Floating action button to proceed to next step',
			'quiz3.insight.fabTitle' => 'Floating cart button',
			'quiz3.insight.fabDesc' => 'The prominent button always visible at the bottom shows the total price, signaling readiness to purchase.',
			'quiz3.insight.priceTitle' => 'Price display',
			'quiz3.insight.priceDesc' => 'The auto-calculated total appears on the button, letting users confirm the amount before ordering.',
			'quiz3.insight.actionTitle' => 'Primary action emphasis',
			'quiz3.insight.actionDesc' => 'Placing the main action (proceed to cart) prominently at the bottom makes the next step obvious.',
			'quiz4.missionText' => 'Where is the courier? Expand the map to full screen',
			'quiz4.insight.title' => 'How did you know dragging the sheet expands the map?',
			'quiz4.insight.subtitle' => 'Draggable bottom sheet to reveal details',
			'quiz4.insight.sheetTitle' => 'Draggable bottom sheet',
			'quiz4.insight.sheetDesc' => 'A sheet that can be dragged from the bottom upward is called a draggable bottom sheet. It lets you balance the map and detail views.',
			'quiz4.insight.handleTitle' => 'Handle bar',
			'quiz4.insight.handleDesc' => 'The horizontal bar at the top of the sheet is an affordance showing it can be grabbed and moved.',
			'quiz4.insight.expandTitle' => 'Full screen expand',
			'quiz4.insight.expandDesc' => 'Dragging the sheet to maximum makes it full screen, showing detailed courier information.',
			'common.appTitle' => 'Food Delivery',
			'common.searchHint' => 'Search restaurants & menus',
			'common.categories' => 'Categories',
			'common.itemName' => 'Burger Set',
			'common.itemDescription' => 'Juicy beef patty with fresh vegetables',
			'common.itemPrice' => '¥890',
			'common.itemPriceValue' => '890',
			'common.cartButton' => 'Check Cart ¥{total}',
			'common.trackingTitle' => 'Delivery Status',
			'common.courierName' => 'Courier: Nantom',
			'common.courierStatus' => 'Arriving soon',
			'common.estimatedTime' => 'ETA: ~10 min',
			'common.orderItems' => 'Order Items',
			'common.orderTotal' => 'Total: ¥{total}',
			'categories.burger' => 'Burger',
			'categories.sushi' => 'Sushi',
			'categories.pizza' => 'Pizza',
			'categories.ramen' => 'Ramen',
			'categories.curry' => 'Curry',
			'items.burger.name' => 'Burger Set',
			'items.burger.description' => 'Juicy beef patty with fresh vegetables',
			'items.sushi.name' => 'Nigiri Sushi 10pc',
			'items.sushi.description' => 'Fresh sushi carefully crafted by our chef',
			'items.pizza.name' => 'Margherita Pizza',
			'items.pizza.description' => 'Mozzarella cheese and fresh basil on tomato sauce',
			'items.ramen.name' => 'Soy Sauce Ramen',
			'items.ramen.description' => 'Rich pork & chicken broth with soy sauce tare',
			'items.curry.name' => 'Chicken Curry',
			'items.curry.description' => 'Aromatic butter chicken curry with steamed rice',
			_ => null,
		};
	}
}
