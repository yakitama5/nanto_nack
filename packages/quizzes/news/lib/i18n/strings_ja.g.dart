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
}

// Path: quiz1
class TranslationsQuiz1Ja {
	TranslationsQuiz1Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ニュースを最新の状態に更新しよう'
	String get missionText => 'ニュースを最新の状態に更新しよう';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '『スポーツ』カテゴリのトップニュースを確認しよう'
	String get missionText => '『スポーツ』カテゴリのトップニュースを確認しよう';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'この記事の文字が小さくて読みづらい……文字サイズを『大』に変更しよう'
	String get missionText => 'この記事の文字が小さくて読みづらい……文字サイズを『大』に変更しよう';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ネタバレを含んでいる『映画のレビュー』記事を一覧から非表示にしよう'
	String get missionText => 'ネタバレを含んでいる『映画のレビュー』記事を一覧から非表示にしよう';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ニュース'
	String get appTitle => 'ニュース';

	/// ja: '主要'
	String get tabTop => '主要';

	/// ja: 'エンタメ'
	String get tabEntertainment => 'エンタメ';

	/// ja: 'スポーツ'
	String get tabSports => 'スポーツ';

	/// ja: '記事がありません'
	String get noArticles => '記事がありません';

	/// ja: 'この記事を非表示にする'
	String get hideArticle => 'この記事を非表示にする';

	/// ja: '文字サイズ'
	String get fontSizeLabel => '文字サイズ';

	/// ja: '小'
	String get fontSizeSmall => '小';

	/// ja: '中'
	String get fontSizeMedium => '中';

	/// ja: '大'
	String get fontSizeLarge => '大';

	/// ja: 'その他のオプション'
	String get moreOptions => 'その他のオプション';

	/// ja: '記事詳細'
	String get articleDetailTitle => '記事詳細';

	/// ja: 'ネタバレ注意'
	String get spoilerLabel => 'ネタバレ注意';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ引っ張ることでニュースが更新できるとわかった？'
	String get title => 'なぜ引っ張ることでニュースが更新できるとわかった？';

	/// ja: '下への引っ張りは『更新』の世界標準ジェスチャー'
	String get subtitle => '下への引っ張りは『更新』の世界標準ジェスチャー';

	/// ja: 'Pull to Refresh（引っ張って更新）'
	String get pullTitle => 'Pull to Refresh（引っ張って更新）';

	/// ja: 'スマホアプリで一覧画面を下に引っ張る操作は、Twitterやメールアプリで定番化した更新ジェスチャー。世界中のアプリに採用されている。'
	String get pullDesc => 'スマホアプリで一覧画面を下に引っ張る操作は、Twitterやメールアプリで定番化した更新ジェスチャー。世界中のアプリに採用されている。';

	/// ja: 'くるくる回転＝読み込み中のサイン'
	String get spinnerTitle => 'くるくる回転＝読み込み中のサイン';

	/// ja: '丸いインジケーターが回転するアニメーションは、世界中のアプリで『処理中・読み込み中』を示す共通のビジュアル言語。'
	String get spinnerDesc => '丸いインジケーターが回転するアニメーションは、世界中のアプリで『処理中・読み込み中』を示す共通のビジュアル言語。';

	/// ja: 'フィードは常に最新情報を求めている'
	String get feedTitle => 'フィードは常に最新情報を求めている';

	/// ja: 'ニュース・SNS・メールのような情報フィード画面では、上から下へ引っ張ることで手動更新が発動するよう設計されている。'
	String get feedDesc => 'ニュース・SNS・メールのような情報フィード画面では、上から下へ引っ張ることで手動更新が発動するよう設計されている。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ横にスワイプするとカテゴリが切り替わるとわかった？'
	String get title => 'なぜ横にスワイプするとカテゴリが切り替わるとわかった？';

	/// ja: 'タブは横に並んだページのサイン'
	String get subtitle => 'タブは横に並んだページのサイン';

	/// ja: 'タブUIは横スワイプに対応している'
	String get tabTitle => 'タブUIは横スワイプに対応している';

	/// ja: '上部に並んだタブはカテゴリ分けの目次。横スワイプでページをめくるように切り替えられる設計が標準となっている。'
	String get tabDesc => '上部に並んだタブはカテゴリ分けの目次。横スワイプでページをめくるように切り替えられる設計が標準となっている。';

	/// ja: '指を横に動かす＝ページ送りの直感'
	String get swipeTitle => '指を横に動かす＝ページ送りの直感';

	/// ja: '本をめくるように指を左右に動かすスワイプ操作は、モバイルアプリで最も自然なページ切り替えジェスチャー。'
	String get swipeDesc => '本をめくるように指を左右に動かすスワイプ操作は、モバイルアプリで最も自然なページ切り替えジェスチャー。';

	/// ja: 'タブのラベルが目的のカテゴリを示す'
	String get labelTitle => 'タブのラベルが目的のカテゴリを示す';

	/// ja: '『スポーツ』と書かれたタブをタップするか、そこまでスワイプすれば目的の情報にたどり着ける。'
	String get labelDesc => '『スポーツ』と書かれたタブをタップするか、そこまでスワイプすれば目的の情報にたどり着ける。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ『Aa』アイコンで文字サイズを変えられるとわかった？'
	String get title => 'なぜ『Aa』アイコンで文字サイズを変えられるとわかった？';

	/// ja: 'Aaはフォント設定の世界共通アイコン'
	String get subtitle => 'Aaはフォント設定の世界共通アイコン';

	/// ja: '『Aa』は文字サイズ変更の世界標準アイコン'
	String get aaTitle => '『Aa』は文字サイズ変更の世界標準アイコン';

	/// ja: '大文字Aと小文字aを並べたアイコンは、フォントサイズや表示設定を意味する記号として世界中のブラウザ・アプリで採用されている。'
	String get aaDesc => '大文字Aと小文字aを並べたアイコンは、フォントサイズや表示設定を意味する記号として世界中のブラウザ・アプリで採用されている。';

	/// ja: 'アクセシビリティとユーザー設定'
	String get accessTitle => 'アクセシビリティとユーザー設定';

	/// ja: '文字が小さくて読みづらいと感じたとき、視認性を自分で調整できる機能が多くのアプリに搭載されている。'
	String get accessDesc => '文字が小さくて読みづらいと感じたとき、視認性を自分で調整できる機能が多くのアプリに搭載されている。';

	/// ja: '小・中・大の3段階が定番'
	String get sizeTitle => '小・中・大の3段階が定番';

	/// ja: 'フォントサイズの選択肢は『小・中・大』の3段階が基本。ユーザーが好みや視力に合わせて選べる設計が標準となっている。'
	String get sizeDesc => 'フォントサイズの選択肢は『小・中・大』の3段階が基本。ユーザーが好みや視力に合わせて選べる設計が標準となっている。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ長押しすると非表示にできるとわかった？'
	String get title => 'なぜ長押しすると非表示にできるとわかった？';

	/// ja: '長押しは隠れたオプションを呼び出すジェスチャー'
	String get subtitle => '長押しは隠れたオプションを呼び出すジェスチャー';

	/// ja: '長押し＝追加メニューを開くジェスチャー'
	String get longPressTitle => '長押し＝追加メニューを開くジェスチャー';

	/// ja: 'アイコンや項目を長押しすることで追加オプションが表示されるのは、AndroidとiOS両方に共通するインタラクションパターン。'
	String get longPressDesc => 'アイコンや項目を長押しすることで追加オプションが表示されるのは、AndroidとiOS両方に共通するインタラクションパターン。';

	/// ja: '『…』アイコンは隠れた操作のサイン'
	String get menuTitle => '『…』アイコンは隠れた操作のサイン';

	/// ja: '三点リーダー（…）または縦三点アイコンは『その他のオプション』を示す世界共通のUI記号。タップすることでメニューが展開される。'
	String get menuDesc => '三点リーダー（…）または縦三点アイコンは『その他のオプション』を示す世界共通のUI記号。タップすることでメニューが展開される。';

	/// ja: '非表示機能で情報をコントロール'
	String get hideTitle => '非表示機能で情報をコントロール';

	/// ja: '見たくない記事や通知を個別に非表示にできる機能は、現代のニュースアプリやSNSの標準機能。自分のフィードを自分でカスタマイズできる。'
	String get hideDesc => '見たくない記事や通知を個別に非表示にできる機能は、現代のニュースアプリやSNSの標準機能。自分のフィードを自分でカスタマイズできる。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
			'common.spoilerLabel' => 'ネタバレ注意',
			_ => null,
		};
	}
}
