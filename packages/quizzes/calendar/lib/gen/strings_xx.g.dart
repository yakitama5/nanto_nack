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
class TranslationsXx with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsXx({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.xx,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <xx>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsXx _root = this; // ignore: unused_field

	@override 
	TranslationsXx $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsXx(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsQuiz1Xx quiz1 = _TranslationsQuiz1Xx._(_root);
	@override late final _TranslationsQuiz2Xx quiz2 = _TranslationsQuiz2Xx._(_root);
	@override late final _TranslationsQuiz3Xx quiz3 = _TranslationsQuiz3Xx._(_root);
	@override late final _TranslationsQuiz4Xx quiz4 = _TranslationsQuiz4Xx._(_root);
	@override late final _TranslationsCommonXx common = _TranslationsCommonXx._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Xx implements TranslationsQuiz1En {
	_TranslationsQuiz1Xx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => '来月、どんな予定が入っていたか確認しよう';
	@override String get failureReason => 'カレンダーを左にスワイプして翌月を表示してください';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx implements TranslationsQuiz2En {
	_TranslationsQuiz2Xx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => '15日に新しい予定を追加しよう';
	@override String get failureReason => '15日のマスを長押しするか、右下の＋ボタンを使って予定を追加してください';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx implements TranslationsQuiz3En {
	_TranslationsQuiz3Xx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => '「会議」の予定が明日に延期！予定を移動させよう';
	@override String get failureReason => '「会議」の予定ブロックを長押しして掴み、翌日のマスへドラッグ＆ドロップしてください';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx implements TranslationsQuiz4En {
	_TranslationsQuiz4Xx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => '迷子になっちゃった！一瞬で「今日」に戻ろう';
	@override String get failureReason => 'AppBarのカレンダーアイコン（今日）ボタンをタップしてください';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx implements TranslationsCommonEn {
	_TranslationsCommonXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Clndr';
	@override String get today => 'Tdy';
	@override String get add => 'Add';
	@override String get save => 'Sv';
	@override String get cancel => 'Cnc';
	@override String get newEvent => 'Nw Evnt';
	@override String get eventTitle => 'Evnt Ttl';
	@override String get addEventTitle => 'Add Evnt';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ来月が確認できた？';
	@override String get subtitle => '横スワイプで月を切り替えるのは直感操作';
	@override String get swipeTitle => '横スワイプは「ページ送り」の定番ジェスチャー';
	@override String get swipeDesc => 'カレンダーアプリでは左にスワイプすると次の月、右にスワイプすると前の月に切り替わる。この操作はほぼすべてのカレンダーアプリで共通している。';
	@override String get calendarTitle => 'カレンダーは「月単位」で管理される';
	@override String get calendarDesc => 'スマートフォンのカレンダーアプリは月をまたいだスクロールではなく、月単位でスワイプして切り替えるUI設計が主流となっている。';
	@override String get gestureTitle => '見えないUIも操作できる';
	@override String get gestureDesc => '画面に「次の月へ」ボタンがなくても、スワイプジェスチャーで操作できる。これがスマートフォンのUI設計の特徴の一つ。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ長押しで追加できた？';
	@override String get subtitle => '長押し＝隠れた操作メニューを呼び出す';
	@override String get longPressTitle => '長押しは「コンテキストメニュー」を開く';
	@override String get longPressDesc => 'カレンダーの日付を長押しすると、その日の予定を直接追加できる。これは多くのカレンダーアプリで採用されている隠れた便利機能。';
	@override String get fabTitle => '＋ボタンは新規作成の万国共通語';
	@override String get fabDesc => '右下の＋（プラス）ボタンは「新しいものを作成する」という意味のUIパターンとして、Google系アプリを中心に世界標準となっている。';
	@override String get addTitle => '2つの操作経路が存在する';
	@override String get addDesc => 'カレンダーへの予定追加は「日付を長押し」と「＋ボタンをタップ」の2種類の方法がある。使い方を知ることで操作の選択肢が広がる。';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜドラッグで予定を移動できた？';
	@override String get subtitle => '長押し＆ドラッグで予定を直感的に移動';
	@override String get dragTitle => '長押しドラッグは「掴んで移動」の定番操作';
	@override String get dragDesc => 'リスト項目や予定ブロックを長押しして「掴む」感覚でドラッグするUIは、iOS・Androidのカレンダーアプリ・タスクアプリで広く採用されている。';
	@override String get dropTitle => 'ドロップした場所に「移動」される';
	@override String get dropDesc => 'ドラッグした要素を目的の場所で離す（ドロップする）と、その位置に内容が移動する。これがドラッグ&ドロップ操作の本質。';
	@override String get intuitionTitle => '視覚的な直感と一致する操作';
	@override String get intuitionDesc => '「移動したいなら引っ張ればいい」という直感通りに機能するUIは、ユーザーの認知負荷を下げる優れたデザイン。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightXx._(this._root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜすぐに「今日」に戻れた？';
	@override String get subtitle => '「今日」ボタンは迷子を救う機能';
	@override String get todayTitle => '「今日」ボタンはカレンダーの必須機能';
	@override String get todayDesc => 'カレンダーアプリには「今日の日付にジャンプする」専用のボタンが存在する。遠い月まで移動しても一瞬で戻れる便利な機能。';
	@override String get iconTitle => 'カレンダーアイコン＝今日へ戻る';
	@override String get iconDesc => 'AppBarに表示されたカレンダーアイコンは「今日の日付を表示する」という意味を持つ。アイコンのデザインで機能を伝える典型例。';
	@override String get jumpTitle => 'スクロールより「ジャンプ」が効率的';
	@override String get jumpDesc => '数年後の未来や過去から現在に戻るとき、スワイプで一枚ずつ戻るより専用ボタンで直接ジャンプする方が圧倒的に速い。';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '来月、どんな予定が入っていたか確認しよう',
			'quiz1.failureReason' => 'カレンダーを左にスワイプして翌月を表示してください',
			'quiz1.insight.title' => 'なぜ来月が確認できた？',
			'quiz1.insight.subtitle' => '横スワイプで月を切り替えるのは直感操作',
			'quiz1.insight.swipeTitle' => '横スワイプは「ページ送り」の定番ジェスチャー',
			'quiz1.insight.swipeDesc' => 'カレンダーアプリでは左にスワイプすると次の月、右にスワイプすると前の月に切り替わる。この操作はほぼすべてのカレンダーアプリで共通している。',
			'quiz1.insight.calendarTitle' => 'カレンダーは「月単位」で管理される',
			'quiz1.insight.calendarDesc' => 'スマートフォンのカレンダーアプリは月をまたいだスクロールではなく、月単位でスワイプして切り替えるUI設計が主流となっている。',
			'quiz1.insight.gestureTitle' => '見えないUIも操作できる',
			'quiz1.insight.gestureDesc' => '画面に「次の月へ」ボタンがなくても、スワイプジェスチャーで操作できる。これがスマートフォンのUI設計の特徴の一つ。',
			'quiz2.missionText' => '15日に新しい予定を追加しよう',
			'quiz2.failureReason' => '15日のマスを長押しするか、右下の＋ボタンを使って予定を追加してください',
			'quiz2.insight.title' => 'なぜ長押しで追加できた？',
			'quiz2.insight.subtitle' => '長押し＝隠れた操作メニューを呼び出す',
			'quiz2.insight.longPressTitle' => '長押しは「コンテキストメニュー」を開く',
			'quiz2.insight.longPressDesc' => 'カレンダーの日付を長押しすると、その日の予定を直接追加できる。これは多くのカレンダーアプリで採用されている隠れた便利機能。',
			'quiz2.insight.fabTitle' => '＋ボタンは新規作成の万国共通語',
			'quiz2.insight.fabDesc' => '右下の＋（プラス）ボタンは「新しいものを作成する」という意味のUIパターンとして、Google系アプリを中心に世界標準となっている。',
			'quiz2.insight.addTitle' => '2つの操作経路が存在する',
			'quiz2.insight.addDesc' => 'カレンダーへの予定追加は「日付を長押し」と「＋ボタンをタップ」の2種類の方法がある。使い方を知ることで操作の選択肢が広がる。',
			'quiz3.missionText' => '「会議」の予定が明日に延期！予定を移動させよう',
			'quiz3.failureReason' => '「会議」の予定ブロックを長押しして掴み、翌日のマスへドラッグ＆ドロップしてください',
			'quiz3.insight.title' => 'なぜドラッグで予定を移動できた？',
			'quiz3.insight.subtitle' => '長押し＆ドラッグで予定を直感的に移動',
			'quiz3.insight.dragTitle' => '長押しドラッグは「掴んで移動」の定番操作',
			'quiz3.insight.dragDesc' => 'リスト項目や予定ブロックを長押しして「掴む」感覚でドラッグするUIは、iOS・Androidのカレンダーアプリ・タスクアプリで広く採用されている。',
			'quiz3.insight.dropTitle' => 'ドロップした場所に「移動」される',
			'quiz3.insight.dropDesc' => 'ドラッグした要素を目的の場所で離す（ドロップする）と、その位置に内容が移動する。これがドラッグ&ドロップ操作の本質。',
			'quiz3.insight.intuitionTitle' => '視覚的な直感と一致する操作',
			'quiz3.insight.intuitionDesc' => '「移動したいなら引っ張ればいい」という直感通りに機能するUIは、ユーザーの認知負荷を下げる優れたデザイン。',
			'quiz4.missionText' => '迷子になっちゃった！一瞬で「今日」に戻ろう',
			'quiz4.failureReason' => 'AppBarのカレンダーアイコン（今日）ボタンをタップしてください',
			'quiz4.insight.title' => 'なぜすぐに「今日」に戻れた？',
			'quiz4.insight.subtitle' => '「今日」ボタンは迷子を救う機能',
			'quiz4.insight.todayTitle' => '「今日」ボタンはカレンダーの必須機能',
			'quiz4.insight.todayDesc' => 'カレンダーアプリには「今日の日付にジャンプする」専用のボタンが存在する。遠い月まで移動しても一瞬で戻れる便利な機能。',
			'quiz4.insight.iconTitle' => 'カレンダーアイコン＝今日へ戻る',
			'quiz4.insight.iconDesc' => 'AppBarに表示されたカレンダーアイコンは「今日の日付を表示する」という意味を持つ。アイコンのデザインで機能を伝える典型例。',
			'quiz4.insight.jumpTitle' => 'スクロールより「ジャンプ」が効率的',
			'quiz4.insight.jumpDesc' => '数年後の未来や過去から現在に戻るとき、スワイプで一枚ずつ戻るより専用ボタンで直接ジャンプする方が圧倒的に速い。',
			'common.appTitle' => 'Clndr',
			'common.today' => 'Tdy',
			'common.add' => 'Add',
			'common.save' => 'Sv',
			'common.cancel' => 'Cnc',
			'common.newEvent' => 'Nw Evnt',
			'common.eventTitle' => 'Evnt Ttl',
			'common.addEventTitle' => 'Add Evnt',
			_ => null,
		};
	}
}
