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
	late final TranslationsQuiz1En quiz1 = TranslationsQuiz1En._(_root);
	late final TranslationsQuiz2En quiz2 = TranslationsQuiz2En._(_root);
	late final TranslationsQuiz3En quiz3 = TranslationsQuiz3En._(_root);
	late final TranslationsQuiz4En quiz4 = TranslationsQuiz4En._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsCategoriesEn categories = TranslationsCategoriesEn._(_root);
	late final TranslationsItemsEn items = TranslationsItemsEn._(_root);
}

// Path: quiz1
class TranslationsQuiz1En {
	TranslationsQuiz1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Feeling like pizza today! Find pizza in the categories'
	String get missionText => 'Feeling like pizza today! Find pizza in the categories';

	late final TranslationsQuiz1InsightEn insight = TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class TranslationsQuiz2En {
	TranslationsQuiz2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Order some for a friend too. Increase the quantity to 2'
	String get missionText => 'Order some for a friend too. Increase the quantity to 2';

	late final TranslationsQuiz2InsightEn insight = TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class TranslationsQuiz3En {
	TranslationsQuiz3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ready to order? Check your cart'
	String get missionText => 'Ready to order? Check your cart';

	late final TranslationsQuiz3InsightEn insight = TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class TranslationsQuiz4En {
	TranslationsQuiz4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Where is the courier? Expand the map to full screen'
	String get missionText => 'Where is the courier? Expand the map to full screen';

	late final TranslationsQuiz4InsightEn insight = TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Food Delivery'
	String get appTitle => 'Food Delivery';

	/// en: 'Search restaurants & menus'
	String get searchHint => 'Search restaurants & menus';

	/// en: 'Categories'
	String get categories => 'Categories';

	/// en: 'Burger Set'
	String get itemName => 'Burger Set';

	/// en: 'Juicy beef patty with fresh vegetables'
	String get itemDescription => 'Juicy beef patty with fresh vegetables';

	/// en: '¥890'
	String get itemPrice => '¥890';

	/// en: '890'
	String get itemPriceValue => '890';

	/// en: 'Check Cart ¥{total}'
	String get cartButton => 'Check Cart ¥{total}';

	/// en: 'Delivery Status'
	String get trackingTitle => 'Delivery Status';

	/// en: 'Courier: Nantom'
	String get courierName => 'Courier: Nantom';

	/// en: 'Arriving soon'
	String get courierStatus => 'Arriving soon';

	/// en: 'ETA: ~10 min'
	String get estimatedTime => 'ETA: ~10 min';

	/// en: 'Order Items'
	String get orderItems => 'Order Items';

	/// en: 'Total: ¥{total}'
	String get orderTotal => 'Total: ¥{total}';
}

// Path: categories
class TranslationsCategoriesEn {
	TranslationsCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Burger'
	String get burger => 'Burger';

	/// en: 'Sushi'
	String get sushi => 'Sushi';

	/// en: 'Pizza'
	String get pizza => 'Pizza';

	/// en: 'Ramen'
	String get ramen => 'Ramen';

	/// en: 'Curry'
	String get curry => 'Curry';
}

// Path: items
class TranslationsItemsEn {
	TranslationsItemsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsItemsBurgerEn burger = TranslationsItemsBurgerEn._(_root);
	late final TranslationsItemsSushiEn sushi = TranslationsItemsSushiEn._(_root);
	late final TranslationsItemsPizzaEn pizza = TranslationsItemsPizzaEn._(_root);
	late final TranslationsItemsRamenEn ramen = TranslationsItemsRamenEn._(_root);
	late final TranslationsItemsCurryEn curry = TranslationsItemsCurryEn._(_root);
}

// Path: quiz1.insight
class TranslationsQuiz1InsightEn {
	TranslationsQuiz1InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know pizza was hidden?'
	String get title => 'How did you know pizza was hidden?';

	/// en: 'Horizontal scroll to discover hidden content'
	String get subtitle => 'Horizontal scroll to discover hidden content';

	/// en: 'Swipe to scroll'
	String get scrollTitle => 'Swipe to scroll';

	/// en: 'Categories that don't fit on screen can be found by horizontal scrolling. The peeking icons at the edge signal there's more content.'
	String get scrollDesc => 'Categories that don\'t fit on screen can be found by horizontal scrolling. The peeking icons at the edge signal there\'s more content.';

	/// en: 'Category icons'
	String get iconTitle => 'Category icons';

	/// en: 'Round icons represent categories. Tapping filters the menu by that category.'
	String get iconDesc => 'Round icons represent categories. Tapping filters the menu by that category.';

	/// en: 'Affordance'
	String get affordanceTitle => 'Affordance';

	/// en: 'Icons peeking at the edge serve as an affordance, signaling that the list is horizontally scrollable.'
	String get affordanceDesc => 'Icons peeking at the edge serve as an affordance, signaling that the list is horizontally scrollable.';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightEn {
	TranslationsQuiz2InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know + increases the quantity?'
	String get title => 'How did you know + increases the quantity?';

	/// en: 'Stepper UI for quantity adjustment'
	String get subtitle => 'Stepper UI for quantity adjustment';

	/// en: 'Stepper UI'
	String get stepperTitle => 'Stepper UI';

	/// en: 'The '−', number, '+' control is called a stepper. Decrease on the left, increase on the right.'
	String get stepperDesc => 'The \'−\', number, \'+\' control is called a stepper. Decrease on the left, increase on the right.';

	/// en: 'Minimum limit'
	String get minTitle => 'Minimum limit';

	/// en: 'The quantity cannot go below 1, preventing zero-item orders.'
	String get minDesc => 'The quantity cannot go below 1, preventing zero-item orders.';

	/// en: 'Instant feedback'
	String get feedbackTitle => 'Instant feedback';

	/// en: 'The number and total price update instantly with each tap, visually confirming the action.'
	String get feedbackDesc => 'The number and total price update instantly with each tap, visually confirming the action.';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightEn {
	TranslationsQuiz3InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know the bottom button was the cart?'
	String get title => 'How did you know the bottom button was the cart?';

	/// en: 'Floating action button to proceed to next step'
	String get subtitle => 'Floating action button to proceed to next step';

	/// en: 'Floating cart button'
	String get fabTitle => 'Floating cart button';

	/// en: 'The prominent button always visible at the bottom shows the total price, signaling readiness to purchase.'
	String get fabDesc => 'The prominent button always visible at the bottom shows the total price, signaling readiness to purchase.';

	/// en: 'Price display'
	String get priceTitle => 'Price display';

	/// en: 'The auto-calculated total appears on the button, letting users confirm the amount before ordering.'
	String get priceDesc => 'The auto-calculated total appears on the button, letting users confirm the amount before ordering.';

	/// en: 'Primary action emphasis'
	String get actionTitle => 'Primary action emphasis';

	/// en: 'Placing the main action (proceed to cart) prominently at the bottom makes the next step obvious.'
	String get actionDesc => 'Placing the main action (proceed to cart) prominently at the bottom makes the next step obvious.';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightEn {
	TranslationsQuiz4InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know dragging the sheet expands the map?'
	String get title => 'How did you know dragging the sheet expands the map?';

	/// en: 'Draggable bottom sheet to reveal details'
	String get subtitle => 'Draggable bottom sheet to reveal details';

	/// en: 'Draggable bottom sheet'
	String get sheetTitle => 'Draggable bottom sheet';

	/// en: 'A sheet that can be dragged from the bottom upward is called a draggable bottom sheet. It lets you balance the map and detail views.'
	String get sheetDesc => 'A sheet that can be dragged from the bottom upward is called a draggable bottom sheet. It lets you balance the map and detail views.';

	/// en: 'Handle bar'
	String get handleTitle => 'Handle bar';

	/// en: 'The horizontal bar at the top of the sheet is an affordance showing it can be grabbed and moved.'
	String get handleDesc => 'The horizontal bar at the top of the sheet is an affordance showing it can be grabbed and moved.';

	/// en: 'Full screen expand'
	String get expandTitle => 'Full screen expand';

	/// en: 'Dragging the sheet to maximum makes it full screen, showing detailed courier information.'
	String get expandDesc => 'Dragging the sheet to maximum makes it full screen, showing detailed courier information.';
}

// Path: items.burger
class TranslationsItemsBurgerEn {
	TranslationsItemsBurgerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Burger Set'
	String get name => 'Burger Set';

	/// en: 'Juicy beef patty with fresh vegetables'
	String get description => 'Juicy beef patty with fresh vegetables';
}

// Path: items.sushi
class TranslationsItemsSushiEn {
	TranslationsItemsSushiEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Nigiri Sushi 10pc'
	String get name => 'Nigiri Sushi 10pc';

	/// en: 'Fresh sushi carefully crafted by our chef'
	String get description => 'Fresh sushi carefully crafted by our chef';
}

// Path: items.pizza
class TranslationsItemsPizzaEn {
	TranslationsItemsPizzaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Margherita Pizza'
	String get name => 'Margherita Pizza';

	/// en: 'Mozzarella cheese and fresh basil on tomato sauce'
	String get description => 'Mozzarella cheese and fresh basil on tomato sauce';
}

// Path: items.ramen
class TranslationsItemsRamenEn {
	TranslationsItemsRamenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Soy Sauce Ramen'
	String get name => 'Soy Sauce Ramen';

	/// en: 'Rich pork & chicken broth with soy sauce tare'
	String get description => 'Rich pork & chicken broth with soy sauce tare';
}

// Path: items.curry
class TranslationsItemsCurryEn {
	TranslationsItemsCurryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Chicken Curry'
	String get name => 'Chicken Curry';

	/// en: 'Aromatic butter chicken curry with steamed rice'
	String get description => 'Aromatic butter chicken curry with steamed rice';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
