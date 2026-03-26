///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsJa = Translations; // ignore: unused_element
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
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsWaterJa water = TranslationsWaterJa.internal(_root);
	late final TranslationsCartJa cart = TranslationsCartJa.internal(_root);
	late final TranslationsCheckoutJa checkout = TranslationsCheckoutJa.internal(_root);
	late final TranslationsCommonJa common = TranslationsCommonJa.internal(_root);
	late final TranslationsNavigationJa navigation = TranslationsNavigationJa.internal(_root);
	late final TranslationsCategoriesJa categories = TranslationsCategoriesJa.internal(_root);
}

// Path: water
class TranslationsWaterJa {
	TranslationsWaterJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '水を2つ購入してください'
	String get missionText => '水を2つ購入してください';

	/// ja: 'nantomall'
	String get appTitle => 'nantomall';

	/// ja: '商品を検索する'
	String get searchPlaceholder => '商品を検索する';

	/// ja: 'ショッピングカート'
	String get cartTitle => 'ショッピングカート';

	/// ja: 'カートは空です'
	String get cartEmpty => 'カートは空です';

	/// ja: '小計 ({count}点の商品):'
	String get subtotal => '小計 ({count}点の商品):';

	/// ja: '注文を確定する'
	String get confirmOrder => '注文を確定する';

	late final TranslationsWaterInsightJa insight = TranslationsWaterInsightJa.internal(_root);
}

// Path: cart
class TranslationsCartJa {
	TranslationsCartJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'このカートの合計金額を選んでください'
	String get missionText => 'このカートの合計金額を選んでください';

	/// ja: 'ショッピングカート'
	String get appTitle => 'ショッピングカート';

	/// ja: 'カートの中身'
	String get itemsHeader => 'カートの中身';

	/// ja: '{count}点'
	String get itemCount => '{count}点';

	/// ja: '合計金額はいくらですか？'
	String get questionTitle => '合計金額はいくらですか？';

	/// ja: '上のカートに入っている商品の合計を計算して選んでください'
	String get questionSubtitle => '上のカートに入っている商品の合計を計算して選んでください';

	/// ja: '各商品の単価 × 数量を足すと合計が求まります'
	String get hint => '各商品の単価 × 数量を足すと合計が求まります';
}

// Path: checkout
class TranslationsCheckoutJa {
	TranslationsCheckoutJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '購入手続きを完了してください'
	String get missionText => '購入手続きを完了してください';

	/// ja: 'お支払い手続き'
	String get appTitle => 'お支払い手続き';

	/// ja: 'カート'
	String get step1 => 'カート';

	/// ja: 'お届け先・支払い'
	String get step2 => 'お届け先・支払い';

	/// ja: '注文確認'
	String get step3 => '注文確認';

	/// ja: 'お届け先住所'
	String get addressSection => 'お届け先住所';

	/// ja: '例: 東京都渋谷区...'
	String get addressPlaceholder => '例: 東京都渋谷区...';

	/// ja: 'お支払い方法'
	String get paymentSection => 'お支払い方法';

	/// ja: 'クレジットカード'
	String get paymentCreditCard => 'クレジットカード';

	/// ja: 'コンビニ払い'
	String get paymentConvenience => 'コンビニ払い';

	/// ja: '代金引換'
	String get paymentCOD => '代金引換';

	/// ja: '注文サマリー'
	String get summarySection => '注文サマリー';

	/// ja: '商品合計'
	String get subtotal => '商品合計';

	/// ja: '配送料・手数料'
	String get shipping => '配送料・手数料';

	/// ja: '注文合計'
	String get total => '注文合計';

	/// ja: '注文内容を確認しました'
	String get confirmCheck => '注文内容を確認しました';

	/// ja: '注文を確定する'
	String get confirmButton => '注文を確定する';
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'カートに追加'
	String get addToCart => 'カートに追加';

	/// ja: '数量: {qty}'
	String get quantity => '数量: {qty}';

	/// ja: 'prime'
	String get primeBadge => 'prime';
}

// Path: navigation
class TranslationsNavigationJa {
	TranslationsNavigationJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ホーム'
	String get home => 'ホーム';

	/// ja: '検索'
	String get search => '検索';

	/// ja: 'アカウント'
	String get account => 'アカウント';

	/// ja: 'メニュー'
	String get menu => 'メニュー';
}

// Path: categories
class TranslationsCategoriesJa {
	TranslationsCategoriesJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '日用品'
	String get daily => '日用品';

	/// ja: '食品・飲料'
	String get food => '食品・飲料';

	/// ja: '家電'
	String get electronics => '家電';

	/// ja: 'ファッション'
	String get fashion => 'ファッション';

	/// ja: 'スポーツ'
	String get sports => 'スポーツ';

	/// ja: 'キッチン'
	String get kitchen => 'キッチン';
}

// Path: water.insight
class TranslationsWaterInsightJa {
	TranslationsWaterInsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ文字が読めなくてもわかった？'
	String get title => 'なぜ文字が読めなくてもわかった？';

	/// ja: 'このUIには、言語を超えて伝わる3つの工夫がある'
	String get subtitle => 'このUIには、言語を超えて伝わる3つの工夫がある';

	/// ja: 'アイコンは言語を超える'
	String get iconTitle => 'アイコンは言語を超える';

	/// ja: '🛒カート・🔍検索・❤️お気に入り。よく見るアイコンは世界共通の記号として定着しており、文字がなくても意味が伝わる。'
	String get iconDesc => '🛒カート・🔍検索・❤️お気に入り。よく見るアイコンは世界共通の記号として定着しており、文字がなくても意味が伝わる。';

	/// ja: '色が行動を促す'
	String get colorTitle => '色が行動を促す';

	/// ja: '黄色い「注文確定」ボタンはAmazonなど大手ECで繰り返し使われた結果、「この色＝買う」という意味が色自体に刷り込まれている。'
	String get colorDesc => '黄色い「注文確定」ボタンはAmazonなど大手ECで繰り返し使われた結果、「この色＝買う」という意味が色自体に刷り込まれている。';

	/// ja: 'UIパターンが直感を作る'
	String get patternTitle => 'UIパターンが直感を作る';

	/// ja: 'グリッド商品一覧×価格＝ネットショップ、±ボタン＝数量調整。体験を重ねるうちに、パターンそのものが「当たり前」になった。'
	String get patternDesc => 'グリッド商品一覧×価格＝ネットショップ、±ボタン＝数量調整。体験を重ねるうちに、パターンそのものが「当たり前」になった。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
			'common.addToCart' => 'カートに追加',
			'common.quantity' => '数量: {qty}',
			'common.primeBadge' => 'prime',
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
			_ => null,
		};
	}
}
