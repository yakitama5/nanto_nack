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
}

// Path: quiz1
class TranslationsQuiz1En {
	TranslationsQuiz1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Show the QR code'
	String get missionText => 'Show the QR code';

	/// en: 'Tap the 'QR Code' button'
	String get failureReason => 'Tap the \'QR Code\' button';

	late final TranslationsQuiz1InsightEn insight = TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class TranslationsQuiz2En {
	TranslationsQuiz2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Check your balance'
	String get missionText => 'Check your balance';

	/// en: 'Tap the blurred balance area to reveal it'
	String get failureReason => 'Tap the blurred balance area to reveal it';

	late final TranslationsQuiz2InsightEn insight = TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class TranslationsQuiz3En {
	TranslationsQuiz3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Send money to someone'
	String get missionText => 'Send money to someone';

	/// en: 'Select a recipient, enter amount, and tap Send'
	String get failureReason => 'Select a recipient, enter amount, and tap Send';

	late final TranslationsQuiz3InsightEn insight = TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class TranslationsQuiz4En {
	TranslationsQuiz4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Check your transaction history'
	String get missionText => 'Check your transaction history';

	/// en: 'Tap the 'History' tab or statement button'
	String get failureReason => 'Tap the \'History\' tab or statement button';

	late final TranslationsQuiz4InsightEn insight = TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Pay'
	String get appTitle => 'Pay';

	/// en: 'Balance'
	String get balance => 'Balance';

	/// en: 'Send'
	String get send => 'Send';

	/// en: 'Receive'
	String get receive => 'Receive';

	/// en: 'History'
	String get history => 'History';

	/// en: 'QR Code'
	String get qrCode => 'QR Code';

	/// en: 'Scan'
	String get scanQr => 'Scan';

	/// en: 'Points'
	String get point => 'Points';

	/// en: 'Top Up'
	String get topUp => 'Top Up';

	/// en: 'Amount'
	String get amount => 'Amount';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Send Money'
	String get sendMoney => 'Send Money';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Tap to reveal'
	String get tapToReveal => 'Tap to reveal';

	/// en: '¥'
	String get yen => '¥';

	/// en: 'Taro Tanaka'
	String get contact1 => 'Taro Tanaka';

	/// en: 'Hanako Yamada'
	String get contact2 => 'Hanako Yamada';

	/// en: 'Jiro Suzuki'
	String get contact3 => 'Jiro Suzuki';

	/// en: 'Midori Sato'
	String get contact4 => 'Midori Sato';

	/// en: 'Convenience Store'
	String get txTitle1 => 'Convenience Store';

	/// en: 'Lunch'
	String get txTitle2 => 'Lunch';

	/// en: 'From friend'
	String get txTitle3 => 'From friend';

	/// en: 'Books'
	String get txTitle4 => 'Books';

	/// en: 'Train fare'
	String get txTitle5 => 'Train fare';

	/// en: '-580'
	String get txAmount1 => '-580';

	/// en: '-1200'
	String get txAmount2 => '-1200';

	/// en: '+3000'
	String get txAmount3 => '+3000';

	/// en: '-2800'
	String get txAmount4 => '-2800';

	/// en: '-240'
	String get txAmount5 => '-240';

	/// en: 'Today'
	String get txDate1 => 'Today';

	/// en: 'Yesterday'
	String get txDate2 => 'Yesterday';

	/// en: 'Yesterday'
	String get txDate3 => 'Yesterday';

	/// en: '3 days ago'
	String get txDate4 => '3 days ago';

	/// en: '4 days ago'
	String get txDate5 => '4 days ago';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightEn {
	TranslationsQuiz1InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the QR button?'
	String get title => 'How did you find the QR button?';

	/// en: 'QR code = entry to scan-and-pay'
	String get subtitle => 'QR code = entry to scan-and-pay';

	/// en: 'QR code icon means 'payment''
	String get qrTitle => 'QR code icon means \'payment\'';

	/// en: 'The mosaic-patterned QR code icon is used as the entry point for QR payments in cashless apps worldwide.'
	String get qrDesc => 'The mosaic-patterned QR code icon is used as the entry point for QR payments in cashless apps worldwide.';

	/// en: 'Camera icon means 'scan''
	String get cameraTitle => 'Camera icon means \'scan\'';

	/// en: 'The camera/scan icon is for reading someone else's QR code — opposite of showing your own for payment.'
	String get cameraDesc => 'The camera/scan icon is for reading someone else\'s QR code — opposite of showing your own for payment.';

	/// en: 'Highlighted color = main action'
	String get colorTitle => 'Highlighted color = main action';

	/// en: 'Buttons emphasized in the app's primary color indicate the most-used action — usually QR payment in payment apps.'
	String get colorDesc => 'Buttons emphasized in the app\'s primary color indicate the most-used action — usually QR payment in payment apps.';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightEn {
	TranslationsQuiz2InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you reveal the balance?'
	String get title => 'How did you reveal the balance?';

	/// en: 'Blur = hidden info waiting to be shown'
	String get subtitle => 'Blur = hidden info waiting to be shown';

	/// en: 'Blur indicates hidden information'
	String get blurTitle => 'Blur indicates hidden information';

	/// en: 'Balance amounts are intentionally blurred for privacy. The blur itself signals 'tap to reveal' — a tappable UI element.'
	String get blurDesc => 'Balance amounts are intentionally blurred for privacy. The blur itself signals \'tap to reveal\' — a tappable UI element.';

	/// en: 'Eye icon means show/hide'
	String get eyeTitle => 'Eye icon means show/hide';

	/// en: 'A closed eye means info is hidden; an open eye means visible. Widely used for passwords and balance displays.'
	String get eyeDesc => 'A closed eye means info is hidden; an open eye means visible. Widely used for passwords and balance displays.';

	/// en: 'Revealed info = correct action'
	String get privacyTitle => 'Revealed info = correct action';

	/// en: 'When information is shown correctly, it confirms you performed the right action. UI feedback guides correct usage.'
	String get privacyDesc => 'When information is shown correctly, it confirms you performed the right action. UI feedback guides correct usage.';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightEn {
	TranslationsQuiz3InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you figure out how to send?'
	String get title => 'How did you figure out how to send?';

	/// en: '3 steps is the standard send flow'
	String get subtitle => '3 steps is the standard send flow';

	/// en: 'Send icon = upward arrow or paper plane'
	String get sendTitle => 'Send icon = upward arrow or paper plane';

	/// en: 'Upward arrows and paper plane icons are widely used to represent sending — familiar from email and messaging apps.'
	String get sendDesc => 'Upward arrows and paper plane icons are widely used to represent sending — familiar from email and messaging apps.';

	/// en: 'Number pad = amount input'
	String get amountTitle => 'Number pad = amount input';

	/// en: 'A number keypad appears for entering amounts — common across banking and payment apps.'
	String get amountDesc => 'A number keypad appears for entering amounts — common across banking and payment apps.';

	/// en: 'Confirmation screen prevents mistakes'
	String get confirmTitle => 'Confirmation screen prevents mistakes';

	/// en: 'Important actions like sending money include a confirmation step to prevent accidental transactions.'
	String get confirmDesc => 'Important actions like sending money include a confirmation step to prevent accidental transactions.';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightEn {
	TranslationsQuiz4InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find transaction history?'
	String get title => 'How did you find transaction history?';

	/// en: 'Clock + list = history UI symbols'
	String get subtitle => 'Clock + list = history UI symbols';

	/// en: 'Clock icon = history'
	String get historyTitle => 'Clock icon = history';

	/// en: 'Clock and list-style icons represent past records in banking and payment apps worldwide.'
	String get historyDesc => 'Clock and list-style icons represent past records in banking and payment apps worldwide.';

	/// en: 'List layout = information overview'
	String get listTitle => 'List layout = information overview';

	/// en: 'Vertical lists are the simplest and most intuitive UI for showing multiple items like transactions or messages.'
	String get listDesc => 'Vertical lists are the simplest and most intuitive UI for showing multiple items like transactions or messages.';

	/// en: 'Tabs = category switching'
	String get tabTitle => 'Tabs = category switching';

	/// en: 'Tabs at the top or bottom of the screen switch between content categories — Home, Send, History, etc.'
	String get tabDesc => 'Tabs at the top or bottom of the screen switch between content categories — Home, Send, History, etc.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
