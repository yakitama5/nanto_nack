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

	/// ja: 'タイムラインに流れてきた猫の写真に「いいね」をしよう'
	String get missionText => 'タイムラインに流れてきた猫の写真に「いいね」をしよう';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '全画面で開いた画像を閉じて、タイムラインに戻ろう'
	String get missionText => '全画面で開いた画像を閉じて、タイムラインに戻ろう';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '昔の投稿を読みすぎた！一瞬で最新の投稿（一番上）に戻ろう'
	String get missionText => '昔の投稿を読みすぎた！一瞬で最新の投稿（一番上）に戻ろう';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'こっそり作っている「裏垢（サブアカウント）」に切り替えよう'
	String get missionText => 'こっそり作っている「裏垢（サブアカウント）」に切り替えよう';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'NantoTweet'
	String get appTitle => 'NantoTweet';

	/// ja: 'ホーム'
	String get home => 'ホーム';

	/// ja: '検索'
	String get search => '検索';

	/// ja: '通知'
	String get notifications => '通知';

	/// ja: 'プロフィール'
	String get profile => 'プロフィール';

	/// ja: 'なんとユーザー'
	String get mainAccountName => 'なんとユーザー';

	/// ja: '@nanto_user'
	String get mainAccountId => '@nanto_user';

	/// ja: 'なんとの裏垢'
	String get subAccountName => 'なんとの裏垢';

	/// ja: '@nanto_ura'
	String get subAccountId => '@nanto_ura';

	/// ja: 'アカウントを切り替える'
	String get switchAccountLabel => 'アカウントを切り替える';

	/// ja: 'なんとにゃん太'
	String get post1UserName => 'なんとにゃん太';

	/// ja: '@nanto_nyan'
	String get post1UserId => '@nanto_nyan';

	/// ja: '今日もかわいい写真が撮れた🐱'
	String get post1Content => '今日もかわいい写真が撮れた🐱';

	/// ja: 'なんとわん子'
	String get post2UserName => 'なんとわん子';

	/// ja: '@nanto_wanko'
	String get post2UserId => '@nanto_wanko';

	/// ja: '散歩から帰ってきたよ🐶'
	String get post2Content => '散歩から帰ってきたよ🐶';

	/// ja: 'なんとぴよ子'
	String get post3UserName => 'なんとぴよ子';

	/// ja: '@nanto_piyo'
	String get post3UserId => '@nanto_piyo';

	/// ja: 'ぴよぴよ！元気いっぱいだよ🐥'
	String get post3Content => 'ぴよぴよ！元気いっぱいだよ🐥';

	/// ja: 'なんとうさ吉'
	String get post4UserName => 'なんとうさ吉';

	/// ja: '@nanto_usa'
	String get post4UserId => '@nanto_usa';

	/// ja: '今日はにんじんをいっぱい食べた🥕'
	String get post4Content => '今日はにんじんをいっぱい食べた🥕';

	/// ja: 'なんとはむすけ'
	String get post5UserName => 'なんとはむすけ';

	/// ja: '@nanto_hamu'
	String get post5UserId => '@nanto_hamu';

	/// ja: '回し車が止まらない🐹'
	String get post5Content => '回し車が止まらない🐹';

	/// ja: 'なんとかめ次郎'
	String get post6UserName => 'なんとかめ次郎';

	/// ja: '@nanto_kame'
	String get post6UserId => '@nanto_kame';

	/// ja: 'ゆっくりと日光浴中🐢'
	String get post6Content => 'ゆっくりと日光浴中🐢';

	/// ja: 'なんとさかな男'
	String get post7UserName => 'なんとさかな男';

	/// ja: '@nanto_sakana'
	String get post7UserId => '@nanto_sakana';

	/// ja: '水槽の掃除をしたら気持ちよさそうに泳いでいる🐟'
	String get post7Content => '水槽の掃除をしたら気持ちよさそうに泳いでいる🐟';

	/// ja: 'なんとすずめ'
	String get post8UserName => 'なんとすずめ';

	/// ja: '@nanto_suzume'
	String get post8UserId => '@nanto_suzume';

	/// ja: 'ちゅんちゅん！今日も元気です🐦'
	String get post8Content => 'ちゅんちゅん！今日も元気です🐦';

	/// ja: 'なんとねこ平'
	String get post9UserName => 'なんとねこ平';

	/// ja: '@nanto_neko2'
	String get post9UserId => '@nanto_neko2';

	/// ja: 'お昼寝タイムです😴'
	String get post9Content => 'お昼寝タイムです😴';

	/// ja: 'なんとくま太郎'
	String get post10UserName => 'なんとくま太郎';

	/// ja: '@nanto_kuma'
	String get post10UserId => '@nanto_kuma';

	/// ja: '蜂蜜を食べたくなってきた🍯'
	String get post10Content => '蜂蜜を食べたくなってきた🍯';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜダブルタップでいいねできた？'
	String get title => 'なぜダブルタップでいいねできた？';

	/// ja: 'ダブルタップ＝「いいね」はSNSの定番操作'
	String get subtitle => 'ダブルタップ＝「いいね」はSNSの定番操作';

	/// ja: 'ダブルタップは「いいね」のショートカット'
	String get doubleTapTitle => 'ダブルタップは「いいね」のショートカット';

	/// ja: 'X（旧Twitter）やInstagramでは、投稿の写真をすばやく2回タップすると「いいね」できる。ハートボタンを探す必要がなく、直感的に操作できる。'
	String get doubleTapDesc => 'X（旧Twitter）やInstagramでは、投稿の写真をすばやく2回タップすると「いいね」できる。ハートボタンを探す必要がなく、直感的に操作できる。';

	/// ja: 'ハートアニメーションが操作を確認させる'
	String get heartTitle => 'ハートアニメーションが操作を確認させる';

	/// ja: 'ダブルタップすると画像中央に大きなハートが表示される。これはフィードバックアニメーションと呼ばれ、操作が正しく認識されたことをユーザーに伝える仕組み。'
	String get heartDesc => 'ダブルタップすると画像中央に大きなハートが表示される。これはフィードバックアニメーションと呼ばれ、操作が正しく認識されたことをユーザーに伝える仕組み。';

	/// ja: 'SNSジェスチャーは世界共通の操作'
	String get gestureTitle => 'SNSジェスチャーは世界共通の操作';

	/// ja: 'InstagramやX・TikTokなど多くのSNSで「ダブルタップ＝いいね」が共通操作になっている。一度覚えれば複数のアプリで活用できる。'
	String get gestureDesc => 'InstagramやX・TikTokなど多くのSNSで「ダブルタップ＝いいね」が共通操作になっている。一度覚えれば複数のアプリで活用できる。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ下にスワイプで閉じられた？'
	String get title => 'なぜ下にスワイプで閉じられた？';

	/// ja: '下スワイプ＝「戻る・閉じる」の直感操作'
	String get subtitle => '下スワイプ＝「戻る・閉じる」の直感操作';

	/// ja: '下スワイプは「閉じる」の直感ジェスチャー'
	String get swipeTitle => '下スワイプは「閉じる」の直感ジェスチャー';

	/// ja: '全画面表示された画像を下に向かってスワイプ（フリック）すると、元の画面に戻れる。重力を意識した「落とす」感覚が「閉じる」動作と結びついている。'
	String get swipeDesc => '全画面表示された画像を下に向かってスワイプ（フリック）すると、元の画面に戻れる。重力を意識した「落とす」感覚が「閉じる」動作と結びついている。';

	/// ja: '全画面モードはタップで開く'
	String get fullscreenTitle => '全画面モードはタップで開く';

	/// ja: 'SNSアプリでは投稿の画像をタップすると全画面モードで表示される。ピンチアウトで拡大したり、より詳しく見ることができる。'
	String get fullscreenDesc => 'SNSアプリでは投稿の画像をタップすると全画面モードで表示される。ピンチアウトで拡大したり、より詳しく見ることができる。';

	/// ja: '「×ボタン」がなくても閉じられる'
	String get backTitle => '「×ボタン」がなくても閉じられる';

	/// ja: 'スマートフォンのUIでは×ボタンがなくても、スワイプジェスチャーで画面を閉じることができる。操作の手がかりがなくても試してみることが重要。'
	String get backDesc => 'スマートフォンのUIでは×ボタンがなくても、スワイプジェスチャーで画面を閉じることができる。操作の手がかりがなくても試してみることが重要。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ一瞬でトップに戻れた？'
	String get title => 'なぜ一瞬でトップに戻れた？';

	/// ja: 'ステータスバー・ホームタブのタップ＝先頭へ'
	String get subtitle => 'ステータスバー・ホームタブのタップ＝先頭へ';

	/// ja: 'ステータスバーのタップは「先頭に戻る」ショートカット'
	String get statusBarTitle => 'ステータスバーのタップは「先頭に戻る」ショートカット';

	/// ja: 'iPhoneのステータスバー（時刻表示エリア）をタップすると、多くのアプリでリストの先頭に瞬時に戻れる。長いタイムラインをスクロールして戻る手間が省ける。'
	String get statusBarDesc => 'iPhoneのステータスバー（時刻表示エリア）をタップすると、多くのアプリでリストの先頭に瞬時に戻れる。長いタイムラインをスクロールして戻る手間が省ける。';

	/// ja: 'ホームタブの再タップも「先頭に戻る」操作'
	String get homeTabTitle => 'ホームタブの再タップも「先頭に戻る」操作';

	/// ja: 'すでに表示中のタブ（ホームボタン）をもう一度タップすると、タイムラインが一番上に戻る。SNSアプリに限らず多くのアプリで使えるテクニック。'
	String get homeTabDesc => 'すでに表示中のタブ（ホームボタン）をもう一度タップすると、タイムラインが一番上に戻る。SNSアプリに限らず多くのアプリで使えるテクニック。';

	/// ja: 'スクロールより「ジャンプ」が圧倒的に速い'
	String get efficientTitle => 'スクロールより「ジャンプ」が圧倒的に速い';

	/// ja: '大量のコンテンツを一番上まで手動でスクロールするのは非効率。専用操作でトップに戻ることで、快適なアプリ体験が実現される。'
	String get efficientDesc => '大量のコンテンツを一番上まで手動でスクロールするのは非効率。専用操作でトップに戻ることで、快適なアプリ体験が実現される。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ長押しでアカウントが切り替えられた？'
	String get title => 'なぜ長押しでアカウントが切り替えられた？';

	/// ja: 'プロフィールアイコンの長押し＝アカウント切り替え'
	String get subtitle => 'プロフィールアイコンの長押し＝アカウント切り替え';

	/// ja: 'プロフィールアイコンの長押しでアカウント選択'
	String get longPressTitle => 'プロフィールアイコンの長押しでアカウント選択';

	/// ja: '多くのSNSアプリでは、プロフィールアイコンやアバターを長押しすることでアカウント切り替えメニューが表示される。複数アカウントをすばやく使い分けられる機能。'
	String get longPressDesc => '多くのSNSアプリでは、プロフィールアイコンやアバターを長押しすることでアカウント切り替えメニューが表示される。複数アカウントをすばやく使い分けられる機能。';

	/// ja: 'サブアカウントは普段使いのアカウントと分ける'
	String get subAccountTitle => 'サブアカウントは普段使いのアカウントと分ける';

	/// ja: 'SNSではメインアカウントと趣味・匿名用のサブアカウントを使い分ける人が多い。長押し操作で素早く切り替えることで、用途に応じた使い分けが快適にできる。'
	String get subAccountDesc => 'SNSではメインアカウントと趣味・匿名用のサブアカウントを使い分ける人が多い。長押し操作で素早く切り替えることで、用途に応じた使い分けが快適にできる。';

	/// ja: 'マルチアカウント管理は現代の必須スキル'
	String get multiAccountTitle => 'マルチアカウント管理は現代の必須スキル';

	/// ja: '仕事用・プライベート用・趣味用など複数のSNSアカウントを持つことが一般化している。アカウント切り替えの操作を知ることで、SNSをより効果的に活用できる。'
	String get multiAccountDesc => '仕事用・プライベート用・趣味用など複数のSNSアカウントを持つことが一般化している。アカウント切り替えの操作を知ることで、SNSをより効果的に活用できる。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'タイムラインに流れてきた猫の写真に「いいね」をしよう',
			'quiz1.insight.title' => 'なぜダブルタップでいいねできた？',
			'quiz1.insight.subtitle' => 'ダブルタップ＝「いいね」はSNSの定番操作',
			'quiz1.insight.doubleTapTitle' => 'ダブルタップは「いいね」のショートカット',
			'quiz1.insight.doubleTapDesc' => 'X（旧Twitter）やInstagramでは、投稿の写真をすばやく2回タップすると「いいね」できる。ハートボタンを探す必要がなく、直感的に操作できる。',
			'quiz1.insight.heartTitle' => 'ハートアニメーションが操作を確認させる',
			'quiz1.insight.heartDesc' => 'ダブルタップすると画像中央に大きなハートが表示される。これはフィードバックアニメーションと呼ばれ、操作が正しく認識されたことをユーザーに伝える仕組み。',
			'quiz1.insight.gestureTitle' => 'SNSジェスチャーは世界共通の操作',
			'quiz1.insight.gestureDesc' => 'InstagramやX・TikTokなど多くのSNSで「ダブルタップ＝いいね」が共通操作になっている。一度覚えれば複数のアプリで活用できる。',
			'quiz2.missionText' => '全画面で開いた画像を閉じて、タイムラインに戻ろう',
			'quiz2.insight.title' => 'なぜ下にスワイプで閉じられた？',
			'quiz2.insight.subtitle' => '下スワイプ＝「戻る・閉じる」の直感操作',
			'quiz2.insight.swipeTitle' => '下スワイプは「閉じる」の直感ジェスチャー',
			'quiz2.insight.swipeDesc' => '全画面表示された画像を下に向かってスワイプ（フリック）すると、元の画面に戻れる。重力を意識した「落とす」感覚が「閉じる」動作と結びついている。',
			'quiz2.insight.fullscreenTitle' => '全画面モードはタップで開く',
			'quiz2.insight.fullscreenDesc' => 'SNSアプリでは投稿の画像をタップすると全画面モードで表示される。ピンチアウトで拡大したり、より詳しく見ることができる。',
			'quiz2.insight.backTitle' => '「×ボタン」がなくても閉じられる',
			'quiz2.insight.backDesc' => 'スマートフォンのUIでは×ボタンがなくても、スワイプジェスチャーで画面を閉じることができる。操作の手がかりがなくても試してみることが重要。',
			'quiz3.missionText' => '昔の投稿を読みすぎた！一瞬で最新の投稿（一番上）に戻ろう',
			'quiz3.insight.title' => 'なぜ一瞬でトップに戻れた？',
			'quiz3.insight.subtitle' => 'ステータスバー・ホームタブのタップ＝先頭へ',
			'quiz3.insight.statusBarTitle' => 'ステータスバーのタップは「先頭に戻る」ショートカット',
			'quiz3.insight.statusBarDesc' => 'iPhoneのステータスバー（時刻表示エリア）をタップすると、多くのアプリでリストの先頭に瞬時に戻れる。長いタイムラインをスクロールして戻る手間が省ける。',
			'quiz3.insight.homeTabTitle' => 'ホームタブの再タップも「先頭に戻る」操作',
			'quiz3.insight.homeTabDesc' => 'すでに表示中のタブ（ホームボタン）をもう一度タップすると、タイムラインが一番上に戻る。SNSアプリに限らず多くのアプリで使えるテクニック。',
			'quiz3.insight.efficientTitle' => 'スクロールより「ジャンプ」が圧倒的に速い',
			'quiz3.insight.efficientDesc' => '大量のコンテンツを一番上まで手動でスクロールするのは非効率。専用操作でトップに戻ることで、快適なアプリ体験が実現される。',
			'quiz4.missionText' => 'こっそり作っている「裏垢（サブアカウント）」に切り替えよう',
			'quiz4.insight.title' => 'なぜ長押しでアカウントが切り替えられた？',
			'quiz4.insight.subtitle' => 'プロフィールアイコンの長押し＝アカウント切り替え',
			'quiz4.insight.longPressTitle' => 'プロフィールアイコンの長押しでアカウント選択',
			'quiz4.insight.longPressDesc' => '多くのSNSアプリでは、プロフィールアイコンやアバターを長押しすることでアカウント切り替えメニューが表示される。複数アカウントをすばやく使い分けられる機能。',
			'quiz4.insight.subAccountTitle' => 'サブアカウントは普段使いのアカウントと分ける',
			'quiz4.insight.subAccountDesc' => 'SNSではメインアカウントと趣味・匿名用のサブアカウントを使い分ける人が多い。長押し操作で素早く切り替えることで、用途に応じた使い分けが快適にできる。',
			'quiz4.insight.multiAccountTitle' => 'マルチアカウント管理は現代の必須スキル',
			'quiz4.insight.multiAccountDesc' => '仕事用・プライベート用・趣味用など複数のSNSアカウントを持つことが一般化している。アカウント切り替えの操作を知ることで、SNSをより効果的に活用できる。',
			'common.appTitle' => 'NantoTweet',
			'common.home' => 'ホーム',
			'common.search' => '検索',
			'common.notifications' => '通知',
			'common.profile' => 'プロフィール',
			'common.mainAccountName' => 'なんとユーザー',
			'common.mainAccountId' => '@nanto_user',
			'common.subAccountName' => 'なんとの裏垢',
			'common.subAccountId' => '@nanto_ura',
			'common.switchAccountLabel' => 'アカウントを切り替える',
			'common.post1UserName' => 'なんとにゃん太',
			'common.post1UserId' => '@nanto_nyan',
			'common.post1Content' => '今日もかわいい写真が撮れた🐱',
			'common.post2UserName' => 'なんとわん子',
			'common.post2UserId' => '@nanto_wanko',
			'common.post2Content' => '散歩から帰ってきたよ🐶',
			'common.post3UserName' => 'なんとぴよ子',
			'common.post3UserId' => '@nanto_piyo',
			'common.post3Content' => 'ぴよぴよ！元気いっぱいだよ🐥',
			'common.post4UserName' => 'なんとうさ吉',
			'common.post4UserId' => '@nanto_usa',
			'common.post4Content' => '今日はにんじんをいっぱい食べた🥕',
			'common.post5UserName' => 'なんとはむすけ',
			'common.post5UserId' => '@nanto_hamu',
			'common.post5Content' => '回し車が止まらない🐹',
			'common.post6UserName' => 'なんとかめ次郎',
			'common.post6UserId' => '@nanto_kame',
			'common.post6Content' => 'ゆっくりと日光浴中🐢',
			'common.post7UserName' => 'なんとさかな男',
			'common.post7UserId' => '@nanto_sakana',
			'common.post7Content' => '水槽の掃除をしたら気持ちよさそうに泳いでいる🐟',
			'common.post8UserName' => 'なんとすずめ',
			'common.post8UserId' => '@nanto_suzume',
			'common.post8Content' => 'ちゅんちゅん！今日も元気です🐦',
			'common.post9UserName' => 'なんとねこ平',
			'common.post9UserId' => '@nanto_neko2',
			'common.post9Content' => 'お昼寝タイムです😴',
			'common.post10UserName' => 'なんとくま太郎',
			'common.post10UserId' => '@nanto_kuma',
			'common.post10Content' => '蜂蜜を食べたくなってきた🍯',
			_ => null,
		};
	}
}
