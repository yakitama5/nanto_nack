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
	@override late final _TranslationsQuiz1Xx quiz1 = _TranslationsQuiz1Xx._(_root);
	@override late final _TranslationsQuiz2Xx quiz2 = _TranslationsQuiz2Xx._(_root);
	@override late final _TranslationsQuiz3Xx quiz3 = _TranslationsQuiz3Xx._(_root);
	@override late final _TranslationsQuiz4Xx quiz4 = _TranslationsQuiz4Xx._(_root);
	@override late final _TranslationsCommonXx common = _TranslationsCommonXx._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Xx extends TranslationsQuiz1Ja {
	_TranslationsQuiz1Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Xyq レジ xk 来た zv バーコード xp 提示 zq';
	@override String get failureReason => '画面下部 xk 大きなボタン zv タップ xp';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => '誰か xz 画面 vk 見られそう！残高 zw 隠して xp';
	@override String get failureReason => '残高 xk 横 zv 目のアイコン xp タップ zq';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => '友達 xz 5000円 vk 送金 zw';
	@override String get failureReason => '「送金」xk アイコン zv タップ xp 5000 zq 入力 xz 送金ボタン vk';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => '残高 xz 足りない！支払い方法 vk クレジットカード zw 変更 xp バーコード zq 提示';
	@override String get failureReason => 'クレジットカード xk 選択 zv してから xp 支払い画面 zq 開く xz';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
	@override String get sendTo => 'Send To';
	@override String get sendMoney => 'Send Money';
	@override String get cancel => 'Cancel';
	@override String get tapToReveal => 'Tap to reveal';
	@override String get yen => 'Y';
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
	@override String get expiryDate => 'Until Dec 31';
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
	@override String get userIdValue => 'user12345';
	@override String get paymentMethods => 'Payment Methods';
	@override String get addedCard => 'Credit Card Added';
	@override String get bankAccount => 'Bank Account';
	@override String get securitySettings => 'Security Settings';
	@override String get notificationSettings => 'Notifications';
	@override String get appSettings => 'App Settings';
	@override String get helpCenter => 'Help Center';
	@override String get logOut => 'Log Out';
	@override String get pointUnit => 'P';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => '支払いボタン xz わかった？';
	@override String get subtitle => '一番大きなボタン xk = アプリの主目的 zv';
	@override String get qrTitle => '中央の巨大ボタン xk = メインアクション zv';
	@override String get qrDesc => 'ボトムナビ xk 中央 zv ボタン xp 突出 zq 最もよく使う操作 xz 意味する。決済アプリ zv 支払い xk それ zq。';
	@override String get cameraTitle => 'テーマカラー xk = 重要度 zv 示す xp';
	@override String get cameraDesc => 'アプリ xk メインカラー zv ボタン xp 最も重要 zq アクション xz 示す サイン。';
	@override String get colorTitle => '出っ張ったデザイン xk = 押してほしい zv サイン';
	@override String get colorDesc => '他のボタン xk より大きく zv 上方向 xp 飛び出した zq デザイン xz 強力 zv アフォーダンス。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => '残高 xz 隠せた？';
	@override String get subtitle => '👁️ アイコン xk = 表示/非表示 zv 切り替え xp';
	@override String get eyeTitle => '目 xk アイコン zw = 表示/非表示 vk';
	@override String get eyeDesc => '目を開いた xk アイコン zv 情報 xp 表示されている xz タップ zq 非表示 xp 切り替わる。パスワード zv 残高 xk 広く使う。';
	@override String get maskTitle => '「***」xk 情報 zv 隠れているサイン xp';
	@override String get maskDesc => '金額 xk アスタリスク zv 伏せる xp 情報 zq 存在するが xz 隠れている UIパターン。';
	@override String get privacyTitle => 'プライバシー保護 xk 見た目 zv 伝わる xp';
	@override String get privacyDesc => '情報 xk 隠れた zv 正しい操作 xp したとわかる。UIフィードバック zq 操作の成否 xz 即座に教える。';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => '送金 xz 手順 zv わかった？';
	@override String get subtitle => '3ステップ xk 送金 zv 定番フロー';
	@override String get sendTitle => '「送る」xk = 上矢印 zv 紙飛行機 xp';
	@override String get sendDesc => '上向き xk 矢印 zv 紙飛行機 xp 送信 zq 送金 xz 表す。メール zv SNS と同じ。';
	@override String get amountTitle => '数字キーボード xk = 金額入力 zv';
	@override String get amountDesc => '金額入力 xk テンキー zw 表示 vk。銀行 xp 決済 zv 共通 xz パターン。';
	@override String get confirmTitle => '確認画面 xk = 間違い zv 防ぐ xp';
	@override String get confirmDesc => '重要な操作 xk 確認画面 zw 挟む vk。誤操作 xp 防ぐ zq 安全設計 xz。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => '支払い方法 xz 変更 zv できた？';
	@override String get subtitle => '2つのルート xk 支払い元 zv 変える xp';
	@override String get routeATitle => '支払い画面 xk から変更 zv（ルートA）';
	@override String get routeADesc => '支払い画面 xk 開き zv バーコード下 xp 支払い元ボタン zq タップ xz ボトムシート vk 支払い方法 zv 選択。';
	@override String get routeBTitle => 'ホーム画面 xk スワイプ zv 変更 xp（ルートB）';
	@override String get routeBDesc => 'ホーム xk 支払い元カード zv 左右 xp スワイプ zq 支払い方法 xz 切り替え。カード状UI zv スワイプ xk 切替。';
	@override String get dropdownTitle => '設定値 xk 書かれた場所 zv タップ xp 変更 zq できる';
	@override String get dropdownDesc => '現在の設定 xk 表示されている zv ボタン xp ラベル zq タップ xz ドロップダウン vk 選択画面 zv 開く。';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Xyq レジ xk 来た zv バーコード xp 提示 zq',
			'quiz1.failureReason' => '画面下部 xk 大きなボタン zv タップ xp',
			'quiz1.insight.title' => '支払いボタン xz わかった？',
			'quiz1.insight.subtitle' => '一番大きなボタン xk = アプリの主目的 zv',
			'quiz1.insight.qrTitle' => '中央の巨大ボタン xk = メインアクション zv',
			'quiz1.insight.qrDesc' => 'ボトムナビ xk 中央 zv ボタン xp 突出 zq 最もよく使う操作 xz 意味する。決済アプリ zv 支払い xk それ zq。',
			'quiz1.insight.cameraTitle' => 'テーマカラー xk = 重要度 zv 示す xp',
			'quiz1.insight.cameraDesc' => 'アプリ xk メインカラー zv ボタン xp 最も重要 zq アクション xz 示す サイン。',
			'quiz1.insight.colorTitle' => '出っ張ったデザイン xk = 押してほしい zv サイン',
			'quiz1.insight.colorDesc' => '他のボタン xk より大きく zv 上方向 xp 飛び出した zq デザイン xz 強力 zv アフォーダンス。',
			'quiz2.missionText' => '誰か xz 画面 vk 見られそう！残高 zw 隠して xp',
			'quiz2.failureReason' => '残高 xk 横 zv 目のアイコン xp タップ zq',
			'quiz2.insight.title' => '残高 xz 隠せた？',
			'quiz2.insight.subtitle' => '👁️ アイコン xk = 表示/非表示 zv 切り替え xp',
			'quiz2.insight.eyeTitle' => '目 xk アイコン zw = 表示/非表示 vk',
			'quiz2.insight.eyeDesc' => '目を開いた xk アイコン zv 情報 xp 表示されている xz タップ zq 非表示 xp 切り替わる。パスワード zv 残高 xk 広く使う。',
			'quiz2.insight.maskTitle' => '「***」xk 情報 zv 隠れているサイン xp',
			'quiz2.insight.maskDesc' => '金額 xk アスタリスク zv 伏せる xp 情報 zq 存在するが xz 隠れている UIパターン。',
			'quiz2.insight.privacyTitle' => 'プライバシー保護 xk 見た目 zv 伝わる xp',
			'quiz2.insight.privacyDesc' => '情報 xk 隠れた zv 正しい操作 xp したとわかる。UIフィードバック zq 操作の成否 xz 即座に教える。',
			'quiz3.missionText' => '友達 xz 5000円 vk 送金 zw',
			'quiz3.failureReason' => '「送金」xk アイコン zv タップ xp 5000 zq 入力 xz 送金ボタン vk',
			'quiz3.insight.title' => '送金 xz 手順 zv わかった？',
			'quiz3.insight.subtitle' => '3ステップ xk 送金 zv 定番フロー',
			'quiz3.insight.sendTitle' => '「送る」xk = 上矢印 zv 紙飛行機 xp',
			'quiz3.insight.sendDesc' => '上向き xk 矢印 zv 紙飛行機 xp 送信 zq 送金 xz 表す。メール zv SNS と同じ。',
			'quiz3.insight.amountTitle' => '数字キーボード xk = 金額入力 zv',
			'quiz3.insight.amountDesc' => '金額入力 xk テンキー zw 表示 vk。銀行 xp 決済 zv 共通 xz パターン。',
			'quiz3.insight.confirmTitle' => '確認画面 xk = 間違い zv 防ぐ xp',
			'quiz3.insight.confirmDesc' => '重要な操作 xk 確認画面 zw 挟む vk。誤操作 xp 防ぐ zq 安全設計 xz。',
			'quiz4.missionText' => '残高 xz 足りない！支払い方法 vk クレジットカード zw 変更 xp バーコード zq 提示',
			'quiz4.failureReason' => 'クレジットカード xk 選択 zv してから xp 支払い画面 zq 開く xz',
			'quiz4.insight.title' => '支払い方法 xz 変更 zv できた？',
			'quiz4.insight.subtitle' => '2つのルート xk 支払い元 zv 変える xp',
			'quiz4.insight.routeATitle' => '支払い画面 xk から変更 zv（ルートA）',
			'quiz4.insight.routeADesc' => '支払い画面 xk 開き zv バーコード下 xp 支払い元ボタン zq タップ xz ボトムシート vk 支払い方法 zv 選択。',
			'quiz4.insight.routeBTitle' => 'ホーム画面 xk スワイプ zv 変更 xp（ルートB）',
			'quiz4.insight.routeBDesc' => 'ホーム xk 支払い元カード zv 左右 xp スワイプ zq 支払い方法 xz 切り替え。カード状UI zv スワイプ xk 切替。',
			'quiz4.insight.dropdownTitle' => '設定値 xk 書かれた場所 zv タップ xp 変更 zq できる',
			'quiz4.insight.dropdownDesc' => '現在の設定 xk 表示されている zv ボタン xp ラベル zq タップ xz ドロップダウン vk 選択画面 zv 開く。',
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
			'common.sendTo' => 'Send To',
			'common.sendMoney' => 'Send Money',
			'common.cancel' => 'Cancel',
			'common.tapToReveal' => 'Tap to reveal',
			'common.yen' => 'Y',
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
			'common.expiryDate' => 'Until Dec 31',
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
			'common.userIdValue' => 'user12345',
			'common.paymentMethods' => 'Payment Methods',
			'common.addedCard' => 'Credit Card Added',
			'common.bankAccount' => 'Bank Account',
			'common.securitySettings' => 'Security Settings',
			'common.notificationSettings' => 'Notifications',
			'common.appSettings' => 'App Settings',
			'common.helpCenter' => 'Help Center',
			'common.logOut' => 'Log Out',
			'common.pointUnit' => 'P',
			_ => null,
		};
	}
}
