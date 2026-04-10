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
	late final TranslationsSceneJa scene = TranslationsSceneJa.internal(_root);
	late final TranslationsTipJa tip = TranslationsTipJa.internal(_root);
	late final TranslationsTutorialJa tutorial = TranslationsTutorialJa.internal(_root);
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

	/// ja: 'UI/UX 直感クイズ'
	String get subtitle => 'UI/UX 直感クイズ';

	/// ja: '本日の残りプレイ回数'
	String get remainingPlaysLabel => '本日の残りプレイ回数';

	/// ja: 'プレイする'
	String get playButton => 'プレイする';

	/// ja: '次のステージへ進む'
	String get nextStageHint => '次のステージへ進む';

	/// ja: '過去60日間の クリア記録'
	String get past60Days => '過去60日間の\nクリア記録';

	/// ja: 'まだプレイ履歴が ありません'
	String get noActivityHistory => 'まだプレイ履歴が\nありません';

	/// ja: 'カテゴリー'
	String get categoriesLabel => 'カテゴリー';

	/// ja: 'クリア後に解放'
	String get categoryLockedLabel => 'クリア後に解放';

	/// ja: '{cleared}/{total} クリア'
	String get categoryClearCount => '{cleared}/{total} クリア';

	/// ja: '{month}月{day}日（{weekday}）'
	String get dateFormat => '{month}月{day}日（{weekday}）';

	late final TranslationsHomeWeekdayJa weekday = TranslationsHomeWeekdayJa.internal(_root);
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

	/// ja: 'ゲームを中断しますか？'
	String get exitDialogTitle => 'ゲームを中断しますか？';

	/// ja: 'プレイ中のゲームを終了します。'
	String get exitDialogContent => 'プレイ中のゲームを終了します。';

	/// ja: '続ける'
	String get exitDialogContinue => '続ける';

	/// ja: '終了する'
	String get exitDialogExit => '終了する';
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

	/// ja: 'ステージがありません'
	String get noStages => 'ステージがありません';

	/// ja: '準備中'
	String get comingSoon => '準備中';

	late final TranslationsPlayCategoryLabelJa categoryLabel = TranslationsPlayCategoryLabelJa.internal(_root);
	late final TranslationsPlayCategoryDescriptionJa categoryDescription = TranslationsPlayCategoryDescriptionJa.internal(_root);
	late final TranslationsPlayStageTitleJa stageTitle = TranslationsPlayStageTitleJa.internal(_root);
	late final TranslationsPlayStageDescriptionJa stageDescription = TranslationsPlayStageDescriptionJa.internal(_root);
}

// Path: scene
class TranslationsSceneJa {
	TranslationsSceneJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSceneGreetingJa greeting = TranslationsSceneGreetingJa.internal(_root);
}

// Path: tip
class TranslationsTipJa {
	TranslationsTipJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'UI/UXを学ぼう'
	String get defaultTitle => 'UI/UXを学ぼう';

	/// ja: 'クイズを解いてUI/UXの感覚を磨きましょう！'
	String get defaultContent => 'クイズを解いてUI/UXの感覚を磨きましょう！';
}

// Path: tutorial
class TranslationsTutorialJa {
	TranslationsTutorialJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'スキップ'
	String get skip => 'スキップ';

	/// ja: 'ようこそ！ボクはナントム！'
	String get step1 => 'ようこそ！ボクはナントム！';

	/// ja: 'ここではボクが作ったアプリをならべてるよ'
	String get step2 => 'ここではボクが作ったアプリをならべてるよ';

	/// ja: '一生懸命作ったからさっそく使ってみて！'
	String get step3 => '一生懸命作ったからさっそく使ってみて！';

	/// ja: 'まずはショッピングアプリを体験してみよう。いくよ！'
	String get step4 => 'まずはショッピングアプリを体験してみよう。いくよ！';

	/// ja: 'うわー！文字が読めなくなっちゃってる'
	String get step5 => 'うわー！文字が読めなくなっちゃってる';

	/// ja: 'ボクのノロいが伝染ったのかも'
	String get step6 => 'ボクのノロいが伝染ったのかも';

	/// ja: 'でも大丈夫！文字が読めなくても、アイコンや色を見れば「なんとなく」わかるはず。さあ、やってみて！'
	String get step7 => 'でも大丈夫！文字が読めなくても、アイコンや色を見れば「なんとなく」わかるはず。さあ、やってみて！';
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

// Path: home.weekday
class TranslationsHomeWeekdayJa {
	TranslationsHomeWeekdayJa.internal(this._root);

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

// Path: play.categoryLabel
class TranslationsPlayCategoryLabelJa {
	TranslationsPlayCategoryLabelJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ショッピング'
	String get shopping => 'ショッピング';

	/// ja: 'チャット'
	String get chat => 'チャット';

	/// ja: '動画'
	String get streaming => '動画';

	/// ja: 'マップ'
	String get map => 'マップ';

	/// ja: 'アラーム'
	String get alarm => 'アラーム';

	/// ja: '決済'
	String get payment => '決済';
}

// Path: play.categoryDescription
class TranslationsPlayCategoryDescriptionJa {
	TranslationsPlayCategoryDescriptionJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ECサイトのUI/UXを体験しよう'
	String get shopping => 'ECサイトのUI/UXを体験しよう';

	/// ja: 'メッセージアプリのUI/UXを体験しよう'
	String get chat => 'メッセージアプリのUI/UXを体験しよう';

	/// ja: '動画アプリのUI/UXを体験しよう'
	String get streaming => '動画アプリのUI/UXを体験しよう';

	/// ja: '地図アプリのUI/UXを体験しよう'
	String get map => '地図アプリのUI/UXを体験しよう';

	/// ja: '時計・アラームアプリのUI/UXを体験しよう'
	String get alarm => '時計・アラームアプリのUI/UXを体験しよう';

	/// ja: 'モバイル決済アプリのUI/UXを体験しよう'
	String get payment => 'モバイル決済アプリのUI/UXを体験しよう';
}

// Path: play.stageTitle
class TranslationsPlayStageTitleJa {
	TranslationsPlayStageTitleJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '水を2つ買おう'
	String get shopping_water => '水を2つ買おう';

	/// ja: '購入手続きを完了しよう'
	String get shopping_checkout => '購入手続きを完了しよう';

	/// ja: '直近の注文を再注文しよう'
	String get shopping_reorder => '直近の注文を再注文しよう';

	/// ja: 'カートの合計金額を選ぼう'
	String get shopping_cart => 'カートの合計金額を選ぼう';

	/// ja: 'スタンプを返信しよう'
	String get chat_quiz1 => 'スタンプを返信しよう';

	/// ja: 'リアクションをしよう'
	String get chat_quiz2 => 'リアクションをしよう';

	/// ja: '写真を送ろう'
	String get chat_quiz3 => '写真を送ろう';

	/// ja: 'メッセージを取り消そう'
	String get chat_quiz4 => 'メッセージを取り消そう';

	/// ja: '字幕をオンにしよう'
	String get streaming_quiz1 => '字幕をオンにしよう';

	/// ja: '動画の中盤まで進めよう'
	String get streaming_quiz2 => '動画の中盤まで進めよう';

	/// ja: '2倍速で再生しよう'
	String get streaming_quiz3 => '2倍速で再生しよう';

	/// ja: '動画をダウンロードしよう'
	String get streaming_quiz4 => '動画をダウンロードしよう';

	/// ja: '現在地を表示しよう'
	String get map_quiz1 => '現在地を表示しよう';

	/// ja: '目的地を検索しよう'
	String get map_quiz2 => '目的地を検索しよう';

	/// ja: 'ルートを案内しよう'
	String get map_quiz3 => 'ルートを案内しよう';

	/// ja: '場所をお気に入りに追加しよう'
	String get map_quiz4 => '場所をお気に入りに追加しよう';

	/// ja: 'アラームを追加しよう'
	String get alarm_quiz1 => 'アラームを追加しよう';

	/// ja: '平日だけ鳴るよう設定しよう'
	String get alarm_quiz2 => '平日だけ鳴るよう設定しよう';

	/// ja: 'スヌーズをオフにしよう'
	String get alarm_quiz3 => 'スヌーズをオフにしよう';

	/// ja: 'アラームを削除しよう'
	String get alarm_quiz4 => 'アラームを削除しよう';

	/// ja: 'QRコードを表示しよう'
	String get payment_quiz1 => 'QRコードを表示しよう';

	/// ja: '残高を隠そう'
	String get payment_quiz2 => '残高を隠そう';

	/// ja: '送金しよう'
	String get payment_quiz3 => '送金しよう';

	/// ja: '支払い方法を変更しよう'
	String get payment_quiz4 => '支払い方法を変更しよう';
}

// Path: play.stageDescription
class TranslationsPlayStageDescriptionJa {
	TranslationsPlayStageDescriptionJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ECサイトで水を2つカートに入れて購入してください'
	String get shopping_water => 'ECサイトで水を2つカートに入れて購入してください';

	/// ja: '住所入力・支払い方法選択・注文確認の3ステップを完了してください'
	String get shopping_checkout => '住所入力・支払い方法選択・注文確認の3ステップを完了してください';

	/// ja: '注文履歴から直近で注文した商品をもう一度購入してください'
	String get shopping_reorder => '注文履歴から直近で注文した商品をもう一度購入してください';

	/// ja: 'カート内の商品の合計金額を4択から選んでください'
	String get shopping_cart => 'カート内の商品の合計金額を4択から選んでください';

	/// ja: 'チャットアプリでスタンプを1つ返信してください'
	String get chat_quiz1 => 'チャットアプリでスタンプを1つ返信してください';

	/// ja: '相手のメッセージにハートリアクションをしてください'
	String get chat_quiz2 => '相手のメッセージにハートリアクションをしてください';

	/// ja: 'チャットアプリで写真を1枚送信してください'
	String get chat_quiz3 => 'チャットアプリで写真を1枚送信してください';

	/// ja: '送信した自分のメッセージを取り消してください'
	String get chat_quiz4 => '送信した自分のメッセージを取り消してください';

	/// ja: '動画アプリで字幕機能をオンにしてください'
	String get streaming_quiz1 => '動画アプリで字幕機能をオンにしてください';

	/// ja: '次の動画へ移動し、動画の中盤まで進めてください'
	String get streaming_quiz2 => '次の動画へ移動し、動画の中盤まで進めてください';

	/// ja: '動画アプリで動画を2倍速で再生してください'
	String get streaming_quiz3 => '動画アプリで動画を2倍速で再生してください';

	/// ja: '動画を最高画質に変更して端末にダウンロードしてください'
	String get streaming_quiz4 => '動画を最高画質に変更して端末にダウンロードしてください';

	/// ja: '地図アプリで現在地を表示してください'
	String get map_quiz1 => '地図アプリで現在地を表示してください';

	/// ja: '地図アプリで目的地を検索してください'
	String get map_quiz2 => '地図アプリで目的地を検索してください';

	/// ja: '地図アプリでルート案内を開始してください'
	String get map_quiz3 => '地図アプリでルート案内を開始してください';

	/// ja: '地図アプリで場所をお気に入りに保存してください'
	String get map_quiz4 => '地図アプリで場所をお気に入りに保存してください';

	/// ja: '時計アプリで新しいアラームを追加してください'
	String get alarm_quiz1 => '時計アプリで新しいアラームを追加してください';

	/// ja: 'アラームを月〜金曜日だけ繰り返すように設定してください'
	String get alarm_quiz2 => 'アラームを月〜金曜日だけ繰り返すように設定してください';

	/// ja: 'アラームのスヌーズ機能をオフにして保存してください'
	String get alarm_quiz3 => 'アラームのスヌーズ機能をオフにして保存してください';

	/// ja: 'アラーム一覧から一番上のアラームを削除してください'
	String get alarm_quiz4 => 'アラーム一覧から一番上のアラームを削除してください';

	/// ja: '決済アプリでQRコードを表示してください'
	String get payment_quiz1 => '決済アプリでQRコードを表示してください';

	/// ja: '決済アプリで目のアイコンをタップして残高を隠してください'
	String get payment_quiz2 => '決済アプリで目のアイコンをタップして残高を隠してください';

	/// ja: '決済アプリで誰かに送金してください'
	String get payment_quiz3 => '決済アプリで誰かに送金してください';

	/// ja: '決済アプリで支払い方法をクレジットカードに変更してQRコードを提示してください'
	String get payment_quiz4 => '決済アプリで支払い方法をクレジットカードに変更してQRコードを提示してください';
}

// Path: scene.greeting
class TranslationsSceneGreetingJa {
	TranslationsSceneGreetingJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'おはようございます'
	String get sunriseMorning => 'おはようございます';

	/// ja: '今日もいい天気'
	String get sunnyDay => '今日もいい天気';

	/// ja: '曇り空の一日'
	String get cloudyDay => '曇り空の一日';

	/// ja: '雨の一日'
	String get rainyDay => '雨の一日';

	/// ja: 'お疲れ様でした'
	String get sunsetEvening => 'お疲れ様でした';

	/// ja: 'お疲れ様でした'
	String get nightSky => 'お疲れ様でした';
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
			'quiz.exitDialogTitle' => 'ゲームを中断しますか？',
			'quiz.exitDialogContent' => 'プレイ中のゲームを終了します。',
			'quiz.exitDialogContinue' => '続ける',
			'quiz.exitDialogExit' => '終了する',
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
			'play.stageTitle.chat_quiz1' => 'スタンプを返信しよう',
			'play.stageTitle.chat_quiz2' => 'リアクションをしよう',
			'play.stageTitle.chat_quiz3' => '写真を送ろう',
			'play.stageTitle.chat_quiz4' => 'メッセージを取り消そう',
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
			'play.stageTitle.payment_quiz2' => '残高を隠そう',
			'play.stageTitle.payment_quiz3' => '送金しよう',
			'play.stageTitle.payment_quiz4' => '支払い方法を変更しよう',
			'play.stageDescription.shopping_water' => 'ECサイトで水を2つカートに入れて購入してください',
			'play.stageDescription.shopping_checkout' => '住所入力・支払い方法選択・注文確認の3ステップを完了してください',
			'play.stageDescription.shopping_reorder' => '注文履歴から直近で注文した商品をもう一度購入してください',
			'play.stageDescription.shopping_cart' => 'カート内の商品の合計金額を4択から選んでください',
			'play.stageDescription.chat_quiz1' => 'チャットアプリでスタンプを1つ返信してください',
			'play.stageDescription.chat_quiz2' => '相手のメッセージにハートリアクションをしてください',
			'play.stageDescription.chat_quiz3' => 'チャットアプリで写真を1枚送信してください',
			'play.stageDescription.chat_quiz4' => '送信した自分のメッセージを取り消してください',
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
			'play.stageDescription.payment_quiz2' => '決済アプリで目のアイコンをタップして残高を隠してください',
			'play.stageDescription.payment_quiz3' => '決済アプリで誰かに送金してください',
			'play.stageDescription.payment_quiz4' => '決済アプリで支払い方法をクレジットカードに変更してQRコードを提示してください',
			'scene.greeting.sunriseMorning' => 'おはようございます',
			'scene.greeting.sunnyDay' => '今日もいい天気',
			'scene.greeting.cloudyDay' => '曇り空の一日',
			'scene.greeting.rainyDay' => '雨の一日',
			'scene.greeting.sunsetEvening' => 'お疲れ様でした',
			'scene.greeting.nightSky' => 'お疲れ様でした',
			'tip.defaultTitle' => 'UI/UXを学ぼう',
			'tip.defaultContent' => 'クイズを解いてUI/UXの感覚を磨きましょう！',
			'tutorial.skip' => 'スキップ',
			'tutorial.step1' => 'ようこそ！ボクはナントム！',
			'tutorial.step2' => 'ここではボクが作ったアプリをならべてるよ',
			'tutorial.step3' => '一生懸命作ったからさっそく使ってみて！',
			'tutorial.step4' => 'まずはショッピングアプリを体験してみよう。いくよ！',
			'tutorial.step5' => 'うわー！文字が読めなくなっちゃってる',
			'tutorial.step6' => 'ボクのノロいが伝染ったのかも',
			'tutorial.step7' => 'でも大丈夫！文字が読めなくても、アイコンや色を見れば「なんとなく」わかるはず。さあ、やってみて！',
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
