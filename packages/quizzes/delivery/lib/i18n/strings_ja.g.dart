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
	late final TranslationsQuiz1Ja quiz1 = TranslationsQuiz1Ja.internal(_root);
	late final TranslationsQuiz2Ja quiz2 = TranslationsQuiz2Ja.internal(_root);
	late final TranslationsQuiz3Ja quiz3 = TranslationsQuiz3Ja.internal(_root);
	late final TranslationsQuiz4Ja quiz4 = TranslationsQuiz4Ja.internal(_root);
	late final TranslationsCommonJa common = TranslationsCommonJa.internal(_root);
	late final TranslationsCategoriesJa categories = TranslationsCategoriesJa.internal(_root);
	late final TranslationsItemsJa items = TranslationsItemsJa.internal(_root);
}

// Path: quiz1
class TranslationsQuiz1Ja {
	TranslationsQuiz1Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '今日はピザの気分！カテゴリ一覧からピザを探そう'
	String get missionText => '今日はピザの気分！カテゴリ一覧からピザを探そう';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '友達の分も頼もう。注文数を2つに増やして'
	String get missionText => '友達の分も頼もう。注文数を2つに増やして';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '注文内容が決まったら、カートの中身を確認しよう'
	String get missionText => '注文内容が決まったら、カートの中身を確認しよう';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '配達員さんは今どこかな？地図を全画面に広げて確認しよう'
	String get missionText => '配達員さんは今どこかな？地図を全画面に広げて確認しよう';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'フードデリバリー'
	String get appTitle => 'フードデリバリー';

	/// ja: 'お店・メニューを探す'
	String get searchHint => 'お店・メニューを探す';

	/// ja: 'カテゴリー'
	String get categories => 'カテゴリー';

	/// ja: 'ハンバーガーセット'
	String get itemName => 'ハンバーガーセット';

	/// ja: 'ジューシーなビーフパティとフレッシュな野菜のバーガー'
	String get itemDescription => 'ジューシーなビーフパティとフレッシュな野菜のバーガー';

	/// ja: '¥890'
	String get itemPrice => '¥890';

	/// ja: '890'
	String get itemPriceValue => '890';

	/// ja: 'カートを確認 ¥{total}'
	String get cartButton => 'カートを確認 ¥{total}';

	/// ja: '配達状況'
	String get trackingTitle => '配達状況';

	/// ja: '配達員: ナントム'
	String get courierName => '配達員: ナントム';

	/// ja: 'まもなく到着します'
	String get courierStatus => 'まもなく到着します';

	/// ja: '到着予定: 約10分'
	String get estimatedTime => '到着予定: 約10分';

	/// ja: '注文内容'
	String get orderItems => '注文内容';

	/// ja: '合計: ¥{total}'
	String get orderTotal => '合計: ¥{total}';
}

// Path: categories
class TranslationsCategoriesJa {
	TranslationsCategoriesJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ハンバーガー'
	String get burger => 'ハンバーガー';

	/// ja: '寿司'
	String get sushi => '寿司';

	/// ja: 'ピザ'
	String get pizza => 'ピザ';

	/// ja: 'ラーメン'
	String get ramen => 'ラーメン';

	/// ja: 'カレー'
	String get curry => 'カレー';
}

// Path: items
class TranslationsItemsJa {
	TranslationsItemsJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsItemsBurgerJa burger = TranslationsItemsBurgerJa.internal(_root);
	late final TranslationsItemsSushiJa sushi = TranslationsItemsSushiJa.internal(_root);
	late final TranslationsItemsPizzaJa pizza = TranslationsItemsPizzaJa.internal(_root);
	late final TranslationsItemsRamenJa ramen = TranslationsItemsRamenJa.internal(_root);
	late final TranslationsItemsCurryJa curry = TranslationsItemsCurryJa.internal(_root);
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ横スクロールでカテゴリが見つかるとわかった？'
	String get title => 'なぜ横スクロールでカテゴリが見つかるとわかった？';

	/// ja: '横スクロールで隠れたコンテンツを探す'
	String get subtitle => '横スクロールで隠れたコンテンツを探す';

	/// ja: '横スクロールで探す'
	String get scrollTitle => '横スクロールで探す';

	/// ja: '画面に収まりきらないカテゴリは横スクロールで確認できる。アイコン列の端が少し見えることで『続きがある』と伝わる設計。'
	String get scrollDesc => '画面に収まりきらないカテゴリは横スクロールで確認できる。アイコン列の端が少し見えることで『続きがある』と伝わる設計。';

	/// ja: 'カテゴリアイコン'
	String get iconTitle => 'カテゴリアイコン';

	/// ja: '丸いアイコンはカテゴリを表す。タップで該当カテゴリの商品が絞り込まれる。'
	String get iconDesc => '丸いアイコンはカテゴリを表す。タップで該当カテゴリの商品が絞り込まれる。';

	/// ja: 'アフォーダンス'
	String get affordanceTitle => 'アフォーダンス';

	/// ja: '画面の端からはみ出したアイコンが『横スクロール可能』であることを示すアフォーダンス（操作のヒント）になっている。'
	String get affordanceDesc => '画面の端からはみ出したアイコンが『横スクロール可能』であることを示すアフォーダンス（操作のヒント）になっている。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ＋ボタンで個数が増えるとわかった？'
	String get title => 'なぜ＋ボタンで個数が増えるとわかった？';

	/// ja: 'ステッパーUIで数量を調整する'
	String get subtitle => 'ステッパーUIで数量を調整する';

	/// ja: 'ステッパーUI'
	String get stepperTitle => 'ステッパーUI';

	/// ja: '「−」「数字」「＋」が並んだコントロールをステッパーという。左で減らし、右で増やす直感的なUI。'
	String get stepperDesc => '「−」「数字」「＋」が並んだコントロールをステッパーという。左で減らし、右で増やす直感的なUI。';

	/// ja: '最小値の制限'
	String get minTitle => '最小値の制限';

	/// ja: '0個以下にはならないよう最小値が設定されている。注文が1個未満にならない実用的な制御。'
	String get minDesc => '0個以下にはならないよう最小値が設定されている。注文が1個未満にならない実用的な制御。';

	/// ja: '即時フィードバック'
	String get feedbackTitle => '即時フィードバック';

	/// ja: 'ボタンを押すたびに数字が変わり、合計金額も即時に更新される。ユーザーの操作が反映されていることを視覚的に伝える。'
	String get feedbackDesc => 'ボタンを押すたびに数字が変わり、合計金額も即時に更新される。ユーザーの操作が反映されていることを視覚的に伝える。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ下部のボタンがカートだとわかった？'
	String get title => 'なぜ下部のボタンがカートだとわかった？';

	/// ja: 'フローティングアクションボタンで次のステップへ'
	String get subtitle => 'フローティングアクションボタンで次のステップへ';

	/// ja: 'フローティングカートボタン'
	String get fabTitle => 'フローティングカートボタン';

	/// ja: '画面下部に常に表示される目立つボタン。合計金額を表示することで「今すぐ購入できる」状態を伝える。'
	String get fabDesc => '画面下部に常に表示される目立つボタン。合計金額を表示することで「今すぐ購入できる」状態を伝える。';

	/// ja: '合計金額の表示'
	String get priceTitle => '合計金額の表示';

	/// ja: '選択中の商品と個数から自動計算された合計金額がボタンに表示される。購入前に金額を確認できる安心設計。'
	String get priceDesc => '選択中の商品と個数から自動計算された合計金額がボタンに表示される。購入前に金額を確認できる安心設計。';

	/// ja: '主要アクションの強調'
	String get actionTitle => '主要アクションの強調';

	/// ja: '最も重要なアクション（カートへ進む）を画面下部に大きく配置することで、ユーザーが次に何をすべきかを明確に示す。'
	String get actionDesc => '最も重要なアクション（カートへ進む）を画面下部に大きく配置することで、ユーザーが次に何をすべきかを明確に示す。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜシートを引き上げると地図が広がるとわかった？'
	String get title => 'なぜシートを引き上げると地図が広がるとわかった？';

	/// ja: 'ドラッグ可能なボトムシートで情報を展開する'
	String get subtitle => 'ドラッグ可能なボトムシートで情報を展開する';

	/// ja: 'ドラッグ可能なボトムシート'
	String get sheetTitle => 'ドラッグ可能なボトムシート';

	/// ja: '画面下部から上に引き上げられるシートをドラッガブルボトムシートという。地図と詳細情報を同時に表示しながら、どちらを優先するか調整できる。'
	String get sheetDesc => '画面下部から上に引き上げられるシートをドラッガブルボトムシートという。地図と詳細情報を同時に表示しながら、どちらを優先するか調整できる。';

	/// ja: 'ハンドルバー'
	String get handleTitle => 'ハンドルバー';

	/// ja: 'シート上部の横棒（ハンドル）が『掴んで動かせる』ことを示すアフォーダンス。ユーザーに操作可能であることを直感的に伝える。'
	String get handleDesc => 'シート上部の横棒（ハンドル）が『掴んで動かせる』ことを示すアフォーダンス。ユーザーに操作可能であることを直感的に伝える。';

	/// ja: '全画面展開'
	String get expandTitle => '全画面展開';

	/// ja: 'シートを最大まで引き上げると全画面になり、配達員の詳細情報が確認できる。地図表示との切り替えを片手でスムーズに行える設計。'
	String get expandDesc => 'シートを最大まで引き上げると全画面になり、配達員の詳細情報が確認できる。地図表示との切り替えを片手でスムーズに行える設計。';
}

// Path: items.burger
class TranslationsItemsBurgerJa {
	TranslationsItemsBurgerJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ハンバーガーセット'
	String get name => 'ハンバーガーセット';

	/// ja: 'ジューシーなビーフパティとフレッシュな野菜のバーガー'
	String get description => 'ジューシーなビーフパティとフレッシュな野菜のバーガー';
}

// Path: items.sushi
class TranslationsItemsSushiJa {
	TranslationsItemsSushiJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'にぎり寿司10貫'
	String get name => 'にぎり寿司10貫';

	/// ja: '鮮度抜群のネタを職人が丁寧に握った本格寿司'
	String get description => '鮮度抜群のネタを職人が丁寧に握った本格寿司';
}

// Path: items.pizza
class TranslationsItemsPizzaJa {
	TranslationsItemsPizzaJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'マルゲリータピザ'
	String get name => 'マルゲリータピザ';

	/// ja: 'モッツァレラチーズとフレッシュバジルのシンプルな逸品'
	String get description => 'モッツァレラチーズとフレッシュバジルのシンプルな逸品';
}

// Path: items.ramen
class TranslationsItemsRamenJa {
	TranslationsItemsRamenJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '醤油ラーメン'
	String get name => '醤油ラーメン';

	/// ja: '豚骨と鶏ガラのダブルスープに醤油タレを合わせた一杯'
	String get description => '豚骨と鶏ガラのダブルスープに醤油タレを合わせた一杯';
}

// Path: items.curry
class TranslationsItemsCurryJa {
	TranslationsItemsCurryJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'チキンカレー'
	String get name => 'チキンカレー';

	/// ja: 'スパイス香るまろやかなバターチキンカレーとライス'
	String get description => 'スパイス香るまろやかなバターチキンカレーとライス';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '今日はピザの気分！カテゴリ一覧からピザを探そう',
			'quiz1.insight.title' => 'なぜ横スクロールでカテゴリが見つかるとわかった？',
			'quiz1.insight.subtitle' => '横スクロールで隠れたコンテンツを探す',
			'quiz1.insight.scrollTitle' => '横スクロールで探す',
			'quiz1.insight.scrollDesc' => '画面に収まりきらないカテゴリは横スクロールで確認できる。アイコン列の端が少し見えることで『続きがある』と伝わる設計。',
			'quiz1.insight.iconTitle' => 'カテゴリアイコン',
			'quiz1.insight.iconDesc' => '丸いアイコンはカテゴリを表す。タップで該当カテゴリの商品が絞り込まれる。',
			'quiz1.insight.affordanceTitle' => 'アフォーダンス',
			'quiz1.insight.affordanceDesc' => '画面の端からはみ出したアイコンが『横スクロール可能』であることを示すアフォーダンス（操作のヒント）になっている。',
			'quiz2.missionText' => '友達の分も頼もう。注文数を2つに増やして',
			'quiz2.insight.title' => 'なぜ＋ボタンで個数が増えるとわかった？',
			'quiz2.insight.subtitle' => 'ステッパーUIで数量を調整する',
			'quiz2.insight.stepperTitle' => 'ステッパーUI',
			'quiz2.insight.stepperDesc' => '「−」「数字」「＋」が並んだコントロールをステッパーという。左で減らし、右で増やす直感的なUI。',
			'quiz2.insight.minTitle' => '最小値の制限',
			'quiz2.insight.minDesc' => '0個以下にはならないよう最小値が設定されている。注文が1個未満にならない実用的な制御。',
			'quiz2.insight.feedbackTitle' => '即時フィードバック',
			'quiz2.insight.feedbackDesc' => 'ボタンを押すたびに数字が変わり、合計金額も即時に更新される。ユーザーの操作が反映されていることを視覚的に伝える。',
			'quiz3.missionText' => '注文内容が決まったら、カートの中身を確認しよう',
			'quiz3.insight.title' => 'なぜ下部のボタンがカートだとわかった？',
			'quiz3.insight.subtitle' => 'フローティングアクションボタンで次のステップへ',
			'quiz3.insight.fabTitle' => 'フローティングカートボタン',
			'quiz3.insight.fabDesc' => '画面下部に常に表示される目立つボタン。合計金額を表示することで「今すぐ購入できる」状態を伝える。',
			'quiz3.insight.priceTitle' => '合計金額の表示',
			'quiz3.insight.priceDesc' => '選択中の商品と個数から自動計算された合計金額がボタンに表示される。購入前に金額を確認できる安心設計。',
			'quiz3.insight.actionTitle' => '主要アクションの強調',
			'quiz3.insight.actionDesc' => '最も重要なアクション（カートへ進む）を画面下部に大きく配置することで、ユーザーが次に何をすべきかを明確に示す。',
			'quiz4.missionText' => '配達員さんは今どこかな？地図を全画面に広げて確認しよう',
			'quiz4.insight.title' => 'なぜシートを引き上げると地図が広がるとわかった？',
			'quiz4.insight.subtitle' => 'ドラッグ可能なボトムシートで情報を展開する',
			'quiz4.insight.sheetTitle' => 'ドラッグ可能なボトムシート',
			'quiz4.insight.sheetDesc' => '画面下部から上に引き上げられるシートをドラッガブルボトムシートという。地図と詳細情報を同時に表示しながら、どちらを優先するか調整できる。',
			'quiz4.insight.handleTitle' => 'ハンドルバー',
			'quiz4.insight.handleDesc' => 'シート上部の横棒（ハンドル）が『掴んで動かせる』ことを示すアフォーダンス。ユーザーに操作可能であることを直感的に伝える。',
			'quiz4.insight.expandTitle' => '全画面展開',
			'quiz4.insight.expandDesc' => 'シートを最大まで引き上げると全画面になり、配達員の詳細情報が確認できる。地図表示との切り替えを片手でスムーズに行える設計。',
			'common.appTitle' => 'フードデリバリー',
			'common.searchHint' => 'お店・メニューを探す',
			'common.categories' => 'カテゴリー',
			'common.itemName' => 'ハンバーガーセット',
			'common.itemDescription' => 'ジューシーなビーフパティとフレッシュな野菜のバーガー',
			'common.itemPrice' => '¥890',
			'common.itemPriceValue' => '890',
			'common.cartButton' => 'カートを確認 ¥{total}',
			'common.trackingTitle' => '配達状況',
			'common.courierName' => '配達員: ナントム',
			'common.courierStatus' => 'まもなく到着します',
			'common.estimatedTime' => '到着予定: 約10分',
			'common.orderItems' => '注文内容',
			'common.orderTotal' => '合計: ¥{total}',
			'categories.burger' => 'ハンバーガー',
			'categories.sushi' => '寿司',
			'categories.pizza' => 'ピザ',
			'categories.ramen' => 'ラーメン',
			'categories.curry' => 'カレー',
			'items.burger.name' => 'ハンバーガーセット',
			'items.burger.description' => 'ジューシーなビーフパティとフレッシュな野菜のバーガー',
			'items.sushi.name' => 'にぎり寿司10貫',
			'items.sushi.description' => '鮮度抜群のネタを職人が丁寧に握った本格寿司',
			'items.pizza.name' => 'マルゲリータピザ',
			'items.pizza.description' => 'モッツァレラチーズとフレッシュバジルのシンプルな逸品',
			'items.ramen.name' => '醤油ラーメン',
			'items.ramen.description' => '豚骨と鶏ガラのダブルスープに醤油タレを合わせた一杯',
			'items.curry.name' => 'チキンカレー',
			'items.curry.description' => 'スパイス香るまろやかなバターチキンカレーとライス',
			_ => null,
		};
	}
}
