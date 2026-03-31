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
	late final TranslationsMissionJa mission = TranslationsMissionJa.internal(_root);
	late final TranslationsPurchaseJa purchase = TranslationsPurchaseJa.internal(_root);
	late final TranslationsErrorJa error = TranslationsErrorJa.internal(_root);
	late final TranslationsDashboardJa dashboard = TranslationsDashboardJa.internal(_root);
	late final TranslationsPlayJa play = TranslationsPlayJa.internal(_root);
	late final TranslationsSettingsJa settings = TranslationsSettingsJa.internal(_root);
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

	/// ja: '諦めた...'
	String get giveUp => '諦めた...';

	/// ja: '結果'
	String get result => '結果';

	/// ja: 'もう一度'
	String get retry => 'もう一度';

	/// ja: '次へ'
	String get next => '次へ';

	/// ja: '戻る'
	String get back => '戻る';

	/// ja: 'スコア: {score}点'
	String get score => 'スコア: {score}点';

	/// ja: 'タイム: {time}秒'
	String get elapsedTime => 'タイム: {time}秒';
}

// Path: mission
class TranslationsMissionJa {
	TranslationsMissionJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'MISSION'
	String get title => 'MISSION';

	/// ja: 'お題'
	String get topic => 'お題';

	/// ja: 'ヒントを使う'
	String get useHint => 'ヒントを使う';

	/// ja: '諦める'
	String get giveUp => '諦める';

	/// ja: '制限時間: {seconds}秒'
	String get timeLimit => '制限時間: {seconds}秒';
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

	/// ja: '{days}日連続'
	String get streakDays => '{days}日連続';

	/// ja: 'プレイ履歴'
	String get activityHistory => 'プレイ履歴';

	/// ja: 'まだプレイ履歴がありません'
	String get noActivity => 'まだプレイ履歴がありません';
}

// Path: play
class TranslationsPlayJa {
	TranslationsPlayJa.internal(this._root);

	final Translations _root; // ignore: unused_field

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

// Path: settings
class TranslationsSettingsJa {
	TranslationsSettingsJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '設定'
	String get title => '設定';

	late final TranslationsSettingsAppearanceJa appearance = TranslationsSettingsAppearanceJa.internal(_root);
	late final TranslationsSettingsDataJa data = TranslationsSettingsDataJa.internal(_root);
	late final TranslationsSettingsAboutJa about = TranslationsSettingsAboutJa.internal(_root);
}

// Path: settings.appearance
class TranslationsSettingsAppearanceJa {
	TranslationsSettingsAppearanceJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'アピアランス'
	String get title => 'アピアランス';

	/// ja: 'テーマ'
	String get theme => 'テーマ';

	/// ja: 'システム設定'
	String get themeSystem => 'システム設定';

	/// ja: 'ライトテーマ'
	String get themeLight => 'ライトテーマ';

	/// ja: 'ダークテーマ'
	String get themeDark => 'ダークテーマ';

	/// ja: 'UIスタイル'
	String get uiStyle => 'UIスタイル';

	/// ja: 'システム設定'
	String get uiStyleSystem => 'システム設定';

	/// ja: 'Android風'
	String get uiStyleMaterial => 'Android風';

	/// ja: 'iOS風'
	String get uiStyleCupertino => 'iOS風';
}

// Path: settings.data
class TranslationsSettingsDataJa {
	TranslationsSettingsDataJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'データとアカウント'
	String get title => 'データとアカウント';

	/// ja: '購入の復元'
	String get restorePurchase => '購入の復元';

	/// ja: 'プレイデータの初期化'
	String get resetData => 'プレイデータの初期化';

	/// ja: '記憶を消去しますか？'
	String get resetDataDialogTitle => '記憶を消去しますか？';

	/// ja: 'これまでの学びが消え去ります…🥺 クリア記録・プレイ履歴がすべて削除されます。'
	String get resetDataDialogMessage => 'これまでの学びが消え去ります…🥺\nクリア記録・プレイ履歴がすべて削除されます。';

	/// ja: 'やめておく'
	String get resetDataCancel => 'やめておく';

	/// ja: '消去する'
	String get resetDataOk => '消去する';

	/// ja: 'データを初期化しました'
	String get resetDataSuccess => 'データを初期化しました';
}

// Path: settings.about
class TranslationsSettingsAboutJa {
	TranslationsSettingsAboutJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'アプリについて'
	String get title => 'アプリについて';

	/// ja: '開発者X（Twitter）'
	String get developerX => '開発者X（Twitter）';

	/// ja: '利用規約'
	String get terms => '利用規約';

	/// ja: 'お問い合わせ'
	String get contact => 'お問い合わせ';

	/// ja: 'ライセンス'
	String get licenses => 'ライセンス';

	/// ja: 'バージョン {version}'
	String get version => 'バージョン {version}';
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
			'quiz.giveUp' => '諦めた...',
			'quiz.result' => '結果',
			'quiz.retry' => 'もう一度',
			'quiz.next' => '次へ',
			'quiz.back' => '戻る',
			'quiz.score' => 'スコア: {score}点',
			'quiz.elapsedTime' => 'タイム: {time}秒',
			'mission.title' => 'MISSION',
			'mission.topic' => 'お題',
			'mission.useHint' => 'ヒントを使う',
			'mission.giveUp' => '諦める',
			'mission.timeLimit' => '制限時間: {seconds}秒',
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
			'dashboard.streakDays' => '{days}日連続',
			'dashboard.activityHistory' => 'プレイ履歴',
			'dashboard.noActivity' => 'まだプレイ履歴がありません',
			'play.startPlay' => 'プレイする',
			'play.selectCategory' => 'カテゴリー選択',
			'play.selectCategoryDescription' => 'チャレンジするカテゴリーを選んでください',
			'play.selectStage' => 'ステージ選択',
			'play.stageCount' => '{count}ステージ',
			'settings.title' => '設定',
			'settings.appearance.title' => 'アピアランス',
			'settings.appearance.theme' => 'テーマ',
			'settings.appearance.themeSystem' => 'システム設定',
			'settings.appearance.themeLight' => 'ライトテーマ',
			'settings.appearance.themeDark' => 'ダークテーマ',
			'settings.appearance.uiStyle' => 'UIスタイル',
			'settings.appearance.uiStyleSystem' => 'システム設定',
			'settings.appearance.uiStyleMaterial' => 'Android風',
			'settings.appearance.uiStyleCupertino' => 'iOS風',
			'settings.data.title' => 'データとアカウント',
			'settings.data.restorePurchase' => '購入の復元',
			'settings.data.resetData' => 'プレイデータの初期化',
			'settings.data.resetDataDialogTitle' => '記憶を消去しますか？',
			'settings.data.resetDataDialogMessage' => 'これまでの学びが消え去ります…🥺\nクリア記録・プレイ履歴がすべて削除されます。',
			'settings.data.resetDataCancel' => 'やめておく',
			'settings.data.resetDataOk' => '消去する',
			'settings.data.resetDataSuccess' => 'データを初期化しました',
			'settings.about.title' => 'アプリについて',
			'settings.about.developerX' => '開発者X（Twitter）',
			'settings.about.terms' => '利用規約',
			'settings.about.contact' => 'お問い合わせ',
			'settings.about.licenses' => 'ライセンス',
			'settings.about.version' => 'バージョン {version}',
			_ => null,
		};
	}
}
