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

	/// ja: '15日のマスを長押しするか、右下の＋ボタンを使って予定を追加してください'
	String get failureReason => '15日のマスを長押しするか、右下の＋ボタンを使って予定を追加してください';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '「会議」の予定が明日に延期！予定を移動させよう'
	String get missionText => '「会議」の予定が明日に延期！予定を移動させよう';

	/// ja: '「会議」の予定ブロックを長押しして掴み、翌日のマスへドラッグ＆ドロップしてください'
	String get failureReason => '「会議」の予定ブロックを長押しして掴み、翌日のマスへドラッグ＆ドロップしてください';

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

	/// ja: 'Calendar'
	String get appTitle => 'Calendar';

	/// ja: 'Today'
	String get today => 'Today';

	/// ja: 'Add'
	String get add => 'Add';

	/// ja: 'Save'
	String get save => 'Save';

	/// ja: 'Cancel'
	String get cancel => 'Cancel';

	/// ja: 'New Event'
	String get newEvent => 'New Event';

	/// ja: 'Event Title'
	String get eventTitle => 'Event Title';

	/// ja: 'Add Event'
	String get addEventTitle => 'Add Event';
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

	/// ja: 'なぜドラッグで予定を移動できた？'
	String get title => 'なぜドラッグで予定を移動できた？';

	/// ja: '長押し＆ドラッグで予定を直感的に移動'
	String get subtitle => '長押し＆ドラッグで予定を直感的に移動';

	/// ja: '長押しドラッグは「掴んで移動」の定番操作'
	String get dragTitle => '長押しドラッグは「掴んで移動」の定番操作';

	/// ja: 'リスト項目や予定ブロックを長押しして「掴む」感覚でドラッグするUIは、iOS・Androidのカレンダーアプリ・タスクアプリで広く採用されている。'
	String get dragDesc => 'リスト項目や予定ブロックを長押しして「掴む」感覚でドラッグするUIは、iOS・Androidのカレンダーアプリ・タスクアプリで広く採用されている。';

	/// ja: 'ドロップした場所に「移動」される'
	String get dropTitle => 'ドロップした場所に「移動」される';

	/// ja: 'ドラッグした要素を目的の場所で離す（ドロップする）と、その位置に内容が移動する。これがドラッグ&ドロップ操作の本質。'
	String get dropDesc => 'ドラッグした要素を目的の場所で離す（ドロップする）と、その位置に内容が移動する。これがドラッグ&ドロップ操作の本質。';

	/// ja: '視覚的な直感と一致する操作'
	String get intuitionTitle => '視覚的な直感と一致する操作';

	/// ja: '「移動したいなら引っ張ればいい」という直感通りに機能するUIは、ユーザーの認知負荷を下げる優れたデザイン。'
	String get intuitionDesc => '「移動したいなら引っ張ればいい」という直感通りに機能するUIは、ユーザーの認知負荷を下げる優れたデザイン。';
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
			'common.appTitle' => 'Calendar',
			'common.today' => 'Today',
			'common.add' => 'Add',
			'common.save' => 'Save',
			'common.cancel' => 'Cancel',
			'common.newEvent' => 'New Event',
			'common.eventTitle' => 'Event Title',
			'common.addEventTitle' => 'Add Event',
			_ => null,
		};
	}
}
