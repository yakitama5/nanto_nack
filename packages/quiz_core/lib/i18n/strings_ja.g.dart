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
	@override late final _TranslationsAppJa app = _TranslationsAppJa._(_root);
	@override late final _TranslationsHomeJa home = _TranslationsHomeJa._(_root);
	@override late final _TranslationsStageJa stage = _TranslationsStageJa._(_root);
	@override late final _TranslationsQuizJa quiz = _TranslationsQuizJa._(_root);
	@override late final _TranslationsPurchaseJa purchase = _TranslationsPurchaseJa._(_root);
	@override late final _TranslationsErrorJa error = _TranslationsErrorJa._(_root);
	@override late final _TranslationsDashboardJa dashboard = _TranslationsDashboardJa._(_root);
	@override late final _TranslationsPlayJa play = _TranslationsPlayJa._(_root);
	@override late final _TranslationsShoppingJa shopping = _TranslationsShoppingJa._(_root);
}

// Path: app
class _TranslationsAppJa implements TranslationsAppEn {
	_TranslationsAppJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'NantoNack';
	@override String get subtitle => 'UI/UX直感クイズ';
}

// Path: home
class _TranslationsHomeJa implements TranslationsHomeEn {
	_TranslationsHomeJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get stageList => 'ステージ一覧';
	@override String get playCount => '{count}回プレイ済み';
}

// Path: stage
class _TranslationsStageJa implements TranslationsStageEn {
	_TranslationsStageJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get cleared => 'クリア済み';
	@override String get available => 'プレイ可能';
	@override String get locked => 'クリア後に解放';
	@override String get play => 'プレイ';
	@override String get clearTime => 'クリアタイム: {time}';
	@override String get score => 'スコア: {score}点';
}

// Path: quiz
class _TranslationsQuizJa implements TranslationsQuizEn {
	_TranslationsQuizJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get correct => '正解！';
	@override String get incorrect => '不正解';
	@override String get timeUp => '時間切れ';
	@override String get result => '結果';
	@override String get retry => 'もう一度';
	@override String get next => '次へ';
	@override String get back => '戻る';
}

// Path: purchase
class _TranslationsPurchaseJa implements TranslationsPurchaseEn {
	_TranslationsPurchaseJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get limitReached => '本日のプレイ上限に達しました';
	@override String get unlockDescription => 'プレミアムにアップグレードすると\n無制限でプレイできます';
	@override String get upgrade => 'アップグレード';
	@override String get later => 'あとで';
}

// Path: error
class _TranslationsErrorJa implements TranslationsErrorEn {
	_TranslationsErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get unknown => 'エラーが発生しました';
	@override String get retry => '再試行';
}

// Path: dashboard
class _TranslationsDashboardJa implements TranslationsDashboardEn {
	_TranslationsDashboardJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ダッシュボード';
	@override String get todayTip => '今日のUI/UXヒント';
	@override String get remainingPlays => '残りプレイ数';
	@override String get remainingPlaysCount => '残り{count}回';
	@override String get unlimitedPlays => '無制限';
	@override String get streak => '連続プレイ';
	@override String get streakDays => '{days}日連続';
	@override String get activityHistory => 'プレイ履歴';
	@override String get noActivity => 'まだプレイ履歴がありません';
}

// Path: play
class _TranslationsPlayJa implements TranslationsPlayEn {
	_TranslationsPlayJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get startPlay => 'プレイする';
	@override String get selectCategory => 'カテゴリー選択';
	@override String get selectCategoryDescription => 'チャレンジするカテゴリーを選んでください';
	@override String get selectStage => 'ステージ選択';
	@override String get stageCount => '{count}ステージ';
}

// Path: shopping
class _TranslationsShoppingJa implements TranslationsShoppingEn {
	_TranslationsShoppingJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsShoppingWaterJa water = _TranslationsShoppingWaterJa._(_root);
	@override late final _TranslationsShoppingCartJa cart = _TranslationsShoppingCartJa._(_root);
	@override late final _TranslationsShoppingCheckoutJa checkout = _TranslationsShoppingCheckoutJa._(_root);
	@override late final _TranslationsShoppingCommonJa common = _TranslationsShoppingCommonJa._(_root);
	@override late final _TranslationsShoppingNavigationJa navigation = _TranslationsShoppingNavigationJa._(_root);
	@override late final _TranslationsShoppingCategoriesJa categories = _TranslationsShoppingCategoriesJa._(_root);
}

// Path: shopping.water
class _TranslationsShoppingWaterJa implements TranslationsShoppingWaterEn {
	_TranslationsShoppingWaterJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '水を2つ購入してください';
	@override String get appTitle => 'nantomall';
	@override String get searchPlaceholder => '商品を検索する';
	@override String get cartTitle => 'ショッピングカート';
	@override String get cartEmpty => 'カートは空です';
	@override String get subtotal => '小計 ({count}点の商品):';
	@override String get confirmOrder => '注文を確定する';
}

// Path: shopping.cart
class _TranslationsShoppingCartJa implements TranslationsShoppingCartEn {
	_TranslationsShoppingCartJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'このカートの合計金額を選んでください';
	@override String get appTitle => 'ショッピングカート';
	@override String get itemsHeader => 'カートの中身';
	@override String get itemCount => '{count}点';
	@override String get questionTitle => '合計金額はいくらですか？';
	@override String get questionSubtitle => '上のカートに入っている商品の合計を計算して選んでください';
	@override String get hint => '各商品の単価 × 数量を足すと合計が求まります';
}

// Path: shopping.checkout
class _TranslationsShoppingCheckoutJa implements TranslationsShoppingCheckoutEn {
	_TranslationsShoppingCheckoutJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '購入手続きを完了してください';
	@override String get appTitle => 'お支払い手続き';
	@override String get step1 => 'カート';
	@override String get step2 => 'お届け先・支払い';
	@override String get step3 => '注文確認';
	@override String get addressSection => 'お届け先住所';
	@override String get addressPlaceholder => '例: 東京都渋谷区...';
	@override String get paymentSection => 'お支払い方法';
	@override String get paymentCreditCard => 'クレジットカード';
	@override String get paymentConvenience => 'コンビニ払い';
	@override String get paymentCOD => '代金引換';
	@override String get summarySection => '注文サマリー';
	@override String get subtotal => '商品合計';
	@override String get shipping => '配送料・手数料';
	@override String get total => '注文合計';
	@override String get confirmCheck => '注文内容を確認しました';
	@override String get confirmButton => '注文を確定する';
}

// Path: shopping.common
class _TranslationsShoppingCommonJa implements TranslationsShoppingCommonEn {
	_TranslationsShoppingCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get addToCart => 'カートに追加';
	@override String get quantity => '数量: {qty}';
	@override String get primeBadge => 'prime';
}

// Path: shopping.navigation
class _TranslationsShoppingNavigationJa implements TranslationsShoppingNavigationEn {
	_TranslationsShoppingNavigationJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get home => 'ホーム';
	@override String get search => '検索';
	@override String get account => 'アカウント';
	@override String get menu => 'メニュー';
}

// Path: shopping.categories
class _TranslationsShoppingCategoriesJa implements TranslationsShoppingCategoriesEn {
	_TranslationsShoppingCategoriesJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get daily => '日用品';
	@override String get food => '食品・飲料';
	@override String get electronics => '家電';
	@override String get fashion => 'ファッション';
	@override String get sports => 'スポーツ';
	@override String get kitchen => 'キッチン';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'NantoNack',
			'app.subtitle' => 'UI/UX直感クイズ',
			'home.stageList' => 'ステージ一覧',
			'home.playCount' => '{count}回プレイ済み',
			'stage.cleared' => 'クリア済み',
			'stage.available' => 'プレイ可能',
			'stage.locked' => 'クリア後に解放',
			'stage.play' => 'プレイ',
			'stage.clearTime' => 'クリアタイム: {time}',
			'stage.score' => 'スコア: {score}点',
			'quiz.correct' => '正解！',
			'quiz.incorrect' => '不正解',
			'quiz.timeUp' => '時間切れ',
			'quiz.result' => '結果',
			'quiz.retry' => 'もう一度',
			'quiz.next' => '次へ',
			'quiz.back' => '戻る',
			'purchase.limitReached' => '本日のプレイ上限に達しました',
			'purchase.unlockDescription' => 'プレミアムにアップグレードすると\n無制限でプレイできます',
			'purchase.upgrade' => 'アップグレード',
			'purchase.later' => 'あとで',
			'error.unknown' => 'エラーが発生しました',
			'error.retry' => '再試行',
			'dashboard.title' => 'ダッシュボード',
			'dashboard.todayTip' => '今日のUI/UXヒント',
			'dashboard.remainingPlays' => '残りプレイ数',
			'dashboard.remainingPlaysCount' => '残り{count}回',
			'dashboard.unlimitedPlays' => '無制限',
			'dashboard.streak' => '連続プレイ',
			'dashboard.streakDays' => '{days}日連続',
			'dashboard.activityHistory' => 'プレイ履歴',
			'dashboard.noActivity' => 'まだプレイ履歴がありません',
			'play.startPlay' => 'プレイする',
			'play.selectCategory' => 'カテゴリー選択',
			'play.selectCategoryDescription' => 'チャレンジするカテゴリーを選んでください',
			'play.selectStage' => 'ステージ選択',
			'play.stageCount' => '{count}ステージ',
			'shopping.water.missionText' => '水を2つ購入してください',
			'shopping.water.appTitle' => 'nantomall',
			'shopping.water.searchPlaceholder' => '商品を検索する',
			'shopping.water.cartTitle' => 'ショッピングカート',
			'shopping.water.cartEmpty' => 'カートは空です',
			'shopping.water.subtotal' => '小計 ({count}点の商品):',
			'shopping.water.confirmOrder' => '注文を確定する',
			'shopping.cart.missionText' => 'このカートの合計金額を選んでください',
			'shopping.cart.appTitle' => 'ショッピングカート',
			'shopping.cart.itemsHeader' => 'カートの中身',
			'shopping.cart.itemCount' => '{count}点',
			'shopping.cart.questionTitle' => '合計金額はいくらですか？',
			'shopping.cart.questionSubtitle' => '上のカートに入っている商品の合計を計算して選んでください',
			'shopping.cart.hint' => '各商品の単価 × 数量を足すと合計が求まります',
			'shopping.checkout.missionText' => '購入手続きを完了してください',
			'shopping.checkout.appTitle' => 'お支払い手続き',
			'shopping.checkout.step1' => 'カート',
			'shopping.checkout.step2' => 'お届け先・支払い',
			'shopping.checkout.step3' => '注文確認',
			'shopping.checkout.addressSection' => 'お届け先住所',
			'shopping.checkout.addressPlaceholder' => '例: 東京都渋谷区...',
			'shopping.checkout.paymentSection' => 'お支払い方法',
			'shopping.checkout.paymentCreditCard' => 'クレジットカード',
			'shopping.checkout.paymentConvenience' => 'コンビニ払い',
			'shopping.checkout.paymentCOD' => '代金引換',
			'shopping.checkout.summarySection' => '注文サマリー',
			'shopping.checkout.subtotal' => '商品合計',
			'shopping.checkout.shipping' => '配送料・手数料',
			'shopping.checkout.total' => '注文合計',
			'shopping.checkout.confirmCheck' => '注文内容を確認しました',
			'shopping.checkout.confirmButton' => '注文を確定する',
			'shopping.common.addToCart' => 'カートに追加',
			'shopping.common.quantity' => '数量: {qty}',
			'shopping.common.primeBadge' => 'prime',
			'shopping.navigation.home' => 'ホーム',
			'shopping.navigation.search' => '検索',
			'shopping.navigation.account' => 'アカウント',
			'shopping.navigation.menu' => 'メニュー',
			'shopping.categories.daily' => '日用品',
			'shopping.categories.food' => '食品・飲料',
			'shopping.categories.electronics' => '家電',
			'shopping.categories.fashion' => 'ファッション',
			'shopping.categories.sports' => 'スポーツ',
			'shopping.categories.kitchen' => 'キッチン',
			_ => null,
		};
	}
}
