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
	late final TranslationsAppJa app = TranslationsAppJa.internal(_root);
	late final TranslationsHomeJa home = TranslationsHomeJa.internal(_root);
	late final TranslationsStageJa stage = TranslationsStageJa.internal(_root);
	late final TranslationsQuizJa quiz = TranslationsQuizJa.internal(_root);
	late final TranslationsPurchaseJa purchase = TranslationsPurchaseJa.internal(_root);
	late final TranslationsErrorJa error = TranslationsErrorJa.internal(_root);
	late final TranslationsDashboardJa dashboard = TranslationsDashboardJa.internal(_root);
	late final TranslationsPlayJa play = TranslationsPlayJa.internal(_root);
}

// Path: app
class TranslationsAppJa {
	TranslationsAppJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'NantoNack'
	String get title => 'NantoNack';

	/// ja: 'UI/UX直感クイズ'
	String get subtitle => 'UI/UX直感クイズ';
}

// Path: home
class TranslationsHomeJa {
	TranslationsHomeJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ステージ一覧'
	String get stageList => 'ステージ一覧';

	/// ja: '{count}回プレイ済み'
	String get playCount => '{count}回プレイ済み';
}

// Path: stage
class TranslationsStageJa {
	TranslationsStageJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'クリア済み'
	String get cleared => 'クリア済み';

	/// ja: 'プレイ可能'
	String get available => 'プレイ可能';

	/// ja: 'クリア後に解放'
	String get locked => 'クリア後に解放';

	/// ja: 'プレイ'
	String get play => 'プレイ';

	/// ja: 'クリアタイム: {time}'
	String get clearTime => 'クリアタイム: {time}';

	/// ja: 'スコア: {score}点'
	String get score => 'スコア: {score}点';
}

// Path: quiz
class TranslationsQuizJa {
	TranslationsQuizJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '正解！'
	String get correct => '正解！';

	/// ja: '不正解'
	String get incorrect => '不正解';

	/// ja: '時間切れ'
	String get timeUp => '時間切れ';

	/// ja: '結果'
	String get result => '結果';

	/// ja: 'もう一度'
	String get retry => 'もう一度';

	/// ja: '次へ'
	String get next => '次へ';

	/// ja: '戻る'
	String get back => '戻る';
}

// Path: purchase
class TranslationsPurchaseJa {
	TranslationsPurchaseJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '本日のプレイ上限に達しました'
	String get limitReached => '本日のプレイ上限に達しました';

	/// ja: 'プレミアムにアップグレードすると 無制限でプレイできます'
	String get unlockDescription => 'プレミアムにアップグレードすると\n無制限でプレイできます';

	/// ja: 'アップグレード'
	String get upgrade => 'アップグレード';

	/// ja: 'あとで'
	String get later => 'あとで';
}

// Path: error
class TranslationsErrorJa {
	TranslationsErrorJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'エラーが発生しました'
	String get unknown => 'エラーが発生しました';

	/// ja: '再試行'
	String get retry => '再試行';
}

// Path: dashboard
class TranslationsDashboardJa {
	TranslationsDashboardJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ダッシュボード'
	String get title => 'ダッシュボード';

	/// ja: '今日のUI/UXヒント'
	String get todayTip => '今日のUI/UXヒント';

	/// ja: '残りプレイ数'
	String get remainingPlays => '残りプレイ数';

	/// ja: '残り{count}回'
	String get remainingPlaysCount => '残り{count}回';

	/// ja: '無制限'
	String get unlimitedPlays => '無制限';

	/// ja: '連続プレイ'
	String get streak => '連続プレイ';

	/// ja: '{days}日連続' (one/other どちらも同じ形式)
	String streakDays({required num n, required int days}) => '${days}日連続';

	/// ja: 'プレイ履歴'
	String get activityHistory => 'プレイ履歴';

	/// ja: 'まだプレイ履歴がありません'
	String get noActivity => 'まだプレイ履歴がありません';
}

// Path: play
class TranslationsPlayJa {
	TranslationsPlayJa.internal(this._root);

	// ignore: unused_field
	final dynamic _root;

	// Translations

	/// ja: 'プレイする'
	String get startPlay => 'プレイする';

	/// ja: 'カテゴリー選択'
	String get selectCategory => 'カテゴリー選択';

	/// ja: 'チャレンジするカテゴリーを選んでください'
	String get selectCategoryDescription => 'チャレンジするカテゴリーを選んでください';

	/// ja: 'ステージ選択'
	String get selectStage => 'ステージ選択';

	/// ja: '{count}ステージ'
	String get stageCount => '{count}ステージ';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'NantoNack',
			'app.subtitle' => 'UI/UX直感クイズ',
			'home.stageList' => 'ステージ一覧',
			'home.playCount' => '{count}回プレイ済み',
			'stage.cleared' => 'クリア済み',
			'stage.available' => 'プレイ可能',
			'stage.locked' => 'クリア後に解放',
			'stage.play' => 'プレイ',
			'stage.clearTime' => 'クリアタイム: {time}',
			'stage.score' => 'スコア: {score}点',
			'quiz.correct' => '正解！',
			'quiz.incorrect' => '不正解',
			'quiz.timeUp' => '時間切れ',
			'quiz.result' => '結果',
			'quiz.retry' => 'もう一度',
			'quiz.next' => '次へ',
			'quiz.back' => '戻る',
			'purchase.limitReached' => '本日のプレイ上限に達しました',
			'purchase.unlockDescription' => 'プレミアムにアップグレードすると\n無制限でプレイできます',
			'purchase.upgrade' => 'アップグレード',
			'purchase.later' => 'あとで',
			'error.unknown' => 'エラーが発生しました',
			'error.retry' => '再試行',
			'dashboard.title' => 'ダッシュボード',
			'dashboard.todayTip' => '今日のUI/UXヒント',
			'dashboard.remainingPlays' => '残りプレイ数',
			'dashboard.remainingPlaysCount' => '残り{count}回',
			'dashboard.unlimitedPlays' => '無制限',
			'dashboard.streak' => '連続プレイ',
			'dashboard.streakDays' => ({required num n, required int days}) => _root.dashboard.streakDays(n: n, days: days),
			'dashboard.activityHistory' => 'プレイ履歴',
			'dashboard.noActivity' => 'まだプレイ履歴がありません',
			'play.startPlay' => 'プレイする',
			'play.selectCategory' => 'カテゴリー選択',
			'play.selectCategoryDescription' => 'チャレンジするカテゴリーを選んでください',
			'play.selectStage' => 'ステージ選択',
			'play.stageCount' => '{count}ステージ',
			_ => null,
		};
	}
}
