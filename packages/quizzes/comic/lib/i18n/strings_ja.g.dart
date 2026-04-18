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
}

// Path: quiz1
class TranslationsQuiz1Ja {
	TranslationsQuiz1Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '内容を読み飛ばしてしまった！3ページ戻ろう'
	String get mission => '内容を読み飛ばしてしまった！3ページ戻ろう';

	/// ja: '画面の右端をタップするか、左にスワイプするとページが戻ります'
	String get hint => '画面の右端をタップするか、左にスワイプするとページが戻ります';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'コマの隅の文字が読めない……画面を拡大しよう'
	String get mission => 'コマの隅の文字が読めない……画面を拡大しよう';

	/// ja: '2本指を広げる（ピンチアウト）か、ダブルタップで拡大できます'
	String get hint => '2本指を広げる（ピンチアウト）か、ダブルタップで拡大できます';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '一度読むのをやめよう。メニューを表示させて'
	String get mission => '一度読むのをやめよう。メニューを表示させて';

	/// ja: '画面の中央あたりをタップするとメニューが表示されます'
	String get hint => '画面の中央あたりをタップするとメニューが表示されます';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '面白かった！応援ボタンを10回連打して作者にパワーを送ろう'
	String get mission => '面白かった！応援ボタンを10回連打して作者にパワーを送ろう';

	/// ja: '最終ページの大きなハートボタンを素早く10回タップしましょう'
	String get hint => '最終ページの大きなハートボタンを素早く10回タップしましょう';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '漫画アプリのページ操作'
	String get title => '漫画アプリのページ操作';

	/// ja: '日本の漫画は右開き（右から左へ読む）のため、ページを「戻る」には右側をタップします'
	String get subtitle => '日本の漫画は右開き（右から左へ読む）のため、ページを「戻る」には右側をタップします';

	/// ja: '右端タップ or 左スワイプ'
	String get step1Title => '右端タップ or 左スワイプ';

	/// ja: '画面右端をタップするか、左にスワイプするとページが1枚戻ります'
	String get step1Desc => '画面右端をタップするか、左にスワイプするとページが1枚戻ります';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '拡大・縮小操作'
	String get title => '拡大・縮小操作';

	/// ja: '小さな文字や細かい描写は、ピンチ操作やダブルタップで拡大して読めます'
	String get subtitle => '小さな文字や細かい描写は、ピンチ操作やダブルタップで拡大して読めます';

	/// ja: 'ピンチアウト'
	String get step1Title => 'ピンチアウト';

	/// ja: '2本指を画面上で広げると、漫画を拡大表示できます'
	String get step1Desc => '2本指を画面上で広げると、漫画を拡大表示できます';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'メニューの表示方法'
	String get title => 'メニューの表示方法';

	/// ja: '多くの漫画アプリは、画面中央タップでヘッダー/フッターのメニューを表示します'
	String get subtitle => '多くの漫画アプリは、画面中央タップでヘッダー/フッターのメニューを表示します';

	/// ja: '画面中央タップ'
	String get step1Title => '画面中央タップ';

	/// ja: '画面の中央部分をタップすると、ヘッダーとフッターのメニューが表示されます'
	String get step1Desc => '画面の中央部分をタップすると、ヘッダーとフッターのメニューが表示されます';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '応援・いいね機能'
	String get title => '応援・いいね機能';

	/// ja: '連続タップで気持ちを届ける「連打応援」機能は、多くの漫画アプリに搭載されています'
	String get subtitle => '連続タップで気持ちを届ける「連打応援」機能は、多くの漫画アプリに搭載されています';

	/// ja: '応援ボタンを連打'
	String get step1Title => '応援ボタンを連打';

	/// ja: 'ハートボタンを素早く何度もタップして、作者への応援を送りましょう'
	String get step1Desc => 'ハートボタンを素早く何度もタップして、作者への応援を送りましょう';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.mission' => '内容を読み飛ばしてしまった！3ページ戻ろう',
			'quiz1.hint' => '画面の右端をタップするか、左にスワイプするとページが戻ります',
			'quiz1.insight.title' => '漫画アプリのページ操作',
			'quiz1.insight.subtitle' => '日本の漫画は右開き（右から左へ読む）のため、ページを「戻る」には右側をタップします',
			'quiz1.insight.step1Title' => '右端タップ or 左スワイプ',
			'quiz1.insight.step1Desc' => '画面右端をタップするか、左にスワイプするとページが1枚戻ります',
			'quiz2.mission' => 'コマの隅の文字が読めない……画面を拡大しよう',
			'quiz2.hint' => '2本指を広げる（ピンチアウト）か、ダブルタップで拡大できます',
			'quiz2.insight.title' => '拡大・縮小操作',
			'quiz2.insight.subtitle' => '小さな文字や細かい描写は、ピンチ操作やダブルタップで拡大して読めます',
			'quiz2.insight.step1Title' => 'ピンチアウト',
			'quiz2.insight.step1Desc' => '2本指を画面上で広げると、漫画を拡大表示できます',
			'quiz3.mission' => '一度読むのをやめよう。メニューを表示させて',
			'quiz3.hint' => '画面の中央あたりをタップするとメニューが表示されます',
			'quiz3.insight.title' => 'メニューの表示方法',
			'quiz3.insight.subtitle' => '多くの漫画アプリは、画面中央タップでヘッダー/フッターのメニューを表示します',
			'quiz3.insight.step1Title' => '画面中央タップ',
			'quiz3.insight.step1Desc' => '画面の中央部分をタップすると、ヘッダーとフッターのメニューが表示されます',
			'quiz4.mission' => '面白かった！応援ボタンを10回連打して作者にパワーを送ろう',
			'quiz4.hint' => '最終ページの大きなハートボタンを素早く10回タップしましょう',
			'quiz4.insight.title' => '応援・いいね機能',
			'quiz4.insight.subtitle' => '連続タップで気持ちを届ける「連打応援」機能は、多くの漫画アプリに搭載されています',
			'quiz4.insight.step1Title' => '応援ボタンを連打',
			'quiz4.insight.step1Desc' => 'ハートボタンを素早く何度もタップして、作者への応援を送りましょう',
			_ => null,
		};
	}
}
