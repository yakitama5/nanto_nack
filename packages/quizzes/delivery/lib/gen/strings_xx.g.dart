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
class TranslationsXx with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsXx({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.xx,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <xx>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsXx _root = this; // ignore: unused_field

	@override 
	TranslationsXx $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsXx(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsQuiz1Xx quiz1 = _TranslationsQuiz1Xx._(_root);
	@override late final _TranslationsQuiz2Xx quiz2 = _TranslationsQuiz2Xx._(_root);
	@override late final _TranslationsQuiz3Xx quiz3 = _TranslationsQuiz3Xx._(_root);
	@override late final _TranslationsQuiz4Xx quiz4 = _TranslationsQuiz4Xx._(_root);
	@override late final _TranslationsCommonXx common = _TranslationsCommonXx._(_root);
	@override late final _TranslationsCategoriesXx categories = _TranslationsCategoriesXx._(_root);
	@override late final _TranslationsItemsXx items = _TranslationsItemsXx._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Xx implements TranslationsQuiz1En {
	_TranslationsQuiz1Xx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Azkzk Wozzs Ksazkoxg';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx implements TranslationsQuiz2En {
	_TranslationsQuiz2Xx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Apkxzsaz Qospzoag';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx implements TranslationsQuiz3En {
	_TranslationsQuiz3Xx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Kuzkq Ksxz';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx implements TranslationsQuiz4En {
	_TranslationsQuiz4Xx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Follakxzzp Msw';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx implements TranslationsCommonEn {
	_TranslationsCommonXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Foovilivxg';
	@override String get searchHint => 'Azskku...';
	@override String get categories => 'Ksazakuxoza';
	@override String get itemName => 'Bixkzx Azz';
	@override String get itemDescription => 'Jigkkg wzfy & fxzau vzkz.';
	@override String get itemPrice => '¥890';
	@override String get itemPriceValue => '890';
	@override String get cartButton => 'Kuzkq Ksxz ¥{total}';
	@override String get trackingTitle => 'Vxskqopk';
	@override String get courierName => 'Koixozx: Nspzoa';
	@override String get courierStatus => 'Axrovopk aoop';
	@override String get estimatedTime => 'ETA: ~10mop';
	@override String get orderItems => 'Oxvzx Izaza';
	@override String get orderTotal => 'Tozsl ¥{total}';
}

// Path: categories
class _TranslationsCategoriesXx implements TranslationsCategoriesEn {
	_TranslationsCategoriesXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get burger => 'Bixkzx';
	@override String get sushi => 'Aiuao';
	@override String get pizza => 'Wozzs';
	@override String get ramen => 'Xsamzp';
	@override String get curry => 'Kixxi';
}

// Path: items
class _TranslationsItemsXx implements TranslationsItemsEn {
	_TranslationsItemsXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsItemsBurgerXx burger = _TranslationsItemsBurgerXx._(_root);
	@override late final _TranslationsItemsSushiXx sushi = _TranslationsItemsSushiXx._(_root);
	@override late final _TranslationsItemsPizzaXx pizza = _TranslationsItemsPizzaXx._(_root);
	@override late final _TranslationsItemsRamenXx ramen = _TranslationsItemsRamenXx._(_root);
	@override late final _TranslationsItemsCurryXx curry = _TranslationsItemsCurryXx._(_root);
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Azkzk Wozzs?';
	@override String get subtitle => 'Akxoll zo fopv';
	@override String get scrollTitle => 'Azkzk Uxkll';
	@override String get scrollDesc => 'Azkzk fox ukiizp kzza.';
	@override String get iconTitle => 'Ksazkoxg Ikop';
	@override String get iconDesc => 'Zkw fox kzkkoxg.';
	@override String get affordanceTitle => 'Affoxvspkz';
	@override String get affordanceDesc => 'Evkz aujoa akxollseoloag.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wow Azerwwex?';
	@override String get subtitle => 'Azerwwex UI';
	@override String get stepperTitle => 'Azerwwex';
	@override String get stepperDesc => 'Mopoa zp kospzaoa.';
	@override String get minTitle => 'Mop Lokuoz';
	@override String get minDesc => 'Ksp\'z kx ozxo 1.';
	@override String get feedbackTitle => 'Fzzveskq';
	@override String get feedbackDesc => 'Opazspz rwvsaz.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wow Ksxz?';
	@override String get subtitle => 'FAB zo Ksxz';
	@override String get fabTitle => 'Flosoopk Ksxz';
	@override String get fabDesc => 'Auwwa zkxz wozu wxokz.';
	@override String get priceTitle => 'Txokz Vuawlsg';
	@override String get priceDesc => 'Toskl wokz auowp.';
	@override String get actionTitle => 'Mskp Akzoop';
	@override String get actionDesc => 'Eowluszaa qzg skzoop.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wow Bozzoa Auzzz?';
	@override String get subtitle => 'Vxskksoez Bozzo Auzzz';
	@override String get sheetTitle => 'Vxskksoez Auzzz';
	@override String get sheetDesc => 'Vxsk rw fox vzzsola.';
	@override String get handleTitle => 'Uspvlz Bsx';
	@override String get handleDesc => 'Kuswa vxskksoez.';
	@override String get expandTitle => 'Follakxzzp';
	@override String get expandDesc => 'Msu vxsk fox vzzskla.';
}

// Path: items.burger
class _TranslationsItemsBurgerXx implements TranslationsItemsBurgerEn {
	_TranslationsItemsBurgerXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get name => 'Bixkzx Azz';
	@override String get description => 'Jigkkg wzfy & fxzau vzkz.';
}

// Path: items.sushi
class _TranslationsItemsSushiXx implements TranslationsItemsSushiEn {
	_TranslationsItemsSushiXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get name => 'Aiuao 10 Wkzkza';
	@override String get description => 'Fxzau aiuao eg skxzfol kusfa.';
}

// Path: items.pizza
class _TranslationsItemsPizzaXx implements TranslationsItemsPizzaEn {
	_TranslationsItemsPizzaXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get name => 'Msxkzxozs Wozzs';
	@override String get description => 'Mozzsxzlls kuzzaz & esaol.';
}

// Path: items.ramen
class _TranslationsItemsRamenXx implements TranslationsItemsRamenEn {
	_TranslationsItemsRamenXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get name => 'Aujog Xsamzp';
	@override String get description => 'Vorzlz axozu & xoku ikas axozu.';
}

// Path: items.curry
class _TranslationsItemsCurryXx implements TranslationsItemsCurryEn {
	_TranslationsItemsCurryXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get name => 'Kijkqzp Kixxi';
	@override String get description => 'Awokz zsazz exzsmg kixxi & xokz.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Azkzk Wozzs Ksazkoxg',
			'quiz1.insight.title' => 'Azkzk Wozzs?',
			'quiz1.insight.subtitle' => 'Akxoll zo fopv',
			'quiz1.insight.scrollTitle' => 'Azkzk Uxkll',
			'quiz1.insight.scrollDesc' => 'Azkzk fox ukiizp kzza.',
			'quiz1.insight.iconTitle' => 'Ksazkoxg Ikop',
			'quiz1.insight.iconDesc' => 'Zkw fox kzkkoxg.',
			'quiz1.insight.affordanceTitle' => 'Affoxvspkz',
			'quiz1.insight.affordanceDesc' => 'Evkz aujoa akxollseoloag.',
			'quiz2.missionText' => 'Apkxzsaz Qospzoag',
			'quiz2.insight.title' => 'Wow Azerwwex?',
			'quiz2.insight.subtitle' => 'Azerwwex UI',
			'quiz2.insight.stepperTitle' => 'Azerwwex',
			'quiz2.insight.stepperDesc' => 'Mopoa zp kospzaoa.',
			'quiz2.insight.minTitle' => 'Mop Lokuoz',
			'quiz2.insight.minDesc' => 'Ksp\'z kx ozxo 1.',
			'quiz2.insight.feedbackTitle' => 'Fzzveskq',
			'quiz2.insight.feedbackDesc' => 'Opazspz rwvsaz.',
			'quiz3.missionText' => 'Kuzkq Ksxz',
			'quiz3.insight.title' => 'Wow Ksxz?',
			'quiz3.insight.subtitle' => 'FAB zo Ksxz',
			'quiz3.insight.fabTitle' => 'Flosoopk Ksxz',
			'quiz3.insight.fabDesc' => 'Auwwa zkxz wozu wxokz.',
			'quiz3.insight.priceTitle' => 'Txokz Vuawlsg',
			'quiz3.insight.priceDesc' => 'Toskl wokz auowp.',
			'quiz3.insight.actionTitle' => 'Mskp Akzoop',
			'quiz3.insight.actionDesc' => 'Eowluszaa qzg skzoop.',
			'quiz4.missionText' => 'Follakxzzp Msw',
			'quiz4.insight.title' => 'Wow Bozzoa Auzzz?',
			'quiz4.insight.subtitle' => 'Vxskksoez Bozzo Auzzz',
			'quiz4.insight.sheetTitle' => 'Vxskksoez Auzzz',
			'quiz4.insight.sheetDesc' => 'Vxsk rw fox vzzsola.',
			'quiz4.insight.handleTitle' => 'Uspvlz Bsx',
			'quiz4.insight.handleDesc' => 'Kuswa vxskksoez.',
			'quiz4.insight.expandTitle' => 'Follakxzzp',
			'quiz4.insight.expandDesc' => 'Msu vxsk fox vzzskla.',
			'common.appTitle' => 'Foovilivxg',
			'common.searchHint' => 'Azskku...',
			'common.categories' => 'Ksazakuxoza',
			'common.itemName' => 'Bixkzx Azz',
			'common.itemDescription' => 'Jigkkg wzfy & fxzau vzkz.',
			'common.itemPrice' => '¥890',
			'common.itemPriceValue' => '890',
			'common.cartButton' => 'Kuzkq Ksxz ¥{total}',
			'common.trackingTitle' => 'Vxskqopk',
			'common.courierName' => 'Koixozx: Nspzoa',
			'common.courierStatus' => 'Axrovopk aoop',
			'common.estimatedTime' => 'ETA: ~10mop',
			'common.orderItems' => 'Oxvzx Izaza',
			'common.orderTotal' => 'Tozsl ¥{total}',
			'categories.burger' => 'Bixkzx',
			'categories.sushi' => 'Aiuao',
			'categories.pizza' => 'Wozzs',
			'categories.ramen' => 'Xsamzp',
			'categories.curry' => 'Kixxi',
			'items.burger.name' => 'Bixkzx Azz',
			'items.burger.description' => 'Jigkkg wzfy & fxzau vzkz.',
			'items.sushi.name' => 'Aiuao 10 Wkzkza',
			'items.sushi.description' => 'Fxzau aiuao eg skxzfol kusfa.',
			'items.pizza.name' => 'Msxkzxozs Wozzs',
			'items.pizza.description' => 'Mozzsxzlls kuzzaz & esaol.',
			'items.ramen.name' => 'Aujog Xsamzp',
			'items.ramen.description' => 'Vorzlz axozu & xoku ikas axozu.',
			'items.curry.name' => 'Kijkqzp Kixxi',
			'items.curry.description' => 'Awokz zsazz exzsmg kixxi & xokz.',
			_ => null,
		};
	}
}
