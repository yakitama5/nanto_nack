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
	@override late final _TranslationsCommonXx common = _TranslationsCommonXx._(_root);
	@override late final _TranslationsNavigationXx navigation = _TranslationsNavigationXx._(_root);
	@override late final _TranslationsCategoriesXx categories = _TranslationsCategoriesXx._(_root);
}

// Path: water
class _TranslationsWaterXx extends TranslationsWaterJa {
	_TranslationsWaterXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Buy 2 bottles of water';
	@override String get appTitle => 'jkjzsekcc';
	@override String get searchPlaceholder => 'Wxkfuy rzxew';
	@override String get cartTitle => 'Wysoorjp Ukfz';
	@override String get cartEmpty => 'Ishf ukfz rw xeozi';
	@override String get subtotal => 'Whdzszkc ({count} rzxew):';
	@override String get confirmOrder => 'Ockux sfmxf';
}

// Path: cart
class _TranslationsCartXx extends TranslationsCartJa {
	_TranslationsCartXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Select the total price of this cart';
	@override String get appTitle => 'Wysoorjp Ukfz';
	@override String get itemsHeader => 'Ukfz Rzxew';
	@override String get itemCount => '{count} rzxew';
	@override String get questionTitle => 'Gykz rw zyx zszkc ofrux?';
	@override String get questionSubtitle => 'Ukcuhckzx zyx zszkc sb rzxew kdsnx kjm wxcxuz';
	@override String get hint => 'Ehczroci xkuy hjrz ofrux di lhkjzrzi kjm whe zyxe ho';
}

// Path: checkout
class _TranslationsCheckoutXx extends TranslationsCheckoutJa {
	_TranslationsCheckoutXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Complete the checkout process';
	@override String get appTitle => 'Okiexjz Uyxuashz';
	@override String get step1 => 'Ukfz';
	@override String get step2 => 'Kmmfxww & Okiexjz';
	@override String get step3 => 'Usjbrfe';
	@override String get addressSection => 'Mxcrnxfi Kmmfxww';
	@override String get addressPlaceholder => 'x.p. γ-γ Wyrdhik, Zsais...';
	@override String get paymentSection => 'Okiexjz Exzysm';
	@override String get paymentCreditCard => 'Ufxmrz Ukfm';
	@override String get paymentConvenience => 'Usjnxjrxjux Wzsfx';
	@override String get paymentCOD => 'Ukwy sj Mxcrnxfi';
	@override String get summarySection => 'Sfmxf Wheekfi';
	@override String get subtotal => 'Rzxe Whdzszkc';
	@override String get shipping => 'Wyroorjp bxx';
	@override String get total => 'Sfmxf Zszkc';
	@override String get confirmCheck => 'R yknx usjbrfexm zyx sfmxf mxzkrcw';
	@override String get confirmButton => 'Ockux Sfmxf';
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get addToCart => 'Kmm zs Ukfz';
	@override String get quantity => 'Lzi: {qty}';
	@override String get primeBadge => 'ofrex';
}

// Path: navigation
class _TranslationsNavigationXx extends TranslationsNavigationJa {
	_TranslationsNavigationXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get home => 'Ysex';
	@override String get search => 'Wxkfuy';
	@override String get account => 'Kuushjz';
	@override String get menu => 'Exjh';
}

// Path: categories
class _TranslationsCategoriesXx extends TranslationsCategoriesJa {
	_TranslationsCategoriesXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get daily => 'Mkrci pssmw';
	@override String get food => 'Bssm & Mfrjaw';
	@override String get electronics => 'Xcxuzfsjruw';
	@override String get fashion => 'Bkwyrsj';
	@override String get sports => 'Wosfzw';
	@override String get kitchen => 'Arzuyxj';
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
			'water.appTitle' => 'jkjzsekcc',
			'water.searchPlaceholder' => 'Wxkfuy rzxew',
			'water.cartTitle' => 'Wysoorjp Ukfz',
			'water.cartEmpty' => 'Ishf ukfz rw xeozi',
			'water.subtotal' => 'Whdzszkc ({count} rzxew):',
			'water.confirmOrder' => 'Ockux sfmxf',
			'cart.missionText' => 'Select the total price of this cart',
			'cart.appTitle' => 'Wysoorjp Ukfz',
			'cart.itemsHeader' => 'Ukfz Rzxew',
			'cart.itemCount' => '{count} rzxew',
			'cart.questionTitle' => 'Gykz rw zyx zszkc ofrux?',
			'cart.questionSubtitle' => 'Ukcuhckzx zyx zszkc sb rzxew kdsnx kjm wxcxuz',
			'cart.hint' => 'Ehczroci xkuy hjrz ofrux di lhkjzrzi kjm whe zyxe ho',
			'checkout.missionText' => 'Complete the checkout process',
			'checkout.appTitle' => 'Okiexjz Uyxuashz',
			'checkout.step1' => 'Ukfz',
			'checkout.step2' => 'Kmmfxww & Okiexjz',
			'checkout.step3' => 'Usjbrfe',
			'checkout.addressSection' => 'Mxcrnxfi Kmmfxww',
			'checkout.addressPlaceholder' => 'x.p. γ-γ Wyrdhik, Zsais...',
			'checkout.paymentSection' => 'Okiexjz Exzysm',
			'checkout.paymentCreditCard' => 'Ufxmrz Ukfm',
			'checkout.paymentConvenience' => 'Usjnxjrxjux Wzsfx',
			'checkout.paymentCOD' => 'Ukwy sj Mxcrnxfi',
			'checkout.summarySection' => 'Sfmxf Wheekfi',
			'checkout.subtotal' => 'Rzxe Whdzszkc',
			'checkout.shipping' => 'Wyroorjp bxx',
			'checkout.total' => 'Sfmxf Zszkc',
			'checkout.confirmCheck' => 'R yknx usjbrfexm zyx sfmxf mxzkrcw',
			'checkout.confirmButton' => 'Ockux Sfmxf',
			'common.addToCart' => 'Kmm zs Ukfz',
			'common.quantity' => 'Lzi: {qty}',
			'common.primeBadge' => 'ofrex',
			'navigation.home' => 'Ysex',
			'navigation.search' => 'Wxkfuy',
			'navigation.account' => 'Kuushjz',
			'navigation.menu' => 'Exjh',
			'categories.daily' => 'Mkrci pssmw',
			'categories.food' => 'Bssm & Mfrjaw',
			'categories.electronics' => 'Xcxuzfsjruw',
			'categories.fashion' => 'Bkwyrsj',
			'categories.sports' => 'Wosfzw',
			'categories.kitchen' => 'Arzuyxj',
			_ => null,
		};
	}
}
