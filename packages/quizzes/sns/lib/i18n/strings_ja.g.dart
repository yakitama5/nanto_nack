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

	/// ja: 'タイムラインに流れてきた猫の写真に「いいネ！」をしよう'
	String get missionText => 'タイムラインに流れてきた猫の写真に「いいネ！」をしよう';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '何か投稿してみよう！'
	String get missionText => '何か投稿してみよう！';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '画像を開いて表示した後に元の画面に戻ろう'
	String get missionText => '画像を開いて表示した後に元の画面に戻ろう';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ナントム(@nantom)の投稿を検索しよう！'
	String get missionText => 'ナントム(@nantom)の投稿を検索しよう！';

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

	/// ja: '投稿する'
	String get post => '投稿する';

	/// ja: 'キャンセル'
	String get cancel => 'キャンセル';

	/// ja: 'いまどうしてる？'
	String get composeHint => 'いまどうしてる？';

	/// ja: '投稿画面 (Twitter風UI実装予定)'
	String get composePlaceholder => '投稿画面 (Twitter風UI実装予定)';

	late final TranslationsCommonTrendsJa trends = TranslationsCommonTrendsJa.internal(_root);
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜダブルタップで「いいネ！」できた？'
	String get title => 'なぜダブルタップで「いいネ！」できた？';

	/// ja: 'ダブルタップ＝「いいネ！」はSNSの定番操作'
	String get subtitle => 'ダブルタップ＝「いいネ！」はSNSの定番操作';

	/// ja: 'ダブルタップは「いいネ！」のショートカット'
	String get doubleTapTitle => 'ダブルタップは「いいネ！」のショートカット';

	/// ja: 'X（旧Twitter）やInstagramでは、投稿の写真をすばやく2回タップすると「いいネ！」できる。ハートボタンを探す必要がなく、直感的に操作できる。'
	String get doubleTapDesc => 'X（旧Twitter）やInstagramでは、投稿の写真をすばやく2回タップすると「いいネ！」できる。ハートボタンを探す必要がなく、直感的に操作できる。';

	/// ja: 'ハートアニメーションが操作を確認させる'
	String get heartTitle => 'ハートアニメーションが操作を確認させる';

	/// ja: 'ダブルタップすると画像中央に大きなハートが表示される。これはフィードバックアニメーションと呼ばれ、操作が正しく認識されたことをユーザーに伝える仕組み。'
	String get heartDesc => 'ダブルタップすると画像中央に大きなハートが表示される。これはフィードバックアニメーションと呼ばれ、操作が正しく認識されたことをユーザーに伝える仕組み。';

	/// ja: 'SNSジェスチャーは世界共通の操作'
	String get gestureTitle => 'SNSジェスチャーは世界共通の操作';

	/// ja: 'InstagramやX・TikTokなど多くのSNSで「ダブルタップ＝いいネ！」が共通操作になっている。一度覚えれば複数のアプリで活用できる。'
	String get gestureDesc => 'InstagramやX・TikTokなど多くのSNSで「ダブルタップ＝いいネ！」が共通操作になっている。一度覚えれば複数のアプリで活用できる。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ投稿画面が下から出てきた？'
	String get title => 'なぜ投稿画面が下から出てきた？';

	/// ja: '＋ボタン＝「新規作成・アクション」の目印'
	String get subtitle => '＋ボタン＝「新規作成・アクション」の目印';

	/// ja: 'FAB（Floating Action Button）の役割'
	String get swipeTitle => 'FAB（Floating Action Button）の役割';

	/// ja: '画面右下に浮かんでいる＋ボタンは、その画面で最も重要な操作（SNSなら投稿）を示す。親指で届きやすい位置にあり、すぐに操作を開始できる。'
	String get swipeDesc => '画面右下に浮かんでいる＋ボタンは、その画面で最も重要な操作（SNSなら投稿）を示す。親指で届きやすい位置にあり、すぐに操作を開始できる。';

	/// ja: '入力中はキーボードが自動で開く'
	String get fullscreenTitle => '入力中はキーボードが自動で開く';

	/// ja: '投稿画面を開くと自動的に入力欄にフォーカスが当たり、キーボードが表示される。ユーザーがすぐに文字を打ち込めるように工夫されている。'
	String get fullscreenDesc => '投稿画面を開くと自動的に入力欄にフォーカスが当たり、キーボードが表示される。ユーザーがすぐに文字を打ち込めるように工夫されている。';

	/// ja: '投稿ボタンの色が変わる'
	String get backTitle => '投稿ボタンの色が変わる';

	/// ja: '何も入力していない時は投稿ボタンが半透明で押せないようになっている。文字を入力することで色が濃くなり、操作可能であることを視覚的に伝える。'
	String get backDesc => '何も入力していない時は投稿ボタンが半透明で押せないようになっている。文字を入力することで色が濃くなり、操作可能であることを視覚的に伝える。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

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

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ「from:」で検索できた？'
	String get title => 'なぜ「from:」で検索できた？';

	/// ja: '検索コマンドで絞り込みを効率化'
	String get subtitle => '検索コマンドで絞り込みを効率化';

	/// ja: '検索コマンド（from:）の便利さ'
	String get searchCommandTitle => '検索コマンド（from:）の便利さ';

	/// ja: '「from:ユーザー名」と入力することで、その特定のユーザーの投稿だけを検索できる。SNSの検索バーでは、こうしたコマンドを使うことで高度な絞り込みが可能。'
	String get searchCommandDesc => '「from:ユーザー名」と入力することで、その特定のユーザーの投稿だけを検索できる。SNSの検索バーでは、こうしたコマンドを使うことで高度な絞り込みが可能。';

	/// ja: '検索タブへの切り替えはアイコンで判断'
	String get searchTabIconTitle => '検索タブへの切り替えはアイコンで判断';

	/// ja: '虫眼鏡アイコンは世界的に「検索」を意味する。タブバーのアイコンから、自分が今どの機能を使おうとしているかを直感的に判断できる。'
	String get searchTabIconDesc => '虫眼鏡アイコンは世界的に「検索」を意味する。タブバーのアイコンから、自分が今どの機能を使おうとしているかを直感的に判断できる。';

	/// ja: 'オートフォーカスでスムーズに検索'
	String get autoFocusTitle => 'オートフォーカスでスムーズに検索';

	/// ja: '検索タブに切り替えた瞬間に検索バーにカーソルが移動することで、タップの手間を省いてすぐにタイピングを開始できるUI設計。'
	String get autoFocusDesc => '検索タブに切り替えた瞬間に検索バーにカーソルが移動することで、タップの手間を省いてすぐにタイピングを開始できるUI設計。';
}

// Path: common.trends
class TranslationsCommonTrendsJa {
	TranslationsCommonTrendsJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '日本のトレンド'
	String get trendingInJapan => '日本のトレンド';

	/// ja: 'テクノロジー · トレンド'
	String get technologyTrending => 'テクノロジー · トレンド';

	/// ja: 'ゲーム · トレンド'
	String get gamingTrending => 'ゲーム · トレンド';

	/// ja: '件の投稿'
	String get postsCountSuffix => '件の投稿';

	/// ja: 'ナントナック'
	String get nantoNack => 'ナントナック';

	/// ja: 'Flutter'
	String get flutter => 'Flutter';

	/// ja: 'レトロゲーム'
	String get retroGames => 'レトロゲーム';

	/// ja: 'UI/UX クイズ'
	String get uiUxQuiz => 'UI/UX クイズ';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'タイムラインに流れてきた猫の写真に「いいネ！」をしよう',
			'quiz1.insight.title' => 'なぜダブルタップで「いいネ！」できた？',
			'quiz1.insight.subtitle' => 'ダブルタップ＝「いいネ！」はSNSの定番操作',
			'quiz1.insight.doubleTapTitle' => 'ダブルタップは「いいネ！」のショートカット',
			'quiz1.insight.doubleTapDesc' => 'X（旧Twitter）やInstagramでは、投稿の写真をすばやく2回タップすると「いいネ！」できる。ハートボタンを探す必要がなく、直感的に操作できる。',
			'quiz1.insight.heartTitle' => 'ハートアニメーションが操作を確認させる',
			'quiz1.insight.heartDesc' => 'ダブルタップすると画像中央に大きなハートが表示される。これはフィードバックアニメーションと呼ばれ、操作が正しく認識されたことをユーザーに伝える仕組み。',
			'quiz1.insight.gestureTitle' => 'SNSジェスチャーは世界共通の操作',
			'quiz1.insight.gestureDesc' => 'InstagramやX・TikTokなど多くのSNSで「ダブルタップ＝いいネ！」が共通操作になっている。一度覚えれば複数のアプリで活用できる。',
			'quiz2.missionText' => '何か投稿してみよう！',
			'quiz2.insight.title' => 'なぜ投稿画面が下から出てきた？',
			'quiz2.insight.subtitle' => '＋ボタン＝「新規作成・アクション」の目印',
			'quiz2.insight.swipeTitle' => 'FAB（Floating Action Button）の役割',
			'quiz2.insight.swipeDesc' => '画面右下に浮かんでいる＋ボタンは、その画面で最も重要な操作（SNSなら投稿）を示す。親指で届きやすい位置にあり、すぐに操作を開始できる。',
			'quiz2.insight.fullscreenTitle' => '入力中はキーボードが自動で開く',
			'quiz2.insight.fullscreenDesc' => '投稿画面を開くと自動的に入力欄にフォーカスが当たり、キーボードが表示される。ユーザーがすぐに文字を打ち込めるように工夫されている。',
			'quiz2.insight.backTitle' => '投稿ボタンの色が変わる',
			'quiz2.insight.backDesc' => '何も入力していない時は投稿ボタンが半透明で押せないようになっている。文字を入力することで色が濃くなり、操作可能であることを視覚的に伝える。',
			'quiz3.missionText' => '画像を開いて表示した後に元の画面に戻ろう',
			'quiz3.insight.title' => 'なぜ下にスワイプで閉じられた？',
			'quiz3.insight.subtitle' => '下スワイプ＝「戻る・閉じる」の直感操作',
			'quiz3.insight.swipeTitle' => '下スワイプは「閉じる」の直感ジェスチャー',
			'quiz3.insight.swipeDesc' => '全画面表示された画像を下に向かってスワイプ（フリック）すると、元の画面に戻れる。重力を意識した「落とす」感覚が「閉じる」動作と結びついている。',
			'quiz3.insight.fullscreenTitle' => '全画面モードはタップで開く',
			'quiz3.insight.fullscreenDesc' => 'SNSアプリでは投稿の画像をタップすると全画面モードで表示される。ピンチアウトで拡大したり、より詳しく見ることができる。',
			'quiz3.insight.backTitle' => '「×ボタン」がなくても閉じられる',
			'quiz3.insight.backDesc' => 'スマートフォンのUIでは×ボタンがなくても、スワイプジェスチャーで画面を閉じることができる。操作の手がかりがなくても試してみることが重要。',
			'quiz4.missionText' => 'ナントム(@nantom)の投稿を検索しよう！',
			'quiz4.insight.title' => 'なぜ「from:」で検索できた？',
			'quiz4.insight.subtitle' => '検索コマンドで絞り込みを効率化',
			'quiz4.insight.searchCommandTitle' => '検索コマンド（from:）の便利さ',
			'quiz4.insight.searchCommandDesc' => '「from:ユーザー名」と入力することで、その特定のユーザーの投稿だけを検索できる。SNSの検索バーでは、こうしたコマンドを使うことで高度な絞り込みが可能。',
			'quiz4.insight.searchTabIconTitle' => '検索タブへの切り替えはアイコンで判断',
			'quiz4.insight.searchTabIconDesc' => '虫眼鏡アイコンは世界的に「検索」を意味する。タブバーのアイコンから、自分が今どの機能を使おうとしているかを直感的に判断できる。',
			'quiz4.insight.autoFocusTitle' => 'オートフォーカスでスムーズに検索',
			'quiz4.insight.autoFocusDesc' => '検索タブに切り替えた瞬間に検索バーにカーソルが移動することで、タップの手間を省いてすぐにタイピングを開始できるUI設計。',
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
			'common.post' => '投稿する',
			'common.cancel' => 'キャンセル',
			'common.composeHint' => 'いまどうしてる？',
			'common.composePlaceholder' => '投稿画面 (Twitter風UI実装予定)',
			'common.trends.trendingInJapan' => '日本のトレンド',
			'common.trends.technologyTrending' => 'テクノロジー · トレンド',
			'common.trends.gamingTrending' => 'ゲーム · トレンド',
			'common.trends.postsCountSuffix' => '件の投稿',
			'common.trends.nantoNack' => 'ナントナック',
			'common.trends.flutter' => 'Flutter',
			'common.trends.retroGames' => 'レトロゲーム',
			'common.trends.uiUxQuiz' => 'UI/UX クイズ',
			_ => null,
		};
	}
}
