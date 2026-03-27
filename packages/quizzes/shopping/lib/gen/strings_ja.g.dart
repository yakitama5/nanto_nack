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
	@override late final _TranslationsWaterJa water = _TranslationsWaterJa._(_root);
	@override late final _TranslationsCartJa cart = _TranslationsCartJa._(_root);
	@override late final _TranslationsCheckoutJa checkout = _TranslationsCheckoutJa._(_root);
	@override late final _TranslationsReorderJa reorder = _TranslationsReorderJa._(_root);
	@override late final _TranslationsCommonJa common = _TranslationsCommonJa._(_root);
	@override late final _TranslationsSearchJa search = _TranslationsSearchJa._(_root);
	@override late final _TranslationsMenuJa menu = _TranslationsMenuJa._(_root);
	@override late final _TranslationsNavigationJa navigation = _TranslationsNavigationJa._(_root);
	@override late final _TranslationsCategoriesJa categories = _TranslationsCategoriesJa._(_root);
	@override late final _TranslationsCatalogJa catalog = _TranslationsCatalogJa._(_root);
}

// Path: water
class _TranslationsWaterJa implements TranslationsWaterEn {
	_TranslationsWaterJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '水を2つ購入してください';
	@override String get appTitle => 'nantomall';
	@override String get searchPlaceholder => '商品を検索する';
	@override String get cartTitle => 'ショッピングカート';
	@override String get cartEmpty => 'カートは空です';
	@override String get subtotal => '小計 ({count}点の商品):';
	@override String get confirmOrder => '注文を確定する';
	@override late final _TranslationsWaterInsightJa insight = _TranslationsWaterInsightJa._(_root);
}

// Path: cart
class _TranslationsCartJa implements TranslationsCartEn {
	_TranslationsCartJa._(this._root);

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

// Path: checkout
class _TranslationsCheckoutJa implements TranslationsCheckoutEn {
	_TranslationsCheckoutJa._(this._root);

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

// Path: reorder
class _TranslationsReorderJa implements TranslationsReorderEn {
	_TranslationsReorderJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '直近で注文した商品をもう一度購入してください';
	@override String get appTitle => '注文履歴';
	@override String get orderHistoryTitle => '最近の注文';
	@override String get reorderButton => 'もう一度買う';
	@override String get lastOrderDate => '3日前に注文';
	@override String get cartTitle => 'ショッピングカート';
	@override String get cartEmpty => 'カートは空です';
	@override String get subtotal => '小計 ({count}点の商品):';
	@override String get confirmOrder => '注文を確定する';
	@override late final _TranslationsReorderInsightJa insight = _TranslationsReorderInsightJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get addToCart => 'カートに追加';
	@override String get quantity => '数量: {qty}';
	@override String get primeBadge => 'prime';
	@override String get noResults => '該当する商品がありません';
}

// Path: search
class _TranslationsSearchJa implements TranslationsSearchEn {
	_TranslationsSearchJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get popularCategories => '人気のカテゴリ';
	@override String get trendingItems => '注目の商品';
}

// Path: menu
class _TranslationsMenuJa implements TranslationsMenuEn {
	_TranslationsMenuJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get programs => 'プログラム＆機能';
	@override String get prime => 'Primeに登録';
	@override String get digitalContent => 'デジタルコンテンツ';
	@override String get settingsSection => '設定';
	@override String get notification => '通知設定';
	@override String get customerService => 'カスタマーサービス';
	@override String get help => 'ヘルプ';
	@override String get terms => '利用規約';
}

// Path: navigation
class _TranslationsNavigationJa implements TranslationsNavigationEn {
	_TranslationsNavigationJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get home => 'ホーム';
	@override String get search => '検索';
	@override String get account => 'アカウント';
	@override String get menu => 'メニュー';
}

// Path: categories
class _TranslationsCategoriesJa implements TranslationsCategoriesEn {
	_TranslationsCategoriesJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get daily => '日用品';
	@override String get food => '食品・飲料';
	@override String get electronics => '家電';
	@override String get fashion => 'ファッション';
	@override String get sports => 'スポーツ';
	@override String get kitchen => 'キッチン';
}

// Path: catalog
class _TranslationsCatalogJa implements TranslationsCatalogEn {
	_TranslationsCatalogJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get waterPuraAqua => 'ナチュラルウォーター 500ml';
	@override String get teaAqua => '緑茶 500ml';
	@override String get coffeeCraft => 'クラフトコーヒー';
	@override String get milkDaily => '牛乳 1L';
	@override String get snackChips => 'ポテトチップス';
	@override String get cocoaBar => 'チョコレートバー';
	@override String get bakeryBread => '食パン';
	@override String get eggs => '卵 10個入';
	@override String get noodleBowl => 'カップヌードル';
	@override String get apple => 'りんご';
	@override String get banana => 'バナナ';
	@override String get detergentDailyWash => '洗濯洗剤';
	@override String get soapWashPower => 'ハンドソープ';
	@override String get dishSoapSparkle => '食器用洗剤';
	@override String get sponge => 'キッチンスポンジ';
	@override String get tissueSoft => 'ティッシュペーパー 5箱';
	@override String get toiletPaper => 'トイレットペーパー 12ロール';
	@override String get haircareBotanicShine => 'ヘアオイル';
	@override String get notebook => 'リングノート';
	@override String get towel => 'フェイスタオル';
	@override String get water500ml => 'ウォーター 500ml';
	@override String get tea500ml => 'グリーンティー 500ml';
	@override String get coffee500ml => 'ブラックコーヒー 500ml';
}

// Path: water.insight
class _TranslationsWaterInsightJa implements TranslationsWaterInsightEn {
	_TranslationsWaterInsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ文字が読めなくてもわかった？';
	@override String get subtitle => 'このUIには、言語を超えて伝わる3つの工夫がある';
	@override String get iconTitle => 'アイコンは言語を超える';
	@override String get iconDesc => '🛒カート・🔍検索・❤️お気に入り。よく見るアイコンは世界共通の記号として定着しており、文字がなくても意味が伝わる。';
	@override String get colorTitle => '色が行動を促す';
	@override String get colorDesc => '黄色い「注文確定」ボタンはAmazonなど大手ECで繰り返し使われた結果、「この色＝買う」という意味が色自体に刷り込まれている。';
	@override String get patternTitle => 'UIパターンが直感を作る';
	@override String get patternDesc => 'グリッド商品一覧×価格＝ネットショップ、±ボタン＝数量調整。体験を重ねるうちに、パターンそのものが「当たり前」になった。';
}

// Path: reorder.insight
class _TranslationsReorderInsightJa implements TranslationsReorderInsightEn {
	_TranslationsReorderInsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ文字が読めなくてもわかった？';
	@override String get subtitle => '視覚パターンが「再注文」体験を作る';
	@override String get imageTitle => '商品画像が記憶のトリガー';
	@override String get imageDesc => '商品の外観・色・デザインは、文字情報がなくても前回の購入体験と結びついている。視覚記憶は言語を超える。';
	@override String get priceTitle => '価格が確信を与える';
	@override String get priceDesc => '金額の一致は「同じ商品だ」という確信をもたらす。数字は言語を超えた共通言語であり、価格を見ると商品を認識できる。';
	@override String get patternTitle => '「もう一度買う」ボタンが体験を完結させる';
	@override String get patternDesc => '再購入ボタンは大手ECサイトで定番のパターン。見たことのあるUIは直感的に操作でき、検索不要で素早く再注文できる。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'water.missionText' => '水を2つ購入してください',
			'water.appTitle' => 'nantomall',
			'water.searchPlaceholder' => '商品を検索する',
			'water.cartTitle' => 'ショッピングカート',
			'water.cartEmpty' => 'カートは空です',
			'water.subtotal' => '小計 ({count}点の商品):',
			'water.confirmOrder' => '注文を確定する',
			'water.insight.title' => 'なぜ文字が読めなくてもわかった？',
			'water.insight.subtitle' => 'このUIには、言語を超えて伝わる3つの工夫がある',
			'water.insight.iconTitle' => 'アイコンは言語を超える',
			'water.insight.iconDesc' => '🛒カート・🔍検索・❤️お気に入り。よく見るアイコンは世界共通の記号として定着しており、文字がなくても意味が伝わる。',
			'water.insight.colorTitle' => '色が行動を促す',
			'water.insight.colorDesc' => '黄色い「注文確定」ボタンはAmazonなど大手ECで繰り返し使われた結果、「この色＝買う」という意味が色自体に刷り込まれている。',
			'water.insight.patternTitle' => 'UIパターンが直感を作る',
			'water.insight.patternDesc' => 'グリッド商品一覧×価格＝ネットショップ、±ボタン＝数量調整。体験を重ねるうちに、パターンそのものが「当たり前」になった。',
			'cart.missionText' => 'このカートの合計金額を選んでください',
			'cart.appTitle' => 'ショッピングカート',
			'cart.itemsHeader' => 'カートの中身',
			'cart.itemCount' => '{count}点',
			'cart.questionTitle' => '合計金額はいくらですか？',
			'cart.questionSubtitle' => '上のカートに入っている商品の合計を計算して選んでください',
			'cart.hint' => '各商品の単価 × 数量を足すと合計が求まります',
			'checkout.missionText' => '購入手続きを完了してください',
			'checkout.appTitle' => 'お支払い手続き',
			'checkout.step1' => 'カート',
			'checkout.step2' => 'お届け先・支払い',
			'checkout.step3' => '注文確認',
			'checkout.addressSection' => 'お届け先住所',
			'checkout.addressPlaceholder' => '例: 東京都渋谷区...',
			'checkout.paymentSection' => 'お支払い方法',
			'checkout.paymentCreditCard' => 'クレジットカード',
			'checkout.paymentConvenience' => 'コンビニ払い',
			'checkout.paymentCOD' => '代金引換',
			'checkout.summarySection' => '注文サマリー',
			'checkout.subtotal' => '商品合計',
			'checkout.shipping' => '配送料・手数料',
			'checkout.total' => '注文合計',
			'checkout.confirmCheck' => '注文内容を確認しました',
			'checkout.confirmButton' => '注文を確定する',
			'reorder.missionText' => '直近で注文した商品をもう一度購入してください',
			'reorder.appTitle' => '注文履歴',
			'reorder.orderHistoryTitle' => '最近の注文',
			'reorder.reorderButton' => 'もう一度買う',
			'reorder.lastOrderDate' => '3日前に注文',
			'reorder.cartTitle' => 'ショッピングカート',
			'reorder.cartEmpty' => 'カートは空です',
			'reorder.subtotal' => '小計 ({count}点の商品):',
			'reorder.confirmOrder' => '注文を確定する',
			'reorder.insight.title' => 'なぜ文字が読めなくてもわかった？',
			'reorder.insight.subtitle' => '視覚パターンが「再注文」体験を作る',
			'reorder.insight.imageTitle' => '商品画像が記憶のトリガー',
			'reorder.insight.imageDesc' => '商品の外観・色・デザインは、文字情報がなくても前回の購入体験と結びついている。視覚記憶は言語を超える。',
			'reorder.insight.priceTitle' => '価格が確信を与える',
			'reorder.insight.priceDesc' => '金額の一致は「同じ商品だ」という確信をもたらす。数字は言語を超えた共通言語であり、価格を見ると商品を認識できる。',
			'reorder.insight.patternTitle' => '「もう一度買う」ボタンが体験を完結させる',
			'reorder.insight.patternDesc' => '再購入ボタンは大手ECサイトで定番のパターン。見たことのあるUIは直感的に操作でき、検索不要で素早く再注文できる。',
			'common.addToCart' => 'カートに追加',
			'common.quantity' => '数量: {qty}',
			'common.primeBadge' => 'prime',
			'common.noResults' => '該当する商品がありません',
			'search.popularCategories' => '人気のカテゴリ',
			'search.trendingItems' => '注目の商品',
			'menu.programs' => 'プログラム＆機能',
			'menu.prime' => 'Primeに登録',
			'menu.digitalContent' => 'デジタルコンテンツ',
			'menu.settingsSection' => '設定',
			'menu.notification' => '通知設定',
			'menu.customerService' => 'カスタマーサービス',
			'menu.help' => 'ヘルプ',
			'menu.terms' => '利用規約',
			'navigation.home' => 'ホーム',
			'navigation.search' => '検索',
			'navigation.account' => 'アカウント',
			'navigation.menu' => 'メニュー',
			'categories.daily' => '日用品',
			'categories.food' => '食品・飲料',
			'categories.electronics' => '家電',
			'categories.fashion' => 'ファッション',
			'categories.sports' => 'スポーツ',
			'categories.kitchen' => 'キッチン',
			'catalog.waterPuraAqua' => 'ナチュラルウォーター 500ml',
			'catalog.teaAqua' => '緑茶 500ml',
			'catalog.coffeeCraft' => 'クラフトコーヒー',
			'catalog.milkDaily' => '牛乳 1L',
			'catalog.snackChips' => 'ポテトチップス',
			'catalog.cocoaBar' => 'チョコレートバー',
			'catalog.bakeryBread' => '食パン',
			'catalog.eggs' => '卵 10個入',
			'catalog.noodleBowl' => 'カップヌードル',
			'catalog.apple' => 'りんご',
			'catalog.banana' => 'バナナ',
			'catalog.detergentDailyWash' => '洗濯洗剤',
			'catalog.soapWashPower' => 'ハンドソープ',
			'catalog.dishSoapSparkle' => '食器用洗剤',
			'catalog.sponge' => 'キッチンスポンジ',
			'catalog.tissueSoft' => 'ティッシュペーパー 5箱',
			'catalog.toiletPaper' => 'トイレットペーパー 12ロール',
			'catalog.haircareBotanicShine' => 'ヘアオイル',
			'catalog.notebook' => 'リングノート',
			'catalog.towel' => 'フェイスタオル',
			'catalog.water500ml' => 'ウォーター 500ml',
			'catalog.tea500ml' => 'グリーンティー 500ml',
			'catalog.coffee500ml' => 'ブラックコーヒー 500ml',
			_ => null,
		};
	}
}
