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
class TranslationsXx extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsXx({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.xx,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <xx>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsXx _root = this; // ignore: unused_field

	@override 
	TranslationsXx $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsXx(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppXx app = _TranslationsAppXx._(_root);
	@override late final _TranslationsHomeXx home = _TranslationsHomeXx._(_root);
	@override late final _TranslationsStageXx stage = _TranslationsStageXx._(_root);
	@override late final _TranslationsQuizXx quiz = _TranslationsQuizXx._(_root);
	@override late final _TranslationsMissionXx mission = _TranslationsMissionXx._(_root);
	@override late final _TranslationsPurchaseXx purchase = _TranslationsPurchaseXx._(_root);
	@override late final _TranslationsErrorXx error = _TranslationsErrorXx._(_root);
	@override late final _TranslationsDashboardXx dashboard = _TranslationsDashboardXx._(_root);
	@override late final _TranslationsPlayXx play = _TranslationsPlayXx._(_root);
	@override late final _TranslationsSceneXx scene = _TranslationsSceneXx._(_root);
	@override late final _TranslationsTipXx tip = _TranslationsTipXx._(_root);
	@override late final _TranslationsTutorialXx tutorial = _TranslationsTutorialXx._(_root);
	@override late final _TranslationsSettingsXx settings = _TranslationsSettingsXx._(_root);
	@override late final _TranslationsSupportXx support = _TranslationsSupportXx._(_root);
	@override late final _TranslationsMaintenanceXx maintenance = _TranslationsMaintenanceXx._(_root);
	@override late final _TranslationsUpdateXx update = _TranslationsUpdateXx._(_root);
}

// Path: app
class _TranslationsAppXx extends TranslationsAppJa {
	_TranslationsAppXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'NantoNack';
	@override String get subtitle => 'UI/UX直感クイズ';
}

// Path: home
class _TranslationsHomeXx extends TranslationsHomeJa {
	_TranslationsHomeXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
	@override late final _TranslationsHomeWeekdayXx weekday = _TranslationsHomeWeekdayXx._(_root);
}

// Path: stage
class _TranslationsStageXx extends TranslationsStageJa {
	_TranslationsStageXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get cleared => 'クリア済み';
	@override String get available => 'プレイ可能';
	@override String get locked => 'クリア後に解放';
	@override String get play => 'プレイ';
	@override String get clearTime => 'クリアタイム: {time}';
	@override String get score => 'スコア: {score}点';
}

// Path: quiz
class _TranslationsQuizXx extends TranslationsQuizJa {
	_TranslationsQuizXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
	@override String get exitDialogTitle => 'ゲームを中断しますか？';
	@override String get exitDialogContent => 'プレイ中のゲームを終了します。';
	@override String get exitDialogContinue => '続ける';
	@override String get exitDialogExit => '終了する';
}

// Path: mission
class _TranslationsMissionXx extends TranslationsMissionJa {
	_TranslationsMissionXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'MISSION';
	@override String get topic => 'お題';
	@override String get useHint => 'ヒントを使う';
	@override String get giveUp => '諦める';
	@override String get timeLimit => '制限時間: {seconds}秒';
}

// Path: purchase
class _TranslationsPurchaseXx extends TranslationsPurchaseJa {
	_TranslationsPurchaseXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get limitReached => '本日のプレイ上限に達しました';
	@override String get unlockDescription => 'また明日プレイしてください！';
	@override String get close => '閉じる';
}

// Path: error
class _TranslationsErrorXx extends TranslationsErrorJa {
	_TranslationsErrorXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get unknown => 'エラーが発生しました';
	@override String get retry => '再試行';
}

// Path: dashboard
class _TranslationsDashboardXx extends TranslationsDashboardJa {
	_TranslationsDashboardXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
class _TranslationsPlayXx extends TranslationsPlayJa {
	_TranslationsPlayXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get startPlay => 'プレイする';
	@override String get selectCategory => 'カテゴリー選択';
	@override String get selectCategoryDescription => 'チャレンジするカテゴリーを選んでください';
	@override String get selectStage => 'ステージ選択';
	@override String get stageCount => '{count}ステージ';
	@override String get noStages => 'ステージがありません';
	@override String get comingSoon => '準備中';
	@override late final _TranslationsPlayCategoryLabelXx categoryLabel = _TranslationsPlayCategoryLabelXx._(_root);
	@override late final _TranslationsPlayCategoryDescriptionXx categoryDescription = _TranslationsPlayCategoryDescriptionXx._(_root);
	@override late final _TranslationsPlayStageTitleXx stageTitle = _TranslationsPlayStageTitleXx._(_root);
	@override late final _TranslationsPlayStageDescriptionXx stageDescription = _TranslationsPlayStageDescriptionXx._(_root);
}

// Path: scene
class _TranslationsSceneXx extends TranslationsSceneJa {
	_TranslationsSceneXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSceneGreetingXx greeting = _TranslationsSceneGreetingXx._(_root);
}

// Path: tip
class _TranslationsTipXx extends TranslationsTipJa {
	_TranslationsTipXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get defaultTitle => 'UI/UXを学ぼう';
	@override String get defaultContent => 'クイズを解いてUI/UXの感覚を磨きましょう！';
}

// Path: tutorial
class _TranslationsTutorialXx extends TranslationsTutorialJa {
	_TranslationsTutorialXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get skip => 'スキップ';
	@override String get step1 => 'ようこそ！ボクはナントム！';
	@override String get step2 => 'ここではボクが作ったアプリをならべてるよ';
	@override String get step3 => '一生懸命作ったからさっそく使ってみて！';
	@override String get step4 => 'まずはショッピングアプリを体験してみよう。いくよ！';
	@override String get step5 => 'うわー！文字が読めなくなっちゃってる';
	@override String get step6 => 'ボクのノロいが伝染ったのかも';
	@override String get step7 => 'でも大丈夫！文字が読めなくても、アイコンや色を見れば「なんとなく」わかるはず。さあ、やってみて！';
}

// Path: settings
class _TranslationsSettingsXx extends TranslationsSettingsJa {
	_TranslationsSettingsXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
	@override late final _TranslationsSettingsAppearanceXx appearance = _TranslationsSettingsAppearanceXx._(_root);
	@override late final _TranslationsSettingsDataXx data = _TranslationsSettingsDataXx._(_root);
	@override late final _TranslationsSettingsAboutXx about = _TranslationsSettingsAboutXx._(_root);
}

// Path: support
class _TranslationsSupportXx extends TranslationsSupportJa {
	_TranslationsSupportXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => '開発者を応援';
	@override String get totalCoffeesLabel => 'これまでに贈ったコーヒー';
	@override String get totalCoffeesCount => '☕️ x {count}';
	@override String get description => 'NantoNackを応援していただきありがとうございます！\nいただいた支援は、今後のアプリ改善や運営のために大切に活用させていただきます。\n※本機能による特別な機能解放等はございません。';
	@override String get sendCoffeeButton => 'コーヒーを送る';
	@override String get restoreButton => '購入内容を復元（カウントを同期）';
	@override String get restoreSuccess => '応援履歴を同期しました';
	@override String get thankYouTitle => 'ありがとうございます！☕️';
	@override String get thankYouMessage => 'いただいたコーヒーを糧に、より良いアプリに改善していきます！';
	@override String get close => '閉じる';
	@override String get fetchError => '取得エラー: {error}';
	@override String get purchaseError => '購入に失敗しました。もう一度お試しください。';
	@override String get restoreError => '購入の復元に失敗しました。もう一度お試しください。';
	@override String get noOfferings => '現在利用できるプランがありません。';
	@override late final _TranslationsSupportPackageNameXx packageName = _TranslationsSupportPackageNameXx._(_root);
}

// Path: maintenance
class _TranslationsMaintenanceXx extends TranslationsMaintenanceJa {
	_TranslationsMaintenanceXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'メンテナンス中';
	@override String get defaultMessage => 'ただいまメンテナンス中です。\nしばらくお待ちください。';
}

// Path: update
class _TranslationsUpdateXx extends TranslationsUpdateJa {
	_TranslationsUpdateXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'アップデートのお知らせ';
	@override String get forceMessage => '引き続きご利用いただくには、アプリのアップデートが必要です。';
	@override String get optionalMessage => '新しいバージョンが利用可能です。アップデートをお勧めします。';
	@override String get updateButton => 'アップデートする';
	@override String get laterButton => 'あとで';
}

// Path: home.weekday
class _TranslationsHomeWeekdayXx extends TranslationsHomeWeekdayJa {
	_TranslationsHomeWeekdayXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
class _TranslationsPlayCategoryLabelXx extends TranslationsPlayCategoryLabelJa {
	_TranslationsPlayCategoryLabelXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get shopping => 'ショッピング';
	@override String get chat => 'チャット';
	@override String get streaming => '動画';
	@override String get map => 'マップ';
	@override String get alarm => 'アラーム';
	@override String get payment => '決済';
	@override String get mail => 'メール';
	@override String get news => 'ニュース';
	@override String get calendar => 'カレンダー';
	@override String get sns => 'SNS';
	@override String get comic => '漫画アプリ';
	@override String get todo => 'タスク管理';
}

// Path: play.categoryDescription
class _TranslationsPlayCategoryDescriptionXx extends TranslationsPlayCategoryDescriptionJa {
	_TranslationsPlayCategoryDescriptionXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get shopping => 'ECサイトのUI/UXを体験しよう';
	@override String get chat => 'メッセージアプリのUI/UXを体験しよう';
	@override String get streaming => '動画アプリのUI/UXを体験しよう';
	@override String get map => '地図アプリのUI/UXを体験しよう';
	@override String get alarm => '時計・アラームアプリのUI/UXを体験しよう';
	@override String get payment => 'モバイル決済アプリのUI/UXを体験しよう';
	@override String get mail => 'メールアプリのUI/UXを体験しよう';
	@override String get news => 'ニュースアプリのUI/UXを体験しよう';
	@override String get calendar => 'カレンダーアプリのUI/UXを体験しよう';
	@override String get sns => 'SNSアプリのUI/UXを体験しよう';
	@override String get comic => '漫画アプリの操作をマスターしよう';
	@override String get todo => 'ZSMS koo HR/HT xtoxfrxjux';
}

// Path: play.stageTitle
class _TranslationsPlayStageTitleXx extends TranslationsPlayStageTitleJa {
	_TranslationsPlayStageTitleXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get shopping_quiz1 => '水を2つ買おう';
	@override String get shopping_quiz2 => '購入手続きを完了しよう';
	@override String get shopping_quiz3 => '直近の注文を再注文しよう';
	@override String get shopping_quiz4 => 'カートの合計金額を選ぼう';
	@override String get chat_quiz1 => 'スタンプを返信しよう';
	@override String get chat_quiz2 => 'リアクションをしよう';
	@override String get chat_quiz3 => '写真を送ろう';
	@override String get chat_quiz4 => 'メッセージを取り消そう';
	@override String get streaming_quiz1 => '字幕をオンにしよう';
	@override String get streaming_quiz2 => '動画の中盤まで進めよう';
	@override String get streaming_quiz3 => '2倍速で再生しよう';
	@override String get streaming_quiz4 => '動画をダウンロードしよう';
	@override String get map_quiz1 => '現在地を表示しよう';
	@override String get map_quiz2 => '学校の情報を表示しよう';
	@override String get map_quiz3 => '公園に電車でルートを案内しよう';
	@override String get map_quiz4 => '駅をお気に入りに追加しよう';
	@override String get alarm_quiz1 => 'アラームを追加しよう';
	@override String get alarm_quiz2 => '平日だけ鳴るよう設定しよう';
	@override String get alarm_quiz3 => 'スヌーズをオフにしよう';
	@override String get alarm_quiz4 => 'アラームを削除しよう';
	@override String get payment_quiz1 => 'QRコードを表示しよう';
	@override String get payment_quiz2 => '残高を隠そう';
	@override String get payment_quiz3 => '送金しよう';
	@override String get payment_quiz4 => '支払い方法を変更しよう';
	@override String get mail_quiz1 => 'メールをアーカイブしよう';
	@override String get mail_quiz2 => 'ゴミ箱を空にしよう';
	@override String get mail_quiz3 => '3件のメールを削除しよう';
	@override String get mail_quiz4 => '大きなメールを検索しよう';
	@override String get news_quiz1 => 'ニュースを更新しよう';
	@override String get news_quiz2 => 'スポーツカテゴリを表示しよう';
	@override String get news_quiz3 => '文字サイズを『大』に変えよう';
	@override String get news_quiz4 => '気になる記事を非表示にしよう';
	@override String get calendar_quiz1 => '来月の予定を見よう';
	@override String get calendar_quiz2 => '予定を素早く追加しよう';
	@override String get calendar_quiz3 => '予定の日付を変えよう';
	@override String get calendar_quiz4 => '一瞬で「今日」に戻ろう';
	@override String get sns_quiz1 => 'タイムラインに流れてきた猫の写真に「いいネ！」をしよう';
	@override String get sns_quiz2 => '何か投稿してみよう！';
	@override String get sns_quiz3 => '画像を開いて表示した後に元の画面に戻ろう';
	@override String get sns_quiz4 => 'ナントム(@nantom)の投稿を検索しよう！';
	@override String get comic_quiz1 => '3ページ戻る';
	@override String get comic_quiz2 => '画面を拡大する';
	@override String get comic_quiz3 => 'メニューを表示する';
	@override String get comic_quiz4 => '作者を応援する';
	@override String get todo_quiz1 => '『牛乳を買う』タスクを完了にしよう';
	@override String get todo_quiz2 => '『企画書の作成』を一番上に移動しよう';
	@override String get todo_quiz3 => '『家賃の振り込み』を重要タスクにしよう';
	@override String get todo_quiz4 => '間違えて完了にしたタスクを元に戻そう';
}

// Path: play.stageDescription
class _TranslationsPlayStageDescriptionXx extends TranslationsPlayStageDescriptionJa {
	_TranslationsPlayStageDescriptionXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get shopping_quiz1 => 'ECサイトで水を2つカートに入れて購入してください';
	@override String get shopping_quiz2 => '住所入力・支払い方法選択・注文確認の3ステップを完了してください';
	@override String get shopping_quiz3 => '注文履歴から直近で注文した商品をもう一度購入してください';
	@override String get shopping_quiz4 => 'カート内の商品の合計金額を4択から選んでください';
	@override String get chat_quiz1 => 'チャットアプリでスタンプを1つ返信してください';
	@override String get chat_quiz2 => '相手のメッセージにハートリアクションをしてください';
	@override String get chat_quiz3 => 'チャットアプリで写真を1枚送信してください';
	@override String get chat_quiz4 => '送信した自分のメッセージを取り消してください';
	@override String get streaming_quiz1 => '動画アプリで字幕機能をオンにしてください';
	@override String get streaming_quiz2 => '次の動画へ移動し、動画の中盤まで進めてください';
	@override String get streaming_quiz3 => '動画アプリで動画を2倍速で再生してください';
	@override String get streaming_quiz4 => '動画を最高画質に変更して端末にダウンロードしてください';
	@override String get map_quiz1 => '地図アプリで現在地を表示してください';
	@override String get map_quiz2 => '地図アプリで学校アイコンをタップして情報を表示してください';
	@override String get map_quiz3 => '地図アプリで公園を選び電車でルートを案内してください';
	@override String get map_quiz4 => '地図アプリで駅をタップしてお気に入りに保存してください';
	@override String get alarm_quiz1 => '時計アプリで新しいアラームを追加してください';
	@override String get alarm_quiz2 => 'アラームを月〜金曜日だけ繰り返すように設定してください';
	@override String get alarm_quiz3 => 'アラームのスヌーズ機能をオフにして保存してください';
	@override String get alarm_quiz4 => 'アラーム一覧から一番上のアラームを削除してください';
	@override String get payment_quiz1 => '決済アプリでQRコードを表示してください';
	@override String get payment_quiz2 => '決済アプリで目のアイコンをタップして残高を隠してください';
	@override String get payment_quiz3 => '決済アプリで誰かに送金してください';
	@override String get payment_quiz4 => '決済アプリで支払い方法をクレジットカードに変更してQRコードを提示してください';
	@override String get mail_quiz1 => 'メールアプリで3番目のメールをアーカイブしてください';
	@override String get mail_quiz2 => 'メールアプリでゴミ箱を空にしてください';
	@override String get mail_quiz3 => 'メールアプリで3件のメールを選択して削除してください';
	@override String get mail_quiz4 => 'メールアプリで5MB以上のメールを検索してください';
	@override String get news_quiz1 => 'ニュース一覧を引っ張って更新してください';
	@override String get news_quiz2 => 'タブをスワイプまたはタップして『スポーツ』を表示してください';
	@override String get news_quiz3 => '記事を開き、文字サイズを『大』に変更してください';
	@override String get news_quiz4 => '映画レビュー記事のメニューから非表示にしてください';
	@override String get calendar_quiz1 => 'カレンダーを操作して翌月の予定を確認してください';
	@override String get calendar_quiz2 => '15日に新しい予定を追加してください';
	@override String get calendar_quiz3 => '歯医者の予定を翌日に移動してください';
	@override String get calendar_quiz4 => '数年先に移動した後、今日の日付に戻ってください';
	@override String get comic_quiz1 => 'ページを3つ前に戻そう';
	@override String get comic_quiz2 => '小さな文字を読めるよう拡大しよう';
	@override String get comic_quiz3 => 'メニューを表示してみよう';
	@override String get comic_quiz4 => '応援ボタンを10回連打しよう';
	@override String get todo_quiz1 => 'タスクをタップするか左スワイプで完了にしてください';
	@override String get todo_quiz2 => 'タスクを長押ししてドラッグし、一番上に移動してください';
	@override String get todo_quiz3 => 'タスクを右から左にスワイプして星マークをタップしてください';
	@override String get todo_quiz4 => '完了済みリストを開いてチェックを外してください';
}

// Path: scene.greeting
class _TranslationsSceneGreetingXx extends TranslationsSceneGreetingJa {
	_TranslationsSceneGreetingXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get sunriseMorning => 'おはようございます';
	@override String get sunnyDay => '今日もいい天気';
	@override String get cloudyDay => '曇り空の一日';
	@override String get rainyDay => '雨の一日';
	@override String get sunsetEvening => 'お疲れ様でした';
	@override String get nightSky => 'お疲れ様でした';
}

// Path: settings.appearance
class _TranslationsSettingsAppearanceXx extends TranslationsSettingsAppearanceJa {
	_TranslationsSettingsAppearanceXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
class _TranslationsSettingsDataXx extends TranslationsSettingsDataJa {
	_TranslationsSettingsDataXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
class _TranslationsSettingsAboutXx extends TranslationsSettingsAboutJa {
	_TranslationsSettingsAboutXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'アプリについて';
	@override String get developerX => '開発者X（Twitter）';
	@override String get privacyPolicy => 'プライバシーポリシー';
	@override String get contact => 'お問い合わせ';
	@override String get licenses => 'ライセンス';
	@override String get version => 'バージョン {version}';
}

// Path: support.packageName
class _TranslationsSupportPackageNameXx extends TranslationsSupportPackageNameJa {
	_TranslationsSupportPackageNameXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get coffee100 => 'コーヒー1杯';
	@override String get coffee300 => 'コーヒー3杯';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
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
			'purchase.unlockDescription' => 'また明日プレイしてください！',
			'purchase.close' => '閉じる',
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
			'play.categoryLabel.mail' => 'メール',
			'play.categoryLabel.news' => 'ニュース',
			'play.categoryLabel.calendar' => 'カレンダー',
			'play.categoryLabel.sns' => 'SNS',
			'play.categoryLabel.comic' => '漫画アプリ',
			'play.categoryLabel.todo' => 'タスク管理',
			'play.categoryDescription.shopping' => 'ECサイトのUI/UXを体験しよう',
			'play.categoryDescription.chat' => 'メッセージアプリのUI/UXを体験しよう',
			'play.categoryDescription.streaming' => '動画アプリのUI/UXを体験しよう',
			'play.categoryDescription.map' => '地図アプリのUI/UXを体験しよう',
			'play.categoryDescription.alarm' => '時計・アラームアプリのUI/UXを体験しよう',
			'play.categoryDescription.payment' => 'モバイル決済アプリのUI/UXを体験しよう',
			'play.categoryDescription.mail' => 'メールアプリのUI/UXを体験しよう',
			'play.categoryDescription.news' => 'ニュースアプリのUI/UXを体験しよう',
			'play.categoryDescription.calendar' => 'カレンダーアプリのUI/UXを体験しよう',
			'play.categoryDescription.sns' => 'SNSアプリのUI/UXを体験しよう',
			'play.categoryDescription.comic' => '漫画アプリの操作をマスターしよう',
			'play.categoryDescription.todo' => 'ZSMS koo HR/HT xtoxfrxjux',
			'play.stageTitle.shopping_quiz1' => '水を2つ買おう',
			'play.stageTitle.shopping_quiz2' => '購入手続きを完了しよう',
			'play.stageTitle.shopping_quiz3' => '直近の注文を再注文しよう',
			'play.stageTitle.shopping_quiz4' => 'カートの合計金額を選ぼう',
			'play.stageTitle.chat_quiz1' => 'スタンプを返信しよう',
			'play.stageTitle.chat_quiz2' => 'リアクションをしよう',
			'play.stageTitle.chat_quiz3' => '写真を送ろう',
			'play.stageTitle.chat_quiz4' => 'メッセージを取り消そう',
			'play.stageTitle.streaming_quiz1' => '字幕をオンにしよう',
			'play.stageTitle.streaming_quiz2' => '動画の中盤まで進めよう',
			'play.stageTitle.streaming_quiz3' => '2倍速で再生しよう',
			'play.stageTitle.streaming_quiz4' => '動画をダウンロードしよう',
			'play.stageTitle.map_quiz1' => '現在地を表示しよう',
			'play.stageTitle.map_quiz2' => '学校の情報を表示しよう',
			'play.stageTitle.map_quiz3' => '公園に電車でルートを案内しよう',
			'play.stageTitle.map_quiz4' => '駅をお気に入りに追加しよう',
			'play.stageTitle.alarm_quiz1' => 'アラームを追加しよう',
			'play.stageTitle.alarm_quiz2' => '平日だけ鳴るよう設定しよう',
			'play.stageTitle.alarm_quiz3' => 'スヌーズをオフにしよう',
			'play.stageTitle.alarm_quiz4' => 'アラームを削除しよう',
			'play.stageTitle.payment_quiz1' => 'QRコードを表示しよう',
			'play.stageTitle.payment_quiz2' => '残高を隠そう',
			'play.stageTitle.payment_quiz3' => '送金しよう',
			'play.stageTitle.payment_quiz4' => '支払い方法を変更しよう',
			'play.stageTitle.mail_quiz1' => 'メールをアーカイブしよう',
			'play.stageTitle.mail_quiz2' => 'ゴミ箱を空にしよう',
			'play.stageTitle.mail_quiz3' => '3件のメールを削除しよう',
			'play.stageTitle.mail_quiz4' => '大きなメールを検索しよう',
			'play.stageTitle.news_quiz1' => 'ニュースを更新しよう',
			'play.stageTitle.news_quiz2' => 'スポーツカテゴリを表示しよう',
			'play.stageTitle.news_quiz3' => '文字サイズを『大』に変えよう',
			'play.stageTitle.news_quiz4' => '気になる記事を非表示にしよう',
			'play.stageTitle.calendar_quiz1' => '来月の予定を見よう',
			'play.stageTitle.calendar_quiz2' => '予定を素早く追加しよう',
			'play.stageTitle.calendar_quiz3' => '予定の日付を変えよう',
			'play.stageTitle.calendar_quiz4' => '一瞬で「今日」に戻ろう',
			'play.stageTitle.sns_quiz1' => 'タイムラインに流れてきた猫の写真に「いいネ！」をしよう',
			'play.stageTitle.sns_quiz2' => '何か投稿してみよう！',
			'play.stageTitle.sns_quiz3' => '画像を開いて表示した後に元の画面に戻ろう',
			'play.stageTitle.sns_quiz4' => 'ナントム(@nantom)の投稿を検索しよう！',
			'play.stageTitle.comic_quiz1' => '3ページ戻る',
			'play.stageTitle.comic_quiz2' => '画面を拡大する',
			'play.stageTitle.comic_quiz3' => 'メニューを表示する',
			'play.stageTitle.comic_quiz4' => '作者を応援する',
			'play.stageTitle.todo_quiz1' => '『牛乳を買う』タスクを完了にしよう',
			'play.stageTitle.todo_quiz2' => '『企画書の作成』を一番上に移動しよう',
			'play.stageTitle.todo_quiz3' => '『家賃の振り込み』を重要タスクにしよう',
			'play.stageTitle.todo_quiz4' => '間違えて完了にしたタスクを元に戻そう',
			'play.stageDescription.shopping_quiz1' => 'ECサイトで水を2つカートに入れて購入してください',
			'play.stageDescription.shopping_quiz2' => '住所入力・支払い方法選択・注文確認の3ステップを完了してください',
			'play.stageDescription.shopping_quiz3' => '注文履歴から直近で注文した商品をもう一度購入してください',
			'play.stageDescription.shopping_quiz4' => 'カート内の商品の合計金額を4択から選んでください',
			'play.stageDescription.chat_quiz1' => 'チャットアプリでスタンプを1つ返信してください',
			'play.stageDescription.chat_quiz2' => '相手のメッセージにハートリアクションをしてください',
			'play.stageDescription.chat_quiz3' => 'チャットアプリで写真を1枚送信してください',
			'play.stageDescription.chat_quiz4' => '送信した自分のメッセージを取り消してください',
			'play.stageDescription.streaming_quiz1' => '動画アプリで字幕機能をオンにしてください',
			'play.stageDescription.streaming_quiz2' => '次の動画へ移動し、動画の中盤まで進めてください',
			'play.stageDescription.streaming_quiz3' => '動画アプリで動画を2倍速で再生してください',
			'play.stageDescription.streaming_quiz4' => '動画を最高画質に変更して端末にダウンロードしてください',
			'play.stageDescription.map_quiz1' => '地図アプリで現在地を表示してください',
			'play.stageDescription.map_quiz2' => '地図アプリで学校アイコンをタップして情報を表示してください',
			'play.stageDescription.map_quiz3' => '地図アプリで公園を選び電車でルートを案内してください',
			'play.stageDescription.map_quiz4' => '地図アプリで駅をタップしてお気に入りに保存してください',
			'play.stageDescription.alarm_quiz1' => '時計アプリで新しいアラームを追加してください',
			'play.stageDescription.alarm_quiz2' => 'アラームを月〜金曜日だけ繰り返すように設定してください',
			'play.stageDescription.alarm_quiz3' => 'アラームのスヌーズ機能をオフにして保存してください',
			'play.stageDescription.alarm_quiz4' => 'アラーム一覧から一番上のアラームを削除してください',
			'play.stageDescription.payment_quiz1' => '決済アプリでQRコードを表示してください',
			'play.stageDescription.payment_quiz2' => '決済アプリで目のアイコンをタップして残高を隠してください',
			'play.stageDescription.payment_quiz3' => '決済アプリで誰かに送金してください',
			'play.stageDescription.payment_quiz4' => '決済アプリで支払い方法をクレジットカードに変更してQRコードを提示してください',
			'play.stageDescription.mail_quiz1' => 'メールアプリで3番目のメールをアーカイブしてください',
			'play.stageDescription.mail_quiz2' => 'メールアプリでゴミ箱を空にしてください',
			'play.stageDescription.mail_quiz3' => 'メールアプリで3件のメールを選択して削除してください',
			'play.stageDescription.mail_quiz4' => 'メールアプリで5MB以上のメールを検索してください',
			'play.stageDescription.news_quiz1' => 'ニュース一覧を引っ張って更新してください',
			'play.stageDescription.news_quiz2' => 'タブをスワイプまたはタップして『スポーツ』を表示してください',
			'play.stageDescription.news_quiz3' => '記事を開き、文字サイズを『大』に変更してください',
			'play.stageDescription.news_quiz4' => '映画レビュー記事のメニューから非表示にしてください',
			'play.stageDescription.calendar_quiz1' => 'カレンダーを操作して翌月の予定を確認してください',
			'play.stageDescription.calendar_quiz2' => '15日に新しい予定を追加してください',
			'play.stageDescription.calendar_quiz3' => '歯医者の予定を翌日に移動してください',
			'play.stageDescription.calendar_quiz4' => '数年先に移動した後、今日の日付に戻ってください',
			'play.stageDescription.comic_quiz1' => 'ページを3つ前に戻そう',
			'play.stageDescription.comic_quiz2' => '小さな文字を読めるよう拡大しよう',
			'play.stageDescription.comic_quiz3' => 'メニューを表示してみよう',
			'play.stageDescription.comic_quiz4' => '応援ボタンを10回連打しよう',
			'play.stageDescription.todo_quiz1' => 'タスクをタップするか左スワイプで完了にしてください',
			'play.stageDescription.todo_quiz2' => 'タスクを長押ししてドラッグし、一番上に移動してください',
			'play.stageDescription.todo_quiz3' => 'タスクを右から左にスワイプして星マークをタップしてください',
			'play.stageDescription.todo_quiz4' => '完了済みリストを開いてチェックを外してください',
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
			'settings.about.privacyPolicy' => 'プライバシーポリシー',
			'settings.about.contact' => 'お問い合わせ',
			'settings.about.licenses' => 'ライセンス',
			'settings.about.version' => 'バージョン {version}',
			'support.title' => '開発者を応援',
			'support.totalCoffeesLabel' => 'これまでに贈ったコーヒー',
			'support.totalCoffeesCount' => '☕️ x {count}',
			'support.description' => 'NantoNackを応援していただきありがとうございます！\nいただいた支援は、今後のアプリ改善や運営のために大切に活用させていただきます。\n※本機能による特別な機能解放等はございません。',
			'support.sendCoffeeButton' => 'コーヒーを送る',
			'support.restoreButton' => '購入内容を復元（カウントを同期）',
			'support.restoreSuccess' => '応援履歴を同期しました',
			'support.thankYouTitle' => 'ありがとうございます！☕️',
			'support.thankYouMessage' => 'いただいたコーヒーを糧に、より良いアプリに改善していきます！',
			'support.close' => '閉じる',
			'support.fetchError' => '取得エラー: {error}',
			'support.purchaseError' => '購入に失敗しました。もう一度お試しください。',
			'support.restoreError' => '購入の復元に失敗しました。もう一度お試しください。',
			'support.noOfferings' => '現在利用できるプランがありません。',
			'support.packageName.coffee100' => 'コーヒー1杯',
			'support.packageName.coffee300' => 'コーヒー3杯',
			'maintenance.title' => 'メンテナンス中',
			'maintenance.defaultMessage' => 'ただいまメンテナンス中です。\nしばらくお待ちください。',
			'update.title' => 'アップデートのお知らせ',
			'update.forceMessage' => '引き続きご利用いただくには、アプリのアップデートが必要です。',
			'update.optionalMessage' => '新しいバージョンが利用可能です。アップデートをお勧めします。',
			'update.updateButton' => 'アップデートする',
			'update.laterButton' => 'あとで',
			_ => null,
		};
	}
}
