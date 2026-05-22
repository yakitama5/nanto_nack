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
	@override late final _TranslationsCategoriesJa categories = _TranslationsCategoriesJa._(_root);
	@override late final _TranslationsItemsJa items = _TranslationsItemsJa._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Ja implements TranslationsQuiz1En {
	_TranslationsQuiz1Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '今日はピザの気分！カテゴリ一覧からピザを探そう';
	@override late final _TranslationsQuiz1InsightJa insight = _TranslationsQuiz1InsightJa._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Ja implements TranslationsQuiz2En {
	_TranslationsQuiz2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '友達の分も頼もう。注文数を2つに増やして';
	@override late final _TranslationsQuiz2InsightJa insight = _TranslationsQuiz2InsightJa._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Ja implements TranslationsQuiz3En {
	_TranslationsQuiz3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '注文内容が決まったら、カートの中身を確認しよう';
	@override late final _TranslationsQuiz3InsightJa insight = _TranslationsQuiz3InsightJa._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Ja implements TranslationsQuiz4En {
	_TranslationsQuiz4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '配達員さんは今どこかな？地図を全画面に広げて確認しよう';
	@override late final _TranslationsQuiz4InsightJa insight = _TranslationsQuiz4InsightJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'フードデリバリー';
	@override String get searchHint => 'お店・メニューを探す';
	@override String get categories => 'カテゴリー';
	@override String get itemName => 'ハンバーガーセット';
	@override String get itemDescription => 'ジューシーなビーフパティとフレッシュな野菜のバーガー';
	@override String get itemPrice => '¥890';
	@override String get itemPriceValue => '890';
	@override String get cartButton => 'カートを確認 ¥{total}';
	@override String get trackingTitle => '配達状況';
	@override String get courierName => '配達員: ナントム';
	@override String get courierStatus => 'まもなく到着します';
	@override String get estimatedTime => '到着予定: 約10分';
	@override String get orderItems => '注文内容';
	@override String get orderTotal => '合計: ¥{total}';
}

// Path: categories
class _TranslationsCategoriesJa implements TranslationsCategoriesEn {
	_TranslationsCategoriesJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get burger => 'ハンバーガー';
	@override String get sushi => '寿司';
	@override String get pizza => 'ピザ';
	@override String get ramen => 'ラーメン';
	@override String get curry => 'カレー';
}

// Path: items
class _TranslationsItemsJa implements TranslationsItemsEn {
	_TranslationsItemsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsItemsBurgerJa burger = _TranslationsItemsBurgerJa._(_root);
	@override late final _TranslationsItemsSushiJa sushi = _TranslationsItemsSushiJa._(_root);
	@override late final _TranslationsItemsPizzaJa pizza = _TranslationsItemsPizzaJa._(_root);
	@override late final _TranslationsItemsRamenJa ramen = _TranslationsItemsRamenJa._(_root);
	@override late final _TranslationsItemsCurryJa curry = _TranslationsItemsCurryJa._(_root);
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightJa implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ横スクロールでカテゴリが見つかるとわかった？';
	@override String get subtitle => '横スクロールで隠れたコンテンツを探す';
	@override String get scrollTitle => '横スクロールで探す';
	@override String get scrollDesc => '画面に収まりきらないカテゴリは横スクロールで確認できる。アイコン列の端が少し見えることで『続きがある』と伝わる設計。';
	@override String get iconTitle => 'カテゴリアイコン';
	@override String get iconDesc => '丸いアイコンはカテゴリを表す。タップで該当カテゴリの商品が絞り込まれる。';
	@override String get affordanceTitle => 'アフォーダンス';
	@override String get affordanceDesc => '画面の端からはみ出したアイコンが『横スクロール可能』であることを示すアフォーダンス（操作のヒント）になっている。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightJa implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ＋ボタンで個数が増えるとわかった？';
	@override String get subtitle => 'ステッパーUIで数量を調整する';
	@override String get stepperTitle => 'ステッパーUI';
	@override String get stepperDesc => '「−」「数字」「＋」が並んだコントロールをステッパーという。左で減らし、右で増やす直感的なUI。';
	@override String get minTitle => '最小値の制限';
	@override String get minDesc => '0個以下にはならないよう最小値が設定されている。注文が1個未満にならない実用的な制御。';
	@override String get feedbackTitle => '即時フィードバック';
	@override String get feedbackDesc => 'ボタンを押すたびに数字が変わり、合計金額も即時に更新される。ユーザーの操作が反映されていることを視覚的に伝える。';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightJa implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ下部のボタンがカートだとわかった？';
	@override String get subtitle => 'フローティングアクションボタンで次のステップへ';
	@override String get fabTitle => 'フローティングカートボタン';
	@override String get fabDesc => '画面下部に常に表示される目立つボタン。合計金額を表示することで「今すぐ購入できる」状態を伝える。';
	@override String get priceTitle => '合計金額の表示';
	@override String get priceDesc => '選択中の商品と個数から自動計算された合計金額がボタンに表示される。購入前に金額を確認できる安心設計。';
	@override String get actionTitle => '主要アクションの強調';
	@override String get actionDesc => '最も重要なアクション（カートへ進む）を画面下部に大きく配置することで、ユーザーが次に何をすべきかを明確に示す。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightJa implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜシートを引き上げると地図が広がるとわかった？';
	@override String get subtitle => 'ドラッグ可能なボトムシートで情報を展開する';
	@override String get sheetTitle => 'ドラッグ可能なボトムシート';
	@override String get sheetDesc => '画面下部から上に引き上げられるシートをドラッガブルボトムシートという。地図と詳細情報を同時に表示しながら、どちらを優先するか調整できる。';
	@override String get handleTitle => 'ハンドルバー';
	@override String get handleDesc => 'シート上部の横棒（ハンドル）が『掴んで動かせる』ことを示すアフォーダンス。ユーザーに操作可能であることを直感的に伝える。';
	@override String get expandTitle => '全画面展開';
	@override String get expandDesc => 'シートを最大まで引き上げると全画面になり、配達員の詳細情報が確認できる。地図表示との切り替えを片手でスムーズに行える設計。';
}

// Path: items.burger
class _TranslationsItemsBurgerJa implements TranslationsItemsBurgerEn {
	_TranslationsItemsBurgerJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'ハンバーガーセット';
	@override String get description => 'ジューシーなビーフパティとフレッシュな野菜のバーガー';
}

// Path: items.sushi
class _TranslationsItemsSushiJa implements TranslationsItemsSushiEn {
	_TranslationsItemsSushiJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'にぎり寿司10貫';
	@override String get description => '鮮度抜群のネタを職人が丁寧に握った本格寿司';
}

// Path: items.pizza
class _TranslationsItemsPizzaJa implements TranslationsItemsPizzaEn {
	_TranslationsItemsPizzaJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'マルゲリータピザ';
	@override String get description => 'モッツァレラチーズとフレッシュバジルのシンプルな逸品';
}

// Path: items.ramen
class _TranslationsItemsRamenJa implements TranslationsItemsRamenEn {
	_TranslationsItemsRamenJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get name => '醤油ラーメン';
	@override String get description => '豚骨と鶏ガラのダブルスープに醤油タレを合わせた一杯';
}

// Path: items.curry
class _TranslationsItemsCurryJa implements TranslationsItemsCurryEn {
	_TranslationsItemsCurryJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'チキンカレー';
	@override String get description => 'スパイス香るまろやかなバターチキンカレーとライス';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
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
