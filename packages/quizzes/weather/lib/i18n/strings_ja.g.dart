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
	late final TranslationsCitiesJa cities = TranslationsCitiesJa.internal(_root);
	late final TranslationsWeekdaysJa weekdays = TranslationsWeekdaysJa.internal(_root);
}

// Path: quiz1
class TranslationsQuiz1Ja {
	TranslationsQuiz1Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '明日は大阪に出張だ。スワイプして大阪の天気を調べよう'
	String get missionText => '明日は大阪に出張だ。スワイプして大阪の天気を調べよう';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ちょっとデータが古いかも？引っ張って最新の天気に更新しよう'
	String get missionText => 'ちょっとデータが古いかも？引っ張って最新の天気に更新しよう';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '水曜日は雨の予報だ……何時頃から降るか、詳しく見てみよう'
	String get missionText => '水曜日は雨の予報だ……何時頃から降るか、詳しく見てみよう';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '空が暗くなってきた！雨雲レーダーのマップを開いて確認しよう'
	String get missionText => '空が暗くなってきた！雨雲レーダーのマップを開いて確認しよう';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '天気予報'
	String get appTitle => '天気予報';

	/// ja: '{cityName}の天気'
	String get cityTitle => '{cityName}の天気';

	/// ja: '現在の気温'
	String get currentTemp => '現在の気温';

	/// ja: '{temp}°C'
	String get tempUnit => '{temp}°C';

	/// ja: '週間天気'
	String get weeklyForecast => '週間天気';

	/// ja: '時間帯別天気'
	String get hourlyDetail => '時間帯別天気';

	/// ja: '雨雲レーダー'
	String get radarMap => '雨雲レーダー';

	/// ja: '雨雲レーダーマップ'
	String get radarMapDetail => '雨雲レーダーマップ';

	/// ja: '更新中...'
	String get refreshing => '更新中...';

	/// ja: '最終更新'
	String get lastUpdated => '最終更新';

	/// ja: '引っ張って更新'
	String get pullToRefresh => '引っ張って更新';

	/// ja: '晴れ'
	String get sunny => '晴れ';

	/// ja: '曇り'
	String get cloudy => '曇り';

	/// ja: '雨'
	String get rainy => '雨';

	/// ja: '晴れ時々曇り'
	String get partlyCloudy => '晴れ時々曇り';

	/// ja: 'ゲームを中断しますか？'
	String get quitConfirmTitle => 'ゲームを中断しますか？';

	/// ja: 'プレイ中のゲームを終了します。'
	String get quitConfirmMessage => 'プレイ中のゲームを終了します。';

	/// ja: '続ける'
	String get continueButton => '続ける';

	/// ja: '終了する'
	String get quitButton => '終了する';
}

// Path: cities
class TranslationsCitiesJa {
	TranslationsCitiesJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '東京都'
	String get tokyo => '東京都';

	/// ja: '大阪府'
	String get osaka => '大阪府';

	/// ja: '北海道（札幌）'
	String get sapporo => '北海道（札幌）';
}

// Path: weekdays
class TranslationsWeekdaysJa {
	TranslationsWeekdaysJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '月'
	String get mon => '月';

	/// ja: '火'
	String get tue => '火';

	/// ja: '水'
	String get wed => '水';

	/// ja: '木'
	String get thu => '木';

	/// ja: '金'
	String get fri => '金';

	/// ja: '土'
	String get sat => '土';

	/// ja: '日'
	String get sun => '日';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ左スワイプで都市が切り替わるとわかった？'
	String get title => 'なぜ左スワイプで都市が切り替わるとわかった？';

	/// ja: 'PageViewの左右スワイプで画面を切り替える'
	String get subtitle => 'PageViewの左右スワイプで画面を切り替える';

	/// ja: '左右スワイプで切り替え'
	String get swipeTitle => '左右スワイプで切り替え';

	/// ja: '天気アプリでは複数都市をPageViewで管理し、左右スワイプで切り替えるのが標準パターン。スマホの画面端に次のページが少し見えることで「まだ続きがある」と直感的に伝わる。'
	String get swipeDesc => '天気アプリでは複数都市をPageViewで管理し、左右スワイプで切り替えるのが標準パターン。スマホの画面端に次のページが少し見えることで「まだ続きがある」と直感的に伝わる。';

	/// ja: 'ページインジケーター（ドット）'
	String get dotTitle => 'ページインジケーター（ドット）';

	/// ja: '画面下部の点（ドット）は現在表示中のページ番号を示す。白く塗りつぶされたドットが現在地であり、「全部でいくつのページがあるか」も一目でわかる。'
	String get dotDesc => '画面下部の点（ドット）は現在表示中のページ番号を示す。白く塗りつぶされたドットが現在地であり、「全部でいくつのページがあるか」も一目でわかる。';

	/// ja: '都市リストとインデックス'
	String get cityTitle => '都市リストとインデックス';

	/// ja: '複数都市の天気を管理するには、都市のリストと「現在何番目を表示しているか」のインデックスを状態として持つ設計が基本。ページ切り替えのたびにインデックスが更新される。'
	String get cityDesc => '複数都市の天気を管理するには、都市のリストと「現在何番目を表示しているか」のインデックスを状態として持つ設計が基本。ページ切り替えのたびにインデックスが更新される。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ画面を引っ張ると更新されるとわかった？'
	String get title => 'なぜ画面を引っ張ると更新されるとわかった？';

	/// ja: 'Pull to Refresh（プルリフレッシュ）パターン'
	String get subtitle => 'Pull to Refresh（プルリフレッシュ）パターン';

	/// ja: '引っ張って更新'
	String get pullTitle => '引っ張って更新';

	/// ja: 'リストの一番上でさらに下に引っ張ると更新されるPull to Refreshは、iOS/Androidアプリで普及した標準パターン。物理的に「引っ張って放す」感覚がデータ更新の概念と結びついている。'
	String get pullDesc => 'リストの一番上でさらに下に引っ張ると更新されるPull to Refreshは、iOS/Androidアプリで普及した標準パターン。物理的に「引っ張って放す」感覚がデータ更新の概念と結びついている。';

	/// ja: 'ローディングインジケーター'
	String get indicatorTitle => 'ローディングインジケーター';

	/// ja: '画面を十分引っ張ると円形のローディングアニメーションが表示される。これがフィードバックとなり、「更新操作が受け付けられた」ことをユーザーに伝える。'
	String get indicatorDesc => '画面を十分引っ張ると円形のローディングアニメーションが表示される。これがフィードバックとなり、「更新操作が受け付けられた」ことをユーザーに伝える。';

	/// ja: '引っ張り量のしきい値'
	String get thresholdTitle => '引っ張り量のしきい値';

	/// ja: '一定量以上引っ張らないと更新が発動しない設計は、誤操作を防ぐため。スクロールと区別するために、十分な引っ張り量が必要な「しきい値」が設けられている。'
	String get thresholdDesc => '一定量以上引っ張らないと更新が発動しない設計は、誤操作を防ぐため。スクロールと区別するために、十分な引っ張り量が必要な「しきい値」が設けられている。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜタップすると時間帯別天気が表示されるとわかった？'
	String get title => 'なぜタップすると時間帯別天気が表示されるとわかった？';

	/// ja: 'ExpansionTile（アコーディオン）で詳細を展開する'
	String get subtitle => 'ExpansionTile（アコーディオン）で詳細を展開する';

	/// ja: 'タップで展開するアコーディオン'
	String get expandTitle => 'タップで展開するアコーディオン';

	/// ja: '週間天気の各行をタップすると時間帯別の詳細が展開されるアコーディオンUIは、情報量が多い画面で「必要な情報だけを開いて見る」ために使われる標準パターン。'
	String get expandDesc => '週間天気の各行をタップすると時間帯別の詳細が展開されるアコーディオンUIは、情報量が多い画面で「必要な情報だけを開いて見る」ために使われる標準パターン。';

	/// ja: '展開可能を示す矢印アイコン'
	String get arrowTitle => '展開可能を示す矢印アイコン';

	/// ja: '行の右端にある「∨」または「›」アイコンは、「このUIは展開できる」というアフォーダンス。タップすると「∧」に変わり、現在の状態（開いている/閉じている）を示す。'
	String get arrowDesc => '行の右端にある「∨」または「›」アイコンは、「このUIは展開できる」というアフォーダンス。タップすると「∧」に変わり、現在の状態（開いている/閉じている）を示す。';

	/// ja: '時間帯別天気の読み方'
	String get hourlyTitle => '時間帯別天気の読み方';

	/// ja: 'アコーディオン内に表示される時間帯別天気は、「何時頃から雨が降るか」を把握するための情報。天気予報アプリの核心的な機能であり、ユーザーが行動計画を立てるために使う。'
	String get hourlyDesc => 'アコーディオン内に表示される時間帯別天気は、「何時頃から雨が降るか」を把握するための情報。天気予報アプリの核心的な機能であり、ユーザーが行動計画を立てるために使う。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ画像をタップすると全画面で開くとわかった？'
	String get title => 'なぜ画像をタップすると全画面で開くとわかった？';

	/// ja: 'タップで全画面表示するHeroアニメーション'
	String get subtitle => 'タップで全画面表示するHeroアニメーション';

	/// ja: '画像タップで全画面表示'
	String get tapTitle => '画像タップで全画面表示';

	/// ja: '小さなサムネイル画像をタップすると全画面で表示されるパターンは、ギャラリーアプリやマップアプリで広く普及している。「縮小されたものはタップで拡大できる」という共通認識がある。'
	String get tapDesc => '小さなサムネイル画像をタップすると全画面で表示されるパターンは、ギャラリーアプリやマップアプリで広く普及している。「縮小されたものはタップで拡大できる」という共通認識がある。';

	/// ja: 'Heroアニメーション'
	String get heroTitle => 'Heroアニメーション';

	/// ja: 'タップした画像がそのまま滑らかに拡大して全画面になるHeroアニメーションは、「今見ていたものが大きくなった」という連続性を演出する。画面遷移の唐突さを解消するUXパターンだ。'
	String get heroDesc => 'タップした画像がそのまま滑らかに拡大して全画面になるHeroアニメーションは、「今見ていたものが大きくなった」という連続性を演出する。画面遷移の唐突さを解消するUXパターンだ。';

	/// ja: '雨雲レーダーの見方'
	String get radarTitle => '雨雲レーダーの見方';

	/// ja: '雨雲レーダーは色のグラデーションで雨の強さを表す。青→緑→黄→赤→紫の順に強い雨を示す。全画面で表示することで雨雲の動きや位置を正確に把握できる。'
	String get radarDesc => '雨雲レーダーは色のグラデーションで雨の強さを表す。青→緑→黄→赤→紫の順に強い雨を示す。全画面で表示することで雨雲の動きや位置を正確に把握できる。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '明日は大阪に出張だ。スワイプして大阪の天気を調べよう',
			'quiz1.insight.title' => 'なぜ左スワイプで都市が切り替わるとわかった？',
			'quiz1.insight.subtitle' => 'PageViewの左右スワイプで画面を切り替える',
			'quiz1.insight.swipeTitle' => '左右スワイプで切り替え',
			'quiz1.insight.swipeDesc' => '天気アプリでは複数都市をPageViewで管理し、左右スワイプで切り替えるのが標準パターン。スマホの画面端に次のページが少し見えることで「まだ続きがある」と直感的に伝わる。',
			'quiz1.insight.dotTitle' => 'ページインジケーター（ドット）',
			'quiz1.insight.dotDesc' => '画面下部の点（ドット）は現在表示中のページ番号を示す。白く塗りつぶされたドットが現在地であり、「全部でいくつのページがあるか」も一目でわかる。',
			'quiz1.insight.cityTitle' => '都市リストとインデックス',
			'quiz1.insight.cityDesc' => '複数都市の天気を管理するには、都市のリストと「現在何番目を表示しているか」のインデックスを状態として持つ設計が基本。ページ切り替えのたびにインデックスが更新される。',
			'quiz2.missionText' => 'ちょっとデータが古いかも？引っ張って最新の天気に更新しよう',
			'quiz2.insight.title' => 'なぜ画面を引っ張ると更新されるとわかった？',
			'quiz2.insight.subtitle' => 'Pull to Refresh（プルリフレッシュ）パターン',
			'quiz2.insight.pullTitle' => '引っ張って更新',
			'quiz2.insight.pullDesc' => 'リストの一番上でさらに下に引っ張ると更新されるPull to Refreshは、iOS/Androidアプリで普及した標準パターン。物理的に「引っ張って放す」感覚がデータ更新の概念と結びついている。',
			'quiz2.insight.indicatorTitle' => 'ローディングインジケーター',
			'quiz2.insight.indicatorDesc' => '画面を十分引っ張ると円形のローディングアニメーションが表示される。これがフィードバックとなり、「更新操作が受け付けられた」ことをユーザーに伝える。',
			'quiz2.insight.thresholdTitle' => '引っ張り量のしきい値',
			'quiz2.insight.thresholdDesc' => '一定量以上引っ張らないと更新が発動しない設計は、誤操作を防ぐため。スクロールと区別するために、十分な引っ張り量が必要な「しきい値」が設けられている。',
			'quiz3.missionText' => '水曜日は雨の予報だ……何時頃から降るか、詳しく見てみよう',
			'quiz3.insight.title' => 'なぜタップすると時間帯別天気が表示されるとわかった？',
			'quiz3.insight.subtitle' => 'ExpansionTile（アコーディオン）で詳細を展開する',
			'quiz3.insight.expandTitle' => 'タップで展開するアコーディオン',
			'quiz3.insight.expandDesc' => '週間天気の各行をタップすると時間帯別の詳細が展開されるアコーディオンUIは、情報量が多い画面で「必要な情報だけを開いて見る」ために使われる標準パターン。',
			'quiz3.insight.arrowTitle' => '展開可能を示す矢印アイコン',
			'quiz3.insight.arrowDesc' => '行の右端にある「∨」または「›」アイコンは、「このUIは展開できる」というアフォーダンス。タップすると「∧」に変わり、現在の状態（開いている/閉じている）を示す。',
			'quiz3.insight.hourlyTitle' => '時間帯別天気の読み方',
			'quiz3.insight.hourlyDesc' => 'アコーディオン内に表示される時間帯別天気は、「何時頃から雨が降るか」を把握するための情報。天気予報アプリの核心的な機能であり、ユーザーが行動計画を立てるために使う。',
			'quiz4.missionText' => '空が暗くなってきた！雨雲レーダーのマップを開いて確認しよう',
			'quiz4.insight.title' => 'なぜ画像をタップすると全画面で開くとわかった？',
			'quiz4.insight.subtitle' => 'タップで全画面表示するHeroアニメーション',
			'quiz4.insight.tapTitle' => '画像タップで全画面表示',
			'quiz4.insight.tapDesc' => '小さなサムネイル画像をタップすると全画面で表示されるパターンは、ギャラリーアプリやマップアプリで広く普及している。「縮小されたものはタップで拡大できる」という共通認識がある。',
			'quiz4.insight.heroTitle' => 'Heroアニメーション',
			'quiz4.insight.heroDesc' => 'タップした画像がそのまま滑らかに拡大して全画面になるHeroアニメーションは、「今見ていたものが大きくなった」という連続性を演出する。画面遷移の唐突さを解消するUXパターンだ。',
			'quiz4.insight.radarTitle' => '雨雲レーダーの見方',
			'quiz4.insight.radarDesc' => '雨雲レーダーは色のグラデーションで雨の強さを表す。青→緑→黄→赤→紫の順に強い雨を示す。全画面で表示することで雨雲の動きや位置を正確に把握できる。',
			'common.appTitle' => '天気予報',
			'common.cityTitle' => '{cityName}の天気',
			'common.currentTemp' => '現在の気温',
			'common.tempUnit' => '{temp}°C',
			'common.weeklyForecast' => '週間天気',
			'common.hourlyDetail' => '時間帯別天気',
			'common.radarMap' => '雨雲レーダー',
			'common.radarMapDetail' => '雨雲レーダーマップ',
			'common.refreshing' => '更新中...',
			'common.lastUpdated' => '最終更新',
			'common.pullToRefresh' => '引っ張って更新',
			'common.sunny' => '晴れ',
			'common.cloudy' => '曇り',
			'common.rainy' => '雨',
			'common.partlyCloudy' => '晴れ時々曇り',
			'common.quitConfirmTitle' => 'ゲームを中断しますか？',
			'common.quitConfirmMessage' => 'プレイ中のゲームを終了します。',
			'common.continueButton' => '続ける',
			'common.quitButton' => '終了する',
			'cities.tokyo' => '東京都',
			'cities.osaka' => '大阪府',
			'cities.sapporo' => '北海道（札幌）',
			'weekdays.mon' => '月',
			'weekdays.tue' => '火',
			'weekdays.wed' => '水',
			'weekdays.thu' => '木',
			'weekdays.fri' => '金',
			'weekdays.sat' => '土',
			'weekdays.sun' => '日',
			_ => null,
		};
	}
}
