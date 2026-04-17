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
	@override String get missionText => 'You\'re at the register. Please show your barcode';
	@override String get failureReason => 'Tap the large button at the bottom of the screen';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Someone might see your screen! Hide your balance';
	@override String get failureReason => 'Tap the \'eye icon\' next to your balance';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Send 5,000 yen to a friend';
	@override String get failureReason => 'Tap the \'Send\' icon, enter 5000, and press the send button';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Not enough balance! Change payment method to \'Credit Card\' and show the barcode';
	@override String get failureReason => 'Select credit card first, then open the payment screen';
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
	@override String get sendTo => 'Send to';
	@override String get sendMoney => 'Send Money';
	@override String get cancel => 'Cancel';
	@override String get tapToReveal => 'Tap to reveal';
	@override String get yen => '¥';
	@override String get payment => 'Pay';
	@override String get creditCard => 'Credit Card';
	@override String get paymentSource => 'Payment Source';
	@override String get balancePayment => 'Balance';
	@override String get scan => 'Scan';
	@override String get more => 'More';
	@override String get home => 'Home';
	@override String get account => 'Account';
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
	@override String get txFilterAll => 'All';
	@override String get txFilterOut => 'Pay';
	@override String get txFilterIn => 'Receive';
	@override String get txMonthLabel => 'This Month';
	@override String get txMonthTotal => 'Monthly Total';
	@override String get pointBalance => 'Point Balance';
	@override String get pointExpiry => 'Expires';
	@override String get expiryDate => 'Until Dec 31, 2026';
	@override String get earnPoints => 'Earn Points';
	@override String get shopService => 'Shopping';
	@override String get missionService => 'Mission';
	@override String get campaignService => 'Campaign';
	@override String get pointHistory => 'Point History';
	@override String get pointItem1 => 'Shopping';
	@override String get pointItem2 => 'Daily Bonus';
	@override String get pointItem3 => 'Friend Invite';
	@override String get pointGained1 => '+50';
	@override String get pointGained2 => '+10';
	@override String get pointGained3 => '+200';
	@override String get pointDate1 => 'Today';
	@override String get pointDate2 => 'Yesterday';
	@override String get pointDate3 => '3 days ago';
	@override String get myAccount => 'My Account';
	@override String get userId => 'User ID';
	@override String get userIdValue => 'user_12345';
	@override String get paymentMethods => 'Payment Methods';
	@override String get addedCard => 'Credit Card Added';
	@override String get bankAccount => 'Bank Account';
	@override String get securitySettings => 'Security Settings';
	@override String get notificationSettings => 'Notifications';
	@override String get appSettings => 'App Settings';
	@override String get helpCenter => 'Help Center';
	@override String get logOut => 'Log Out';
	@override String get pointUnit => 'P';
	@override String get mockPointsBalance => '1,250';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the payment button?';
	@override String get subtitle => 'The biggest button = the app\'s main purpose';
	@override String get qrTitle => 'The center large button is the \'main action\'';
	@override String get qrDesc => 'A protruding button in the center of the bottom navigation indicates the most-used action in that app. In payment apps, that\'s \'Pay\'.';
	@override String get cameraTitle => 'The app\'s theme color shows \'importance\'';
	@override String get cameraDesc => 'Buttons highlighted in the app\'s main color (red, blue, etc.) are used as a sign of the most important action.';
	@override String get colorTitle => 'Protruding design = \'please press me\' signal';
	@override String get colorDesc => 'A design that is larger than other buttons and pops upward has a strong affordance saying \'use this button\'.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you hide your balance?';
	@override String get subtitle => '👁️ icon = show/hide toggle';
	@override String get eyeTitle => 'Eye icon means show/hide';
	@override String get eyeDesc => 'An open eye icon means \'information is visible\' and tapping it switches to hidden. A widely used UI pattern for password fields and balance displays.';
	@override String get maskTitle => '\'***\' is a sign that info is hidden';
	@override String get maskDesc => 'Displaying sensitive information like amounts with asterisks (***) is a UI pattern indicating \'the information exists but is hidden\'.';
	@override String get privacyTitle => 'Privacy protection is conveyed visually';
	@override String get privacyDesc => 'When information is hidden, you know you performed the correct action. UI feedback immediately tells you whether the operation succeeded.';
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
	@override String get title => 'How did you change the payment method?';
	@override String get subtitle => 'Two routes to change payment source';
	@override String get routeATitle => 'Change from payment screen (Route A)';
	@override String get routeADesc => 'Open the payment screen and tap the \'payment source button\' below the barcode to open a bottom sheet and select a payment method. The mental model: \'current setting = tap to change\'.';
	@override String get routeBTitle => 'Swipe on home screen to change (Route B)';
	@override String get routeBDesc => 'Swipe left or right on the \'payment source card\' on the home screen to switch payment methods. Understanding modern gesture UI: \'card UI = swipe to switch\'.';
	@override String get dropdownTitle => 'A place showing a setting value can be tapped to change it';
	@override String get dropdownDesc => 'Buttons or labels showing the current setting open a dropdown or selection screen when tapped. Widely used in banking and shopping apps.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'You\'re at the register. Please show your barcode',
			'quiz1.failureReason' => 'Tap the large button at the bottom of the screen',
			'quiz1.insight.title' => 'How did you find the payment button?',
			'quiz1.insight.subtitle' => 'The biggest button = the app\'s main purpose',
			'quiz1.insight.qrTitle' => 'The center large button is the \'main action\'',
			'quiz1.insight.qrDesc' => 'A protruding button in the center of the bottom navigation indicates the most-used action in that app. In payment apps, that\'s \'Pay\'.',
			'quiz1.insight.cameraTitle' => 'The app\'s theme color shows \'importance\'',
			'quiz1.insight.cameraDesc' => 'Buttons highlighted in the app\'s main color (red, blue, etc.) are used as a sign of the most important action.',
			'quiz1.insight.colorTitle' => 'Protruding design = \'please press me\' signal',
			'quiz1.insight.colorDesc' => 'A design that is larger than other buttons and pops upward has a strong affordance saying \'use this button\'.',
			'quiz2.missionText' => 'Someone might see your screen! Hide your balance',
			'quiz2.failureReason' => 'Tap the \'eye icon\' next to your balance',
			'quiz2.insight.title' => 'How did you hide your balance?',
			'quiz2.insight.subtitle' => '👁️ icon = show/hide toggle',
			'quiz2.insight.eyeTitle' => 'Eye icon means show/hide',
			'quiz2.insight.eyeDesc' => 'An open eye icon means \'information is visible\' and tapping it switches to hidden. A widely used UI pattern for password fields and balance displays.',
			'quiz2.insight.maskTitle' => '\'***\' is a sign that info is hidden',
			'quiz2.insight.maskDesc' => 'Displaying sensitive information like amounts with asterisks (***) is a UI pattern indicating \'the information exists but is hidden\'.',
			'quiz2.insight.privacyTitle' => 'Privacy protection is conveyed visually',
			'quiz2.insight.privacyDesc' => 'When information is hidden, you know you performed the correct action. UI feedback immediately tells you whether the operation succeeded.',
			'quiz3.missionText' => 'Send 5,000 yen to a friend',
			'quiz3.failureReason' => 'Tap the \'Send\' icon, enter 5000, and press the send button',
			'quiz3.insight.title' => 'How did you figure out how to send?',
			'quiz3.insight.subtitle' => '3 steps is the standard send flow',
			'quiz3.insight.sendTitle' => 'Send icon = upward arrow or paper plane',
			'quiz3.insight.sendDesc' => 'Upward arrows and paper plane icons are widely used to represent sending — familiar from email and messaging apps.',
			'quiz3.insight.amountTitle' => 'Number pad = amount input',
			'quiz3.insight.amountDesc' => 'A number keypad appears for entering amounts — common across banking and payment apps.',
			'quiz3.insight.confirmTitle' => 'Confirmation screen prevents mistakes',
			'quiz3.insight.confirmDesc' => 'Important actions like sending money include a confirmation step to prevent accidental transactions.',
			'quiz4.missionText' => 'Not enough balance! Change payment method to \'Credit Card\' and show the barcode',
			'quiz4.failureReason' => 'Select credit card first, then open the payment screen',
			'quiz4.insight.title' => 'How did you change the payment method?',
			'quiz4.insight.subtitle' => 'Two routes to change payment source',
			'quiz4.insight.routeATitle' => 'Change from payment screen (Route A)',
			'quiz4.insight.routeADesc' => 'Open the payment screen and tap the \'payment source button\' below the barcode to open a bottom sheet and select a payment method. The mental model: \'current setting = tap to change\'.',
			'quiz4.insight.routeBTitle' => 'Swipe on home screen to change (Route B)',
			'quiz4.insight.routeBDesc' => 'Swipe left or right on the \'payment source card\' on the home screen to switch payment methods. Understanding modern gesture UI: \'card UI = swipe to switch\'.',
			'quiz4.insight.dropdownTitle' => 'A place showing a setting value can be tapped to change it',
			'quiz4.insight.dropdownDesc' => 'Buttons or labels showing the current setting open a dropdown or selection screen when tapped. Widely used in banking and shopping apps.',
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
			'common.sendTo' => 'Send to',
			'common.sendMoney' => 'Send Money',
			'common.cancel' => 'Cancel',
			'common.tapToReveal' => 'Tap to reveal',
			'common.yen' => '¥',
			'common.payment' => 'Pay',
			'common.creditCard' => 'Credit Card',
			'common.paymentSource' => 'Payment Source',
			'common.balancePayment' => 'Balance',
			'common.scan' => 'Scan',
			'common.more' => 'More',
			'common.home' => 'Home',
			'common.account' => 'Account',
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
			'common.txFilterAll' => 'All',
			'common.txFilterOut' => 'Pay',
			'common.txFilterIn' => 'Receive',
			'common.txMonthLabel' => 'This Month',
			'common.txMonthTotal' => 'Monthly Total',
			'common.pointBalance' => 'Point Balance',
			'common.pointExpiry' => 'Expires',
			'common.expiryDate' => 'Until Dec 31, 2026',
			'common.earnPoints' => 'Earn Points',
			'common.shopService' => 'Shopping',
			'common.missionService' => 'Mission',
			'common.campaignService' => 'Campaign',
			'common.pointHistory' => 'Point History',
			'common.pointItem1' => 'Shopping',
			'common.pointItem2' => 'Daily Bonus',
			'common.pointItem3' => 'Friend Invite',
			'common.pointGained1' => '+50',
			'common.pointGained2' => '+10',
			'common.pointGained3' => '+200',
			'common.pointDate1' => 'Today',
			'common.pointDate2' => 'Yesterday',
			'common.pointDate3' => '3 days ago',
			'common.myAccount' => 'My Account',
			'common.userId' => 'User ID',
			'common.userIdValue' => 'user_12345',
			'common.paymentMethods' => 'Payment Methods',
			'common.addedCard' => 'Credit Card Added',
			'common.bankAccount' => 'Bank Account',
			'common.securitySettings' => 'Security Settings',
			'common.notificationSettings' => 'Notifications',
			'common.appSettings' => 'App Settings',
			'common.helpCenter' => 'Help Center',
			'common.logOut' => 'Log Out',
			'common.pointUnit' => 'P',
			'common.mockPointsBalance' => '1,250',
			_ => null,
		};
	}
}
