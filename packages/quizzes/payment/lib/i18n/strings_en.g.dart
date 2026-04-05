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
}

// Path: quiz1
class _TranslationsQuiz1En extends TranslationsQuiz1Ja {
	_TranslationsQuiz1En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Show the QR code';
	@override String get failureReason => 'Tap the \'QR Code\' button';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Check your balance';
	@override String get failureReason => 'Tap the blurred balance area to reveal it';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Send money to someone';
	@override String get failureReason => 'Select a recipient, enter amount, and tap Send';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Check your transaction history';
	@override String get failureReason => 'Tap the \'History\' tab or statement button';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Pay';
	@override String get balance => 'Balance';
	@override String get send => 'Send';
	@override String get receive => 'Receive';
	@override String get history => 'History';
	@override String get qrCode => 'QR Code';
	@override String get scanQr => 'Scan';
	@override String get point => 'Points';
	@override String get topUp => 'Top Up';
	@override String get amount => 'Amount';
	@override String get confirm => 'Confirm';
	@override String get sendMoney => 'Send Money';
	@override String get cancel => 'Cancel';
	@override String get tapToReveal => 'Tap to reveal';
	@override String get yen => '¥';
	@override String get contact1 => 'Taro Tanaka';
	@override String get contact2 => 'Hanako Yamada';
	@override String get contact3 => 'Jiro Suzuki';
	@override String get contact4 => 'Midori Sato';
	@override String get txTitle1 => 'Convenience Store';
	@override String get txTitle2 => 'Lunch';
	@override String get txTitle3 => 'From friend';
	@override String get txTitle4 => 'Books';
	@override String get txTitle5 => 'Train fare';
	@override String get txAmount1 => '-580';
	@override String get txAmount2 => '-1200';
	@override String get txAmount3 => '+3000';
	@override String get txAmount4 => '-2800';
	@override String get txAmount5 => '-240';
	@override String get txDate1 => 'Today';
	@override String get txDate2 => 'Yesterday';
	@override String get txDate3 => 'Yesterday';
	@override String get txDate4 => '3 days ago';
	@override String get txDate5 => '4 days ago';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the QR button?';
	@override String get subtitle => 'QR code = entry to scan-and-pay';
	@override String get qrTitle => 'QR code icon means \'payment\'';
	@override String get qrDesc => 'The mosaic-patterned QR code icon is used as the entry point for QR payments in cashless apps worldwide.';
	@override String get cameraTitle => 'Camera icon means \'scan\'';
	@override String get cameraDesc => 'The camera/scan icon is for reading someone else\'s QR code — opposite of showing your own for payment.';
	@override String get colorTitle => 'Highlighted color = main action';
	@override String get colorDesc => 'Buttons emphasized in the app\'s primary color indicate the most-used action — usually QR payment in payment apps.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you reveal the balance?';
	@override String get subtitle => 'Blur = hidden info waiting to be shown';
	@override String get blurTitle => 'Blur indicates hidden information';
	@override String get blurDesc => 'Balance amounts are intentionally blurred for privacy. The blur itself signals \'tap to reveal\' — a tappable UI element.';
	@override String get eyeTitle => 'Eye icon means show/hide';
	@override String get eyeDesc => 'A closed eye means info is hidden; an open eye means visible. Widely used for passwords and balance displays.';
	@override String get privacyTitle => 'Revealed info = correct action';
	@override String get privacyDesc => 'When information is shown correctly, it confirms you performed the right action. UI feedback guides correct usage.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you figure out how to send?';
	@override String get subtitle => '3 steps is the standard send flow';
	@override String get sendTitle => 'Send icon = upward arrow or paper plane';
	@override String get sendDesc => 'Upward arrows and paper plane icons are widely used to represent sending — familiar from email and messaging apps.';
	@override String get amountTitle => 'Number pad = amount input';
	@override String get amountDesc => 'A number keypad appears for entering amounts — common across banking and payment apps.';
	@override String get confirmTitle => 'Confirmation screen prevents mistakes';
	@override String get confirmDesc => 'Important actions like sending money include a confirmation step to prevent accidental transactions.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find transaction history?';
	@override String get subtitle => 'Clock + list = history UI symbols';
	@override String get historyTitle => 'Clock icon = history';
	@override String get historyDesc => 'Clock and list-style icons represent past records in banking and payment apps worldwide.';
	@override String get listTitle => 'List layout = information overview';
	@override String get listDesc => 'Vertical lists are the simplest and most intuitive UI for showing multiple items like transactions or messages.';
	@override String get tabTitle => 'Tabs = category switching';
	@override String get tabDesc => 'Tabs at the top or bottom of the screen switch between content categories — Home, Send, History, etc.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Show the QR code',
			'quiz1.failureReason' => 'Tap the \'QR Code\' button',
			'quiz1.insight.title' => 'How did you find the QR button?',
			'quiz1.insight.subtitle' => 'QR code = entry to scan-and-pay',
			'quiz1.insight.qrTitle' => 'QR code icon means \'payment\'',
			'quiz1.insight.qrDesc' => 'The mosaic-patterned QR code icon is used as the entry point for QR payments in cashless apps worldwide.',
			'quiz1.insight.cameraTitle' => 'Camera icon means \'scan\'',
			'quiz1.insight.cameraDesc' => 'The camera/scan icon is for reading someone else\'s QR code — opposite of showing your own for payment.',
			'quiz1.insight.colorTitle' => 'Highlighted color = main action',
			'quiz1.insight.colorDesc' => 'Buttons emphasized in the app\'s primary color indicate the most-used action — usually QR payment in payment apps.',
			'quiz2.missionText' => 'Check your balance',
			'quiz2.failureReason' => 'Tap the blurred balance area to reveal it',
			'quiz2.insight.title' => 'How did you reveal the balance?',
			'quiz2.insight.subtitle' => 'Blur = hidden info waiting to be shown',
			'quiz2.insight.blurTitle' => 'Blur indicates hidden information',
			'quiz2.insight.blurDesc' => 'Balance amounts are intentionally blurred for privacy. The blur itself signals \'tap to reveal\' — a tappable UI element.',
			'quiz2.insight.eyeTitle' => 'Eye icon means show/hide',
			'quiz2.insight.eyeDesc' => 'A closed eye means info is hidden; an open eye means visible. Widely used for passwords and balance displays.',
			'quiz2.insight.privacyTitle' => 'Revealed info = correct action',
			'quiz2.insight.privacyDesc' => 'When information is shown correctly, it confirms you performed the right action. UI feedback guides correct usage.',
			'quiz3.missionText' => 'Send money to someone',
			'quiz3.failureReason' => 'Select a recipient, enter amount, and tap Send',
			'quiz3.insight.title' => 'How did you figure out how to send?',
			'quiz3.insight.subtitle' => '3 steps is the standard send flow',
			'quiz3.insight.sendTitle' => 'Send icon = upward arrow or paper plane',
			'quiz3.insight.sendDesc' => 'Upward arrows and paper plane icons are widely used to represent sending — familiar from email and messaging apps.',
			'quiz3.insight.amountTitle' => 'Number pad = amount input',
			'quiz3.insight.amountDesc' => 'A number keypad appears for entering amounts — common across banking and payment apps.',
			'quiz3.insight.confirmTitle' => 'Confirmation screen prevents mistakes',
			'quiz3.insight.confirmDesc' => 'Important actions like sending money include a confirmation step to prevent accidental transactions.',
			'quiz4.missionText' => 'Check your transaction history',
			'quiz4.failureReason' => 'Tap the \'History\' tab or statement button',
			'quiz4.insight.title' => 'How did you find transaction history?',
			'quiz4.insight.subtitle' => 'Clock + list = history UI symbols',
			'quiz4.insight.historyTitle' => 'Clock icon = history',
			'quiz4.insight.historyDesc' => 'Clock and list-style icons represent past records in banking and payment apps worldwide.',
			'quiz4.insight.listTitle' => 'List layout = information overview',
			'quiz4.insight.listDesc' => 'Vertical lists are the simplest and most intuitive UI for showing multiple items like transactions or messages.',
			'quiz4.insight.tabTitle' => 'Tabs = category switching',
			'quiz4.insight.tabDesc' => 'Tabs at the top or bottom of the screen switch between content categories — Home, Send, History, etc.',
			'common.appTitle' => 'Pay',
			'common.balance' => 'Balance',
			'common.send' => 'Send',
			'common.receive' => 'Receive',
			'common.history' => 'History',
			'common.qrCode' => 'QR Code',
			'common.scanQr' => 'Scan',
			'common.point' => 'Points',
			'common.topUp' => 'Top Up',
			'common.amount' => 'Amount',
			'common.confirm' => 'Confirm',
			'common.sendMoney' => 'Send Money',
			'common.cancel' => 'Cancel',
			'common.tapToReveal' => 'Tap to reveal',
			'common.yen' => '¥',
			'common.contact1' => 'Taro Tanaka',
			'common.contact2' => 'Hanako Yamada',
			'common.contact3' => 'Jiro Suzuki',
			'common.contact4' => 'Midori Sato',
			'common.txTitle1' => 'Convenience Store',
			'common.txTitle2' => 'Lunch',
			'common.txTitle3' => 'From friend',
			'common.txTitle4' => 'Books',
			'common.txTitle5' => 'Train fare',
			'common.txAmount1' => '-580',
			'common.txAmount2' => '-1200',
			'common.txAmount3' => '+3000',
			'common.txAmount4' => '-2800',
			'common.txAmount5' => '-240',
			'common.txDate1' => 'Today',
			'common.txDate2' => 'Yesterday',
			'common.txDate3' => 'Yesterday',
			'common.txDate4' => '3 days ago',
			'common.txDate5' => '4 days ago',
			_ => null,
		};
	}
}
