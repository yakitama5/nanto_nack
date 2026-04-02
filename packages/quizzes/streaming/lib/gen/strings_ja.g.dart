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
	@override late final _TranslationsQuiz1Ja quiz1 = _TranslationsQuiz1Ja._(_root);
	@override late final _TranslationsQuiz2Ja quiz2 = _TranslationsQuiz2Ja._(_root);
	@override late final _TranslationsQuiz3Ja quiz3 = _TranslationsQuiz3Ja._(_root);
	@override late final _TranslationsQuiz4Ja quiz4 = _TranslationsQuiz4Ja._(_root);
	@override late final _TranslationsCommonJa common = _TranslationsCommonJa._(_root);
	@override late final _TranslationsVideosJa videos = _TranslationsVideosJa._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Ja implements TranslationsQuiz1En {
	_TranslationsQuiz1Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '動画の字幕をオンにしてください';
	@override late final _TranslationsQuiz1InsightJa insight = _TranslationsQuiz1InsightJa._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Ja implements TranslationsQuiz2En {
	_TranslationsQuiz2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '次の動画へ移動し、動画の中盤まで進めてください';
	@override late final _TranslationsQuiz2InsightJa insight = _TranslationsQuiz2InsightJa._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Ja implements TranslationsQuiz3En {
	_TranslationsQuiz3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '動画を「2倍速」で再生してください';
	@override late final _TranslationsQuiz3InsightJa insight = _TranslationsQuiz3InsightJa._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Ja implements TranslationsQuiz4En {
	_TranslationsQuiz4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '動画を最高画質に変更し、端末にダウンロードしてください';
	@override late final _TranslationsQuiz4InsightJa insight = _TranslationsQuiz4InsightJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'StreamHub';
	@override String get homeTab => 'Home';
	@override String get exploreTab => 'Explore';
	@override String get shortsTab => 'Shorts';
	@override String get subsTab => 'Subscriptions';
	@override String get youTab => 'You';
	@override String get likeButton => 'Like';
	@override String get dislikeButton => 'Dislike';
	@override String get shareButton => 'Share';
	@override String get saveButton => 'Save';
	@override String get downloadButton => 'Download';
	@override String get moreButton => 'More';
	@override String get subscribeButton => 'Subscribe';
	@override String get views => '回再生';
	@override String get subtitles => 'Subtitles';
	@override String get quality => 'Quality';
	@override String get playbackSpeed => 'Playback speed';
	@override String get reportButton => 'Report';
	@override String get subtitlesOff => 'Off';
	@override String get subtitlesOn => 'On (Auto)';
	@override String get shareTitle => 'Share to';
	@override String get linkCopied => 'Link copied';
	@override String get savedToList => 'Saved to playlist';
}

// Path: videos
class _TranslationsVideosJa implements TranslationsVideosEn {
	_TranslationsVideosJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get v1Title => 'Amazing Nature Documentary 4K';
	@override String get v1Channel => 'NatureWorld';
	@override String get v2Title => 'Learn Programming in 10 Minutes';
	@override String get v2Channel => 'CodeMaster';
	@override String get v3Title => 'Top 10 Travel Destinations 2026';
	@override String get v3Channel => 'TravelVlog';
	@override String get v4Title => 'Cooking Easy Pasta Recipe';
	@override String get v4Channel => 'ChefKitchen';
	@override String get v5Title => 'Morning Yoga for Beginners';
	@override String get v5Channel => 'YogaLife';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightJa implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ字幕設定の場所がわかった？';
	@override String get subtitle => 'CCは国際標準の記号';
	@override String get ccTitle => 'CC（Closed Captions）は世界共通';
	@override String get ccDesc => '「CC」または字幕アイコン（□に線が入った形）は、テレビ放送時代から続く字幕の国際標準記号。言語に関係なく「字幕」を意味すると認識されている。';
	@override String get visibilityTitle => 'コントロールは「隠れている」';
	@override String get visibilityDesc => '動画プレイヤーの多くは、視聴を邪魔しないよう操作ボタンを自動で隠す。しかし、「一度タップすれば出てくる」という隠蔽UIの作法が、現代のユーザーには共通認識として根付いている。';
	@override String get feedbackTitle => '下線や色変化が「ON」を伝える';
	@override String get feedbackDesc => 'アイコンの下に赤い線がついたり、色が明るくなったりする変化は、その機能が有効であることを示す。ラベルを読まなくても状態を瞬時に把握できる。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightJa implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ迷わず操作できた？';
	@override String get subtitle => 'プレイヤーUIは「配置」が命';
	@override String get skipTitle => '右向き矢印＋棒 ＝ 次へ';
	@override String get skipDesc => '「▶︎▶︎|」という記号は、カセットプレイヤーの時代から「次のトラックへスキップ」を意味する。中央の再生ボタンの右隣という配置も世界標準だ。';
	@override String get seekTitle => '赤い線は「時間の流れ」のメタファー';
	@override String get seekDesc => '動画下部のプログレスバーは、左から右へ流れる時間を表す。赤い色は「現在地」を強調し、ツマミを動かすことで過去や未来へ自由にジャンプできることを直感的に伝えている。';
	@override String get targetTitle => '中盤（中央）は視覚的に狙いやすい';
	@override String get targetDesc => 'バーの中央付近を狙う操作は、物理的な長さの半分を感覚的に捉えることで、文字情報なしでも40〜60%という範囲に正確に辿り着ける。';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightJa implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '隠し操作に気づけた？';
	@override String get subtitle => '長押しは「加速」のショートカット';
	@override String get gestureTitle => '動画エリアの長押しジェスチャー';
	@override String get gestureDesc => '多くの動画アプリでは、画面を長押しすると「倍速再生」が発動する。これはメニューを開く手間を省くための隠しショートカットだが、一度知ると手放せない「アハ体験」の一つだ。';
	@override String get gearTitle => '⚙アイコンは設定の入り口';
	@override String get gearDesc => '歯車のアイコンは、OSやアプリを問わず「設定」や「カスタマイズ」を意味する。文字が読めなくても、詳細な変更はここで行えるという信頼感がある。';
	@override String get speedTitle => '数字と「x」の組み合わせ';
	@override String get speedDesc => '「1.5x」「2x」という表記は、倍率を意味する国際的な数学記号。言語の壁を超えて「速さ」を表現する手段として機能している。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightJa implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '最高難易度を突破！';
	@override String get subtitle => '記号の関連付けが鍵';
	@override String get qualityTitle => '数字が大きい ＝ 高画質';
	@override String get qualityDesc => '1080pや2160p(4K)といった数字は、画面の縦の解像度を表す。ユーザーは「大きい数字ほど綺麗」というルールを経験的に知っており、文字が読めなくても選択できる。';
	@override String get downloadTitle => '↓アイコンは「手に入れる」動作';
	@override String get downloadDesc => '下向きの矢印は、クラウドやサーバーから自分の端末へデータを落とす（ダウンロード）という物理的な動作を視覚化したもの。保存ボタンとしての共通認識が確立されている。';
	@override String get locationTitle => 'ボタンの「並び順」の重要性';
	@override String get locationDesc => '動画タイトル直下のメニュー行は、左から「いいね」「共有」「保存（ダウンロード）」と並ぶことが多い。この慣れ親しんだ順序が、不鮮明な文字の解読を助けている。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
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
