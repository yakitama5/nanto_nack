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
}

// Path: quiz1
class _TranslationsQuiz1Xx extends TranslationsQuiz1Ja {
	_TranslationsQuiz1Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get mission => '内容を読み飛ばしてしまった！3ページ戻ろう';
	@override String get hint => '画面の右端をタップするか、左にスワイプするとページが戻ります';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get mission => 'コマの隅の文字が読めない……画面を拡大しよう';
	@override String get hint => '2本指を広げる（ピンチアウト）か、ダブルタップで拡大できます';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get mission => '一度読むのをやめよう。メニューを表示させて';
	@override String get hint => '画面の中央あたりをタップするとメニューが表示されます';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get mission => '面白かった！応援ボタンを10回連打して作者にパワーを送ろう';
	@override String get hint => '最終ページの大きなハートボタンを素早く10回タップしましょう';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => '漫画アプリのページ操作';
	@override String get subtitle => '日本の漫画は右開き（右から左へ読む）のため、ページを「戻る」には右側をタップします';
	@override String get step1Title => '右端タップ or 左スワイプ';
	@override String get step1Desc => '画面右端をタップするか、左にスワイプするとページが1枚戻ります';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => '拡大・縮小操作';
	@override String get subtitle => '小さな文字や細かい描写は、ピンチ操作やダブルタップで拡大して読めます';
	@override String get step1Title => 'ピンチアウト';
	@override String get step1Desc => '2本指を画面上で広げると、漫画を拡大表示できます';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'メニューの表示方法';
	@override String get subtitle => '多くの漫画アプリは、画面中央タップでヘッダー/フッターのメニューを表示します';
	@override String get step1Title => '画面中央タップ';
	@override String get step1Desc => '画面の中央部分をタップすると、ヘッダーとフッターのメニューが表示されます';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => '応援・いいね機能';
	@override String get subtitle => '連続タップで気持ちを届ける「連打応援」機能は、多くの漫画アプリに搭載されています';
	@override String get step1Title => '応援ボタンを連打';
	@override String get step1Desc => 'ハートボタンを素早く何度もタップして、作者への応援を送りましょう';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
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
