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
	@override String get missionText => '新しくアラームを追加してください';
	@override String get failureReason => '右上の＋ボタンを押して、時間を設定し保存してください';
	@override late final _TranslationsQuiz1InsightJa insight = _TranslationsQuiz1InsightJa._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Ja implements TranslationsQuiz2En {
	_TranslationsQuiz2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '平日（月〜金）だけ鳴るように設定してください';
	@override String get failureReason => '月〜金の5つの曜日ボタンを選択してください';
	@override late final _TranslationsQuiz2InsightJa insight = _TranslationsQuiz2InsightJa._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Ja implements TranslationsQuiz3En {
	_TranslationsQuiz3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '「スヌーズ」機能をオフにして保存してください';
	@override String get failureReason => 'スヌーズのトグルをオフにして保存してください';
	@override late final _TranslationsQuiz3InsightJa insight = _TranslationsQuiz3InsightJa._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Ja implements TranslationsQuiz4En {
	_TranslationsQuiz4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '一番上のアラームを削除してください';
	@override String get failureReason => 'アラームを左にスワイプして削除してください';
	@override late final _TranslationsQuiz4InsightJa insight = _TranslationsQuiz4InsightJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Clock';
	@override String get alarmsTab => 'Alarms';
	@override String get add => 'Add';
	@override String get save => 'Save';
	@override String get cancel => 'Cancel';
	@override String get delete => 'Delete';
	@override String get snooze => 'Snooze';
	@override String get label => 'Label';
	@override String get sound => 'Sound';
	@override String get repeat => 'Repeat';
	@override String get am => 'AM';
	@override String get pm => 'PM';
	@override String get mon => 'M';
	@override String get tue => 'T';
	@override String get wed => 'W';
	@override String get thu => 'T';
	@override String get fri => 'F';
	@override String get sat => 'S';
	@override String get sun => 'S';
	@override String get tomorrow => 'Tomorrow';
	@override String get weekdays => 'Weekdays';
	@override String get editAlarm => 'Edit Alarm';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightJa implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ追加ボタンがわかった？';
	@override String get subtitle => '＋マークは「新規作成」の万国共通語';
	@override String get plusTitle => '＋ボタンは「新規追加」を意味する';
	@override String get plusDesc => '＋（プラス）アイコンは、iOS・Androidどちらでも「新規作成・追加」を表す標準UIパターンとして定着している。';
	@override String get pickerTitle => 'ドラムロールは時間入力の定番UI';
	@override String get pickerDesc => '上下にスクロールするドラムロール型ピッカーは、時計アプリや予約アプリで時間・日付入力に広く使われているUI。';
	@override String get saveTitle => '「保存」は右上に配置される';
	@override String get saveDesc => 'iOS/Android共通のパターンとして、編集画面での「保存・完了」アクションは右上に配置されることが多い。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightJa implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ曜日設定がわかった？';
	@override String get subtitle => '7つの丸＝1週間のメンタルモデル';
	@override String get dotTitle => '7つの丸は「曜日」を表す';
	@override String get dotDesc => '丸いボタンが横に7つ並んでいれば「1週間の曜日選択」というメンタルモデルは、世界中のカレンダー・アラームアプリで共通している。';
	@override String get weekdayTitle => '連続する5つ＝平日';
	@override String get weekdayDesc => '月曜から金曜の5日間を選ぶことで「平日のみ」という設定になる。ハイライト状態の変化が選択完了を視覚的に伝える。';
	@override String get highlightTitle => '色変化が選択状態を表す';
	@override String get highlightDesc => '選択されたボタンがハイライト（色付き）になることで、どの曜日が有効かが一目でわかるUIパターン。';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightJa implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜスヌーズをオフにできた？';
	@override String get subtitle => 'トグルスイッチ＝オンオフ切り替えの記号';
	@override String get toggleTitle => 'トグルスイッチはオンオフを表す';
	@override String get toggleDesc => 'トグルスイッチ（左右に切り替わるスイッチUI）は、機能のオン・オフを切り替える専用のUIコンポーネント。';
	@override String get vs_arrow_title => '矢印との違い：遷移vs切り替え';
	@override String get vs_arrow_desc => '「＞」マークは別画面への遷移、トグルは同画面でのオンオフ切り替え。この使い分けを理解すれば、目的の操作を迷わず見つけられる。';
	@override String get colorTitle => 'グレー＝オフ、色付き＝オン';
	@override String get colorDesc => 'トグルがグレーになったらオフ状態。色（多くの場合グリーン）が付いているときがオン状態という色規約は世界共通。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightJa implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜスワイプで削除できた？';
	@override String get subtitle => '左スワイプ＝隠れたアクションの定番ジェスチャー';
	@override String get swipeTitle => '左スワイプは「隠しアクション」を呼び出す';
	@override String get swipeDesc => 'リストアイテムを左にスワイプすると削除・アーカイブなどのアクションが出現するパターンは、iOS・Gmail・Slackなど多くのアプリで採用されている。';
	@override String get redTitle => '赤いエリア＝削除の国際標準色';
	@override String get redDesc => 'スワイプで出現した赤いエリアやゴミ箱アイコンは「削除」を意味する。赤色が「危険・削除」を表す色規約は世界共通のUIデザイン原則。';
	@override String get hiddenTitle => '見えないUIの存在を知ることが重要';
	@override String get hiddenDesc => '画面に表示されていないUIでも、ジェスチャーで呼び出せる隠れたアクションが存在する。これがスマートフォンUIの奥深さ。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
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
			'quiz2.missionText' => '平日（月〜金）だけ鳴るように設定してください',
			'quiz2.failureReason' => '月〜金の5つの曜日ボタンを選択してください',
			'quiz2.insight.title' => 'なぜ曜日設定がわかった？',
			'quiz2.insight.subtitle' => '7つの丸＝1週間のメンタルモデル',
			'quiz2.insight.dotTitle' => '7つの丸は「曜日」を表す',
			'quiz2.insight.dotDesc' => '丸いボタンが横に7つ並んでいれば「1週間の曜日選択」というメンタルモデルは、世界中のカレンダー・アラームアプリで共通している。',
			'quiz2.insight.weekdayTitle' => '連続する5つ＝平日',
			'quiz2.insight.weekdayDesc' => '月曜から金曜の5日間を選ぶことで「平日のみ」という設定になる。ハイライト状態の変化が選択完了を視覚的に伝える。',
			'quiz2.insight.highlightTitle' => '色変化が選択状態を表す',
			'quiz2.insight.highlightDesc' => '選択されたボタンがハイライト（色付き）になることで、どの曜日が有効かが一目でわかるUIパターン。',
			'quiz3.missionText' => '「スヌーズ」機能をオフにして保存してください',
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
