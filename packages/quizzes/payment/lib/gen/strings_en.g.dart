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

	/// en: 'You're at the register. Please show your barcode'
	String get missionText => 'You\'re at the register. Please show your barcode';

	/// en: 'Tap the large button at the bottom of the screen'
	String get failureReason => 'Tap the large button at the bottom of the screen';

	late final TranslationsQuiz1InsightEn insight = TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class TranslationsQuiz2En {
	TranslationsQuiz2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Someone might see your screen! Hide your balance'
	String get missionText => 'Someone might see your screen! Hide your balance';

	/// en: 'Tap the 'eye icon' next to your balance'
	String get failureReason => 'Tap the \'eye icon\' next to your balance';

	late final TranslationsQuiz2InsightEn insight = TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class TranslationsQuiz3En {
	TranslationsQuiz3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Send 5,000 yen to a friend'
	String get missionText => 'Send 5,000 yen to a friend';

	/// en: 'Tap the 'Send' icon, enter 5000, and press the send button'
	String get failureReason => 'Tap the \'Send\' icon, enter 5000, and press the send button';

	late final TranslationsQuiz3InsightEn insight = TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class TranslationsQuiz4En {
	TranslationsQuiz4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Not enough balance! Change payment method to 'Credit Card' and show the barcode'
	String get missionText => 'Not enough balance! Change payment method to \'Credit Card\' and show the barcode';

	/// en: 'Select credit card first, then open the payment screen'
	String get failureReason => 'Select credit card first, then open the payment screen';

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

	/// en: 'Send to'
	String get sendTo => 'Send to';

	/// en: 'Send Money'
	String get sendMoney => 'Send Money';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Tap to reveal'
	String get tapToReveal => 'Tap to reveal';

	/// en: '¥'
	String get yen => '¥';

	/// en: 'Pay'
	String get payment => 'Pay';

	/// en: 'Credit Card'
	String get creditCard => 'Credit Card';

	/// en: 'Payment Source'
	String get paymentSource => 'Payment Source';

	/// en: 'Balance'
	String get balancePayment => 'Balance';

	/// en: 'Scan'
	String get scan => 'Scan';

	/// en: 'More'
	String get more => 'More';

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Account'
	String get account => 'Account';

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

	/// en: 'All'
	String get txFilterAll => 'All';

	/// en: 'Pay'
	String get txFilterOut => 'Pay';

	/// en: 'Receive'
	String get txFilterIn => 'Receive';

	/// en: 'This Month'
	String get txMonthLabel => 'This Month';

	/// en: 'Monthly Total'
	String get txMonthTotal => 'Monthly Total';

	/// en: 'Point Balance'
	String get pointBalance => 'Point Balance';

	/// en: 'Expires'
	String get pointExpiry => 'Expires';

	/// en: 'Until Dec 31, 2026'
	String get expiryDate => 'Until Dec 31, 2026';

	/// en: 'Earn Points'
	String get earnPoints => 'Earn Points';

	/// en: 'Shopping'
	String get shopService => 'Shopping';

	/// en: 'Mission'
	String get missionService => 'Mission';

	/// en: 'Campaign'
	String get campaignService => 'Campaign';

	/// en: 'Point History'
	String get pointHistory => 'Point History';

	/// en: 'Shopping'
	String get pointItem1 => 'Shopping';

	/// en: 'Daily Bonus'
	String get pointItem2 => 'Daily Bonus';

	/// en: 'Friend Invite'
	String get pointItem3 => 'Friend Invite';

	/// en: '+50'
	String get pointGained1 => '+50';

	/// en: '+10'
	String get pointGained2 => '+10';

	/// en: '+200'
	String get pointGained3 => '+200';

	/// en: 'Today'
	String get pointDate1 => 'Today';

	/// en: 'Yesterday'
	String get pointDate2 => 'Yesterday';

	/// en: '3 days ago'
	String get pointDate3 => '3 days ago';

	/// en: 'My Account'
	String get myAccount => 'My Account';

	/// en: 'User ID'
	String get userId => 'User ID';

	/// en: 'user_12345'
	String get userIdValue => 'user_12345';

	/// en: 'Payment Methods'
	String get paymentMethods => 'Payment Methods';

	/// en: 'Credit Card Added'
	String get addedCard => 'Credit Card Added';

	/// en: 'Bank Account'
	String get bankAccount => 'Bank Account';

	/// en: 'Security Settings'
	String get securitySettings => 'Security Settings';

	/// en: 'Notifications'
	String get notificationSettings => 'Notifications';

	/// en: 'App Settings'
	String get appSettings => 'App Settings';

	/// en: 'Help Center'
	String get helpCenter => 'Help Center';

	/// en: 'Log Out'
	String get logOut => 'Log Out';

	/// en: 'P'
	String get pointUnit => 'P';

	/// en: '1,250'
	String get mockPointsBalance => '1,250';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightEn {
	TranslationsQuiz1InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the payment button?'
	String get title => 'How did you find the payment button?';

	/// en: 'The biggest button = the app's main purpose'
	String get subtitle => 'The biggest button = the app\'s main purpose';

	/// en: 'The center large button is the 'main action''
	String get qrTitle => 'The center large button is the \'main action\'';

	/// en: 'A protruding button in the center of the bottom navigation indicates the most-used action in that app. In payment apps, that's 'Pay'.'
	String get qrDesc => 'A protruding button in the center of the bottom navigation indicates the most-used action in that app. In payment apps, that\'s \'Pay\'.';

	/// en: 'The app's theme color shows 'importance''
	String get cameraTitle => 'The app\'s theme color shows \'importance\'';

	/// en: 'Buttons highlighted in the app's main color (red, blue, etc.) are used as a sign of the most important action.'
	String get cameraDesc => 'Buttons highlighted in the app\'s main color (red, blue, etc.) are used as a sign of the most important action.';

	/// en: 'Protruding design = 'please press me' signal'
	String get colorTitle => 'Protruding design = \'please press me\' signal';

	/// en: 'A design that is larger than other buttons and pops upward has a strong affordance saying 'use this button'.'
	String get colorDesc => 'A design that is larger than other buttons and pops upward has a strong affordance saying \'use this button\'.';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightEn {
	TranslationsQuiz2InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you hide your balance?'
	String get title => 'How did you hide your balance?';

	/// en: '👁️ icon = show/hide toggle'
	String get subtitle => '👁️ icon = show/hide toggle';

	/// en: 'Eye icon means show/hide'
	String get eyeTitle => 'Eye icon means show/hide';

	/// en: 'An open eye icon means 'information is visible' and tapping it switches to hidden. A widely used UI pattern for password fields and balance displays.'
	String get eyeDesc => 'An open eye icon means \'information is visible\' and tapping it switches to hidden. A widely used UI pattern for password fields and balance displays.';

	/// en: ''***' is a sign that info is hidden'
	String get maskTitle => '\'***\' is a sign that info is hidden';

	/// en: 'Displaying sensitive information like amounts with asterisks (***) is a UI pattern indicating 'the information exists but is hidden'.'
	String get maskDesc => 'Displaying sensitive information like amounts with asterisks (***) is a UI pattern indicating \'the information exists but is hidden\'.';

	/// en: 'Privacy protection is conveyed visually'
	String get privacyTitle => 'Privacy protection is conveyed visually';

	/// en: 'When information is hidden, you know you performed the correct action. UI feedback immediately tells you whether the operation succeeded.'
	String get privacyDesc => 'When information is hidden, you know you performed the correct action. UI feedback immediately tells you whether the operation succeeded.';
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

	/// en: 'How did you change the payment method?'
	String get title => 'How did you change the payment method?';

	/// en: 'Two routes to change payment source'
	String get subtitle => 'Two routes to change payment source';

	/// en: 'Change from payment screen (Route A)'
	String get routeATitle => 'Change from payment screen (Route A)';

	/// en: 'Open the payment screen and tap the 'payment source button' below the barcode to open a bottom sheet and select a payment method. The mental model: 'current setting = tap to change'.'
	String get routeADesc => 'Open the payment screen and tap the \'payment source button\' below the barcode to open a bottom sheet and select a payment method. The mental model: \'current setting = tap to change\'.';

	/// en: 'Swipe on home screen to change (Route B)'
	String get routeBTitle => 'Swipe on home screen to change (Route B)';

	/// en: 'Swipe left or right on the 'payment source card' on the home screen to switch payment methods. Understanding modern gesture UI: 'card UI = swipe to switch'.'
	String get routeBDesc => 'Swipe left or right on the \'payment source card\' on the home screen to switch payment methods. Understanding modern gesture UI: \'card UI = swipe to switch\'.';

	/// en: 'A place showing a setting value can be tapped to change it'
	String get dropdownTitle => 'A place showing a setting value can be tapped to change it';

	/// en: 'Buttons or labels showing the current setting open a dropdown or selection screen when tapped. Widely used in banking and shopping apps.'
	String get dropdownDesc => 'Buttons or labels showing the current setting open a dropdown or selection screen when tapped. Widely used in banking and shopping apps.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
