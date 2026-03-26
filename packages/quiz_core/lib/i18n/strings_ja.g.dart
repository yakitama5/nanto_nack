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
	late final TranslationsAppJa app = TranslationsAppJa.internal(_root);
	late final TranslationsHomeJa home = TranslationsHomeJa.internal(_root);
	late final TranslationsStageJa stage = TranslationsStageJa.internal(_root);
	late final TranslationsQuizJa quiz = TranslationsQuizJa.internal(_root);
	late final TranslationsPurchaseJa purchase = TranslationsPurchaseJa.internal(_root);
	late final TranslationsErrorJa error = TranslationsErrorJa.internal(_root);
	late final TranslationsDashboardJa dashboard = TranslationsDashboardJa.internal(_root);
	late final TranslationsPlayJa play = TranslationsPlayJa.internal(_root);
	late final TranslationsShoppingJa shopping = TranslationsShoppingJa.internal(_root);
}

// Path: app
class TranslationsAppJa {
	TranslationsAppJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'NantoNack'
	String get title => 'NantoNack';

	/// ja: 'UI/UX直感クイズ'
	String get subtitle => 'UI/UX直感クイズ';
}

// Path: home
class TranslationsHomeJa {
	TranslationsHomeJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ステージ一覧'
	String get stageList => 'ステージ一覧';

	/// ja: '{count}回プレイ済み'
	String get playCount => '{count}回プレイ済み';
}

// Path: stage
class TranslationsStageJa {
	TranslationsStageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'クリア済み'
	String get cleared => 'クリア済み';

	/// ja: 'プレイ可能'
	String get available => 'プレイ可能';

	/// ja: 'クリア後に解放'
	String get locked => 'クリア後に解放';

	/// ja: 'プレイ'
	String get play => 'プレイ';

	/// ja: 'クリアタイム: {time}'
	String get clearTime => 'クリアタイム: {time}';

	/// ja: 'スコア: {score}点'
	String get score => 'スコア: {score}点';
}

// Path: quiz
class TranslationsQuizJa {
	TranslationsQuizJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '正解！'
	String get correct => '正解！';

	/// ja: '不正解'
	String get incorrect => '不正解';

	/// ja: '時間切れ'
	String get timeUp => '時間切れ';

	/// ja: '結果'
	String get result => '結果';

	/// ja: 'もう一度'
	String get retry => 'もう一度';

	/// ja: '次へ'
	String get next => '次へ';

	/// ja: '戻る'
	String get back => '戻る';
}

// Path: purchase
class TranslationsPurchaseJa {
	TranslationsPurchaseJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '本日のプレイ上限に達しました'
	String get limitReached => '本日のプレイ上限に達しました';

	/// ja: 'プレミアムにアップグレードすると 無制限でプレイできます'
	String get unlockDescription => 'プレミアムにアップグレードすると\n無制限でプレイできます';

	/// ja: 'アップグレード'
	String get upgrade => 'アップグレード';

	/// ja: 'あとで'
	String get later => 'あとで';
}

// Path: error
class TranslationsErrorJa {
	TranslationsErrorJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'エラーが発生しました'
	String get unknown => 'エラーが発生しました';

	/// ja: '再試行'
	String get retry => '再試行';
}

// Path: dashboard
class TranslationsDashboardJa {
	TranslationsDashboardJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ダッシュボード'
	String get title => 'ダッシュボード';

	/// ja: '今日のUI/UXヒント'
	String get todayTip => '今日のUI/UXヒント';

	/// ja: '残りプレイ数'
	String get remainingPlays => '残りプレイ数';

	/// ja: '残り{count}回'
	String get remainingPlaysCount => '残り{count}回';

	/// ja: '無制限'
	String get unlimitedPlays => '無制限';

	/// ja: '連続プレイ'
	String get streak => '連続プレイ';

	/// ja: '{days}日連続'
	String get streakDays => '{days}日連続';

	/// ja: 'プレイ履歴'
	String get activityHistory => 'プレイ履歴';

	/// ja: 'まだプレイ履歴がありません'
	String get noActivity => 'まだプレイ履歴がありません';
}

// Path: play
class TranslationsPlayJa {
	TranslationsPlayJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'プレイする'
	String get startPlay => 'プレイする';

	/// ja: 'カテゴリー選択'
	String get selectCategory => 'カテゴリー選択';

	/// ja: 'チャレンジするカテゴリーを選んでください'
	String get selectCategoryDescription => 'チャレンジするカテゴリーを選んでください';

	/// ja: 'ステージ選択'
	String get selectStage => 'ステージ選択';

	/// ja: '{count}ステージ'
	String get stageCount => '{count}ステージ';
}

// Path: shopping
class TranslationsShoppingJa {
	TranslationsShoppingJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsShoppingWaterJa water = TranslationsShoppingWaterJa.internal(_root);
	late final TranslationsShoppingCartJa cart = TranslationsShoppingCartJa.internal(_root);
	late final TranslationsShoppingCheckoutJa checkout = TranslationsShoppingCheckoutJa.internal(_root);
	late final TranslationsShoppingCommonJa common = TranslationsShoppingCommonJa.internal(_root);
	late final TranslationsShoppingNavigationJa navigation = TranslationsShoppingNavigationJa.internal(_root);
	late final TranslationsShoppingCategoriesJa categories = TranslationsShoppingCategoriesJa.internal(_root);
}

// Path: shopping.water
class TranslationsShoppingWaterJa {
	TranslationsShoppingWaterJa.internal(this._root);

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
}

// Path: shopping.cart
class TranslationsShoppingCartJa {
	TranslationsShoppingCartJa.internal(this._root);

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

// Path: shopping.checkout
class TranslationsShoppingCheckoutJa {
	TranslationsShoppingCheckoutJa.internal(this._root);

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

// Path: shopping.common
class TranslationsShoppingCommonJa {
	TranslationsShoppingCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'カートに追加'
	String get addToCart => 'カートに追加';

	/// ja: '数量: {qty}'
	String get quantity => '数量: {qty}';

	/// ja: 'prime'
	String get primeBadge => 'prime';
}

// Path: shopping.navigation
class TranslationsShoppingNavigationJa {
	TranslationsShoppingNavigationJa.internal(this._root);

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

// Path: shopping.categories
class TranslationsShoppingCategoriesJa {
	TranslationsShoppingCategoriesJa.internal(this._root);

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

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
