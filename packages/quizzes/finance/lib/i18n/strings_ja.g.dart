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

	/// ja: '昨日はどんな値動きだったんだろう？グラフを過去（左側）に遡ってみよう'
	String get missionText => '昨日はどんな値動きだったんだろう？グラフを過去（左側）に遡ってみよう';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '全体像が見えないな。グラフを縮小して全体を表示しよう'
	String get missionText => '全体像が見えないな。グラフを縮小して全体を表示しよう';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'この一番高い山の頂点、いくらだったんだろう？長押しして調べてみよう'
	String get missionText => 'この一番高い山の頂点、いくらだったんだろう？長押しして調べてみよう';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '1日単位じゃ分かりにくい。1週間のグラフに切り替えよう'
	String get missionText => '1日単位じゃ分かりにくい。1週間のグラフに切り替えよう';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'Stock Chart'
	String get appTitle => 'Stock Chart';

	/// ja: 'MOCK'
	String get tickerSymbol => 'MOCK';

	/// ja: '1D'
	String get periodOneDay => '1D';

	/// ja: '1W'
	String get periodOneWeek => '1W';

	/// ja: '1M'
	String get periodOneMonth => '1M';

	/// ja: '1Y'
	String get periodOneYear => '1Y';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜパンで過去がわかった？'
	String get title => 'なぜパンで過去がわかった？';

	/// ja: 'チャートは「左が過去・右が現在」の万国共通ルール'
	String get subtitle => 'チャートは「左が過去・右が現在」の万国共通ルール';

	/// ja: '左右のスワイプで時間軸を移動できる'
	String get panTitle => '左右のスワイプで時間軸を移動できる';

	/// ja: 'チャートアプリではグラフを左右にドラッグすることで、過去・未来の時間帯を確認できる。株価・FX・仮想通貨アプリで世界共通の操作方法だ。'
	String get panDesc => 'チャートアプリではグラフを左右にドラッグすることで、過去・未来の時間帯を確認できる。株価・FX・仮想通貨アプリで世界共通の操作方法だ。';

	/// ja: '「左＝過去」は金融チャートの常識'
	String get leftTitle => '「左＝過去」は金融チャートの常識';

	/// ja: '時間は左から右に流れるため、チャートの左側が過去、右側が最新データを表す。この左右の法則は世界中のあらゆる金融チャートで共通している。'
	String get leftDesc => '時間は左から右に流れるため、チャートの左側が過去、右側が最新データを表す。この左右の法則は世界中のあらゆる金融チャートで共通している。';

	/// ja: 'スクロールで「隠れたデータ」を確認する'
	String get viewTitle => 'スクロールで「隠れたデータ」を確認する';

	/// ja: '画面に収まりきらない過去のデータは右スワイプで引き出せる。これはTradingViewなど主要チャートアプリの標準的なUI設計だ。'
	String get viewDesc => '画面に収まりきらない過去のデータは右スワイプで引き出せる。これはTradingViewなど主要チャートアプリの標準的なUI設計だ。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜピンチインで縮小できた？'
	String get title => 'なぜピンチインで縮小できた？';

	/// ja: '2本指を閉じる＝縮小は世界標準のジェスチャー'
	String get subtitle => '2本指を閉じる＝縮小は世界標準のジェスチャー';

	/// ja: 'ピンチインは「縮小」の直感ジェスチャー'
	String get pinchTitle => 'ピンチインは「縮小」の直感ジェスチャー';

	/// ja: '2本の指を閉じる（ピンチイン）ことで画面を縮小するジェスチャーは、iOSとAndroidで共通のタッチ操作として定着している。'
	String get pinchDesc => '2本の指を閉じる（ピンチイン）ことで画面を縮小するジェスチャーは、iOSとAndroidで共通のタッチ操作として定着している。';

	/// ja: '縮小すると全体の「形」が見える'
	String get zoomTitle => '縮小すると全体の「形」が見える';

	/// ja: '株価チャートはズームアウトすることで長期トレンドやパターンが見えやすくなる。全体像を把握することがトレード判断の基本だ。'
	String get zoomDesc => '株価チャートはズームアウトすることで長期トレンドやパターンが見えやすくなる。全体像を把握することがトレード判断の基本だ。';

	/// ja: '拡大・縮小で最適なビューを探す'
	String get overviewTitle => '拡大・縮小で最適なビューを探す';

	/// ja: 'ピンチイン（縮小）でマクロな視点、ピンチアウト（拡大）でミクロな分析。この使い分けが投資家がチャートアプリを使いこなす際の基本テクニックだ。'
	String get overviewDesc => 'ピンチイン（縮小）でマクロな視点、ピンチアウト（拡大）でミクロな分析。この使い分けが投資家がチャートアプリを使いこなす際の基本テクニックだ。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ長押しで価格がわかった？'
	String get title => 'なぜ長押しで価格がわかった？';

	/// ja: '十字線（クロスヘア）は正確な価格読取の専用ツール'
	String get subtitle => '十字線（クロスヘア）は正確な価格読取の専用ツール';

	/// ja: 'タッチで十字線（クロスヘア）が出現する'
	String get crosshairTitle => 'タッチで十字線（クロスヘア）が出現する';

	/// ja: 'チャートを長押しすると縦横の十字線が表示され、その交点にある正確な価格と時刻がツールチップで確認できる。TradingViewなど多くのチャートアプリで採用されている。'
	String get crosshairDesc => 'チャートを長押しすると縦横の十字線が表示され、その交点にある正確な価格と時刻がツールチップで確認できる。TradingViewなど多くのチャートアプリで採用されている。';

	/// ja: 'ツールチップで価格を正確に読み取れる'
	String get tooltipTitle => 'ツールチップで価格を正確に読み取れる';

	/// ja: '十字線に合わせて表示されるツールチップには、その時点の正確な価格が表示される。視覚的なチャートでは読みにくいレベルの値も、十字線を使えば正確に確認できる。'
	String get tooltipDesc => '十字線に合わせて表示されるツールチップには、その時点の正確な価格が表示される。視覚的なチャートでは読みにくいレベルの値も、十字線を使えば正確に確認できる。';

	/// ja: '長押しが「精密モード」への切り替えジェスチャー'
	String get longpressTitle => '長押しが「精密モード」への切り替えジェスチャー';

	/// ja: '通常のタップと区別することで誤操作を防ぎつつ、ユーザーが「詳しく調べたい」という意図を示すことができる。長押しは精密操作のための万国共通のジェスチャーだ。'
	String get longpressDesc => '通常のタップと区別することで誤操作を防ぎつつ、ユーザーが「詳しく調べたい」という意図を示すことができる。長押しは精密操作のための万国共通のジェスチャーだ。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜチップをタップで期間変更できた？'
	String get title => 'なぜチップをタップで期間変更できた？';

	/// ja: '「1D・1W・1M」はチャートアプリの世界共通チップUI'
	String get subtitle => '「1D・1W・1M」はチャートアプリの世界共通チップUI';

	/// ja: '短いラベルのチップが期間切り替えのUI'
	String get chipTitle => '短いラベルのチップが期間切り替えのUI';

	/// ja: '1D・1W・1M・1Yなどのチップは、TradingView・Google Finance・ヤフーファイナンスなど世界中のチャートアプリで使われている。'
	String get chipDesc => '1D・1W・1M・1Yなどのチップは、TradingView・Google Finance・ヤフーファイナンスなど世界中のチャートアプリで使われている。';

	/// ja: '期間切り替えで「視点の粒度」が変わる'
	String get periodTitle => '期間切り替えで「視点の粒度」が変わる';

	/// ja: '1日のグラフは細かい値動きを確認するのに適しているが、トレンドを把握するには1週間・1ヶ月のグラフが有効だ。適切な期間選択が投資判断のカギとなる。'
	String get periodDesc => '1日のグラフは細かい値動きを確認するのに適しているが、トレンドを把握するには1週間・1ヶ月のグラフが有効だ。適切な期間選択が投資判断のカギとなる。';

	/// ja: 'アクティブ状態が「今見ている期間」を示す'
	String get activeTitle => 'アクティブ状態が「今見ている期間」を示す';

	/// ja: '選択中のチップが強調表示されることで、現在どの期間のデータを見ているかが一目でわかる。これはUI設計における「現在地表示の原則」だ。'
	String get activeDesc => '選択中のチップが強調表示されることで、現在どの期間のデータを見ているかが一目でわかる。これはUI設計における「現在地表示の原則」だ。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '昨日はどんな値動きだったんだろう？グラフを過去（左側）に遡ってみよう',
			'quiz1.insight.title' => 'なぜパンで過去がわかった？',
			'quiz1.insight.subtitle' => 'チャートは「左が過去・右が現在」の万国共通ルール',
			'quiz1.insight.panTitle' => '左右のスワイプで時間軸を移動できる',
			'quiz1.insight.panDesc' => 'チャートアプリではグラフを左右にドラッグすることで、過去・未来の時間帯を確認できる。株価・FX・仮想通貨アプリで世界共通の操作方法だ。',
			'quiz1.insight.leftTitle' => '「左＝過去」は金融チャートの常識',
			'quiz1.insight.leftDesc' => '時間は左から右に流れるため、チャートの左側が過去、右側が最新データを表す。この左右の法則は世界中のあらゆる金融チャートで共通している。',
			'quiz1.insight.viewTitle' => 'スクロールで「隠れたデータ」を確認する',
			'quiz1.insight.viewDesc' => '画面に収まりきらない過去のデータは右スワイプで引き出せる。これはTradingViewなど主要チャートアプリの標準的なUI設計だ。',
			'quiz2.missionText' => '全体像が見えないな。グラフを縮小して全体を表示しよう',
			'quiz2.insight.title' => 'なぜピンチインで縮小できた？',
			'quiz2.insight.subtitle' => '2本指を閉じる＝縮小は世界標準のジェスチャー',
			'quiz2.insight.pinchTitle' => 'ピンチインは「縮小」の直感ジェスチャー',
			'quiz2.insight.pinchDesc' => '2本の指を閉じる（ピンチイン）ことで画面を縮小するジェスチャーは、iOSとAndroidで共通のタッチ操作として定着している。',
			'quiz2.insight.zoomTitle' => '縮小すると全体の「形」が見える',
			'quiz2.insight.zoomDesc' => '株価チャートはズームアウトすることで長期トレンドやパターンが見えやすくなる。全体像を把握することがトレード判断の基本だ。',
			'quiz2.insight.overviewTitle' => '拡大・縮小で最適なビューを探す',
			'quiz2.insight.overviewDesc' => 'ピンチイン（縮小）でマクロな視点、ピンチアウト（拡大）でミクロな分析。この使い分けが投資家がチャートアプリを使いこなす際の基本テクニックだ。',
			'quiz3.missionText' => 'この一番高い山の頂点、いくらだったんだろう？長押しして調べてみよう',
			'quiz3.insight.title' => 'なぜ長押しで価格がわかった？',
			'quiz3.insight.subtitle' => '十字線（クロスヘア）は正確な価格読取の専用ツール',
			'quiz3.insight.crosshairTitle' => 'タッチで十字線（クロスヘア）が出現する',
			'quiz3.insight.crosshairDesc' => 'チャートを長押しすると縦横の十字線が表示され、その交点にある正確な価格と時刻がツールチップで確認できる。TradingViewなど多くのチャートアプリで採用されている。',
			'quiz3.insight.tooltipTitle' => 'ツールチップで価格を正確に読み取れる',
			'quiz3.insight.tooltipDesc' => '十字線に合わせて表示されるツールチップには、その時点の正確な価格が表示される。視覚的なチャートでは読みにくいレベルの値も、十字線を使えば正確に確認できる。',
			'quiz3.insight.longpressTitle' => '長押しが「精密モード」への切り替えジェスチャー',
			'quiz3.insight.longpressDesc' => '通常のタップと区別することで誤操作を防ぎつつ、ユーザーが「詳しく調べたい」という意図を示すことができる。長押しは精密操作のための万国共通のジェスチャーだ。',
			'quiz4.missionText' => '1日単位じゃ分かりにくい。1週間のグラフに切り替えよう',
			'quiz4.insight.title' => 'なぜチップをタップで期間変更できた？',
			'quiz4.insight.subtitle' => '「1D・1W・1M」はチャートアプリの世界共通チップUI',
			'quiz4.insight.chipTitle' => '短いラベルのチップが期間切り替えのUI',
			'quiz4.insight.chipDesc' => '1D・1W・1M・1Yなどのチップは、TradingView・Google Finance・ヤフーファイナンスなど世界中のチャートアプリで使われている。',
			'quiz4.insight.periodTitle' => '期間切り替えで「視点の粒度」が変わる',
			'quiz4.insight.periodDesc' => '1日のグラフは細かい値動きを確認するのに適しているが、トレンドを把握するには1週間・1ヶ月のグラフが有効だ。適切な期間選択が投資判断のカギとなる。',
			'quiz4.insight.activeTitle' => 'アクティブ状態が「今見ている期間」を示す',
			'quiz4.insight.activeDesc' => '選択中のチップが強調表示されることで、現在どの期間のデータを見ているかが一目でわかる。これはUI設計における「現在地表示の原則」だ。',
			'common.appTitle' => 'Stock Chart',
			'common.tickerSymbol' => 'MOCK',
			'common.periodOneDay' => '1D',
			'common.periodOneWeek' => '1W',
			'common.periodOneMonth' => '1M',
			'common.periodOneYear' => '1Y',
			_ => null,
		};
	}
}
