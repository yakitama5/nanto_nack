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
	@override String get missionText => 'ニュースを最新の状態に更新しよう';
	@override late final _TranslationsQuiz1InsightJa insight = _TranslationsQuiz1InsightJa._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Ja implements TranslationsQuiz2En {
	_TranslationsQuiz2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '『スポーツ』カテゴリのトップニュースを確認しよう';
	@override late final _TranslationsQuiz2InsightJa insight = _TranslationsQuiz2InsightJa._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Ja implements TranslationsQuiz3En {
	_TranslationsQuiz3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'この記事の文字が小さくて読みづらい……文字サイズを『大』に変更しよう';
	@override late final _TranslationsQuiz3InsightJa insight = _TranslationsQuiz3InsightJa._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Ja implements TranslationsQuiz4En {
	_TranslationsQuiz4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'ネタバレを含んでいる『映画のレビュー』記事を一覧から非表示にしよう';
	@override late final _TranslationsQuiz4InsightJa insight = _TranslationsQuiz4InsightJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'ニュース';
	@override String get tabTop => '主要';
	@override String get tabEntertainment => 'エンタメ';
	@override String get tabSports => 'スポーツ';
	@override String get noArticles => '記事がありません';
	@override String get hideArticle => 'この記事を非表示にする';
	@override String get fontSizeLabel => '文字サイズ';
	@override String get fontSizeSmall => '小';
	@override String get fontSizeMedium => '中';
	@override String get fontSizeLarge => '大';
	@override String get moreOptions => 'その他のオプション';
	@override String get articleDetailTitle => '記事詳細';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightJa implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ引っ張ることでニュースが更新できるとわかった？';
	@override String get subtitle => '下への引っ張りは『更新』の世界標準ジェスチャー';
	@override String get pullTitle => 'Pull to Refresh（引っ張って更新）';
	@override String get pullDesc => 'スマホアプリで一覧画面を下に引っ張る操作は、Twitterやメールアプリで定番化した更新ジェスチャー。世界中のアプリに採用されている。';
	@override String get spinnerTitle => 'くるくる回転＝読み込み中のサイン';
	@override String get spinnerDesc => '丸いインジケーターが回転するアニメーションは、世界中のアプリで『処理中・読み込み中』を示す共通のビジュアル言語。';
	@override String get feedTitle => 'フィードは常に最新情報を求めている';
	@override String get feedDesc => 'ニュース・SNS・メールのような情報フィード画面では、上から下へ引っ張ることで手動更新が発動するよう設計されている。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightJa implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ横にスワイプするとカテゴリが切り替わるとわかった？';
	@override String get subtitle => 'タブは横に並んだページのサイン';
	@override String get tabTitle => 'タブUIは横スワイプに対応している';
	@override String get tabDesc => '上部に並んだタブはカテゴリ分けの目次。横スワイプでページをめくるように切り替えられる設計が標準となっている。';
	@override String get swipeTitle => '指を横に動かす＝ページ送りの直感';
	@override String get swipeDesc => '本をめくるように指を左右に動かすスワイプ操作は、モバイルアプリで最も自然なページ切り替えジェスチャー。';
	@override String get labelTitle => 'タブのラベルが目的のカテゴリを示す';
	@override String get labelDesc => '『スポーツ』と書かれたタブをタップするか、そこまでスワイプすれば目的の情報にたどり着ける。';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightJa implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ『Aa』アイコンで文字サイズを変えられるとわかった？';
	@override String get subtitle => 'Aaはフォント設定の世界共通アイコン';
	@override String get aaTitle => '『Aa』は文字サイズ変更の世界標準アイコン';
	@override String get aaDesc => '大文字Aと小文字aを並べたアイコンは、フォントサイズや表示設定を意味する記号として世界中のブラウザ・アプリで採用されている。';
	@override String get accessTitle => 'アクセシビリティとユーザー設定';
	@override String get accessDesc => '文字が小さくて読みづらいと感じたとき、視認性を自分で調整できる機能が多くのアプリに搭載されている。';
	@override String get sizeTitle => '小・中・大の3段階が定番';
	@override String get sizeDesc => 'フォントサイズの選択肢は『小・中・大』の3段階が基本。ユーザーが好みや視力に合わせて選べる設計が標準となっている。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightJa implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ長押しすると非表示にできるとわかった？';
	@override String get subtitle => '長押しは隠れたオプションを呼び出すジェスチャー';
	@override String get longPressTitle => '長押し＝追加メニューを開くジェスチャー';
	@override String get longPressDesc => 'アイコンや項目を長押しすることで追加オプションが表示されるのは、AndroidとiOS両方に共通するインタラクションパターン。';
	@override String get menuTitle => '『…』アイコンは隠れた操作のサイン';
	@override String get menuDesc => '三点リーダー（…）または縦三点アイコンは『その他のオプション』を示す世界共通のUI記号。タップすることでメニューが展開される。';
	@override String get hideTitle => '非表示機能で情報をコントロール';
	@override String get hideDesc => '見たくない記事や通知を個別に非表示にできる機能は、現代のニュースアプリやSNSの標準機能。自分のフィードを自分でカスタマイズできる。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'ニュースを最新の状態に更新しよう',
			'quiz1.insight.title' => 'なぜ引っ張ることでニュースが更新できるとわかった？',
			'quiz1.insight.subtitle' => '下への引っ張りは『更新』の世界標準ジェスチャー',
			'quiz1.insight.pullTitle' => 'Pull to Refresh（引っ張って更新）',
			'quiz1.insight.pullDesc' => 'スマホアプリで一覧画面を下に引っ張る操作は、Twitterやメールアプリで定番化した更新ジェスチャー。世界中のアプリに採用されている。',
			'quiz1.insight.spinnerTitle' => 'くるくる回転＝読み込み中のサイン',
			'quiz1.insight.spinnerDesc' => '丸いインジケーターが回転するアニメーションは、世界中のアプリで『処理中・読み込み中』を示す共通のビジュアル言語。',
			'quiz1.insight.feedTitle' => 'フィードは常に最新情報を求めている',
			'quiz1.insight.feedDesc' => 'ニュース・SNS・メールのような情報フィード画面では、上から下へ引っ張ることで手動更新が発動するよう設計されている。',
			'quiz2.missionText' => '『スポーツ』カテゴリのトップニュースを確認しよう',
			'quiz2.insight.title' => 'なぜ横にスワイプするとカテゴリが切り替わるとわかった？',
			'quiz2.insight.subtitle' => 'タブは横に並んだページのサイン',
			'quiz2.insight.tabTitle' => 'タブUIは横スワイプに対応している',
			'quiz2.insight.tabDesc' => '上部に並んだタブはカテゴリ分けの目次。横スワイプでページをめくるように切り替えられる設計が標準となっている。',
			'quiz2.insight.swipeTitle' => '指を横に動かす＝ページ送りの直感',
			'quiz2.insight.swipeDesc' => '本をめくるように指を左右に動かすスワイプ操作は、モバイルアプリで最も自然なページ切り替えジェスチャー。',
			'quiz2.insight.labelTitle' => 'タブのラベルが目的のカテゴリを示す',
			'quiz2.insight.labelDesc' => '『スポーツ』と書かれたタブをタップするか、そこまでスワイプすれば目的の情報にたどり着ける。',
			'quiz3.missionText' => 'この記事の文字が小さくて読みづらい……文字サイズを『大』に変更しよう',
			'quiz3.insight.title' => 'なぜ『Aa』アイコンで文字サイズを変えられるとわかった？',
			'quiz3.insight.subtitle' => 'Aaはフォント設定の世界共通アイコン',
			'quiz3.insight.aaTitle' => '『Aa』は文字サイズ変更の世界標準アイコン',
			'quiz3.insight.aaDesc' => '大文字Aと小文字aを並べたアイコンは、フォントサイズや表示設定を意味する記号として世界中のブラウザ・アプリで採用されている。',
			'quiz3.insight.accessTitle' => 'アクセシビリティとユーザー設定',
			'quiz3.insight.accessDesc' => '文字が小さくて読みづらいと感じたとき、視認性を自分で調整できる機能が多くのアプリに搭載されている。',
			'quiz3.insight.sizeTitle' => '小・中・大の3段階が定番',
			'quiz3.insight.sizeDesc' => 'フォントサイズの選択肢は『小・中・大』の3段階が基本。ユーザーが好みや視力に合わせて選べる設計が標準となっている。',
			'quiz4.missionText' => 'ネタバレを含んでいる『映画のレビュー』記事を一覧から非表示にしよう',
			'quiz4.insight.title' => 'なぜ長押しすると非表示にできるとわかった？',
			'quiz4.insight.subtitle' => '長押しは隠れたオプションを呼び出すジェスチャー',
			'quiz4.insight.longPressTitle' => '長押し＝追加メニューを開くジェスチャー',
			'quiz4.insight.longPressDesc' => 'アイコンや項目を長押しすることで追加オプションが表示されるのは、AndroidとiOS両方に共通するインタラクションパターン。',
			'quiz4.insight.menuTitle' => '『…』アイコンは隠れた操作のサイン',
			'quiz4.insight.menuDesc' => '三点リーダー（…）または縦三点アイコンは『その他のオプション』を示す世界共通のUI記号。タップすることでメニューが展開される。',
			'quiz4.insight.hideTitle' => '非表示機能で情報をコントロール',
			'quiz4.insight.hideDesc' => '見たくない記事や通知を個別に非表示にできる機能は、現代のニュースアプリやSNSの標準機能。自分のフィードを自分でカスタマイズできる。',
			'common.appTitle' => 'ニュース',
			'common.tabTop' => '主要',
			'common.tabEntertainment' => 'エンタメ',
			'common.tabSports' => 'スポーツ',
			'common.noArticles' => '記事がありません',
			'common.hideArticle' => 'この記事を非表示にする',
			'common.fontSizeLabel' => '文字サイズ',
			'common.fontSizeSmall' => '小',
			'common.fontSizeMedium' => '中',
			'common.fontSizeLarge' => '大',
			'common.moreOptions' => 'その他のオプション',
			'common.articleDetailTitle' => '記事詳細',
			_ => null,
		};
	}
}
