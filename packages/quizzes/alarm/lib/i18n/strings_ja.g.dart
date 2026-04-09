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

	/// ja: '新しくアラームを追加してください'
	String get missionText => '新しくアラームを追加してください';

	/// ja: '右上の＋ボタンを押して、時間を設定し保存してください'
	String get failureReason => '右上の＋ボタンを押して、時間を設定し保存してください';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '真ん中のアラームを平日だけなるように設定しよう'
	String get missionText => '真ん中のアラームを平日だけなるように設定しよう';

	/// ja: '月〜金の5つの曜日ボタンを選択してください'
	String get failureReason => '月〜金の5つの曜日ボタンを選択してください';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '一番上のアラームをスヌーズオフにしよう'
	String get missionText => '一番上のアラームをスヌーズオフにしよう';

	/// ja: 'スヌーズのトグルをオフにして保存してください'
	String get failureReason => 'スヌーズのトグルをオフにして保存してください';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '一番上のアラームを削除してください'
	String get missionText => '一番上のアラームを削除してください';

	/// ja: 'アラームを左にスワイプして削除してください'
	String get failureReason => 'アラームを左にスワイプして削除してください';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'Clock'
	String get appTitle => 'Clock';

	/// ja: 'Alarms'
	String get alarmsTab => 'Alarms';

	/// ja: 'Add'
	String get add => 'Add';

	/// ja: 'Save'
	String get save => 'Save';

	/// ja: 'Cancel'
	String get cancel => 'Cancel';

	/// ja: 'Delete'
	String get delete => 'Delete';

	/// ja: 'Snooze'
	String get snooze => 'Snooze';

	/// ja: 'Label'
	String get label => 'Label';

	/// ja: 'Sound'
	String get sound => 'Sound';

	/// ja: 'Repeat'
	String get repeat => 'Repeat';

	/// ja: 'AM'
	String get am => 'AM';

	/// ja: 'PM'
	String get pm => 'PM';

	/// ja: 'M'
	String get mon => 'M';

	/// ja: 'T'
	String get tue => 'T';

	/// ja: 'W'
	String get wed => 'W';

	/// ja: 'T'
	String get thu => 'T';

	/// ja: 'F'
	String get fri => 'F';

	/// ja: 'S'
	String get sat => 'S';

	/// ja: 'S'
	String get sun => 'S';

	/// ja: 'Tomorrow'
	String get tomorrow => 'Tomorrow';

	/// ja: 'Weekdays'
	String get weekdays => 'Weekdays';

	/// ja: 'Edit Alarm'
	String get editAlarm => 'Edit Alarm';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ追加ボタンがわかった？'
	String get title => 'なぜ追加ボタンがわかった？';

	/// ja: '＋マークは「新規作成」の万国共通語'
	String get subtitle => '＋マークは「新規作成」の万国共通語';

	/// ja: '＋ボタンは「新規追加」を意味する'
	String get plusTitle => '＋ボタンは「新規追加」を意味する';

	/// ja: '＋（プラス）アイコンは、iOS・Androidどちらでも「新規作成・追加」を表す標準UIパターンとして定着している。'
	String get plusDesc => '＋（プラス）アイコンは、iOS・Androidどちらでも「新規作成・追加」を表す標準UIパターンとして定着している。';

	/// ja: 'ドラムロールは時間入力の定番UI'
	String get pickerTitle => 'ドラムロールは時間入力の定番UI';

	/// ja: '上下にスクロールするドラムロール型ピッカーは、時計アプリや予約アプリで時間・日付入力に広く使われているUI。'
	String get pickerDesc => '上下にスクロールするドラムロール型ピッカーは、時計アプリや予約アプリで時間・日付入力に広く使われているUI。';

	/// ja: '「保存」は右上に配置される'
	String get saveTitle => '「保存」は右上に配置される';

	/// ja: 'iOS/Android共通のパターンとして、編集画面での「保存・完了」アクションは右上に配置されることが多い。'
	String get saveDesc => 'iOS/Android共通のパターンとして、編集画面での「保存・完了」アクションは右上に配置されることが多い。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ曜日設定がわかった？'
	String get title => 'なぜ曜日設定がわかった？';

	/// ja: '7つの丸＝1週間のメンタルモデル'
	String get subtitle => '7つの丸＝1週間のメンタルモデル';

	/// ja: '7つの丸は「曜日」を表す'
	String get dotTitle => '7つの丸は「曜日」を表す';

	/// ja: '丸いボタンが横に7つ並んでいれば「1週間の曜日選択」というメンタルモデルは、世界中のカレンダー・アラームアプリで共通している。'
	String get dotDesc => '丸いボタンが横に7つ並んでいれば「1週間の曜日選択」というメンタルモデルは、世界中のカレンダー・アラームアプリで共通している。';

	/// ja: '連続する5つ＝平日'
	String get weekdayTitle => '連続する5つ＝平日';

	/// ja: '月曜から金曜の5日間を選ぶことで「平日のみ」という設定になる。ハイライト状態の変化が選択完了を視覚的に伝える。'
	String get weekdayDesc => '月曜から金曜の5日間を選ぶことで「平日のみ」という設定になる。ハイライト状態の変化が選択完了を視覚的に伝える。';

	/// ja: '色変化が選択状態を表す'
	String get highlightTitle => '色変化が選択状態を表す';

	/// ja: '選択されたボタンがハイライト（色付き）になることで、どの曜日が有効かが一目でわかるUIパターン。'
	String get highlightDesc => '選択されたボタンがハイライト（色付き）になることで、どの曜日が有効かが一目でわかるUIパターン。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜスヌーズをオフにできた？'
	String get title => 'なぜスヌーズをオフにできた？';

	/// ja: 'トグルスイッチ＝オンオフ切り替えの記号'
	String get subtitle => 'トグルスイッチ＝オンオフ切り替えの記号';

	/// ja: 'トグルスイッチはオンオフを表す'
	String get toggleTitle => 'トグルスイッチはオンオフを表す';

	/// ja: 'トグルスイッチ（左右に切り替わるスイッチUI）は、機能のオン・オフを切り替える専用のUIコンポーネント。'
	String get toggleDesc => 'トグルスイッチ（左右に切り替わるスイッチUI）は、機能のオン・オフを切り替える専用のUIコンポーネント。';

	/// ja: '矢印との違い：遷移vs切り替え'
	String get vs_arrow_title => '矢印との違い：遷移vs切り替え';

	/// ja: '「＞」マークは別画面への遷移、トグルは同画面でのオンオフ切り替え。この使い分けを理解すれば、目的の操作を迷わず見つけられる。'
	String get vs_arrow_desc => '「＞」マークは別画面への遷移、トグルは同画面でのオンオフ切り替え。この使い分けを理解すれば、目的の操作を迷わず見つけられる。';

	/// ja: 'グレー＝オフ、色付き＝オン'
	String get colorTitle => 'グレー＝オフ、色付き＝オン';

	/// ja: 'トグルがグレーになったらオフ状態。色（多くの場合グリーン）が付いているときがオン状態という色規約は世界共通。'
	String get colorDesc => 'トグルがグレーになったらオフ状態。色（多くの場合グリーン）が付いているときがオン状態という色規約は世界共通。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜスワイプで削除できた？'
	String get title => 'なぜスワイプで削除できた？';

	/// ja: '左スワイプ＝隠れたアクションの定番ジェスチャー'
	String get subtitle => '左スワイプ＝隠れたアクションの定番ジェスチャー';

	/// ja: '左スワイプは「隠しアクション」を呼び出す'
	String get swipeTitle => '左スワイプは「隠しアクション」を呼び出す';

	/// ja: 'リストアイテムを左にスワイプすると削除・アーカイブなどのアクションが出現するパターンは、iOS・Gmail・Slackなど多くのアプリで採用されている。'
	String get swipeDesc => 'リストアイテムを左にスワイプすると削除・アーカイブなどのアクションが出現するパターンは、iOS・Gmail・Slackなど多くのアプリで採用されている。';

	/// ja: '赤いエリア＝削除の国際標準色'
	String get redTitle => '赤いエリア＝削除の国際標準色';

	/// ja: 'スワイプで出現した赤いエリアやゴミ箱アイコンは「削除」を意味する。赤色が「危険・削除」を表す色規約は世界共通のUIデザイン原則。'
	String get redDesc => 'スワイプで出現した赤いエリアやゴミ箱アイコンは「削除」を意味する。赤色が「危険・削除」を表す色規約は世界共通のUIデザイン原則。';

	/// ja: '見えないUIの存在を知ることが重要'
	String get hiddenTitle => '見えないUIの存在を知ることが重要';

	/// ja: '画面に表示されていないUIでも、ジェスチャーで呼び出せる隠れたアクションが存在する。これがスマートフォンUIの奥深さ。'
	String get hiddenDesc => '画面に表示されていないUIでも、ジェスチャーで呼び出せる隠れたアクションが存在する。これがスマートフォンUIの奥深さ。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '新しくアラームを追加してください',
			'quiz1.failureReason' => '右上の＋ボタンを押して、時間を設定し保存してください',
			'quiz1.insight.title' => 'なぜ追加ボタンがわかった？',
			'quiz1.insight.subtitle' => '＋マークは「新規作成」の万国共通語',
			'quiz1.insight.plusTitle' => '＋ボタンは「新規追加」を意味する',
			'quiz1.insight.plusDesc' => '＋（プラス）アイコンは、iOS・Androidどちらでも「新規作成・追加」を表す標準UIパターンとして定着している。',
			'quiz1.insight.pickerTitle' => 'ドラムロールは時間入力の定番UI',
			'quiz1.insight.pickerDesc' => '上下にスクロールするドラムロール型ピッカーは、時計アプリや予約アプリで時間・日付入力に広く使われているUI。',
			'quiz1.insight.saveTitle' => '「保存」は右上に配置される',
			'quiz1.insight.saveDesc' => 'iOS/Android共通のパターンとして、編集画面での「保存・完了」アクションは右上に配置されることが多い。',
			'quiz2.missionText' => '真ん中のアラームを平日だけなるように設定しよう',
			'quiz2.failureReason' => '月〜金の5つの曜日ボタンを選択してください',
			'quiz2.insight.title' => 'なぜ曜日設定がわかった？',
			'quiz2.insight.subtitle' => '7つの丸＝1週間のメンタルモデル',
			'quiz2.insight.dotTitle' => '7つの丸は「曜日」を表す',
			'quiz2.insight.dotDesc' => '丸いボタンが横に7つ並んでいれば「1週間の曜日選択」というメンタルモデルは、世界中のカレンダー・アラームアプリで共通している。',
			'quiz2.insight.weekdayTitle' => '連続する5つ＝平日',
			'quiz2.insight.weekdayDesc' => '月曜から金曜の5日間を選ぶことで「平日のみ」という設定になる。ハイライト状態の変化が選択完了を視覚的に伝える。',
			'quiz2.insight.highlightTitle' => '色変化が選択状態を表す',
			'quiz2.insight.highlightDesc' => '選択されたボタンがハイライト（色付き）になることで、どの曜日が有効かが一目でわかるUIパターン。',
			'quiz3.missionText' => '一番上のアラームをスヌーズオフにしよう',
			'quiz3.failureReason' => 'スヌーズのトグルをオフにして保存してください',
			'quiz3.insight.title' => 'なぜスヌーズをオフにできた？',
			'quiz3.insight.subtitle' => 'トグルスイッチ＝オンオフ切り替えの記号',
			'quiz3.insight.toggleTitle' => 'トグルスイッチはオンオフを表す',
			'quiz3.insight.toggleDesc' => 'トグルスイッチ（左右に切り替わるスイッチUI）は、機能のオン・オフを切り替える専用のUIコンポーネント。',
			'quiz3.insight.vs_arrow_title' => '矢印との違い：遷移vs切り替え',
			'quiz3.insight.vs_arrow_desc' => '「＞」マークは別画面への遷移、トグルは同画面でのオンオフ切り替え。この使い分けを理解すれば、目的の操作を迷わず見つけられる。',
			'quiz3.insight.colorTitle' => 'グレー＝オフ、色付き＝オン',
			'quiz3.insight.colorDesc' => 'トグルがグレーになったらオフ状態。色（多くの場合グリーン）が付いているときがオン状態という色規約は世界共通。',
			'quiz4.missionText' => '一番上のアラームを削除してください',
			'quiz4.failureReason' => 'アラームを左にスワイプして削除してください',
			'quiz4.insight.title' => 'なぜスワイプで削除できた？',
			'quiz4.insight.subtitle' => '左スワイプ＝隠れたアクションの定番ジェスチャー',
			'quiz4.insight.swipeTitle' => '左スワイプは「隠しアクション」を呼び出す',
			'quiz4.insight.swipeDesc' => 'リストアイテムを左にスワイプすると削除・アーカイブなどのアクションが出現するパターンは、iOS・Gmail・Slackなど多くのアプリで採用されている。',
			'quiz4.insight.redTitle' => '赤いエリア＝削除の国際標準色',
			'quiz4.insight.redDesc' => 'スワイプで出現した赤いエリアやゴミ箱アイコンは「削除」を意味する。赤色が「危険・削除」を表す色規約は世界共通のUIデザイン原則。',
			'quiz4.insight.hiddenTitle' => '見えないUIの存在を知ることが重要',
			'quiz4.insight.hiddenDesc' => '画面に表示されていないUIでも、ジェスチャーで呼び出せる隠れたアクションが存在する。これがスマートフォンUIの奥深さ。',
			'common.appTitle' => 'Clock',
			'common.alarmsTab' => 'Alarms',
			'common.add' => 'Add',
			'common.save' => 'Save',
			'common.cancel' => 'Cancel',
			'common.delete' => 'Delete',
			'common.snooze' => 'Snooze',
			'common.label' => 'Label',
			'common.sound' => 'Sound',
			'common.repeat' => 'Repeat',
			'common.am' => 'AM',
			'common.pm' => 'PM',
			'common.mon' => 'M',
			'common.tue' => 'T',
			'common.wed' => 'W',
			'common.thu' => 'T',
			'common.fri' => 'F',
			'common.sat' => 'S',
			'common.sun' => 'S',
			'common.tomorrow' => 'Tomorrow',
			'common.weekdays' => 'Weekdays',
			'common.editAlarm' => 'Edit Alarm',
			_ => null,
		};
	}
}
