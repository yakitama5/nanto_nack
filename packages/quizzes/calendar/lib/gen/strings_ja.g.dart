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
	@override String get missionText => '来月、どんな予定が入っていたか確認しよう';
	@override String get failureReason => 'カレンダーを左にスワイプして翌月を表示してください';
	@override late final _TranslationsQuiz1InsightJa insight = _TranslationsQuiz1InsightJa._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Ja implements TranslationsQuiz2En {
	_TranslationsQuiz2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '15日に新しい予定を追加しよう';
	@override String get failureReason => '15日のマスを長押しして予定を追加してください';
	@override late final _TranslationsQuiz2InsightJa insight = _TranslationsQuiz2InsightJa._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Ja implements TranslationsQuiz3En {
	_TranslationsQuiz3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '当日の予定を翌日に変更しよう';
	@override String get failureReason => '当日の予定を長押しし、翌日のマスへドラッグ＆ドロップしてください';
	@override late final _TranslationsQuiz3InsightJa insight = _TranslationsQuiz3InsightJa._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Ja implements TranslationsQuiz4En {
	_TranslationsQuiz4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '迷子になっちゃった！一瞬で「今日」に戻ろう';
	@override String get failureReason => 'AppBarのカレンダーアイコン（今日）ボタンをタップしてください';
	@override late final _TranslationsQuiz4InsightJa insight = _TranslationsQuiz4InsightJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'カレンダー';
	@override String get today => '今日';
	@override String get add => '追加';
	@override String get save => '保存';
	@override String get cancel => 'キャンセル';
	@override String get newEvent => '新しいイベント';
	@override String get eventTitle => 'イベントタイトル';
	@override String get addEventTitle => 'イベントを追加';
	@override List<String> get weekdays => [
		'月',
		'火',
		'水',
		'木',
		'金',
		'土',
		'日',
	];
	@override String dateLabel({required Object month, required Object day, required Object weekday}) => '${month}月${day}日（${weekday}）';
	@override String get eventInterview => '面接';
	@override String get eventParty => '飲み会';
	@override String get eventMeeting => 'ミーティング';
	@override String get eventHealth => '健康診断';
	@override String get eventDentist => '歯医者';
	@override String get eventLunch => 'ランチ';
	@override String get eventImportant => '大切な予定';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightJa implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

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
class _TranslationsQuiz2InsightJa implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

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
class _TranslationsQuiz3InsightJa implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ予定を変更できた？';
	@override String get subtitle => 'ドラッグ＆ドロップで素早く予定を再調整';
	@override String get tapTitle => '予定をドラッグ＆ドロップする';
	@override String get tapDesc => 'カレンダー上の予定を長押しすると移動モードになり、そのまま別の日付へ移動させることができる。急な予定変更も指先一つで完了。';
	@override String get futureTitle => '柔軟なスケジュール管理';
	@override String get futureDesc => 'スマートフォンのカレンダーアプリは、予定を直感的に動かせる。予定の移動がスムーズに行えることは、時間を無駄にしないために重要。';
	@override String get planTitle => '変更に強い生活リズム';
	@override String get planDesc => '急な用事が入っても、カレンダーの予定をずらすだけで整理できる。デジタルツールで柔軟に管理し、常に整ったスケジュールを保とう。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightJa implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

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

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
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
			'quiz2.failureReason' => '15日のマスを長押しして予定を追加してください',
			'quiz2.insight.title' => 'なぜ長押しで追加できた？',
			'quiz2.insight.subtitle' => '長押し＝隠れた操作メニューを呼び出す',
			'quiz2.insight.longPressTitle' => '長押しは「コンテキストメニュー」を開く',
			'quiz2.insight.longPressDesc' => 'カレンダーの日付を長押しすると、その日の予定を直接追加できる。これは多くのカレンダーアプリで採用されている隠れた便利機能。',
			'quiz2.insight.fabTitle' => '＋ボタンは新規作成の万国共通語',
			'quiz2.insight.fabDesc' => '右下の＋（プラス）ボタンは「新しいものを作成する」という意味のUIパターンとして、Google系アプリを中心に世界標準となっている。',
			'quiz2.insight.addTitle' => '2つの操作経路が存在する',
			'quiz2.insight.addDesc' => 'カレンダーへの予定追加は「日付を長押し」と「＋ボタンをタップ」の2種類の方法がある。使い方を知ることで操作の選択肢が広がる。',
			'quiz3.missionText' => '当日の予定を翌日に変更しよう',
			'quiz3.failureReason' => '当日の予定を長押しし、翌日のマスへドラッグ＆ドロップしてください',
			'quiz3.insight.title' => 'なぜ予定を変更できた？',
			'quiz3.insight.subtitle' => 'ドラッグ＆ドロップで素早く予定を再調整',
			'quiz3.insight.tapTitle' => '予定をドラッグ＆ドロップする',
			'quiz3.insight.tapDesc' => 'カレンダー上の予定を長押しすると移動モードになり、そのまま別の日付へ移動させることができる。急な予定変更も指先一つで完了。',
			'quiz3.insight.futureTitle' => '柔軟なスケジュール管理',
			'quiz3.insight.futureDesc' => 'スマートフォンのカレンダーアプリは、予定を直感的に動かせる。予定の移動がスムーズに行えることは、時間を無駄にしないために重要。',
			'quiz3.insight.planTitle' => '変更に強い生活リズム',
			'quiz3.insight.planDesc' => '急な用事が入っても、カレンダーの予定をずらすだけで整理できる。デジタルツールで柔軟に管理し、常に整ったスケジュールを保とう。',
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
			'common.appTitle' => 'カレンダー',
			'common.today' => '今日',
			'common.add' => '追加',
			'common.save' => '保存',
			'common.cancel' => 'キャンセル',
			'common.newEvent' => '新しいイベント',
			'common.eventTitle' => 'イベントタイトル',
			'common.addEventTitle' => 'イベントを追加',
			'common.weekdays.0' => '月',
			'common.weekdays.1' => '火',
			'common.weekdays.2' => '水',
			'common.weekdays.3' => '木',
			'common.weekdays.4' => '金',
			'common.weekdays.5' => '土',
			'common.weekdays.6' => '日',
			'common.dateLabel' => ({required Object month, required Object day, required Object weekday}) => '${month}月${day}日（${weekday}）',
			'common.eventInterview' => '面接',
			'common.eventParty' => '飲み会',
			'common.eventMeeting' => 'ミーティング',
			'common.eventHealth' => '健康診断',
			'common.eventDentist' => '歯医者',
			'common.eventLunch' => 'ランチ',
			'common.eventImportant' => '大切な予定',
			_ => null,
		};
	}
}
