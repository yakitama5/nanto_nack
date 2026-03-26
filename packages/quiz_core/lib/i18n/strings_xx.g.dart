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
	@override late final _TranslationsShoppingXx shopping = _TranslationsShoppingXx._(_root);
}

// Path: shopping
class _TranslationsShoppingXx extends TranslationsShoppingJa {
	_TranslationsShoppingXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsShoppingWaterXx water = _TranslationsShoppingWaterXx._(_root);
	@override late final _TranslationsShoppingCartXx cart = _TranslationsShoppingCartXx._(_root);
	@override late final _TranslationsShoppingCheckoutXx checkout = _TranslationsShoppingCheckoutXx._(_root);
	@override late final _TranslationsShoppingCommonXx common = _TranslationsShoppingCommonXx._(_root);
	@override late final _TranslationsShoppingNavigationXx navigation = _TranslationsShoppingNavigationXx._(_root);
	@override late final _TranslationsShoppingCategoriesXx categories = _TranslationsShoppingCategoriesXx._(_root);
}

// Path: shopping.water
class _TranslationsShoppingWaterXx extends TranslationsShoppingWaterJa {
	_TranslationsShoppingWaterXx._(TranslationsXx root) : this._root = root, super.internal(root);

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

// Path: shopping.cart
class _TranslationsShoppingCartXx extends TranslationsShoppingCartJa {
	_TranslationsShoppingCartXx._(TranslationsXx root) : this._root = root, super.internal(root);

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

// Path: shopping.checkout
class _TranslationsShoppingCheckoutXx extends TranslationsShoppingCheckoutJa {
	_TranslationsShoppingCheckoutXx._(TranslationsXx root) : this._root = root, super.internal(root);

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

// Path: shopping.common
class _TranslationsShoppingCommonXx extends TranslationsShoppingCommonJa {
	_TranslationsShoppingCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get addToCart => 'Ɑɗɗ ʈθ Ɔɑʀʈ';
	@override String get quantity => 'Φʈʎ: {qty}';
	@override String get primeBadge => 'ρʀıɱɛ';
}

// Path: shopping.navigation
class _TranslationsShoppingNavigationXx extends TranslationsShoppingNavigationJa {
	_TranslationsShoppingNavigationXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get home => 'Ħθɱɛ';
	@override String get search => 'Ʃɛɑʀɔħ';
	@override String get account => 'Ɑɔɔθʊŋʈ';
	@override String get menu => 'Ɱɛŋʊ';
}

// Path: shopping.categories
class _TranslationsShoppingCategoriesXx extends TranslationsShoppingCategoriesJa {
	_TranslationsShoppingCategoriesXx._(TranslationsXx root) : this._root = root, super.internal(root);

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
			'shopping.water.missionText' => 'Buy 2 bottles of water',
			'shopping.water.appTitle' => 'ŋɑŋʈθɱɑʟʟ',
			'shopping.water.searchPlaceholder' => 'Ʃɛɑʀɔħ ıʈɛɱʃ',
			'shopping.water.cartTitle' => 'Ʃħθρρıŋɣ Ɔɑʀʈ',
			'shopping.water.cartEmpty' => 'Ƴθʊʀ ɔɑʀʈ ıʃ ɛɱρʈʎ',
			'shopping.water.subtotal' => 'Ʃʊƀʈθʈɑʟ ({count} ıʈɛɱʃ):',
			'shopping.water.confirmOrder' => 'Ρʟɑɔɛ θʀɗɛʀ',
			'shopping.cart.missionText' => 'Select the total price of this cart',
			'shopping.cart.appTitle' => 'Ʃħθρρıŋɣ Ɔɑʀʈ',
			'shopping.cart.itemsHeader' => 'Ɔɑʀʈ Ɪʈɛɱʃ',
			'shopping.cart.itemCount' => '{count} ıʈɛɱʃ',
			'shopping.cart.questionTitle' => 'Ωħɑʈ ıʃ ʈħɛ ʈθʈɑʟ ρʀıɔɛ?',
			'shopping.cart.questionSubtitle' => 'Ɔɑʟɔʊʟɑʈɛ ʈħɛ ʈθʈɑʟ θƒ ıʈɛɱʃ ɑƀθʌɛ ɑŋɗ ʃɛʟɛɔʈ',
			'shopping.cart.hint' => 'Ɱʊʟʈıρʟʎ ɛɑɔħ ʊŋıʈ ρʀıɔɛ ƀʎ ϕʊɑŋʈıʈʎ ɑŋɗ ʃʊɱ ʈħɛɱ ʊρ',
			'shopping.checkout.missionText' => 'Complete the checkout process',
			'shopping.checkout.appTitle' => 'Ρɑʎɱɛŋʈ Ɔħɛɔƙθʊʈ',
			'shopping.checkout.step1' => 'Ɔɑʀʈ',
			'shopping.checkout.step2' => 'Ɑɗɗʀɛʃʃ & Ρɑʎɱɛŋʈ',
			'shopping.checkout.step3' => 'Ɔθŋƒıʀɱ',
			'shopping.checkout.addressSection' => 'Ɗɛʟıʌɛʀʎ Ɑɗɗʀɛʃʃ',
			'shopping.checkout.addressPlaceholder' => 'ɛ.ɣ. ①-① Ʃħıƀʊʎɑ, Ʈθƙʎθ...',
			'shopping.checkout.paymentSection' => 'Ρɑʎɱɛŋʈ Ɱɛʈħθɗ',
			'shopping.checkout.paymentCreditCard' => 'Ɔʀɛɗıʈ Ɔɑʀɗ',
			'shopping.checkout.paymentConvenience' => 'Ɔθŋʌɛŋıɛŋɔɛ Ʃʈθʀɛ',
			'shopping.checkout.paymentCOD' => 'Ɔɑʃħ θŋ Ɗɛʟıʌɛʀʎ',
			'shopping.checkout.summarySection' => 'Θʀɗɛʀ Ʃʊɱɱɑʀʎ',
			'shopping.checkout.subtotal' => 'Ɪʈɛɱ Ʃʊƀʈθʈɑʟ',
			'shopping.checkout.shipping' => 'Ʃħıρρıŋɣ ƒɛɛ',
			'shopping.checkout.total' => 'Θʀɗɛʀ Ʈθʈɑʟ',
			'shopping.checkout.confirmCheck' => 'Ɪ ħɑʌɛ ɔθŋƒıʀɱɛɗ ʈħɛ θʀɗɛʀ ɗɛʈɑıʟʃ',
			'shopping.checkout.confirmButton' => 'Ρʟɑɔɛ Θʀɗɛʀ',
			'shopping.common.addToCart' => 'Ɑɗɗ ʈθ Ɔɑʀʈ',
			'shopping.common.quantity' => 'Φʈʎ: {qty}',
			'shopping.common.primeBadge' => 'ρʀıɱɛ',
			'shopping.navigation.home' => 'Ħθɱɛ',
			'shopping.navigation.search' => 'Ʃɛɑʀɔħ',
			'shopping.navigation.account' => 'Ɑɔɔθʊŋʈ',
			'shopping.navigation.menu' => 'Ɱɛŋʊ',
			'shopping.categories.daily' => 'Ɗɑıʟʎ ɣθθɗʃ',
			'shopping.categories.food' => 'Ƒθθɗ & Ɗʀıŋƙʃ',
			'shopping.categories.electronics' => 'Ɛʟɛɔʈʀθŋıɔʃ',
			'shopping.categories.fashion' => 'Ƒɑʃħıθŋ',
			'shopping.categories.sports' => 'Ʃρθʀʈʃ',
			'shopping.categories.kitchen' => 'Ƙıʈɔħɛŋ',
			_ => null,
		};
	}
}
