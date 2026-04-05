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
	@override late final _TranslationsAppJa app = _TranslationsAppJa._(_root);
	@override late final _TranslationsHomeJa home = _TranslationsHomeJa._(_root);
	@override late final _TranslationsStageJa stage = _TranslationsStageJa._(_root);
	@override late final _TranslationsQuizJa quiz = _TranslationsQuizJa._(_root);
	@override late final _TranslationsMissionJa mission = _TranslationsMissionJa._(_root);
	@override late final _TranslationsPurchaseJa purchase = _TranslationsPurchaseJa._(_root);
	@override late final _TranslationsErrorJa error = _TranslationsErrorJa._(_root);
	@override late final _TranslationsDashboardJa dashboard = _TranslationsDashboardJa._(_root);
	@override late final _TranslationsPlayJa play = _TranslationsPlayJa._(_root);
	@override late final _TranslationsSceneJa scene = _TranslationsSceneJa._(_root);
	@override late final _TranslationsTipJa tip = _TranslationsTipJa._(_root);
	@override late final _TranslationsSettingsJa settings = _TranslationsSettingsJa._(_root);
}

// Path: app
class _TranslationsAppJa implements TranslationsAppEn {
	_TranslationsAppJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'NantoNack';
	@override String get subtitle => 'UI/UX直感クイズ';
}

// Path: home
class _TranslationsHomeJa implements TranslationsHomeEn {
	_TranslationsHomeJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get stageList => 'ステージ一覧';
	@override String get playCount => '{count}回プレイ済み';
	@override String get subtitle => 'UI/UX 直感クイズ';
	@override String get remainingPlaysLabel => '本日の残りプレイ回数';
	@override String get playButton => 'プレイする';
	@override String get nextStageHint => '次のステージへ進む';
	@override String get past60Days => '過去60日間の\nクリア記録';
	@override String get noActivityHistory => 'まだプレイ履歴が\nありません';
	@override String get categoriesLabel => 'カテゴリー';
	@override String get categoryLockedLabel => 'クリア後に解放';
	@override String get categoryClearCount => '{cleared}/{total} クリア';
	@override String get dateFormat => '{month}月{day}日（{weekday}）';
	@override late final _TranslationsHomeWeekdayJa weekday = _TranslationsHomeWeekdayJa._(_root);
}

// Path: stage
class _TranslationsStageJa implements TranslationsStageEn {
	_TranslationsStageJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get cleared => 'クリア済み';
	@override String get available => 'プレイ可能';
	@override String get locked => 'クリア後に解放';
	@override String get play => 'プレイ';
	@override String get clearTime => 'クリアタイム: {time}';
	@override String get score => 'スコア: {score}点';
}

// Path: quiz
class _TranslationsQuizJa implements TranslationsQuizEn {
	_TranslationsQuizJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get correct => '正解！';
	@override String get incorrect => '不正解';
	@override String get timeUp => '時間切れ';
	@override String get giveUp => '諦めた...';
	@override String get result => '結果';
	@override String get retry => 'もう一度';
	@override String get next => '次へ';
	@override String get back => '戻る';
	@override String get score => 'スコア: {score}点';
	@override String get elapsedTime => 'タイム: {time}秒';
}

// Path: mission
class _TranslationsMissionJa implements TranslationsMissionEn {
	_TranslationsMissionJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'MISSION';
	@override String get topic => 'お題';
	@override String get useHint => 'ヒントを使う';
	@override String get giveUp => '諦める';
	@override String get timeLimit => '制限時間: {seconds}秒';
}

// Path: purchase
class _TranslationsPurchaseJa implements TranslationsPurchaseEn {
	_TranslationsPurchaseJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get limitReached => '本日のプレイ上限に達しました';
	@override String get unlockDescription => 'プレミアムにアップグレードすると\n無制限でプレイできます';
	@override String get upgrade => 'アップグレード';
	@override String get later => 'あとで';
}

// Path: error
class _TranslationsErrorJa implements TranslationsErrorEn {
	_TranslationsErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get unknown => 'エラーが発生しました';
	@override String get retry => '再試行';
}

// Path: dashboard
class _TranslationsDashboardJa implements TranslationsDashboardEn {
	_TranslationsDashboardJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ダッシュボード';
	@override String get todayTip => '今日のUI/UXヒント';
	@override String get remainingPlays => '残りプレイ数';
	@override String get remainingPlaysCount => '残り{count}回';
	@override String get unlimitedPlays => '無制限';
	@override String get streak => '連続プレイ';
	@override String get streakDays => '{days}日連続';
	@override String get activityHistory => 'プレイ履歴';
	@override String get noActivity => 'まだプレイ履歴がありません';
}

// Path: play
class _TranslationsPlayJa implements TranslationsPlayEn {
	_TranslationsPlayJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get startPlay => 'プレイする';
	@override String get selectCategory => 'カテゴリー選択';
	@override String get selectCategoryDescription => 'チャレンジするカテゴリーを選んでください';
	@override String get selectStage => 'ステージ選択';
	@override String get stageCount => '{count}ステージ';
	@override String get noStages => 'ステージがありません';
	@override String get comingSoon => '準備中';
	@override late final _TranslationsPlayCategoryLabelJa categoryLabel = _TranslationsPlayCategoryLabelJa._(_root);
	@override late final _TranslationsPlayCategoryDescriptionJa categoryDescription = _TranslationsPlayCategoryDescriptionJa._(_root);
	@override late final _TranslationsPlayStageTitleJa stageTitle = _TranslationsPlayStageTitleJa._(_root);
	@override late final _TranslationsPlayStageDescriptionJa stageDescription = _TranslationsPlayStageDescriptionJa._(_root);
}

// Path: scene
class _TranslationsSceneJa implements TranslationsSceneEn {
	_TranslationsSceneJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSceneGreetingJa greeting = _TranslationsSceneGreetingJa._(_root);
}

// Path: tip
class _TranslationsTipJa implements TranslationsTipEn {
	_TranslationsTipJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get defaultTitle => 'UI/UXを学ぼう';
	@override String get defaultContent => 'クイズを解いてUI/UXの感覚を磨きましょう！';
}

// Path: settings
class _TranslationsSettingsJa implements TranslationsSettingsEn {
	_TranslationsSettingsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
	@override late final _TranslationsSettingsAppearanceJa appearance = _TranslationsSettingsAppearanceJa._(_root);
	@override late final _TranslationsSettingsDataJa data = _TranslationsSettingsDataJa._(_root);
	@override late final _TranslationsSettingsAboutJa about = _TranslationsSettingsAboutJa._(_root);
}

// Path: home.weekday
class _TranslationsHomeWeekdayJa implements TranslationsHomeWeekdayEn {
	_TranslationsHomeWeekdayJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get mon => '月';
	@override String get tue => '火';
	@override String get wed => '水';
	@override String get thu => '木';
	@override String get fri => '金';
	@override String get sat => '土';
	@override String get sun => '日';
}

// Path: play.categoryLabel
class _TranslationsPlayCategoryLabelJa implements TranslationsPlayCategoryLabelEn {
	_TranslationsPlayCategoryLabelJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get shopping => 'ショッピング';
	@override String get chat => 'チャット';
	@override String get streaming => '動画';
	@override String get map => 'マップ';
	@override String get alarm => 'アラーム';
	@override String get payment => '決済';
}

// Path: play.categoryDescription
class _TranslationsPlayCategoryDescriptionJa implements TranslationsPlayCategoryDescriptionEn {
	_TranslationsPlayCategoryDescriptionJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get shopping => 'ECサイトのUI/UXを体験しよう';
	@override String get chat => 'メッセージアプリのUI/UXを体験しよう';
	@override String get streaming => '動画アプリのUI/UXを体験しよう';
	@override String get map => '地図アプリのUI/UXを体験しよう';
	@override String get alarm => '時計・アラームアプリのUI/UXを体験しよう';
	@override String get payment => 'モバイル決済アプリのUI/UXを体験しよう';
}

// Path: play.stageTitle
class _TranslationsPlayStageTitleJa implements TranslationsPlayStageTitleEn {
	_TranslationsPlayStageTitleJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get shopping_water => '水を2つ買おう';
	@override String get shopping_checkout => '購入手続きを完了しよう';
	@override String get shopping_reorder => '直近の注文を再注文しよう';
	@override String get shopping_cart => 'カートの合計金額を選ぼう';
	@override String get chat_quiz1 => 'メッセージを送ろう';
	@override String get chat_quiz2 => 'スタンプを送ろう';
	@override String get chat_quiz3 => 'メッセージを削除しよう';
	@override String get chat_quiz4 => 'グループを作ろう';
	@override String get streaming_quiz1 => '字幕をオンにしよう';
	@override String get streaming_quiz2 => '動画の中盤まで進めよう';
	@override String get streaming_quiz3 => '2倍速で再生しよう';
	@override String get streaming_quiz4 => '動画をダウンロードしよう';
	@override String get map_quiz1 => '現在地を表示しよう';
	@override String get map_quiz2 => '目的地を検索しよう';
	@override String get map_quiz3 => 'ルートを案内しよう';
	@override String get map_quiz4 => '場所をお気に入りに追加しよう';
	@override String get alarm_quiz1 => 'アラームを追加しよう';
	@override String get alarm_quiz2 => '平日だけ鳴るよう設定しよう';
	@override String get alarm_quiz3 => 'スヌーズをオフにしよう';
	@override String get alarm_quiz4 => 'アラームを削除しよう';
	@override String get payment_quiz1 => 'QRコードを表示しよう';
	@override String get payment_quiz2 => '残高を確認しよう';
	@override String get payment_quiz3 => '送金しよう';
	@override String get payment_quiz4 => '取引履歴を確認しよう';
}

// Path: play.stageDescription
class _TranslationsPlayStageDescriptionJa implements TranslationsPlayStageDescriptionEn {
	_TranslationsPlayStageDescriptionJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get shopping_water => 'ECサイトで水を2つカートに入れて購入してください';
	@override String get shopping_checkout => '住所入力・支払い方法選択・注文確認の3ステップを完了してください';
	@override String get shopping_reorder => '注文履歴から直近で注文した商品をもう一度購入してください';
	@override String get shopping_cart => 'カート内の商品の合計金額を4択から選んでください';
	@override String get chat_quiz1 => 'チャットアプリでメッセージを送信してください';
	@override String get chat_quiz2 => 'チャットアプリでスタンプを送信してください';
	@override String get chat_quiz3 => '送信したメッセージを削除してください';
	@override String get chat_quiz4 => '新しいグループチャットを作成してください';
	@override String get streaming_quiz1 => '動画アプリで字幕機能をオンにしてください';
	@override String get streaming_quiz2 => '次の動画へ移動し、動画の中盤まで進めてください';
	@override String get streaming_quiz3 => '動画アプリで動画を2倍速で再生してください';
	@override String get streaming_quiz4 => '動画を最高画質に変更して端末にダウンロードしてください';
	@override String get map_quiz1 => '地図アプリで現在地を表示してください';
	@override String get map_quiz2 => '地図アプリで目的地を検索してください';
	@override String get map_quiz3 => '地図アプリでルート案内を開始してください';
	@override String get map_quiz4 => '地図アプリで場所をお気に入りに保存してください';
	@override String get alarm_quiz1 => '時計アプリで新しいアラームを追加してください';
	@override String get alarm_quiz2 => 'アラームを月〜金曜日だけ繰り返すように設定してください';
	@override String get alarm_quiz3 => 'アラームのスヌーズ機能をオフにして保存してください';
	@override String get alarm_quiz4 => 'アラーム一覧から一番上のアラームを削除してください';
	@override String get payment_quiz1 => '決済アプリでQRコードを表示してください';
	@override String get payment_quiz2 => '決済アプリで残高のブラーを解除して確認してください';
	@override String get payment_quiz3 => '決済アプリで誰かに送金してください';
	@override String get payment_quiz4 => '決済アプリで取引履歴を確認してください';
}

// Path: scene.greeting
class _TranslationsSceneGreetingJa implements TranslationsSceneGreetingEn {
	_TranslationsSceneGreetingJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get sunriseMorning => 'おはようございます';
	@override String get sunnyDay => '今日もいい天気';
	@override String get cloudyDay => '曇り空の一日';
	@override String get rainyDay => '雨の一日';
	@override String get sunsetEvening => 'お疲れ様でした';
	@override String get nightSky => 'お疲れ様でした';
}

// Path: settings.appearance
class _TranslationsSettingsAppearanceJa implements TranslationsSettingsAppearanceEn {
	_TranslationsSettingsAppearanceJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アピアランス';
	@override String get theme => 'テーマ';
	@override String get themeSystem => 'システム設定';
	@override String get themeLight => 'ライトテーマ';
	@override String get themeDark => 'ダークテーマ';
	@override String get uiStyle => 'UIスタイル';
	@override String get uiStyleSystem => 'システム設定';
	@override String get uiStyleMaterial => 'Android風';
	@override String get uiStyleCupertino => 'iOS風';
}

// Path: settings.data
class _TranslationsSettingsDataJa implements TranslationsSettingsDataEn {
	_TranslationsSettingsDataJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'データとアカウント';
	@override String get restorePurchase => '購入の復元';
	@override String get resetData => 'プレイデータの初期化';
	@override String get resetDataDialogTitle => '記憶を消去しますか？';
	@override String get resetDataDialogMessage => 'これまでの学びが消え去ります…🥺\nクリア記録・プレイ履歴がすべて削除されます。';
	@override String get resetDataCancel => 'やめておく';
	@override String get resetDataOk => '消去する';
	@override String get resetDataSuccess => 'データを初期化しました';
}

// Path: settings.about
class _TranslationsSettingsAboutJa implements TranslationsSettingsAboutEn {
	_TranslationsSettingsAboutJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アプリについて';
	@override String get developerX => '開発者X（Twitter）';
	@override String get terms => '利用規約';
	@override String get contact => 'お問い合わせ';
	@override String get licenses => 'ライセンス';
	@override String get version => 'バージョン {version}';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'NantoNack',
			'app.subtitle' => 'UI/UX直感クイズ',
			'home.stageList' => 'ステージ一覧',
			'home.playCount' => '{count}回プレイ済み',
			'home.subtitle' => 'UI/UX 直感クイズ',
			'home.remainingPlaysLabel' => '本日の残りプレイ回数',
			'home.playButton' => 'プレイする',
			'home.nextStageHint' => '次のステージへ進む',
			'home.past60Days' => '過去60日間の\nクリア記録',
			'home.noActivityHistory' => 'まだプレイ履歴が\nありません',
			'home.categoriesLabel' => 'カテゴリー',
			'home.categoryLockedLabel' => 'クリア後に解放',
			'home.categoryClearCount' => '{cleared}/{total} クリア',
			'home.dateFormat' => '{month}月{day}日（{weekday}）',
			'home.weekday.mon' => '月',
			'home.weekday.tue' => '火',
			'home.weekday.wed' => '水',
			'home.weekday.thu' => '木',
			'home.weekday.fri' => '金',
			'home.weekday.sat' => '土',
			'home.weekday.sun' => '日',
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
			'play.noStages' => 'ステージがありません',
			'play.comingSoon' => '準備中',
			'play.categoryLabel.shopping' => 'ショッピング',
			'play.categoryLabel.chat' => 'チャット',
			'play.categoryLabel.streaming' => '動画',
			'play.categoryLabel.map' => 'マップ',
			'play.categoryLabel.alarm' => 'アラーム',
			'play.categoryLabel.payment' => '決済',
			'play.categoryDescription.shopping' => 'ECサイトのUI/UXを体験しよう',
			'play.categoryDescription.chat' => 'メッセージアプリのUI/UXを体験しよう',
			'play.categoryDescription.streaming' => '動画アプリのUI/UXを体験しよう',
			'play.categoryDescription.map' => '地図アプリのUI/UXを体験しよう',
			'play.categoryDescription.alarm' => '時計・アラームアプリのUI/UXを体験しよう',
			'play.categoryDescription.payment' => 'モバイル決済アプリのUI/UXを体験しよう',
			'play.stageTitle.shopping_water' => '水を2つ買おう',
			'play.stageTitle.shopping_checkout' => '購入手続きを完了しよう',
			'play.stageTitle.shopping_reorder' => '直近の注文を再注文しよう',
			'play.stageTitle.shopping_cart' => 'カートの合計金額を選ぼう',
			'play.stageTitle.chat_quiz1' => 'メッセージを送ろう',
			'play.stageTitle.chat_quiz2' => 'スタンプを送ろう',
			'play.stageTitle.chat_quiz3' => 'メッセージを削除しよう',
			'play.stageTitle.chat_quiz4' => 'グループを作ろう',
			'play.stageTitle.streaming_quiz1' => '字幕をオンにしよう',
			'play.stageTitle.streaming_quiz2' => '動画の中盤まで進めよう',
			'play.stageTitle.streaming_quiz3' => '2倍速で再生しよう',
			'play.stageTitle.streaming_quiz4' => '動画をダウンロードしよう',
			'play.stageTitle.map_quiz1' => '現在地を表示しよう',
			'play.stageTitle.map_quiz2' => '目的地を検索しよう',
			'play.stageTitle.map_quiz3' => 'ルートを案内しよう',
			'play.stageTitle.map_quiz4' => '場所をお気に入りに追加しよう',
			'play.stageTitle.alarm_quiz1' => 'アラームを追加しよう',
			'play.stageTitle.alarm_quiz2' => '平日だけ鳴るよう設定しよう',
			'play.stageTitle.alarm_quiz3' => 'スヌーズをオフにしよう',
			'play.stageTitle.alarm_quiz4' => 'アラームを削除しよう',
			'play.stageTitle.payment_quiz1' => 'QRコードを表示しよう',
			'play.stageTitle.payment_quiz2' => '残高を確認しよう',
			'play.stageTitle.payment_quiz3' => '送金しよう',
			'play.stageTitle.payment_quiz4' => '取引履歴を確認しよう',
			'play.stageDescription.shopping_water' => 'ECサイトで水を2つカートに入れて購入してください',
			'play.stageDescription.shopping_checkout' => '住所入力・支払い方法選択・注文確認の3ステップを完了してください',
			'play.stageDescription.shopping_reorder' => '注文履歴から直近で注文した商品をもう一度購入してください',
			'play.stageDescription.shopping_cart' => 'カート内の商品の合計金額を4択から選んでください',
			'play.stageDescription.chat_quiz1' => 'チャットアプリでメッセージを送信してください',
			'play.stageDescription.chat_quiz2' => 'チャットアプリでスタンプを送信してください',
			'play.stageDescription.chat_quiz3' => '送信したメッセージを削除してください',
			'play.stageDescription.chat_quiz4' => '新しいグループチャットを作成してください',
			'play.stageDescription.streaming_quiz1' => '動画アプリで字幕機能をオンにしてください',
			'play.stageDescription.streaming_quiz2' => '次の動画へ移動し、動画の中盤まで進めてください',
			'play.stageDescription.streaming_quiz3' => '動画アプリで動画を2倍速で再生してください',
			'play.stageDescription.streaming_quiz4' => '動画を最高画質に変更して端末にダウンロードしてください',
			'play.stageDescription.map_quiz1' => '地図アプリで現在地を表示してください',
			'play.stageDescription.map_quiz2' => '地図アプリで目的地を検索してください',
			'play.stageDescription.map_quiz3' => '地図アプリでルート案内を開始してください',
			'play.stageDescription.map_quiz4' => '地図アプリで場所をお気に入りに保存してください',
			'play.stageDescription.alarm_quiz1' => '時計アプリで新しいアラームを追加してください',
			'play.stageDescription.alarm_quiz2' => 'アラームを月〜金曜日だけ繰り返すように設定してください',
			'play.stageDescription.alarm_quiz3' => 'アラームのスヌーズ機能をオフにして保存してください',
			'play.stageDescription.alarm_quiz4' => 'アラーム一覧から一番上のアラームを削除してください',
			'play.stageDescription.payment_quiz1' => '決済アプリでQRコードを表示してください',
			'play.stageDescription.payment_quiz2' => '決済アプリで残高のブラーを解除して確認してください',
			'play.stageDescription.payment_quiz3' => '決済アプリで誰かに送金してください',
			'play.stageDescription.payment_quiz4' => '決済アプリで取引履歴を確認してください',
			'scene.greeting.sunriseMorning' => 'おはようございます',
			'scene.greeting.sunnyDay' => '今日もいい天気',
			'scene.greeting.cloudyDay' => '曇り空の一日',
			'scene.greeting.rainyDay' => '雨の一日',
			'scene.greeting.sunsetEvening' => 'お疲れ様でした',
			'scene.greeting.nightSky' => 'お疲れ様でした',
			'tip.defaultTitle' => 'UI/UXを学ぼう',
			'tip.defaultContent' => 'クイズを解いてUI/UXの感覚を磨きましょう！',
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
