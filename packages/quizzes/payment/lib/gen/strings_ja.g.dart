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
class TranslationsJa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsQuiz1Ja quiz1 = _TranslationsQuiz1Ja._(_root);
	@override late final _TranslationsQuiz2Ja quiz2 = _TranslationsQuiz2Ja._(_root);
	@override late final _TranslationsQuiz3Ja quiz3 = _TranslationsQuiz3Ja._(_root);
	@override late final _TranslationsQuiz4Ja quiz4 = _TranslationsQuiz4Ja._(_root);
	@override late final _TranslationsCommonJa common = _TranslationsCommonJa._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Ja implements TranslationsQuiz1En {
	_TranslationsQuiz1Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'レジに来ました。バーコードを提示してください';
	@override String get failureReason => '画面下部の一番大きなボタンをタップしてください';
	@override late final _TranslationsQuiz1InsightJa insight = _TranslationsQuiz1InsightJa._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Ja implements TranslationsQuiz2En {
	_TranslationsQuiz2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '誰かに画面を見られそう！残高を隠してください';
	@override String get failureReason => '残高の横にある「目のアイコン」をタップしてください';
	@override late final _TranslationsQuiz2InsightJa insight = _TranslationsQuiz2InsightJa._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Ja implements TranslationsQuiz3En {
	_TranslationsQuiz3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '友達に5,000円を送金してください';
	@override String get failureReason => '「送金」アイコンをタップして、5000と入力し、送金ボタンを押してください';
	@override late final _TranslationsQuiz3InsightJa insight = _TranslationsQuiz3InsightJa._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Ja implements TranslationsQuiz4En {
	_TranslationsQuiz4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '残高が足りません！支払い方法を「クレジットカード」に変更してバーコードを提示してください';
	@override String get failureReason => 'クレジットカードを選択してから支払い画面を開いてください';
	@override late final _TranslationsQuiz4InsightJa insight = _TranslationsQuiz4InsightJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Pay';
	@override String get balance => '残高';
	@override String get send => '送金';
	@override String get receive => '受け取る';
	@override String get history => '履歴';
	@override String get qrCode => 'QRコード';
	@override String get scanQr => 'スキャン';
	@override String get point => 'ポイント';
	@override String get topUp => 'チャージ';
	@override String get amount => '金額';
	@override String get confirm => '確認';
	@override String get sendTo => '送金先';
	@override String get sendMoney => '送金する';
	@override String get cancel => 'キャンセル';
	@override String get tapToReveal => 'タップして確認';
	@override String get yen => '円';
	@override String get payment => '支払い';
	@override String get creditCard => 'クレジットカード';
	@override String get paymentSource => '支払い元';
	@override String get balancePayment => '残高払い';
	@override String get scan => 'スキャン';
	@override String get more => 'その他';
	@override String get home => 'ホーム';
	@override String get account => 'アカウント';
	@override String get contact1 => '田中 太郎';
	@override String get contact2 => '山田 花子';
	@override String get contact3 => '鈴木 次郎';
	@override String get contact4 => '佐藤 みどり';
	@override String get txTitle1 => 'コンビニ決済';
	@override String get txTitle2 => 'ランチ代';
	@override String get txTitle3 => 'お友達から';
	@override String get txTitle4 => '書籍購入';
	@override String get txTitle5 => '電車代';
	@override String get txAmount1 => '-580';
	@override String get txAmount2 => '-1200';
	@override String get txAmount3 => '+3000';
	@override String get txAmount4 => '-2800';
	@override String get txAmount5 => '-240';
	@override String get txDate1 => '今日';
	@override String get txDate2 => '昨日';
	@override String get txDate3 => '昨日';
	@override String get txDate4 => '3日前';
	@override String get txDate5 => '4日前';
	@override String get txFilterAll => 'すべて';
	@override String get txFilterOut => '支払い';
	@override String get txFilterIn => '受け取り';
	@override String get txMonthLabel => '今月';
	@override String get txMonthTotal => '今月の合計';
	@override String get pointBalance => 'ポイント残高';
	@override String get pointExpiry => '有効期限';
	@override String get expiryDate => '2026年12月31日まで';
	@override String get earnPoints => 'ポイントを貯める';
	@override String get shopService => 'ショッピング';
	@override String get missionService => 'ミッション';
	@override String get campaignService => 'キャンペーン';
	@override String get pointHistory => 'ポイント履歴';
	@override String get pointItem1 => 'お買い物';
	@override String get pointItem2 => 'デイリーボーナス';
	@override String get pointItem3 => '友達招待';
	@override String get pointGained1 => '+50';
	@override String get pointGained2 => '+10';
	@override String get pointGained3 => '+200';
	@override String get pointDate1 => '今日';
	@override String get pointDate2 => '昨日';
	@override String get pointDate3 => '3日前';
	@override String get myAccount => 'マイアカウント';
	@override String get userId => 'ユーザーID';
	@override String get userIdValue => 'user_12345';
	@override String get paymentMethods => '支払い方法';
	@override String get addedCard => 'クレジットカード登録済み';
	@override String get bankAccount => '銀行口座';
	@override String get securitySettings => 'セキュリティ設定';
	@override String get notificationSettings => '通知設定';
	@override String get appSettings => 'アプリ設定';
	@override String get helpCenter => 'ヘルプセンター';
	@override String get logOut => 'ログアウト';
	@override String get pointUnit => 'P';
	@override String get mockPointsBalance => '1,250';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightJa implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ支払いボタンがわかった？';
	@override String get subtitle => '一番大きなボタン＝アプリの主目的';
	@override String get qrTitle => '中央の巨大ボタンは「メインアクション」';
	@override String get qrDesc => 'ボトムナビゲーションの中央に突出したボタンは、そのアプリで最もよく使う操作を意味する。決済アプリでは「支払い」がそれにあたる。';
	@override String get cameraTitle => 'アプリのテーマカラーが「重要度」を示す';
	@override String get cameraDesc => '赤や青など、アプリのメインカラーで強調されたボタンは、最も重要なアクションを示すサインとして使われる。';
	@override String get colorTitle => '出っ張ったデザイン＝「押してほしい」サイン';
	@override String get colorDesc => '他のボタンより大きく、上方向に飛び出したデザインは「このボタンを使ってほしい」という強力なアフォーダンスを持つ。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightJa implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ残高を隠せた？';
	@override String get subtitle => '👁️ アイコン＝表示/非表示の切り替え';
	@override String get eyeTitle => '目のアイコンは「表示/非表示」を意味する';
	@override String get eyeDesc => '目を開いたアイコンは「情報が表示されている」状態で、タップすると非表示に切り替わる。パスワードフィールドや残高表示で広く使われるUIパターン。';
	@override String get maskTitle => '「***」は情報が隠れているサイン';
	@override String get maskDesc => '金額などのセンシティブな情報をアスタリスク（***）で伏せる表示は、「情報は存在するが隠れている」ことを示すUIパターン。';
	@override String get privacyTitle => 'プライバシー保護は「見た目」で伝わる';
	@override String get privacyDesc => '情報が隠れたことで、自分が正しい操作をしたとわかる。UIのフィードバックが操作の成否を即座に教えてくれる。';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightJa implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ送金の手順がわかった？';
	@override String get subtitle => '3ステップが送金UIの定番フロー';
	@override String get sendTitle => '「送る」アイコンは上矢印または紙飛行機';
	@override String get sendDesc => '送信・送金を表すUIアイコンとして、上向きの矢印や紙飛行機が広く使われている。メールやSNSの送信ボタンと同じ感覚で操作できる。';
	@override String get amountTitle => '数字キーボードは金額入力の定番';
	@override String get amountDesc => '金額入力にはテンキー（数字キーボード）が表示される。銀行アプリ・キャッシュレス決済アプリともに共通するUIパターン。';
	@override String get confirmTitle => '最終確認画面は「間違えた時のため」';
	@override String get confirmDesc => '送金などの重要な操作では、実行前に確認画面を挟むことが多い。これにより誤操作を防ぐ安全設計になっている。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightJa implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ支払い方法を変更できた？';
	@override String get subtitle => '2つのルートで支払い元を変えられる';
	@override String get routeATitle => '支払い画面から変更（ルートA）';
	@override String get routeADesc => '支払い画面を開き、バーコード下の「支払い元ボタン」をタップするとボトムシートが開いて支払い方法を選択できる。「現在の設定値＝タップで変更」というメンタルモデル。';
	@override String get routeBTitle => 'ホーム画面でスワイプして変更（ルートB）';
	@override String get routeBDesc => 'ホーム画面の「支払い元カード」を左右にスワイプすると支払い方法を切り替えられる。「カード状UIはスワイプで切替」という現代的なジェスチャーUIの理解。';
	@override String get dropdownTitle => '設定値が書かれた場所はタップで変更できる';
	@override String get dropdownDesc => '現在の設定が表示されているボタンやラベルは、タップでドロップダウンや選択画面が開くUIパターン。銀行・ショッピングアプリで広く使われる。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'レジに来ました。バーコードを提示してください',
			'quiz1.failureReason' => '画面下部の一番大きなボタンをタップしてください',
			'quiz1.insight.title' => 'なぜ支払いボタンがわかった？',
			'quiz1.insight.subtitle' => '一番大きなボタン＝アプリの主目的',
			'quiz1.insight.qrTitle' => '中央の巨大ボタンは「メインアクション」',
			'quiz1.insight.qrDesc' => 'ボトムナビゲーションの中央に突出したボタンは、そのアプリで最もよく使う操作を意味する。決済アプリでは「支払い」がそれにあたる。',
			'quiz1.insight.cameraTitle' => 'アプリのテーマカラーが「重要度」を示す',
			'quiz1.insight.cameraDesc' => '赤や青など、アプリのメインカラーで強調されたボタンは、最も重要なアクションを示すサインとして使われる。',
			'quiz1.insight.colorTitle' => '出っ張ったデザイン＝「押してほしい」サイン',
			'quiz1.insight.colorDesc' => '他のボタンより大きく、上方向に飛び出したデザインは「このボタンを使ってほしい」という強力なアフォーダンスを持つ。',
			'quiz2.missionText' => '誰かに画面を見られそう！残高を隠してください',
			'quiz2.failureReason' => '残高の横にある「目のアイコン」をタップしてください',
			'quiz2.insight.title' => 'なぜ残高を隠せた？',
			'quiz2.insight.subtitle' => '👁️ アイコン＝表示/非表示の切り替え',
			'quiz2.insight.eyeTitle' => '目のアイコンは「表示/非表示」を意味する',
			'quiz2.insight.eyeDesc' => '目を開いたアイコンは「情報が表示されている」状態で、タップすると非表示に切り替わる。パスワードフィールドや残高表示で広く使われるUIパターン。',
			'quiz2.insight.maskTitle' => '「***」は情報が隠れているサイン',
			'quiz2.insight.maskDesc' => '金額などのセンシティブな情報をアスタリスク（***）で伏せる表示は、「情報は存在するが隠れている」ことを示すUIパターン。',
			'quiz2.insight.privacyTitle' => 'プライバシー保護は「見た目」で伝わる',
			'quiz2.insight.privacyDesc' => '情報が隠れたことで、自分が正しい操作をしたとわかる。UIのフィードバックが操作の成否を即座に教えてくれる。',
			'quiz3.missionText' => '友達に5,000円を送金してください',
			'quiz3.failureReason' => '「送金」アイコンをタップして、5000と入力し、送金ボタンを押してください',
			'quiz3.insight.title' => 'なぜ送金の手順がわかった？',
			'quiz3.insight.subtitle' => '3ステップが送金UIの定番フロー',
			'quiz3.insight.sendTitle' => '「送る」アイコンは上矢印または紙飛行機',
			'quiz3.insight.sendDesc' => '送信・送金を表すUIアイコンとして、上向きの矢印や紙飛行機が広く使われている。メールやSNSの送信ボタンと同じ感覚で操作できる。',
			'quiz3.insight.amountTitle' => '数字キーボードは金額入力の定番',
			'quiz3.insight.amountDesc' => '金額入力にはテンキー（数字キーボード）が表示される。銀行アプリ・キャッシュレス決済アプリともに共通するUIパターン。',
			'quiz3.insight.confirmTitle' => '最終確認画面は「間違えた時のため」',
			'quiz3.insight.confirmDesc' => '送金などの重要な操作では、実行前に確認画面を挟むことが多い。これにより誤操作を防ぐ安全設計になっている。',
			'quiz4.missionText' => '残高が足りません！支払い方法を「クレジットカード」に変更してバーコードを提示してください',
			'quiz4.failureReason' => 'クレジットカードを選択してから支払い画面を開いてください',
			'quiz4.insight.title' => 'なぜ支払い方法を変更できた？',
			'quiz4.insight.subtitle' => '2つのルートで支払い元を変えられる',
			'quiz4.insight.routeATitle' => '支払い画面から変更（ルートA）',
			'quiz4.insight.routeADesc' => '支払い画面を開き、バーコード下の「支払い元ボタン」をタップするとボトムシートが開いて支払い方法を選択できる。「現在の設定値＝タップで変更」というメンタルモデル。',
			'quiz4.insight.routeBTitle' => 'ホーム画面でスワイプして変更（ルートB）',
			'quiz4.insight.routeBDesc' => 'ホーム画面の「支払い元カード」を左右にスワイプすると支払い方法を切り替えられる。「カード状UIはスワイプで切替」という現代的なジェスチャーUIの理解。',
			'quiz4.insight.dropdownTitle' => '設定値が書かれた場所はタップで変更できる',
			'quiz4.insight.dropdownDesc' => '現在の設定が表示されているボタンやラベルは、タップでドロップダウンや選択画面が開くUIパターン。銀行・ショッピングアプリで広く使われる。',
			'common.appTitle' => 'Pay',
			'common.balance' => '残高',
			'common.send' => '送金',
			'common.receive' => '受け取る',
			'common.history' => '履歴',
			'common.qrCode' => 'QRコード',
			'common.scanQr' => 'スキャン',
			'common.point' => 'ポイント',
			'common.topUp' => 'チャージ',
			'common.amount' => '金額',
			'common.confirm' => '確認',
			'common.sendTo' => '送金先',
			'common.sendMoney' => '送金する',
			'common.cancel' => 'キャンセル',
			'common.tapToReveal' => 'タップして確認',
			'common.yen' => '円',
			'common.payment' => '支払い',
			'common.creditCard' => 'クレジットカード',
			'common.paymentSource' => '支払い元',
			'common.balancePayment' => '残高払い',
			'common.scan' => 'スキャン',
			'common.more' => 'その他',
			'common.home' => 'ホーム',
			'common.account' => 'アカウント',
			'common.contact1' => '田中 太郎',
			'common.contact2' => '山田 花子',
			'common.contact3' => '鈴木 次郎',
			'common.contact4' => '佐藤 みどり',
			'common.txTitle1' => 'コンビニ決済',
			'common.txTitle2' => 'ランチ代',
			'common.txTitle3' => 'お友達から',
			'common.txTitle4' => '書籍購入',
			'common.txTitle5' => '電車代',
			'common.txAmount1' => '-580',
			'common.txAmount2' => '-1200',
			'common.txAmount3' => '+3000',
			'common.txAmount4' => '-2800',
			'common.txAmount5' => '-240',
			'common.txDate1' => '今日',
			'common.txDate2' => '昨日',
			'common.txDate3' => '昨日',
			'common.txDate4' => '3日前',
			'common.txDate5' => '4日前',
			'common.txFilterAll' => 'すべて',
			'common.txFilterOut' => '支払い',
			'common.txFilterIn' => '受け取り',
			'common.txMonthLabel' => '今月',
			'common.txMonthTotal' => '今月の合計',
			'common.pointBalance' => 'ポイント残高',
			'common.pointExpiry' => '有効期限',
			'common.expiryDate' => '2026年12月31日まで',
			'common.earnPoints' => 'ポイントを貯める',
			'common.shopService' => 'ショッピング',
			'common.missionService' => 'ミッション',
			'common.campaignService' => 'キャンペーン',
			'common.pointHistory' => 'ポイント履歴',
			'common.pointItem1' => 'お買い物',
			'common.pointItem2' => 'デイリーボーナス',
			'common.pointItem3' => '友達招待',
			'common.pointGained1' => '+50',
			'common.pointGained2' => '+10',
			'common.pointGained3' => '+200',
			'common.pointDate1' => '今日',
			'common.pointDate2' => '昨日',
			'common.pointDate3' => '3日前',
			'common.myAccount' => 'マイアカウント',
			'common.userId' => 'ユーザーID',
			'common.userIdValue' => 'user_12345',
			'common.paymentMethods' => '支払い方法',
			'common.addedCard' => 'クレジットカード登録済み',
			'common.bankAccount' => '銀行口座',
			'common.securitySettings' => 'セキュリティ設定',
			'common.notificationSettings' => '通知設定',
			'common.appSettings' => 'アプリ設定',
			'common.helpCenter' => 'ヘルプセンター',
			'common.logOut' => 'ログアウト',
			'common.pointUnit' => 'P',
			'common.mockPointsBalance' => '1,250',
			_ => null,
		};
	}
}
