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
	late final TranslationsVideosJa videos = TranslationsVideosJa.internal(_root);
}

// Path: quiz1
class TranslationsQuiz1Ja {
	TranslationsQuiz1Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '動画を再生してください'
	String get missionText => '動画を再生してください';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '動画をシェアしてください'
	String get missionText => '動画をシェアしてください';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '動画をお気に入りに追加してください'
	String get missionText => '動画をお気に入りに追加してください';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '動画の字幕をオンにしてください'
	String get missionText => '動画の字幕をオンにしてください';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'StreamHub'
	String get appTitle => 'StreamHub';

	/// ja: 'Home'
	String get homeTab => 'Home';

	/// ja: 'Explore'
	String get exploreTab => 'Explore';

	/// ja: 'Shorts'
	String get shortsTab => 'Shorts';

	/// ja: 'Subscriptions'
	String get subsTab => 'Subscriptions';

	/// ja: 'You'
	String get youTab => 'You';

	/// ja: 'Like'
	String get likeButton => 'Like';

	/// ja: 'Dislike'
	String get dislikeButton => 'Dislike';

	/// ja: 'Share'
	String get shareButton => 'Share';

	/// ja: 'Save'
	String get saveButton => 'Save';

	/// ja: 'More'
	String get moreButton => 'More';

	/// ja: 'Subscribe'
	String get subscribeButton => 'Subscribe';

	/// ja: '回再生'
	String get views => '回再生';

	/// ja: 'Subtitles'
	String get subtitles => 'Subtitles';

	/// ja: 'Quality'
	String get quality => 'Quality';

	/// ja: 'Playback speed'
	String get playbackSpeed => 'Playback speed';

	/// ja: 'Report'
	String get reportButton => 'Report';

	/// ja: 'Off'
	String get subtitlesOff => 'Off';

	/// ja: 'On (Auto)'
	String get subtitlesOn => 'On (Auto)';

	/// ja: 'Share to'
	String get shareTitle => 'Share to';

	/// ja: 'Link copied'
	String get linkCopied => 'Link copied';

	/// ja: 'Saved to playlist'
	String get savedToList => 'Saved to playlist';
}

// Path: videos
class TranslationsVideosJa {
	TranslationsVideosJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'Amazing Nature Documentary 4K'
	String get v1Title => 'Amazing Nature Documentary 4K';

	/// ja: 'NatureWorld'
	String get v1Channel => 'NatureWorld';

	/// ja: 'Learn Programming in 10 Minutes'
	String get v2Title => 'Learn Programming in 10 Minutes';

	/// ja: 'CodeMaster'
	String get v2Channel => 'CodeMaster';

	/// ja: 'Top 10 Travel Destinations 2026'
	String get v3Title => 'Top 10 Travel Destinations 2026';

	/// ja: 'TravelVlog'
	String get v3Channel => 'TravelVlog';

	/// ja: 'Cooking Easy Pasta Recipe'
	String get v4Title => 'Cooking Easy Pasta Recipe';

	/// ja: 'ChefKitchen'
	String get v4Channel => 'ChefKitchen';

	/// ja: 'Morning Yoga for Beginners'
	String get v5Title => 'Morning Yoga for Beginners';

	/// ja: 'YogaLife'
	String get v5Channel => 'YogaLife';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ再生ボタンがわかった？'
	String get title => 'なぜ再生ボタンがわかった？';

	/// ja: '▶ は世界共通の「再生」の記号'
	String get subtitle => '▶ は世界共通の「再生」の記号';

	/// ja: '▶ マークは60年以上前から変わらない'
	String get playTitle => '▶ マークは60年以上前から変わらない';

	/// ja: 'テープレコーダー時代（1960年代）から使われてきた▶（右向き三角）は、デジタル化されても「再生」を意味する記号として世界中で通用している。文字を読まなくてもわかる、最も普遍的なUIアイコンの一つだ。'
	String get playDesc => 'テープレコーダー時代（1960年代）から使われてきた▶（右向き三角）は、デジタル化されても「再生」を意味する記号として世界中で通用している。文字を読まなくてもわかる、最も普遍的なUIアイコンの一つだ。';

	/// ja: 'サムネイルが内容を予告する'
	String get thumbnailTitle => 'サムネイルが内容を予告する';

	/// ja: '動画の代表画面を事前表示するサムネイルは、文字説明がなくても動画の内容を伝える。視覚情報は言語を超えてコンテンツを伝達できる。'
	String get thumbnailDesc => '動画の代表画面を事前表示するサムネイルは、文字説明がなくても動画の内容を伝える。視覚情報は言語を超えてコンテンツを伝達できる。';

	/// ja: 'プログレスバーが残り時間を見せる'
	String get progressTitle => 'プログレスバーが残り時間を見せる';

	/// ja: '動画下部の細いバーは「ここまで見た/ここから見ていない」を直感的に示す。シークバーのUIパターンは音楽・動画プレイヤーで世界標準となっており、言語不要で操作できる。'
	String get progressDesc => '動画下部の細いバーは「ここまで見た/ここから見ていない」を直感的に示す。シークバーのUIパターンは音楽・動画プレイヤーで世界標準となっており、言語不要で操作できる。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜシェアボタンが見つかった？'
	String get title => 'なぜシェアボタンが見つかった？';

	/// ja: 'シェアアイコンは「つながり」を形にした記号'
	String get subtitle => 'シェアアイコンは「つながり」を形にした記号';

	/// ja: 'シェアアイコンの形が意味を語る'
	String get shareTitle => 'シェアアイコンの形が意味を語る';

	/// ja: '3つの点を2本の線でつなぐシェアアイコン（Androidスタイル）や矢印が上を向くアイコン（iOSスタイル）は、「外へ送り出す」という動作を視覚化している。世界中のアプリで統一されたこの形は、言語に依存しない意味記号だ。'
	String get shareDesc => '3つの点を2本の線でつなぐシェアアイコン（Androidスタイル）や矢印が上を向くアイコン（iOSスタイル）は、「外へ送り出す」という動作を視覚化している。世界中のアプリで統一されたこの形は、言語に依存しない意味記号だ。';

	/// ja: 'アクションボタン群が機能を並べる'
	String get actionTitle => 'アクションボタン群が機能を並べる';

	/// ja: 'いいね・シェア・保存・…（その他）が横並びになるボタン行は、YouTube・TikTok・Twitter など主要SNSで採用されている標準UIパターン。見慣れた配置は、ラベルを読まなくても機能を類推させる。'
	String get actionDesc => 'いいね・シェア・保存・…（その他）が横並びになるボタン行は、YouTube・TikTok・Twitter など主要SNSで採用されている標準UIパターン。見慣れた配置は、ラベルを読まなくても機能を類推させる。';

	/// ja: 'シェアシートが選択肢を提示する'
	String get modalTitle => 'シェアシートが選択肢を提示する';

	/// ja: 'タップで下から出てくるシェアシートはiOS/Androidの標準コンポーネント。並んだアプリアイコンから「どこへシェアするか」を選ぶ体験は、OS横断で統一されており、言語を超えて操作できる。'
	String get modalDesc => 'タップで下から出てくるシェアシートはiOS/Androidの標準コンポーネント。並んだアプリアイコンから「どこへシェアするか」を選ぶ体験は、OS横断で統一されており、言語を超えて操作できる。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ保存ボタンがわかった？'
	String get title => 'なぜ保存ボタンがわかった？';

	/// ja: 'フラグ記号は「あとで見る」の万国共通語'
	String get subtitle => 'フラグ記号は「あとで見る」の万国共通語';

	/// ja: 'フラグ・ブックマーク系アイコンは「保存」の記号'
	String get saveTitle => 'フラグ・ブックマーク系アイコンは「保存」の記号';

	/// ja: '旗・リボン・＋アイコンなど「お気に入り登録」や「あとで見る」に使われるアイコン群は、形が違っても「これを保持する」という意味で一貫している。繰り返し使われた結果、形そのものが意味を持つようになった。'
	String get saveDesc => '旗・リボン・＋アイコンなど「お気に入り登録」や「あとで見る」に使われるアイコン群は、形が違っても「これを保持する」という意味で一貫している。繰り返し使われた結果、形そのものが意味を持つようになった。';

	/// ja: '色変化がアクション完了を伝える'
	String get feedbackTitle => '色変化がアクション完了を伝える';

	/// ja: 'グレーから赤・黄・青などに変わるアイコンの色変化は、「未登録→登録済み」の状態遷移をビジュアルで伝える。状態の変化を色で示すUIパターンはSNS全般で共通しており、ラベルを読まなくても結果がわかる。'
	String get feedbackDesc => 'グレーから赤・黄・青などに変わるアイコンの色変化は、「未登録→登録済み」の状態遷移をビジュアルで伝える。状態の変化を色で示すUIパターンはSNS全般で共通しており、ラベルを読まなくても結果がわかる。';

	/// ja: '「あとで見るリスト」UIが動機を生む'
	String get listTitle => '「あとで見るリスト」UIが動機を生む';

	/// ja: '視聴したいコンテンツを貯めておくリスト機能は、Netflix・YouTube・Spotifyで共通の仕組み。「あとで」を可能にするUIはコンテンツ消費行動の基本パターンとして定着している。'
	String get listDesc => '視聴したいコンテンツを貯めておくリスト機能は、Netflix・YouTube・Spotifyで共通の仕組み。「あとで」を可能にするUIはコンテンツ消費行動の基本パターンとして定着している。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ字幕設定の場所がわかった？'
	String get title => 'なぜ字幕設定の場所がわかった？';

	/// ja: '設定は「⋮」か「⚙」の奥にある'
	String get subtitle => '設定は「⋮」か「⚙」の奥にある';

	/// ja: '⋮（その他）メニューが隠し機能の入り口'
	String get menuTitle => '⋮（その他）メニューが隠し機能の入り口';

	/// ja: '3つの点（⋮）や3本線（≡）のアイコンは「まだ表示していない機能がある」を示す記号として定着している。詳細設定・字幕・品質変更などの発展的機能はここに隠されることが多く、ユーザーは経験的に学習している。'
	String get menuDesc => '3つの点（⋮）や3本線（≡）のアイコンは「まだ表示していない機能がある」を示す記号として定着している。詳細設定・字幕・品質変更などの発展的機能はここに隠されることが多く、ユーザーは経験的に学習している。';

	/// ja: 'CC（Closed Captions）は国際標準の記号'
	String get ccTitle => 'CC（Closed Captions）は国際標準の記号';

	/// ja: '「CC」または字幕アイコン（□に線が入った形）は、テレビ放送時代から続く字幕の国際標準記号。言語に関係なく「字幕」を意味すると認識されている。'
	String get ccDesc => '「CC」または字幕アイコン（□に線が入った形）は、テレビ放送時代から続く字幕の国際標準記号。言語に関係なく「字幕」を意味すると認識されている。';

	/// ja: '設定画面のトグルUIは直感的'
	String get settingsTitle => '設定画面のトグルUIは直感的';

	/// ja: 'オン/オフを切り替えるトグルスイッチは、物理スイッチを模した直感的なUI。色（グレー→カラー）と位置（左→右）の2つの手がかりで状態を伝えるため、言語を読まなくても操作できる。'
	String get settingsDesc => 'オン/オフを切り替えるトグルスイッチは、物理スイッチを模した直感的なUI。色（グレー→カラー）と位置（左→右）の2つの手がかりで状態を伝えるため、言語を読まなくても操作できる。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '動画を再生してください',
			'quiz1.insight.title' => 'なぜ再生ボタンがわかった？',
			'quiz1.insight.subtitle' => '▶ は世界共通の「再生」の記号',
			'quiz1.insight.playTitle' => '▶ マークは60年以上前から変わらない',
			'quiz1.insight.playDesc' => 'テープレコーダー時代（1960年代）から使われてきた▶（右向き三角）は、デジタル化されても「再生」を意味する記号として世界中で通用している。文字を読まなくてもわかる、最も普遍的なUIアイコンの一つだ。',
			'quiz1.insight.thumbnailTitle' => 'サムネイルが内容を予告する',
			'quiz1.insight.thumbnailDesc' => '動画の代表画面を事前表示するサムネイルは、文字説明がなくても動画の内容を伝える。視覚情報は言語を超えてコンテンツを伝達できる。',
			'quiz1.insight.progressTitle' => 'プログレスバーが残り時間を見せる',
			'quiz1.insight.progressDesc' => '動画下部の細いバーは「ここまで見た/ここから見ていない」を直感的に示す。シークバーのUIパターンは音楽・動画プレイヤーで世界標準となっており、言語不要で操作できる。',
			'quiz2.missionText' => '動画をシェアしてください',
			'quiz2.insight.title' => 'なぜシェアボタンが見つかった？',
			'quiz2.insight.subtitle' => 'シェアアイコンは「つながり」を形にした記号',
			'quiz2.insight.shareTitle' => 'シェアアイコンの形が意味を語る',
			'quiz2.insight.shareDesc' => '3つの点を2本の線でつなぐシェアアイコン（Androidスタイル）や矢印が上を向くアイコン（iOSスタイル）は、「外へ送り出す」という動作を視覚化している。世界中のアプリで統一されたこの形は、言語に依存しない意味記号だ。',
			'quiz2.insight.actionTitle' => 'アクションボタン群が機能を並べる',
			'quiz2.insight.actionDesc' => 'いいね・シェア・保存・…（その他）が横並びになるボタン行は、YouTube・TikTok・Twitter など主要SNSで採用されている標準UIパターン。見慣れた配置は、ラベルを読まなくても機能を類推させる。',
			'quiz2.insight.modalTitle' => 'シェアシートが選択肢を提示する',
			'quiz2.insight.modalDesc' => 'タップで下から出てくるシェアシートはiOS/Androidの標準コンポーネント。並んだアプリアイコンから「どこへシェアするか」を選ぶ体験は、OS横断で統一されており、言語を超えて操作できる。',
			'quiz3.missionText' => '動画をお気に入りに追加してください',
			'quiz3.insight.title' => 'なぜ保存ボタンがわかった？',
			'quiz3.insight.subtitle' => 'フラグ記号は「あとで見る」の万国共通語',
			'quiz3.insight.saveTitle' => 'フラグ・ブックマーク系アイコンは「保存」の記号',
			'quiz3.insight.saveDesc' => '旗・リボン・＋アイコンなど「お気に入り登録」や「あとで見る」に使われるアイコン群は、形が違っても「これを保持する」という意味で一貫している。繰り返し使われた結果、形そのものが意味を持つようになった。',
			'quiz3.insight.feedbackTitle' => '色変化がアクション完了を伝える',
			'quiz3.insight.feedbackDesc' => 'グレーから赤・黄・青などに変わるアイコンの色変化は、「未登録→登録済み」の状態遷移をビジュアルで伝える。状態の変化を色で示すUIパターンはSNS全般で共通しており、ラベルを読まなくても結果がわかる。',
			'quiz3.insight.listTitle' => '「あとで見るリスト」UIが動機を生む',
			'quiz3.insight.listDesc' => '視聴したいコンテンツを貯めておくリスト機能は、Netflix・YouTube・Spotifyで共通の仕組み。「あとで」を可能にするUIはコンテンツ消費行動の基本パターンとして定着している。',
			'quiz4.missionText' => '動画の字幕をオンにしてください',
			'quiz4.insight.title' => 'なぜ字幕設定の場所がわかった？',
			'quiz4.insight.subtitle' => '設定は「⋮」か「⚙」の奥にある',
			'quiz4.insight.menuTitle' => '⋮（その他）メニューが隠し機能の入り口',
			'quiz4.insight.menuDesc' => '3つの点（⋮）や3本線（≡）のアイコンは「まだ表示していない機能がある」を示す記号として定着している。詳細設定・字幕・品質変更などの発展的機能はここに隠されることが多く、ユーザーは経験的に学習している。',
			'quiz4.insight.ccTitle' => 'CC（Closed Captions）は国際標準の記号',
			'quiz4.insight.ccDesc' => '「CC」または字幕アイコン（□に線が入った形）は、テレビ放送時代から続く字幕の国際標準記号。言語に関係なく「字幕」を意味すると認識されている。',
			'quiz4.insight.settingsTitle' => '設定画面のトグルUIは直感的',
			'quiz4.insight.settingsDesc' => 'オン/オフを切り替えるトグルスイッチは、物理スイッチを模した直感的なUI。色（グレー→カラー）と位置（左→右）の2つの手がかりで状態を伝えるため、言語を読まなくても操作できる。',
			'common.appTitle' => 'StreamHub',
			'common.homeTab' => 'Home',
			'common.exploreTab' => 'Explore',
			'common.shortsTab' => 'Shorts',
			'common.subsTab' => 'Subscriptions',
			'common.youTab' => 'You',
			'common.likeButton' => 'Like',
			'common.dislikeButton' => 'Dislike',
			'common.shareButton' => 'Share',
			'common.saveButton' => 'Save',
			'common.moreButton' => 'More',
			'common.subscribeButton' => 'Subscribe',
			'common.views' => '回再生',
			'common.subtitles' => 'Subtitles',
			'common.quality' => 'Quality',
			'common.playbackSpeed' => 'Playback speed',
			'common.reportButton' => 'Report',
			'common.subtitlesOff' => 'Off',
			'common.subtitlesOn' => 'On (Auto)',
			'common.shareTitle' => 'Share to',
			'common.linkCopied' => 'Link copied',
			'common.savedToList' => 'Saved to playlist',
			'videos.v1Title' => 'Amazing Nature Documentary 4K',
			'videos.v1Channel' => 'NatureWorld',
			'videos.v2Title' => 'Learn Programming in 10 Minutes',
			'videos.v2Channel' => 'CodeMaster',
			'videos.v3Title' => 'Top 10 Travel Destinations 2026',
			'videos.v3Channel' => 'TravelVlog',
			'videos.v4Title' => 'Cooking Easy Pasta Recipe',
			'videos.v4Channel' => 'ChefKitchen',
			'videos.v5Title' => 'Morning Yoga for Beginners',
			'videos.v5Channel' => 'YogaLife',
			_ => null,
		};
	}
}
