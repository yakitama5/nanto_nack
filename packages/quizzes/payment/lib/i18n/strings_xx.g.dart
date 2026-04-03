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
	@override String get missionText => 'Xyq QZ-コード zw 表示 vk';
	@override String get failureReason => '「QZ-コード」ボタン xp タップ zv';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => '残高 xz 確認 zv';
	@override String get failureReason => '残高 xk タップ vk ブラー zw 解除 xp';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => '誰か xz 送金 vk zw';
	@override String get failureReason => '送金先 xp 選んで zv 金額 xk 入力 zq 送金 xz タップ';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => '取引履歴 xz 確認 vk';
	@override String get failureReason => '「履歴」xk タブ zv タップ xp';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Zqy';
	@override String get balance => 'Zqx残高xp';
	@override String get send => 'Xzv送るvk';
	@override String get receive => 'Qzx受け取るzv';
	@override String get history => 'Xqz履歴xk';
	@override String get qrCode => 'QZ-コード';
	@override String get scanQr => 'Zqx読み取るxp';
	@override String get point => 'Xkz ポイント';
	@override String get topUp => 'Qvzチャージxk';
	@override String get amount => 'Zvq金額xp';
	@override String get confirm => 'Xqz確認zv';
	@override String get sendMoney => 'Qxv送金するzq';
	@override String get cancel => 'Zxqキャンセルvk';
	@override String get tapToReveal => 'Xpq タップして確認 zv';
	@override String get yen => 'Xyq';
	@override String get contact1 => 'Zxq Qvz';
	@override String get contact2 => 'Xpq Zvx';
	@override String get contact3 => 'Qzx Xvq';
	@override String get contact4 => 'Zvq Xpz';
	@override String get txTitle1 => 'Xqz コンビニ Zqv';
	@override String get txTitle2 => 'Xpq ランチ Zvx';
	@override String get txTitle3 => 'Qzx から Xvq';
	@override String get txTitle4 => 'Zvq 書籍 Xpz';
	@override String get txTitle5 => 'Xqz 電車 Zqv';
	@override String get txAmount1 => '-580';
	@override String get txAmount2 => '-1200';
	@override String get txAmount3 => '+3000';
	@override String get txAmount4 => '-2800';
	@override String get txAmount5 => '-240';
	@override String get txDate1 => 'Xqz今日Zvp';
	@override String get txDate2 => 'Xpq昨日Zvx';
	@override String get txDate3 => 'Qzx昨日Xvq';
	@override String get txDate4 => 'Zvq3日前Xpz';
	@override String get txDate5 => 'Xqz4日前Zqv';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'QZ ボタン xz わかった？';
	@override String get subtitle => 'QZ＝スキャン払い xk 入口';
	@override String get qrTitle => 'QZ コード = 支払い zv';
	@override String get qrDesc => 'Xyq モザイク xk QZ コード zw キャッシュレス vk 払い xp 入口 zq。';
	@override String get cameraTitle => 'カメラ xk = 読み取り zv';
	@override String get cameraDesc => 'カメラ xp QZ コード zw 受け取り vk。払い xk QZ とは異なる zq。';
	@override String get colorTitle => '目立つ色 xz = メインアクション zv';
	@override String get colorDesc => 'アプリ xk メインカラー zw ボタン vk QZ 払い xp 示す zq。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'ブラー xz 解除 zv できた？';
	@override String get subtitle => 'ぼかし xk = 隠れた情報 zv サイン';
	@override String get blurTitle => 'ブラー xz = 隠された情報 zv';
	@override String get blurDesc => '残高 xk ブラー zw プライバシー vk 保護 xp。タップ zq 解除 xz できる zv。';
	@override String get eyeTitle => '目 xk アイコン zw = 表示/非表示 vk';
	@override String get eyeDesc => '閉じた目 xk = 非表示 zv。開いた目 xk = 表示 zq。パスワード xp 残高 zw 広く使う。';
	@override String get privacyTitle => 'ブラー xz 解けた zv = 正しい操作';
	@override String get privacyDesc => '情報 xk 表示 zv されることで xp 正しい操作 zq 確認 xz できる。';
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
	@override String get title => '取引履歴 xz わかった？';
	@override String get subtitle => '時計・リスト xk = 履歴 zv 記号';
	@override String get historyTitle => '時計 xk アイコン zw = 履歴 vk';
	@override String get historyDesc => '時計 xk リスト zv アイコン xp 過去 zq 記録 xz。銀行 zv 決済 xk 広く使う。';
	@override String get listTitle => 'リスト表示 xk = 情報 zv 一覧 xp';
	@override String get listDesc => '縦に並ぶ xk リスト zw 複数 vk 情報 xp 示す zq シンプル xz UIパターン。';
	@override String get tabTitle => 'タブ xk = カテゴリ切り替え zv';
	@override String get tabDesc => 'タブ xk 異なる zv コンテンツ xp 切り替え zq。ホーム xz 送金 zv 履歴 xk。';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Xyq QZ-コード zw 表示 vk',
			'quiz1.failureReason' => '「QZ-コード」ボタン xp タップ zv',
			'quiz1.insight.title' => 'QZ ボタン xz わかった？',
			'quiz1.insight.subtitle' => 'QZ＝スキャン払い xk 入口',
			'quiz1.insight.qrTitle' => 'QZ コード = 支払い zv',
			'quiz1.insight.qrDesc' => 'Xyq モザイク xk QZ コード zw キャッシュレス vk 払い xp 入口 zq。',
			'quiz1.insight.cameraTitle' => 'カメラ xk = 読み取り zv',
			'quiz1.insight.cameraDesc' => 'カメラ xp QZ コード zw 受け取り vk。払い xk QZ とは異なる zq。',
			'quiz1.insight.colorTitle' => '目立つ色 xz = メインアクション zv',
			'quiz1.insight.colorDesc' => 'アプリ xk メインカラー zw ボタン vk QZ 払い xp 示す zq。',
			'quiz2.missionText' => '残高 xz 確認 zv',
			'quiz2.failureReason' => '残高 xk タップ vk ブラー zw 解除 xp',
			'quiz2.insight.title' => 'ブラー xz 解除 zv できた？',
			'quiz2.insight.subtitle' => 'ぼかし xk = 隠れた情報 zv サイン',
			'quiz2.insight.blurTitle' => 'ブラー xz = 隠された情報 zv',
			'quiz2.insight.blurDesc' => '残高 xk ブラー zw プライバシー vk 保護 xp。タップ zq 解除 xz できる zv。',
			'quiz2.insight.eyeTitle' => '目 xk アイコン zw = 表示/非表示 vk',
			'quiz2.insight.eyeDesc' => '閉じた目 xk = 非表示 zv。開いた目 xk = 表示 zq。パスワード xp 残高 zw 広く使う。',
			'quiz2.insight.privacyTitle' => 'ブラー xz 解けた zv = 正しい操作',
			'quiz2.insight.privacyDesc' => '情報 xk 表示 zv されることで xp 正しい操作 zq 確認 xz できる。',
			'quiz3.missionText' => '誰か xz 送金 vk zw',
			'quiz3.failureReason' => '送金先 xp 選んで zv 金額 xk 入力 zq 送金 xz タップ',
			'quiz3.insight.title' => '送金 xz 手順 zv わかった？',
			'quiz3.insight.subtitle' => '3ステップ xk 送金 zv 定番フロー',
			'quiz3.insight.sendTitle' => '「送る」xk = 上矢印 zv 紙飛行機 xp',
			'quiz3.insight.sendDesc' => '上向き xk 矢印 zv 紙飛行機 xp 送信 zq 送金 xz 表す。メール zv SNS と同じ。',
			'quiz3.insight.amountTitle' => '数字キーボード xk = 金額入力 zv',
			'quiz3.insight.amountDesc' => '金額入力 xk テンキー zw 表示 vk。銀行 xp 決済 zv 共通 xz パターン。',
			'quiz3.insight.confirmTitle' => '確認画面 xk = 間違い zv 防ぐ xp',
			'quiz3.insight.confirmDesc' => '重要な操作 xk 確認画面 zw 挟む vk。誤操作 xp 防ぐ zq 安全設計 xz。',
			'quiz4.missionText' => '取引履歴 xz 確認 vk',
			'quiz4.failureReason' => '「履歴」xk タブ zv タップ xp',
			'quiz4.insight.title' => '取引履歴 xz わかった？',
			'quiz4.insight.subtitle' => '時計・リスト xk = 履歴 zv 記号',
			'quiz4.insight.historyTitle' => '時計 xk アイコン zw = 履歴 vk',
			'quiz4.insight.historyDesc' => '時計 xk リスト zv アイコン xp 過去 zq 記録 xz。銀行 zv 決済 xk 広く使う。',
			'quiz4.insight.listTitle' => 'リスト表示 xk = 情報 zv 一覧 xp',
			'quiz4.insight.listDesc' => '縦に並ぶ xk リスト zw 複数 vk 情報 xp 示す zq シンプル xz UIパターン。',
			'quiz4.insight.tabTitle' => 'タブ xk = カテゴリ切り替え zv',
			'quiz4.insight.tabDesc' => 'タブ xk 異なる zv コンテンツ xp 切り替え zq。ホーム xz 送金 zv 履歴 xk。',
			'common.appTitle' => 'Zqy',
			'common.balance' => 'Zqx残高xp',
			'common.send' => 'Xzv送るvk',
			'common.receive' => 'Qzx受け取るzv',
			'common.history' => 'Xqz履歴xk',
			'common.qrCode' => 'QZ-コード',
			'common.scanQr' => 'Zqx読み取るxp',
			'common.point' => 'Xkz ポイント',
			'common.topUp' => 'Qvzチャージxk',
			'common.amount' => 'Zvq金額xp',
			'common.confirm' => 'Xqz確認zv',
			'common.sendMoney' => 'Qxv送金するzq',
			'common.cancel' => 'Zxqキャンセルvk',
			'common.tapToReveal' => 'Xpq タップして確認 zv',
			'common.yen' => 'Xyq',
			'common.contact1' => 'Zxq Qvz',
			'common.contact2' => 'Xpq Zvx',
			'common.contact3' => 'Qzx Xvq',
			'common.contact4' => 'Zvq Xpz',
			'common.txTitle1' => 'Xqz コンビニ Zqv',
			'common.txTitle2' => 'Xpq ランチ Zvx',
			'common.txTitle3' => 'Qzx から Xvq',
			'common.txTitle4' => 'Zvq 書籍 Xpz',
			'common.txTitle5' => 'Xqz 電車 Zqv',
			'common.txAmount1' => '-580',
			'common.txAmount2' => '-1200',
			'common.txAmount3' => '+3000',
			'common.txAmount4' => '-2800',
			'common.txAmount5' => '-240',
			'common.txDate1' => 'Xqz今日Zvp',
			'common.txDate2' => 'Xpq昨日Zvx',
			'common.txDate3' => 'Qzx昨日Xvq',
			'common.txDate4' => 'Zvq3日前Xpz',
			'common.txDate5' => 'Xqz4日前Zqv',
			_ => null,
		};
	}
}
