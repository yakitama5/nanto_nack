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
	@override String get appTitle => 'ŋɑŋʈθɱɑʟʟ';
	@override String get searchPlaceholder => 'Ʃɛɑʀɔħ ıʈɛɱʃ';
	@override String get cartTitle => 'Ʃħθρρıŋɣ Ɔɑʀʈ';
	@override String get cartEmpty => 'Ƴθʊʀ ɔɑʀʈ ıʃ ɛɱρʈʎ';
	@override String get subtotal => 'Ʃʊƀʈθʈɑʟ ({count} ıʈɛɱʃ):';
	@override String get confirmOrder => 'Ρʟɑɔɛ θʀɗɛʀ';
}

// Path: cart
class _TranslationsCartXx extends TranslationsCartJa {
	_TranslationsCartXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Select the total price of this cart';
	@override String get appTitle => 'Ʃħθρρıŋɣ Ɔɑʀʈ';
	@override String get itemsHeader => 'Ɔɑʀʈ Ɪʈɛɱʃ';
	@override String get itemCount => '{count} ıʈɛɱʃ';
	@override String get questionTitle => 'Ωħɑʈ ıʃ ʈħɛ ʈθʈɑʟ ρʀıɔɛ?';
	@override String get questionSubtitle => 'Ɔɑʟɔʊʟɑʈɛ ʈħɛ ʈθʈɑʟ θƒ ıʈɛɱʃ ɑƀθʌɛ ɑŋɗ ʃɛʟɛɔʈ';
	@override String get hint => 'Ɱʊʟʈıρʟʎ ɛɑɔħ ʊŋıʈ ρʀıɔɛ ƀʎ ϕʊɑŋʈıʈʎ ɑŋɗ ʃʊɱ ʈħɛɱ ʊρ';
}

// Path: checkout
class _TranslationsCheckoutXx extends TranslationsCheckoutJa {
	_TranslationsCheckoutXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Complete the checkout process';
	@override String get appTitle => 'Ρɑʎɱɛŋʈ Ɔħɛɔƙθʊʈ';
	@override String get step1 => 'Ɔɑʀʈ';
	@override String get step2 => 'Ɑɗɗʀɛʃʃ & Ρɑʎɱɛŋʈ';
	@override String get step3 => 'Ɔθŋƒıʀɱ';
	@override String get addressSection => 'Ɗɛʟıʌɛʀʎ Ɑɗɗʀɛʃʃ';
	@override String get addressPlaceholder => 'ɛ.ɣ. ①-① Ʃħıƀʊʎɑ, Ʈθƙʎθ...';
	@override String get paymentSection => 'Ρɑʎɱɛŋʈ Ɱɛʈħθɗ';
	@override String get paymentCreditCard => 'Ɔʀɛɗıʈ Ɔɑʀɗ';
	@override String get paymentConvenience => 'Ɔθŋʌɛŋıɛŋɔɛ Ʃʈθʀɛ';
	@override String get paymentCOD => 'Ɔɑʃħ θŋ Ɗɛʟıʌɛʀʎ';
	@override String get summarySection => 'Θʀɗɛʀ Ʃʊɱɱɑʀʎ';
	@override String get subtotal => 'Ɪʈɛɱ Ʃʊƀʈθʈɑʟ';
	@override String get shipping => 'Ʃħıρρıŋɣ ƒɛɛ';
	@override String get total => 'Θʀɗɛʀ Ʈθʈɑʟ';
	@override String get confirmCheck => 'Ɪ ħɑʌɛ ɔθŋƒıʀɱɛɗ ʈħɛ θʀɗɛʀ ɗɛʈɑıʟʃ';
	@override String get confirmButton => 'Ρʟɑɔɛ Θʀɗɛʀ';
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get addToCart => 'Ɑɗɗ ʈθ Ɔɑʀʈ';
	@override String get quantity => 'Φʈʎ: {qty}';
	@override String get primeBadge => 'ρʀıɱɛ';
}

// Path: navigation
class _TranslationsNavigationXx extends TranslationsNavigationJa {
	_TranslationsNavigationXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get home => 'Ħθɱɛ';
	@override String get search => 'Ʃɛɑʀɔħ';
	@override String get account => 'Ɑɔɔθʊŋʈ';
	@override String get menu => 'Ɱɛŋʊ';
}

// Path: categories
class _TranslationsCategoriesXx extends TranslationsCategoriesJa {
	_TranslationsCategoriesXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get daily => 'Ɗɑıʟʎ ɣθθɗʃ';
	@override String get food => 'Ƒθθɗ & Ɗʀıŋƙʃ';
	@override String get electronics => 'Ɛʟɛɔʈʀθŋıɔʃ';
	@override String get fashion => 'Ƒɑʃħıθŋ';
	@override String get sports => 'Ʃρθʀʈʃ';
	@override String get kitchen => 'Ƙıʈɔħɛŋ';
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
			'water.appTitle' => 'ŋɑŋʈθɱɑʟʟ',
			'water.searchPlaceholder' => 'Ʃɛɑʀɔħ ıʈɛɱʃ',
			'water.cartTitle' => 'Ʃħθρρıŋɣ Ɔɑʀʈ',
			'water.cartEmpty' => 'Ƴθʊʀ ɔɑʀʈ ıʃ ɛɱρʈʎ',
			'water.subtotal' => 'Ʃʊƀʈθʈɑʟ ({count} ıʈɛɱʃ):',
			'water.confirmOrder' => 'Ρʟɑɔɛ θʀɗɛʀ',
			'cart.missionText' => 'Select the total price of this cart',
			'cart.appTitle' => 'Ʃħθρρıŋɣ Ɔɑʀʈ',
			'cart.itemsHeader' => 'Ɔɑʀʈ Ɪʈɛɱʃ',
			'cart.itemCount' => '{count} ıʈɛɱʃ',
			'cart.questionTitle' => 'Ωħɑʈ ıʃ ʈħɛ ʈθʈɑʟ ρʀıɔɛ?',
			'cart.questionSubtitle' => 'Ɔɑʟɔʊʟɑʈɛ ʈħɛ ʈθʈɑʟ θƒ ıʈɛɱʃ ɑƀθʌɛ ɑŋɗ ʃɛʟɛɔʈ',
			'cart.hint' => 'Ɱʊʟʈıρʟʎ ɛɑɔħ ʊŋıʈ ρʀıɔɛ ƀʎ ϕʊɑŋʈıʈʎ ɑŋɗ ʃʊɱ ʈħɛɱ ʊρ',
			'checkout.missionText' => 'Complete the checkout process',
			'checkout.appTitle' => 'Ρɑʎɱɛŋʈ Ɔħɛɔƙθʊʈ',
			'checkout.step1' => 'Ɔɑʀʈ',
			'checkout.step2' => 'Ɑɗɗʀɛʃʃ & Ρɑʎɱɛŋʈ',
			'checkout.step3' => 'Ɔθŋƒıʀɱ',
			'checkout.addressSection' => 'Ɗɛʟıʌɛʀʎ Ɑɗɗʀɛʃʃ',
			'checkout.addressPlaceholder' => 'ɛ.ɣ. ①-① Ʃħıƀʊʎɑ, Ʈθƙʎθ...',
			'checkout.paymentSection' => 'Ρɑʎɱɛŋʈ Ɱɛʈħθɗ',
			'checkout.paymentCreditCard' => 'Ɔʀɛɗıʈ Ɔɑʀɗ',
			'checkout.paymentConvenience' => 'Ɔθŋʌɛŋıɛŋɔɛ Ʃʈθʀɛ',
			'checkout.paymentCOD' => 'Ɔɑʃħ θŋ Ɗɛʟıʌɛʀʎ',
			'checkout.summarySection' => 'Θʀɗɛʀ Ʃʊɱɱɑʀʎ',
			'checkout.subtotal' => 'Ɪʈɛɱ Ʃʊƀʈθʈɑʟ',
			'checkout.shipping' => 'Ʃħıρρıŋɣ ƒɛɛ',
			'checkout.total' => 'Θʀɗɛʀ Ʈθʈɑʟ',
			'checkout.confirmCheck' => 'Ɪ ħɑʌɛ ɔθŋƒıʀɱɛɗ ʈħɛ θʀɗɛʀ ɗɛʈɑıʟʃ',
			'checkout.confirmButton' => 'Ρʟɑɔɛ Θʀɗɛʀ',
			'common.addToCart' => 'Ɑɗɗ ʈθ Ɔɑʀʈ',
			'common.quantity' => 'Φʈʎ: {qty}',
			'common.primeBadge' => 'ρʀıɱɛ',
			'navigation.home' => 'Ħθɱɛ',
			'navigation.search' => 'Ʃɛɑʀɔħ',
			'navigation.account' => 'Ɑɔɔθʊŋʈ',
			'navigation.menu' => 'Ɱɛŋʊ',
			'categories.daily' => 'Ɗɑıʟʎ ɣθθɗʃ',
			'categories.food' => 'Ƒθθɗ & Ɗʀıŋƙʃ',
			'categories.electronics' => 'Ɛʟɛɔʈʀθŋıɔʃ',
			'categories.fashion' => 'Ƒɑʃħıθŋ',
			'categories.sports' => 'Ʃρθʀʈʃ',
			'categories.kitchen' => 'Ƙıʈɔħɛŋ',
			_ => null,
		};
	}
}
