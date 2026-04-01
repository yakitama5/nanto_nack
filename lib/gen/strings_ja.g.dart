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
	@override String get missionText => '動画を再生してください';
	@override late final _TranslationsQuiz1InsightJa insight = _TranslationsQuiz1InsightJa._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Ja implements TranslationsQuiz2En {
	_TranslationsQuiz2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '動画をシェアしてください';
	@override late final _TranslationsQuiz2InsightJa insight = _TranslationsQuiz2InsightJa._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Ja implements TranslationsQuiz3En {
	_TranslationsQuiz3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '動画をお気に入りに追加してください';
	@override late final _TranslationsQuiz3InsightJa insight = _TranslationsQuiz3InsightJa._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Ja implements TranslationsQuiz4En {
	_TranslationsQuiz4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '動画の字幕をオンにしてください';
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
	@override String get moreButton => 'More';
	@override String get subscribeButton => 'Subscribe';
	@override String get views => '{count} views';
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
	@override String get title => 'なぜ再生ボタンがわかった？';
	@override String get subtitle => '▶ は世界共通の「再生」の記号';
	@override String get playTitle => '▶ マークは60年以上前から変わらない';
	@override String get playDesc => 'テープレコーダー時代（1960年代）から使われてきた▶（右向き三角）は、デジタル化されても「再生」を意味する記号として世界中で通用している。文字を読まなくてもわかる、最も普遍的なUIアイコンの一つだ。';
	@override String get thumbnailTitle => 'サムネイルが内容を予告する';
	@override String get thumbnailDesc => '動画の代表画面を事前表示するサムネイルは、文字説明がなくても動画の内容を伝える。視覚情報は言語を超えてコンテンツを伝達できる。';
	@override String get progressTitle => 'プログレスバーが残り時間を見せる';
	@override String get progressDesc => '動画下部の細いバーは「ここまで見た/ここから見ていない」を直感的に示す。シークバーのUIパターンは音楽・動画プレイヤーで世界標準となっており、言語不要で操作できる。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightJa implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜシェアボタンが見つかった？';
	@override String get subtitle => 'シェアアイコンは「つながり」を形にした記号';
	@override String get shareTitle => 'シェアアイコンの形が意味を語る';
	@override String get shareDesc => '3つの点を2本の線でつなぐシェアアイコン（Androidスタイル）や矢印が上を向くアイコン（iOSスタイル）は、「外へ送り出す」という動作を視覚化している。世界中のアプリで統一されたこの形は、言語に依存しない意味記号だ。';
	@override String get actionTitle => 'アクションボタン群が機能を並べる';
	@override String get actionDesc => 'いいね・シェア・保存・…（その他）が横並びになるボタン行は、YouTube・TikTok・Twitter など主要SNSで採用されている標準UIパターン。見慣れた配置は、ラベルを読まなくても機能を類推させる。';
	@override String get modalTitle => 'シェアシートが選択肢を提示する';
	@override String get modalDesc => 'タップで下から出てくるシェアシートはiOS/Androidの標準コンポーネント。並んだアプリアイコンから「どこへシェアするか」を選ぶ体験は、OS横断で統一されており、言語を超えて操作できる。';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightJa implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ保存ボタンがわかった？';
	@override String get subtitle => 'フラグ記号は「あとで見る」の万国共通語';
	@override String get saveTitle => 'フラグ・ブックマーク系アイコンは「保存」の記号';
	@override String get saveDesc => '旗・リボン・＋アイコンなど「お気に入り登録」や「あとで見る」に使われるアイコン群は、形が違っても「これを保持する」という意味で一貫している。繰り返し使われた結果、形そのものが意味を持つようになった。';
	@override String get feedbackTitle => '色変化がアクション完了を伝える';
	@override String get feedbackDesc => 'グレーから赤・黄・青などに変わるアイコンの色変化は、「未登録→登録済み」の状態遷移をビジュアルで伝える。状態の変化を色で示すUIパターンはSNS全般で共通しており、ラベルを読まなくても結果がわかる。';
	@override String get listTitle => '「あとで見るリスト」UIが動機を生む';
	@override String get listDesc => '視聴したいコンテンツを貯めておくリスト機能は、Netflix・YouTube・Spotifyで共通の仕組み。「あとで」を可能にするUIはコンテンツ消費行動の基本パターンとして定着している。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightJa implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ字幕設定の場所がわかった？';
	@override String get subtitle => '設定は「⋮」か「⚙」の奥にある';
	@override String get menuTitle => '⋮（その他）メニューが隠し機能の入り口';
	@override String get menuDesc => '3つの点（⋮）や3本線（≡）のアイコンは「まだ表示していない機能がある」を示す記号として定着している。詳細設定・字幕・品質変更などの発展的機能はここに隠されることが多く、ユーザーは経験的に学習している。';
	@override String get ccTitle => 'CC（Closed Captions）は国際標準の記号';
	@override String get ccDesc => '「CC」または字幕アイコン（□に線が入った形）は、テレビ放送時代から続く字幕の国際標準記号。言語に関係なく「字幕」を意味すると認識されている。';
	@override String get settingsTitle => '設定画面のトグルUIは直感的';
	@override String get settingsDesc => 'オン/オフを切り替えるトグルスイッチは、物理スイッチを模した直感的なUI。色（グレー→カラー）と位置（左→右）の2つの手がかりで状態を伝えるため、言語を読まなくても操作できる。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
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
			'common.views' => '{count} views',
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
