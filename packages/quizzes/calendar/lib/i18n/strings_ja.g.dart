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

	/// ja: '来月、どんな予定が入っていたか確認しよう'
	String get missionText => '来月、どんな予定が入っていたか確認しよう';

	/// ja: 'カレンダーを左にスワイプして翌月を表示してください'
	String get failureReason => 'カレンダーを左にスワイプして翌月を表示してください';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '15日に新しい予定を追加しよう'
	String get missionText => '15日に新しい予定を追加しよう';

	/// ja: '15日のマスを長押しして予定を追加してください'
	String get failureReason => '15日のマスを長押しして予定を追加してください';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '当日の予定を翌日に変更しよう'
	String get missionText => '当日の予定を翌日に変更しよう';

	/// ja: '当日の予定を長押しし、翌日のマスへドラッグ＆ドロップしてください'
	String get failureReason => '当日の予定を長押しし、翌日のマスへドラッグ＆ドロップしてください';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '迷子になっちゃった！一瞬で「今日」に戻ろう'
	String get missionText => '迷子になっちゃった！一瞬で「今日」に戻ろう';

	/// ja: 'AppBarのカレンダーアイコン（今日）ボタンをタップしてください'
	String get failureReason => 'AppBarのカレンダーアイコン（今日）ボタンをタップしてください';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'カレンダー'
	String get appTitle => 'カレンダー';

	/// ja: '今日'
	String get today => '今日';

	/// ja: '追加'
	String get add => '追加';

	/// ja: '保存'
	String get save => '保存';

	/// ja: 'キャンセル'
	String get cancel => 'キャンセル';

	/// ja: '新しいイベント'
	String get newEvent => '新しいイベント';

	/// ja: 'イベントタイトル'
	String get eventTitle => 'イベントタイトル';

	/// ja: 'イベントを追加'
	String get addEventTitle => 'イベントを追加';

	List<String> get weekdays => [
		'月',
		'火',
		'水',
		'木',
		'金',
		'土',
		'日',
	];

	/// ja: '$month月$day日（$weekday）'
	String dateLabel({required Object month, required Object day, required Object weekday}) => '${month}月${day}日（${weekday}）';

	/// ja: '面接'
	String get eventInterview => '面接';

	/// ja: '飲み会'
	String get eventParty => '飲み会';

	/// ja: 'ミーティング'
	String get eventMeeting => 'ミーティング';

	/// ja: '健康診断'
	String get eventHealth => '健康診断';

	/// ja: '歯医者'
	String get eventDentist => '歯医者';

	/// ja: 'ランチ'
	String get eventLunch => 'ランチ';

	/// ja: '大切な予定'
	String get eventImportant => '大切な予定';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ来月が確認できた？'
	String get title => 'なぜ来月が確認できた？';

	/// ja: '横スワイプで月を切り替えるのは直感操作'
	String get subtitle => '横スワイプで月を切り替えるのは直感操作';

	/// ja: '横スワイプは「ページ送り」の定番ジェスチャー'
	String get swipeTitle => '横スワイプは「ページ送り」の定番ジェスチャー';

	/// ja: 'カレンダーアプリでは左にスワイプすると次の月、右にスワイプすると前の月に切り替わる。この操作はほぼすべてのカレンダーアプリで共通している。'
	String get swipeDesc => 'カレンダーアプリでは左にスワイプすると次の月、右にスワイプすると前の月に切り替わる。この操作はほぼすべてのカレンダーアプリで共通している。';

	/// ja: 'カレンダーは「月単位」で管理される'
	String get calendarTitle => 'カレンダーは「月単位」で管理される';

	/// ja: 'スマートフォンのカレンダーアプリは月をまたいだスクロールではなく、月単位でスワイプして切り替えるUI設計が主流となっている。'
	String get calendarDesc => 'スマートフォンのカレンダーアプリは月をまたいだスクロールではなく、月単位でスワイプして切り替えるUI設計が主流となっている。';

	/// ja: '見えないUIも操作できる'
	String get gestureTitle => '見えないUIも操作できる';

	/// ja: '画面に「次の月へ」ボタンがなくても、スワイプジェスチャーで操作できる。これがスマートフォンのUI設計の特徴の一つ。'
	String get gestureDesc => '画面に「次の月へ」ボタンがなくても、スワイプジェスチャーで操作できる。これがスマートフォンのUI設計の特徴の一つ。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ長押しで追加できた？'
	String get title => 'なぜ長押しで追加できた？';

	/// ja: '長押し＝隠れた操作メニューを呼び出す'
	String get subtitle => '長押し＝隠れた操作メニューを呼び出す';

	/// ja: '長押しは「コンテキストメニュー」を開く'
	String get longPressTitle => '長押しは「コンテキストメニュー」を開く';

	/// ja: 'カレンダーの日付を長押しすると、その日の予定を直接追加できる。これは多くのカレンダーアプリで採用されている隠れた便利機能。'
	String get longPressDesc => 'カレンダーの日付を長押しすると、その日の予定を直接追加できる。これは多くのカレンダーアプリで採用されている隠れた便利機能。';

	/// ja: '＋ボタンは新規作成の万国共通語'
	String get fabTitle => '＋ボタンは新規作成の万国共通語';

	/// ja: '右下の＋（プラス）ボタンは「新しいものを作成する」という意味のUIパターンとして、Google系アプリを中心に世界標準となっている。'
	String get fabDesc => '右下の＋（プラス）ボタンは「新しいものを作成する」という意味のUIパターンとして、Google系アプリを中心に世界標準となっている。';

	/// ja: '2つの操作経路が存在する'
	String get addTitle => '2つの操作経路が存在する';

	/// ja: 'カレンダーへの予定追加は「日付を長押し」と「＋ボタンをタップ」の2種類の方法がある。使い方を知ることで操作の選択肢が広がる。'
	String get addDesc => 'カレンダーへの予定追加は「日付を長押し」と「＋ボタンをタップ」の2種類の方法がある。使い方を知ることで操作の選択肢が広がる。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ予定を変更できた？'
	String get title => 'なぜ予定を変更できた？';

	/// ja: 'ドラッグ＆ドロップで素早く予定を再調整'
	String get subtitle => 'ドラッグ＆ドロップで素早く予定を再調整';

	/// ja: '予定をドラッグ＆ドロップする'
	String get tapTitle => '予定をドラッグ＆ドロップする';

	/// ja: 'カレンダー上の予定を長押しすると移動モードになり、そのまま別の日付へ移動させることができる。急な予定変更も指先一つで完了。'
	String get tapDesc => 'カレンダー上の予定を長押しすると移動モードになり、そのまま別の日付へ移動させることができる。急な予定変更も指先一つで完了。';

	/// ja: '柔軟なスケジュール管理'
	String get futureTitle => '柔軟なスケジュール管理';

	/// ja: 'スマートフォンのカレンダーアプリは、予定を直感的に動かせる。予定の移動がスムーズに行えることは、時間を無駄にしないために重要。'
	String get futureDesc => 'スマートフォンのカレンダーアプリは、予定を直感的に動かせる。予定の移動がスムーズに行えることは、時間を無駄にしないために重要。';

	/// ja: '変更に強い生活リズム'
	String get planTitle => '変更に強い生活リズム';

	/// ja: '急な用事が入っても、カレンダーの予定をずらすだけで整理できる。デジタルツールで柔軟に管理し、常に整ったスケジュールを保とう。'
	String get planDesc => '急な用事が入っても、カレンダーの予定をずらすだけで整理できる。デジタルツールで柔軟に管理し、常に整ったスケジュールを保とう。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜすぐに「今日」に戻れた？'
	String get title => 'なぜすぐに「今日」に戻れた？';

	/// ja: '「今日」ボタンは迷子を救う機能'
	String get subtitle => '「今日」ボタンは迷子を救う機能';

	/// ja: '「今日」ボタンはカレンダーの必須機能'
	String get todayTitle => '「今日」ボタンはカレンダーの必須機能';

	/// ja: 'カレンダーアプリには「今日の日付にジャンプする」専用のボタンが存在する。遠い月まで移動しても一瞬で戻れる便利な機能。'
	String get todayDesc => 'カレンダーアプリには「今日の日付にジャンプする」専用のボタンが存在する。遠い月まで移動しても一瞬で戻れる便利な機能。';

	/// ja: 'カレンダーアイコン＝今日へ戻る'
	String get iconTitle => 'カレンダーアイコン＝今日へ戻る';

	/// ja: 'AppBarに表示されたカレンダーアイコンは「今日の日付を表示する」という意味を持つ。アイコンのデザインで機能を伝える典型例。'
	String get iconDesc => 'AppBarに表示されたカレンダーアイコンは「今日の日付を表示する」という意味を持つ。アイコンのデザインで機能を伝える典型例。';

	/// ja: 'スクロールより「ジャンプ」が効率的'
	String get jumpTitle => 'スクロールより「ジャンプ」が効率的';

	/// ja: '数年後の未来や過去から現在に戻るとき、スワイプで一枚ずつ戻るより専用ボタンで直接ジャンプする方が圧倒的に速い。'
	String get jumpDesc => '数年後の未来や過去から現在に戻るとき、スワイプで一枚ずつ戻るより専用ボタンで直接ジャンプする方が圧倒的に速い。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
