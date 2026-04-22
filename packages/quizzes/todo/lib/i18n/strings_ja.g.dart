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

	/// ja: '『牛乳を買う』タスクを完了にしよう'
	String get missionText => '『牛乳を買う』タスクを完了にしよう';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '『企画書の作成』タスクを一番上に移動しよう'
	String get missionText => '『企画書の作成』タスクを一番上に移動しよう';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '『家賃の振り込み』を重要タスクに指定しよう'
	String get missionText => '『家賃の振り込み』を重要タスクに指定しよう';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '間違えて完了にしてしまった『会議の準備』タスクを未完了に戻そう'
	String get missionText => '間違えて完了にしてしまった『会議の準備』タスクを未完了に戻そう';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'タスク'
	String get appTitle => 'タスク';

	/// ja: '完了済み'
	String get completedLabel => '完了済み';

	/// ja: '完了済み（{count}件）'
	String get completedCount => '完了済み（{count}件）';

	/// ja: '重要'
	String get importantLabel => '重要';

	/// ja: 'タスクなし'
	String get noTasks => 'タスクなし';

	/// ja: 'タスクを追加'
	String get addTask => 'タスクを追加';

	/// ja: 'その他のオプション'
	String get moreOptions => 'その他のオプション';

	/// ja: '重要にする'
	String get importantAction => '重要にする';

	/// ja: '完了にする'
	String get completeAction => '完了にする';

	/// ja: '未完了に戻す'
	String get uncompleteAction => '未完了に戻す';

	late final TranslationsCommonTasksJa tasks = TranslationsCommonTasksJa.internal(_root);
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜチェックボックスや左から右スワイプでタスクが完了できるとわかった？'
	String get title => 'なぜチェックボックスや左から右スワイプでタスクが完了できるとわかった？';

	/// ja: '丸いチェックボックスは『完了』の世界標準サイン'
	String get subtitle => '丸いチェックボックスは『完了』の世界標準サイン';

	/// ja: '丸いチェックボックス＝タップで完了'
	String get checkTitle => '丸いチェックボックス＝タップで完了';

	/// ja: 'TODOアプリの丸いチェックボックスをタップすることでタスクを完了にできる。Microsoft To DoやGoogleタスクなど多くのアプリで採用されている。'
	String get checkDesc => 'TODOアプリの丸いチェックボックスをタップすることでタスクを完了にできる。Microsoft To DoやGoogleタスクなど多くのアプリで採用されている。';

	/// ja: '左から右スワイプ＝完了のジェスチャー'
	String get swipeTitle => '左から右スワイプ＝完了のジェスチャー';

	/// ja: '多くのTODOアプリでは左から右へスワイプすることでタスクの完了操作ができる。メールの既読操作と同じ方向感覚を利用している。'
	String get swipeDesc => '多くのTODOアプリでは左から右へスワイプすることでタスクの完了操作ができる。メールの既読操作と同じ方向感覚を利用している。';

	/// ja: '完了時の視覚フィードバック'
	String get feedbackTitle => '完了時の視覚フィードバック';

	/// ja: 'タスク完了時に青い背景とチェックアイコンが表示されることで、操作の意味を直感的に伝えるデザインになっている。'
	String get feedbackDesc => 'タスク完了時に青い背景とチェックアイコンが表示されることで、操作の意味を直感的に伝えるデザインになっている。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ長押しでドラッグできるとわかった？'
	String get title => 'なぜ長押しでドラッグできるとわかった？';

	/// ja: '長押し＋ドラッグは並び替えの世界標準ジェスチャー'
	String get subtitle => '長押し＋ドラッグは並び替えの世界標準ジェスチャー';

	/// ja: '長押し＝つかむサイン'
	String get longPressTitle => '長押し＝つかむサイン';

	/// ja: 'リストアイテムを長押しすると掴んだ感覚（ハプティクス）と共に並び替えモードになる。AndroidとiOS両方でサポートされた標準的なインタラクション。'
	String get longPressDesc => 'リストアイテムを長押しすると掴んだ感覚（ハプティクス）と共に並び替えモードになる。AndroidとiOS両方でサポートされた標準的なインタラクション。';

	/// ja: 'ドラッグ＆ドロップで優先度を変更'
	String get dragTitle => 'ドラッグ＆ドロップで優先度を変更';

	/// ja: 'TODOアプリでは上にあるタスクほど優先度が高いことが多い。ドラッグして一番上に移動することで最優先タスクを設定できる。'
	String get dragDesc => 'TODOアプリでは上にあるタスクほど優先度が高いことが多い。ドラッグして一番上に移動することで最優先タスクを設定できる。';

	/// ja: 'ドラッグハンドルアイコンのサイン'
	String get handleTitle => 'ドラッグハンドルアイコンのサイン';

	/// ja: '三本線（ハンバーガー）アイコンや点線アイコンは『ドラッグできる』ことを示す世界共通のUI記号。見かけたら並び替えを試してみよう。'
	String get handleDesc => '三本線（ハンバーガー）アイコンや点線アイコンは『ドラッグできる』ことを示す世界共通のUI記号。見かけたら並び替えを試してみよう。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ左スワイプで重要マークを付けられるとわかった？'
	String get title => 'なぜ左スワイプで重要マークを付けられるとわかった？';

	/// ja: '右から左スワイプは『追加アクション』のサイン'
	String get subtitle => '右から左スワイプは『追加アクション』のサイン';

	/// ja: '右から左スワイプ＝隠れた操作を呼び出す'
	String get swipeTitle => '右から左スワイプ＝隠れた操作を呼び出す';

	/// ja: 'メールアプリやTODOアプリでは、右から左へスワイプすることで削除・アーカイブ・重要マークなどの追加操作が現れる。'
	String get swipeDesc => 'メールアプリやTODOアプリでは、右から左へスワイプすることで削除・アーカイブ・重要マークなどの追加操作が現れる。';

	/// ja: '★マーク＝重要・今日のタスクのサイン'
	String get starTitle => '★マーク＝重要・今日のタスクのサイン';

	/// ja: '星形（スター）アイコンは世界中のアプリで『お気に入り』や『重要』を意味する共通記号。TODOアプリでは『今日やること』への移動に使われることが多い。'
	String get starDesc => '星形（スター）アイコンは世界中のアプリで『お気に入り』や『重要』を意味する共通記号。TODOアプリでは『今日やること』への移動に使われることが多い。';

	/// ja: '重要タスクで集中力を高める'
	String get priorityTitle => '重要タスクで集中力を高める';

	/// ja: 'タスクに優先度をつけることで、本当にやるべきことに集中できる。重要マークで目立たせて見落としを防ごう。'
	String get priorityDesc => 'タスクに優先度をつけることで、本当にやるべきことに集中できる。重要マークで目立たせて見落としを防ごう。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ完了済みリストから元に戻せるとわかった？'
	String get title => 'なぜ完了済みリストから元に戻せるとわかった？';

	/// ja: '完了済みリストは操作を取り消せるアーカイブ'
	String get subtitle => '完了済みリストは操作を取り消せるアーカイブ';

	/// ja: '折りたたみリスト＝アコーディオンUI'
	String get accordionTitle => '折りたたみリスト＝アコーディオンUI';

	/// ja: '『完了済み（X件）』のヘッダーをタップすると完了したタスクの一覧が展開される。メールのフォルダやFAQでよく使われるアコーディオンUIの一種。'
	String get accordionDesc => '『完了済み（X件）』のヘッダーをタップすると完了したタスクの一覧が展開される。メールのフォルダやFAQでよく使われるアコーディオンUIの一種。';

	/// ja: '完了の取り消しで間違いを修正'
	String get undoTitle => '完了の取り消しで間違いを修正';

	/// ja: '完了済みリストのチェックを外すことでタスクを未完了状態に戻せる。誤操作を簡単にやり直せる設計は現代のアプリの基本。'
	String get undoDesc => '完了済みリストのチェックを外すことでタスクを未完了状態に戻せる。誤操作を簡単にやり直せる設計は現代のアプリの基本。';

	/// ja: '完了済みリストから未完了に戻す操作'
	String get checkTitle => '完了済みリストから未完了に戻す操作';

	/// ja: '完了済みリストを開いてチェックマークをタップするか左スワイプすることで、タスクを未完了状態に復元できる。'
	String get checkDesc => '完了済みリストを開いてチェックマークをタップするか左スワイプすることで、タスクを未完了状態に復元できる。';
}

// Path: common.tasks
class TranslationsCommonTasksJa {
	TranslationsCommonTasksJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '牛乳を買う'
	String get buyMilk => '牛乳を買う';

	/// ja: '家賃の振り込み'
	String get rentPayment => '家賃の振り込み';

	/// ja: '企画書の作成'
	String get planningDoc => '企画書の作成';

	/// ja: '会議の準備'
	String get meetingPrep => '会議の準備';

	/// ja: 'メールの返信'
	String get replyEmail => 'メールの返信';

	/// ja: '歯医者の予約'
	String get bookDentist => '歯医者の予約';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '『牛乳を買う』タスクを完了にしよう',
			'quiz1.insight.title' => 'なぜチェックボックスや左から右スワイプでタスクが完了できるとわかった？',
			'quiz1.insight.subtitle' => '丸いチェックボックスは『完了』の世界標準サイン',
			'quiz1.insight.checkTitle' => '丸いチェックボックス＝タップで完了',
			'quiz1.insight.checkDesc' => 'TODOアプリの丸いチェックボックスをタップすることでタスクを完了にできる。Microsoft To DoやGoogleタスクなど多くのアプリで採用されている。',
			'quiz1.insight.swipeTitle' => '左から右スワイプ＝完了のジェスチャー',
			'quiz1.insight.swipeDesc' => '多くのTODOアプリでは左から右へスワイプすることでタスクの完了操作ができる。メールの既読操作と同じ方向感覚を利用している。',
			'quiz1.insight.feedbackTitle' => '完了時の視覚フィードバック',
			'quiz1.insight.feedbackDesc' => 'タスク完了時に青い背景とチェックアイコンが表示されることで、操作の意味を直感的に伝えるデザインになっている。',
			'quiz2.missionText' => '『企画書の作成』タスクを一番上に移動しよう',
			'quiz2.insight.title' => 'なぜ長押しでドラッグできるとわかった？',
			'quiz2.insight.subtitle' => '長押し＋ドラッグは並び替えの世界標準ジェスチャー',
			'quiz2.insight.longPressTitle' => '長押し＝つかむサイン',
			'quiz2.insight.longPressDesc' => 'リストアイテムを長押しすると掴んだ感覚（ハプティクス）と共に並び替えモードになる。AndroidとiOS両方でサポートされた標準的なインタラクション。',
			'quiz2.insight.dragTitle' => 'ドラッグ＆ドロップで優先度を変更',
			'quiz2.insight.dragDesc' => 'TODOアプリでは上にあるタスクほど優先度が高いことが多い。ドラッグして一番上に移動することで最優先タスクを設定できる。',
			'quiz2.insight.handleTitle' => 'ドラッグハンドルアイコンのサイン',
			'quiz2.insight.handleDesc' => '三本線（ハンバーガー）アイコンや点線アイコンは『ドラッグできる』ことを示す世界共通のUI記号。見かけたら並び替えを試してみよう。',
			'quiz3.missionText' => '『家賃の振り込み』を重要タスクに指定しよう',
			'quiz3.insight.title' => 'なぜ左スワイプで重要マークを付けられるとわかった？',
			'quiz3.insight.subtitle' => '右から左スワイプは『追加アクション』のサイン',
			'quiz3.insight.swipeTitle' => '右から左スワイプ＝隠れた操作を呼び出す',
			'quiz3.insight.swipeDesc' => 'メールアプリやTODOアプリでは、右から左へスワイプすることで削除・アーカイブ・重要マークなどの追加操作が現れる。',
			'quiz3.insight.starTitle' => '★マーク＝重要・今日のタスクのサイン',
			'quiz3.insight.starDesc' => '星形（スター）アイコンは世界中のアプリで『お気に入り』や『重要』を意味する共通記号。TODOアプリでは『今日やること』への移動に使われることが多い。',
			'quiz3.insight.priorityTitle' => '重要タスクで集中力を高める',
			'quiz3.insight.priorityDesc' => 'タスクに優先度をつけることで、本当にやるべきことに集中できる。重要マークで目立たせて見落としを防ごう。',
			'quiz4.missionText' => '間違えて完了にしてしまった『会議の準備』タスクを未完了に戻そう',
			'quiz4.insight.title' => 'なぜ完了済みリストから元に戻せるとわかった？',
			'quiz4.insight.subtitle' => '完了済みリストは操作を取り消せるアーカイブ',
			'quiz4.insight.accordionTitle' => '折りたたみリスト＝アコーディオンUI',
			'quiz4.insight.accordionDesc' => '『完了済み（X件）』のヘッダーをタップすると完了したタスクの一覧が展開される。メールのフォルダやFAQでよく使われるアコーディオンUIの一種。',
			'quiz4.insight.undoTitle' => '完了の取り消しで間違いを修正',
			'quiz4.insight.undoDesc' => '完了済みリストのチェックを外すことでタスクを未完了状態に戻せる。誤操作を簡単にやり直せる設計は現代のアプリの基本。',
			'quiz4.insight.checkTitle' => '完了済みリストから未完了に戻す操作',
			'quiz4.insight.checkDesc' => '完了済みリストを開いてチェックマークをタップするか左スワイプすることで、タスクを未完了状態に復元できる。',
			'common.appTitle' => 'タスク',
			'common.completedLabel' => '完了済み',
			'common.completedCount' => '完了済み（{count}件）',
			'common.importantLabel' => '重要',
			'common.noTasks' => 'タスクなし',
			'common.addTask' => 'タスクを追加',
			'common.moreOptions' => 'その他のオプション',
			'common.importantAction' => '重要にする',
			'common.completeAction' => '完了にする',
			'common.uncompleteAction' => '未完了に戻す',
			'common.tasks.buyMilk' => '牛乳を買う',
			'common.tasks.rentPayment' => '家賃の振り込み',
			'common.tasks.planningDoc' => '企画書の作成',
			'common.tasks.meetingPrep' => '会議の準備',
			'common.tasks.replyEmail' => 'メールの返信',
			'common.tasks.bookDentist' => '歯医者の予約',
			_ => null,
		};
	}
}
