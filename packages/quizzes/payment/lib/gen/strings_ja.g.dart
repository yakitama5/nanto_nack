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
	@override String get missionText => 'QRコードを表示してください';
	@override String get failureReason => '「QRコード」ボタンをタップしてください';
	@override late final _TranslationsQuiz1InsightJa insight = _TranslationsQuiz1InsightJa._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Ja implements TranslationsQuiz2En {
	_TranslationsQuiz2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '残高を確認してください';
	@override String get failureReason => '残高エリアをタップしてブラーを解除してください';
	@override late final _TranslationsQuiz2InsightJa insight = _TranslationsQuiz2InsightJa._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Ja implements TranslationsQuiz3En {
	_TranslationsQuiz3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '誰かに送金してください';
	@override String get failureReason => '送金先を選んで金額を入力し、送金ボタンをタップしてください';
	@override late final _TranslationsQuiz3InsightJa insight = _TranslationsQuiz3InsightJa._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Ja implements TranslationsQuiz4En {
	_TranslationsQuiz4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '取引履歴を確認してください';
	@override String get failureReason => '「履歴」タブまたは明細ボタンをタップしてください';
	@override late final _TranslationsQuiz4InsightJa insight = _TranslationsQuiz4InsightJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Pay';
	@override String get balance => '残高';
	@override String get send => '送る';
	@override String get receive => '受け取る';
	@override String get history => '履歴';
	@override String get qrCode => 'QRコード';
	@override String get scanQr => '読み取る';
	@override String get point => 'ポイント';
	@override String get topUp => 'チャージ';
	@override String get amount => '金額';
	@override String get confirm => '確認';
	@override String get sendMoney => '送金する';
	@override String get cancel => 'キャンセル';
	@override String get tapToReveal => 'タップして確認';
	@override String get yen => '円';
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
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightJa implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜQRコードボタンがわかった？';
	@override String get subtitle => 'QRコード＝スキャン払いの入口';
	@override String get qrTitle => 'QRコードは「支払い」を意味する';
	@override String get qrDesc => '四角いモザイク柄（QRコード）のアイコンは、キャッシュレス決済アプリで「QR払い」の入口として世界共通で使われている。';
	@override String get cameraTitle => 'カメラアイコンは「読み取り」を意味する';
	@override String get cameraDesc => 'カメラや読み取りアイコンはQRコードを「受け取る側」の操作。支払い時に使うQRコード表示とは目的が異なる。';
	@override String get colorTitle => '目立つ色は「メインアクション」のサイン';
	@override String get colorDesc => 'アプリのメインカラーで強調されたボタンは、最もよく使われる操作を示している。決済アプリでは多くの場合それがQRコード払い。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightJa implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ残高のブラーを解除できた？';
	@override String get subtitle => 'ぼかし＝「隠れた情報がある」サイン';
	@override String get blurTitle => 'ブラーは「隠された情報」を示す';
	@override String get blurDesc => '残高などの金額にかかっているブラーは、プライバシー保護のために意図的に隠されている。タップで解除できるのは「タップ可能なUI」であるサイン。';
	@override String get eyeTitle => '目のアイコンは「表示/非表示」を意味する';
	@override String get eyeDesc => '目を閉じたアイコンは「情報が非表示」、開いたアイコンは「表示」を意味する。パスワードフィールドや残高表示に広く使われるUIパターン。';
	@override String get privacyTitle => 'ブラーが解けた＝正しい操作';
	@override String get privacyDesc => '情報が正しく表示されることで、自分が正しい操作をしたことがわかる。UIからのフィードバックが正しい操作を確認させてくれる。';
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
	@override String get title => 'なぜ取引履歴がわかった？';
	@override String get subtitle => '時計・リスト＝履歴UIの記号';
	@override String get historyTitle => '時計アイコンは「履歴・過去」を表す';
	@override String get historyDesc => '時計やリスト形式のアイコンは「過去の記録・履歴」を表すUIパターンとして、銀行アプリや決済アプリで広く使われている。';
	@override String get listTitle => 'リスト表示は情報の一覧を意味する';
	@override String get listDesc => '縦に並んだリスト形式のUIは、複数の情報（取引・メッセージ・注文など）の一覧を示す最もシンプルで直感的なUIパターン。';
	@override String get tabTitle => 'タブは「カテゴリ切り替え」を意味する';
	@override String get tabDesc => '画面下部や上部に並ぶタブは、異なるカテゴリのコンテンツへ切り替える操作。「ホーム」「送金」「履歴」などの機能分類に使われる。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'QRコードを表示してください',
			'quiz1.failureReason' => '「QRコード」ボタンをタップしてください',
			'quiz1.insight.title' => 'なぜQRコードボタンがわかった？',
			'quiz1.insight.subtitle' => 'QRコード＝スキャン払いの入口',
			'quiz1.insight.qrTitle' => 'QRコードは「支払い」を意味する',
			'quiz1.insight.qrDesc' => '四角いモザイク柄（QRコード）のアイコンは、キャッシュレス決済アプリで「QR払い」の入口として世界共通で使われている。',
			'quiz1.insight.cameraTitle' => 'カメラアイコンは「読み取り」を意味する',
			'quiz1.insight.cameraDesc' => 'カメラや読み取りアイコンはQRコードを「受け取る側」の操作。支払い時に使うQRコード表示とは目的が異なる。',
			'quiz1.insight.colorTitle' => '目立つ色は「メインアクション」のサイン',
			'quiz1.insight.colorDesc' => 'アプリのメインカラーで強調されたボタンは、最もよく使われる操作を示している。決済アプリでは多くの場合それがQRコード払い。',
			'quiz2.missionText' => '残高を確認してください',
			'quiz2.failureReason' => '残高エリアをタップしてブラーを解除してください',
			'quiz2.insight.title' => 'なぜ残高のブラーを解除できた？',
			'quiz2.insight.subtitle' => 'ぼかし＝「隠れた情報がある」サイン',
			'quiz2.insight.blurTitle' => 'ブラーは「隠された情報」を示す',
			'quiz2.insight.blurDesc' => '残高などの金額にかかっているブラーは、プライバシー保護のために意図的に隠されている。タップで解除できるのは「タップ可能なUI」であるサイン。',
			'quiz2.insight.eyeTitle' => '目のアイコンは「表示/非表示」を意味する',
			'quiz2.insight.eyeDesc' => '目を閉じたアイコンは「情報が非表示」、開いたアイコンは「表示」を意味する。パスワードフィールドや残高表示に広く使われるUIパターン。',
			'quiz2.insight.privacyTitle' => 'ブラーが解けた＝正しい操作',
			'quiz2.insight.privacyDesc' => '情報が正しく表示されることで、自分が正しい操作をしたことがわかる。UIからのフィードバックが正しい操作を確認させてくれる。',
			'quiz3.missionText' => '誰かに送金してください',
			'quiz3.failureReason' => '送金先を選んで金額を入力し、送金ボタンをタップしてください',
			'quiz3.insight.title' => 'なぜ送金の手順がわかった？',
			'quiz3.insight.subtitle' => '3ステップが送金UIの定番フロー',
			'quiz3.insight.sendTitle' => '「送る」アイコンは上矢印または紙飛行機',
			'quiz3.insight.sendDesc' => '送信・送金を表すUIアイコンとして、上向きの矢印や紙飛行機が広く使われている。メールやSNSの送信ボタンと同じ感覚で操作できる。',
			'quiz3.insight.amountTitle' => '数字キーボードは金額入力の定番',
			'quiz3.insight.amountDesc' => '金額入力にはテンキー（数字キーボード）が表示される。銀行アプリ・キャッシュレス決済アプリともに共通するUIパターン。',
			'quiz3.insight.confirmTitle' => '最終確認画面は「間違えた時のため」',
			'quiz3.insight.confirmDesc' => '送金などの重要な操作では、実行前に確認画面を挟むことが多い。これにより誤操作を防ぐ安全設計になっている。',
			'quiz4.missionText' => '取引履歴を確認してください',
			'quiz4.failureReason' => '「履歴」タブまたは明細ボタンをタップしてください',
			'quiz4.insight.title' => 'なぜ取引履歴がわかった？',
			'quiz4.insight.subtitle' => '時計・リスト＝履歴UIの記号',
			'quiz4.insight.historyTitle' => '時計アイコンは「履歴・過去」を表す',
			'quiz4.insight.historyDesc' => '時計やリスト形式のアイコンは「過去の記録・履歴」を表すUIパターンとして、銀行アプリや決済アプリで広く使われている。',
			'quiz4.insight.listTitle' => 'リスト表示は情報の一覧を意味する',
			'quiz4.insight.listDesc' => '縦に並んだリスト形式のUIは、複数の情報（取引・メッセージ・注文など）の一覧を示す最もシンプルで直感的なUIパターン。',
			'quiz4.insight.tabTitle' => 'タブは「カテゴリ切り替え」を意味する',
			'quiz4.insight.tabDesc' => '画面下部や上部に並ぶタブは、異なるカテゴリのコンテンツへ切り替える操作。「ホーム」「送金」「履歴」などの機能分類に使われる。',
			'common.appTitle' => 'Pay',
			'common.balance' => '残高',
			'common.send' => '送る',
			'common.receive' => '受け取る',
			'common.history' => '履歴',
			'common.qrCode' => 'QRコード',
			'common.scanQr' => '読み取る',
			'common.point' => 'ポイント',
			'common.topUp' => 'チャージ',
			'common.amount' => '金額',
			'common.confirm' => '確認',
			'common.sendMoney' => '送金する',
			'common.cancel' => 'キャンセル',
			'common.tapToReveal' => 'タップして確認',
			'common.yen' => '円',
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
			_ => null,
		};
	}
}
