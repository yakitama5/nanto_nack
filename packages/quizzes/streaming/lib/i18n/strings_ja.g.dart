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

	/// ja: '動画の字幕をオンにしてください'
	String get missionText => '動画の字幕をオンにしてください';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '次の動画へ移動し、動画の中盤まで進めてください'
	String get missionText => '次の動画へ移動し、動画の中盤まで進めてください';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '動画を「2倍速」で再生してください'
	String get missionText => '動画を「2倍速」で再生してください';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '動画を最高画質に変更し、端末にダウンロードしてください'
	String get missionText => '動画を最高画質に変更し、端末にダウンロードしてください';

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

	/// ja: 'Download'
	String get downloadButton => 'Download';

	/// ja: 'More'
	String get moreButton => 'More';

	/// ja: 'Subscribe'
	String get subscribeButton => 'Subscribe';

	/// ja: '人が登録'
	String get subscribers => '人が登録';

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

	/// ja: 'ゲームを中断しますか？'
	String get quitConfirmTitle => 'ゲームを中断しますか？';

	/// ja: 'プレイ中のゲームを終了します。'
	String get quitConfirmMessage => 'プレイ中のゲームを終了します。';

	/// ja: '続ける'
	String get continueButton => '続ける';

	/// ja: '終了する'
	String get quitButton => '終了する';
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

	/// ja: 'なぜ字幕設定の場所がわかった？'
	String get title => 'なぜ字幕設定の場所がわかった？';

	/// ja: 'CCは国際標準の記号'
	String get subtitle => 'CCは国際標準の記号';

	/// ja: 'CC（Closed Captions）は世界共通'
	String get ccTitle => 'CC（Closed Captions）は世界共通';

	/// ja: '「CC」または字幕アイコン（□に線が入った形）は、テレビ放送時代から続く字幕の国際標準記号。言語に関係なく「字幕」を意味すると認識されている。'
	String get ccDesc => '「CC」または字幕アイコン（□に線が入った形）は、テレビ放送時代から続く字幕の国際標準記号。言語に関係なく「字幕」を意味すると認識されている。';

	/// ja: 'コントロールは「隠れている」'
	String get visibilityTitle => 'コントロールは「隠れている」';

	/// ja: '動画プレイヤーの多くは、視聴を邪魔しないよう操作ボタンを自動で隠す。しかし、「一度タップすれば出てくる」という隠蔽UIの作法が、現代のユーザーには共通認識として根付いている。'
	String get visibilityDesc => '動画プレイヤーの多くは、視聴を邪魔しないよう操作ボタンを自動で隠す。しかし、「一度タップすれば出てくる」という隠蔽UIの作法が、現代のユーザーには共通認識として根付いている。';

	/// ja: '下線や色変化が「ON」を伝える'
	String get feedbackTitle => '下線や色変化が「ON」を伝える';

	/// ja: 'アイコンの下に赤い線がついたり、色が明るくなったりする変化は、その機能が有効であることを示す。ラベルを読まなくても状態を瞬時に把握できる。'
	String get feedbackDesc => 'アイコンの下に赤い線がついたり、色が明るくなったりする変化は、その機能が有効であることを示す。ラベルを読まなくても状態を瞬時に把握できる。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ迷わず操作できた？'
	String get title => 'なぜ迷わず操作できた？';

	/// ja: 'プレイヤーUIは「配置」が命'
	String get subtitle => 'プレイヤーUIは「配置」が命';

	/// ja: '右向き矢印＋棒 ＝ 次へ'
	String get skipTitle => '右向き矢印＋棒 ＝ 次へ';

	/// ja: '「▶︎▶︎|」という記号は、カセットプレイヤーの時代から「次のトラックへスキップ」を意味する。中央の再生ボタンの右隣という配置も世界標準だ。'
	String get skipDesc => '「▶︎▶︎|」という記号は、カセットプレイヤーの時代から「次のトラックへスキップ」を意味する。中央の再生ボタンの右隣という配置も世界標準だ。';

	/// ja: '赤い線は「時間の流れ」のメタファー'
	String get seekTitle => '赤い線は「時間の流れ」のメタファー';

	/// ja: '動画下部のプログレスバーは、左から右へ流れる時間を表す。赤い色は「現在地」を強調し、ツマミを動かすことで過去や未来へ自由にジャンプできることを直感的に伝えている。'
	String get seekDesc => '動画下部のプログレスバーは、左から右へ流れる時間を表す。赤い色は「現在地」を強調し、ツマミを動かすことで過去や未来へ自由にジャンプできることを直感的に伝えている。';

	/// ja: '中盤（中央）は視覚的に狙いやすい'
	String get targetTitle => '中盤（中央）は視覚的に狙いやすい';

	/// ja: 'バーの中央付近を狙う操作は、物理的な長さの半分を感覚的に捉えることで、文字情報なしでも40〜60%という範囲に正確に辿り着ける。'
	String get targetDesc => 'バーの中央付近を狙う操作は、物理的な長さの半分を感覚的に捉えることで、文字情報なしでも40〜60%という範囲に正確に辿り着ける。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '隠し操作に気づけた？'
	String get title => '隠し操作に気づけた？';

	/// ja: '長押しは「加速」のショートカット'
	String get subtitle => '長押しは「加速」のショートカット';

	/// ja: '動画エリアの長押しジェスチャー'
	String get gestureTitle => '動画エリアの長押しジェスチャー';

	/// ja: '多くの動画アプリでは、画面を長押しすると「倍速再生」が発動する。これはメニューを開く手間を省くための隠しショートカットだが、一度知ると手放せない「アハ体験」の一つだ。'
	String get gestureDesc => '多くの動画アプリでは、画面を長押しすると「倍速再生」が発動する。これはメニューを開く手間を省くための隠しショートカットだが、一度知ると手放せない「アハ体験」の一つだ。';

	/// ja: '⚙アイコンは設定の入り口'
	String get gearTitle => '⚙アイコンは設定の入り口';

	/// ja: '歯車のアイコンは、OSやアプリを問わず「設定」や「カスタマイズ」を意味する。文字が読めなくても、詳細な変更はここで行えるという信頼感がある。'
	String get gearDesc => '歯車のアイコンは、OSやアプリを問わず「設定」や「カスタマイズ」を意味する。文字が読めなくても、詳細な変更はここで行えるという信頼感がある。';

	/// ja: '数字と「x」の組み合わせ'
	String get speedTitle => '数字と「x」の組み合わせ';

	/// ja: '「1.5x」「2x」という表記は、倍率を意味する国際的な数学記号。言語の壁を超えて「速さ」を表現する手段として機能している。'
	String get speedDesc => '「1.5x」「2x」という表記は、倍率を意味する国際的な数学記号。言語の壁を超えて「速さ」を表現する手段として機能している。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '最高難易度を突破！'
	String get title => '最高難易度を突破！';

	/// ja: '記号の関連付けが鍵'
	String get subtitle => '記号の関連付けが鍵';

	/// ja: '数字が大きい ＝ 高画質'
	String get qualityTitle => '数字が大きい ＝ 高画質';

	/// ja: '1080pや2160p(4K)といった数字は、画面の縦の解像度を表す。ユーザーは「大きい数字ほど綺麗」というルールを経験的に知っており、文字が読めなくても選択できる。'
	String get qualityDesc => '1080pや2160p(4K)といった数字は、画面の縦の解像度を表す。ユーザーは「大きい数字ほど綺麗」というルールを経験的に知っており、文字が読めなくても選択できる。';

	/// ja: '↓アイコンは「手に入れる」動作'
	String get downloadTitle => '↓アイコンは「手に入れる」動作';

	/// ja: '下向きの矢印は、クラウドやサーバーから自分の端末へデータを落とす（ダウンロード）という物理的な動作を視覚化したもの。保存ボタンとしての共通認識が確立されている。'
	String get downloadDesc => '下向きの矢印は、クラウドやサーバーから自分の端末へデータを落とす（ダウンロード）という物理的な動作を視覚化したもの。保存ボタンとしての共通認識が確立されている。';

	/// ja: 'ボタンの「並び順」の重要性'
	String get locationTitle => 'ボタンの「並び順」の重要性';

	/// ja: '動画タイトル直下のメニュー行は、左から「いいね」「共有」「保存（ダウンロード）」と並ぶことが多い。この慣れ親しんだ順序が、不鮮明な文字の解読を助けている。'
	String get locationDesc => '動画タイトル直下のメニュー行は、左から「いいね」「共有」「保存（ダウンロード）」と並ぶことが多い。この慣れ親しんだ順序が、不鮮明な文字の解読を助けている。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '動画の字幕をオンにしてください',
			'quiz1.insight.title' => 'なぜ字幕設定の場所がわかった？',
			'quiz1.insight.subtitle' => 'CCは国際標準の記号',
			'quiz1.insight.ccTitle' => 'CC（Closed Captions）は世界共通',
			'quiz1.insight.ccDesc' => '「CC」または字幕アイコン（□に線が入った形）は、テレビ放送時代から続く字幕の国際標準記号。言語に関係なく「字幕」を意味すると認識されている。',
			'quiz1.insight.visibilityTitle' => 'コントロールは「隠れている」',
			'quiz1.insight.visibilityDesc' => '動画プレイヤーの多くは、視聴を邪魔しないよう操作ボタンを自動で隠す。しかし、「一度タップすれば出てくる」という隠蔽UIの作法が、現代のユーザーには共通認識として根付いている。',
			'quiz1.insight.feedbackTitle' => '下線や色変化が「ON」を伝える',
			'quiz1.insight.feedbackDesc' => 'アイコンの下に赤い線がついたり、色が明るくなったりする変化は、その機能が有効であることを示す。ラベルを読まなくても状態を瞬時に把握できる。',
			'quiz2.missionText' => '次の動画へ移動し、動画の中盤まで進めてください',
			'quiz2.insight.title' => 'なぜ迷わず操作できた？',
			'quiz2.insight.subtitle' => 'プレイヤーUIは「配置」が命',
			'quiz2.insight.skipTitle' => '右向き矢印＋棒 ＝ 次へ',
			'quiz2.insight.skipDesc' => '「▶︎▶︎|」という記号は、カセットプレイヤーの時代から「次のトラックへスキップ」を意味する。中央の再生ボタンの右隣という配置も世界標準だ。',
			'quiz2.insight.seekTitle' => '赤い線は「時間の流れ」のメタファー',
			'quiz2.insight.seekDesc' => '動画下部のプログレスバーは、左から右へ流れる時間を表す。赤い色は「現在地」を強調し、ツマミを動かすことで過去や未来へ自由にジャンプできることを直感的に伝えている。',
			'quiz2.insight.targetTitle' => '中盤（中央）は視覚的に狙いやすい',
			'quiz2.insight.targetDesc' => 'バーの中央付近を狙う操作は、物理的な長さの半分を感覚的に捉えることで、文字情報なしでも40〜60%という範囲に正確に辿り着ける。',
			'quiz3.missionText' => '動画を「2倍速」で再生してください',
			'quiz3.insight.title' => '隠し操作に気づけた？',
			'quiz3.insight.subtitle' => '長押しは「加速」のショートカット',
			'quiz3.insight.gestureTitle' => '動画エリアの長押しジェスチャー',
			'quiz3.insight.gestureDesc' => '多くの動画アプリでは、画面を長押しすると「倍速再生」が発動する。これはメニューを開く手間を省くための隠しショートカットだが、一度知ると手放せない「アハ体験」の一つだ。',
			'quiz3.insight.gearTitle' => '⚙アイコンは設定の入り口',
			'quiz3.insight.gearDesc' => '歯車のアイコンは、OSやアプリを問わず「設定」や「カスタマイズ」を意味する。文字が読めなくても、詳細な変更はここで行えるという信頼感がある。',
			'quiz3.insight.speedTitle' => '数字と「x」の組み合わせ',
			'quiz3.insight.speedDesc' => '「1.5x」「2x」という表記は、倍率を意味する国際的な数学記号。言語の壁を超えて「速さ」を表現する手段として機能している。',
			'quiz4.missionText' => '動画を最高画質に変更し、端末にダウンロードしてください',
			'quiz4.insight.title' => '最高難易度を突破！',
			'quiz4.insight.subtitle' => '記号の関連付けが鍵',
			'quiz4.insight.qualityTitle' => '数字が大きい ＝ 高画質',
			'quiz4.insight.qualityDesc' => '1080pや2160p(4K)といった数字は、画面の縦の解像度を表す。ユーザーは「大きい数字ほど綺麗」というルールを経験的に知っており、文字が読めなくても選択できる。',
			'quiz4.insight.downloadTitle' => '↓アイコンは「手に入れる」動作',
			'quiz4.insight.downloadDesc' => '下向きの矢印は、クラウドやサーバーから自分の端末へデータを落とす（ダウンロード）という物理的な動作を視覚化したもの。保存ボタンとしての共通認識が確立されている。',
			'quiz4.insight.locationTitle' => 'ボタンの「並び順」の重要性',
			'quiz4.insight.locationDesc' => '動画タイトル直下のメニュー行は、左から「いいね」「共有」「保存（ダウンロード）」と並ぶことが多い。この慣れ親しんだ順序が、不鮮明な文字の解読を助けている。',
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
			'common.downloadButton' => 'Download',
			'common.moreButton' => 'More',
			'common.subscribeButton' => 'Subscribe',
			'common.subscribers' => '人が登録',
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
			'common.quitConfirmTitle' => 'ゲームを中断しますか？',
			'common.quitConfirmMessage' => 'プレイ中のゲームを終了します。',
			'common.continueButton' => '続ける',
			'common.quitButton' => '終了する',
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
