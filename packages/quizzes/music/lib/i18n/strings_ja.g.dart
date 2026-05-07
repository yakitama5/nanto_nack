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
	late final TranslationsSongsJa songs = TranslationsSongsJa.internal(_root);
}

// Path: quiz1
class TranslationsQuiz1Ja {
	TranslationsQuiz1Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'この曲じゃないなぁ。次の曲に進めてみよう'
	String get missionText => 'この曲じゃないなぁ。次の曲に進めてみよう';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '曲を探しに戻りたい。再生画面を小さくして収納しよう'
	String get missionText => '曲を探しに戻りたい。再生画面を小さくして収納しよう';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'この曲最高！ずっとこれだけを繰り返し聴きたいな'
	String get missionText => 'この曲最高！ずっとこれだけを繰り返し聴きたいな';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なんて歌ってるんだろう？歌詞を確認してみて'
	String get missionText => 'なんて歌ってるんだろう？歌詞を確認してみて';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'MusicHub'
	String get appTitle => 'MusicHub';

	/// ja: 'Home'
	String get homeTab => 'Home';

	/// ja: 'Library'
	String get libraryTab => 'Library';

	/// ja: 'Search'
	String get searchTab => 'Search';

	/// ja: 'Like'
	String get likeButton => 'Like';

	/// ja: 'More'
	String get moreButton => 'More';

	/// ja: 'マイプレイリスト'
	String get playlistTitle => 'マイプレイリスト';

	/// ja: '{count}曲'
	String get songCount => '{count}曲';

	/// ja: '歌詞'
	String get lyrics => '歌詞';

	/// ja: '歌詞はありません'
	String get lyricsNotAvailable => '歌詞はありません';

	/// ja: 'ゲームを中断しますか？'
	String get quitConfirmTitle => 'ゲームを中断しますか？';

	/// ja: 'プレイ中のゲームを終了します。'
	String get quitConfirmMessage => 'プレイ中のゲームを終了します。';

	/// ja: '続ける'
	String get continueButton => '続ける';

	/// ja: '終了する'
	String get quitButton => '終了する';
}

// Path: songs
class TranslationsSongsJa {
	TranslationsSongsJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'Starlight Drive'
	String get song1Title => 'Starlight Drive';

	/// ja: 'The Cosmic Band'
	String get song1Artist => 'The Cosmic Band';

	/// ja: 'Driving down the starlit road Feeling free, no heavy load Neon lights and city dreams Nothing's ever what it seems Ride with me through the night Everything will be alright Starlight drive, starlight drive Keep us feeling so alive'
	String get song1Lyrics => 'Driving down the starlit road\nFeeling free, no heavy load\nNeon lights and city dreams\nNothing\'s ever what it seems\n\nRide with me through the night\nEverything will be alright\nStarlight drive, starlight drive\nKeep us feeling so alive';

	/// ja: 'Ocean Waves'
	String get song2Title => 'Ocean Waves';

	/// ja: 'Blue Horizon'
	String get song2Artist => 'Blue Horizon';

	/// ja: 'The ocean calls my name tonight Waves of blue in morning light Salt and sea and endless sky Watching seagulls as they fly Let the tide wash away All the worries of the day Ocean waves, ocean waves Find the peace that silence saves'
	String get song2Lyrics => 'The ocean calls my name tonight\nWaves of blue in morning light\nSalt and sea and endless sky\nWatching seagulls as they fly\n\nLet the tide wash away\nAll the worries of the day\nOcean waves, ocean waves\nFind the peace that silence saves';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ次の曲に進めたの？'
	String get title => 'なぜ次の曲に進めたの？';

	/// ja: 'スワイプで曲を変える感覚'
	String get subtitle => 'スワイプで曲を変える感覚';

	/// ja: 'ジャケ写の左スワイプ'
	String get swipeTitle => 'ジャケ写の左スワイプ';

	/// ja: 'アルバムアートを左にスワイプすると次の曲に進む操作は、スマホのギャラリー画像送りと同じ感覚。視覚的なカードUIが「送れる」ことを直感的に示している。'
	String get swipeDesc => 'アルバムアートを左にスワイプすると次の曲に進む操作は、スマホのギャラリー画像送りと同じ感覚。視覚的なカードUIが「送れる」ことを直感的に示している。';

	/// ja: 'スキップボタン（⏭）の意味'
	String get skipTitle => 'スキップボタン（⏭）の意味';

	/// ja: 'カセットデッキの時代から続く「▶▶|」記号は、次のトラックへのスキップを意味する。音楽プレイヤー共通の配置（再生ボタンの右隣）が世界標準となっている。'
	String get skipDesc => 'カセットデッキの時代から続く「▶▶|」記号は、次のトラックへのスキップを意味する。音楽プレイヤー共通の配置（再生ボタンの右隣）が世界標準となっている。';

	/// ja: 'ジェスチャーとボタンの二重操作'
	String get gestureTitle => 'ジェスチャーとボタンの二重操作';

	/// ja: '同じ機能（曲送り）をスワイプとタップの両方で実現することで、ユーザーは好みの操作方法を選べる。これはモバイルUXの「複数の入力経路」の原則だ。'
	String get gestureDesc => '同じ機能（曲送り）をスワイプとタップの両方で実現することで、ユーザーは好みの操作方法を選べる。これはモバイルUXの「複数の入力経路」の原則だ。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ画面を下に引けるとわかった？'
	String get title => 'なぜ画面を下に引けるとわかった？';

	/// ja: 'シートUIの「引き下げ」パターン'
	String get subtitle => 'シートUIの「引き下げ」パターン';

	/// ja: '下ドラッグで「閉じる」'
	String get dragTitle => '下ドラッグで「閉じる」';

	/// ja: '全画面から下にドラッグして画面を小さくする操作は、iOSのSpotify・Apple Musicで定着した。「引き下げ = 閉じる/収納」の概念がスマホユーザーの共通認識となっている。'
	String get dragDesc => '全画面から下にドラッグして画面を小さくする操作は、iOSのSpotify・Apple Musicで定着した。「引き下げ = 閉じる/収納」の概念がスマホユーザーの共通認識となっている。';

	/// ja: 'ミニプレイヤーで音楽を継続'
	String get miniTitle => 'ミニプレイヤーで音楽を継続';

	/// ja: '全画面を閉じても音楽が止まらず、画面下部のミニプレイヤーで再生が続く。この「ながら操作」のUXパターンは、動画・音楽アプリで広く採用されている。'
	String get miniDesc => '全画面を閉じても音楽が止まらず、画面下部のミニプレイヤーで再生が続く。この「ながら操作」のUXパターンは、動画・音楽アプリで広く採用されている。';

	/// ja: '上部のインジケーター（ノッチ）'
	String get notchTitle => '上部のインジケーター（ノッチ）';

	/// ja: '全画面シートの上部にある細い横棒（ドラッグハンドル）は、「このUIは引っ張れる」というシグナル。小さくても存在感があり、ユーザーに操作を促す。'
	String get notchDesc => '全画面シートの上部にある細い横棒（ドラッグハンドル）は、「このUIは引っ張れる」というシグナル。小さくても存在感があり、ユーザーに操作を促す。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '繰り返しボタンの意味がわかった？'
	String get title => '繰り返しボタンの意味がわかった？';

	/// ja: '3段階リピートの視覚的切り替え'
	String get subtitle => '3段階リピートの視覚的切り替え';

	/// ja: 'リピートボタンの3状態'
	String get repeatTitle => 'リピートボタンの3状態';

	/// ja: '🔁（全体リピート）→🔂（1曲リピート）→なし（オフ）の3段階が1つのボタンで切り替わる。「1」の数字バッジが付いて初めて1曲リピートとわかる記号表現だ。'
	String get repeatDesc => '🔁（全体リピート）→🔂（1曲リピート）→なし（オフ）の3段階が1つのボタンで切り替わる。「1」の数字バッジが付いて初めて1曲リピートとわかる記号表現だ。';

	/// ja: '循環矢印＋「1」の組み合わせ'
	String get iconTitle => '循環矢印＋「1」の組み合わせ';

	/// ja: '2本の矢印が循環している記号は「繰り返し」を表すが、「1」が付くと「1曲だけ」の意味に変わる。修飾子（数字）で意味を拡張するUI表現の好例だ。'
	String get iconDesc => '2本の矢印が循環している記号は「繰り返し」を表すが、「1」が付くと「1曲だけ」の意味に変わる。修飾子（数字）で意味を拡張するUI表現の好例だ。';

	/// ja: '連続タップで状態を巡回'
	String get tapTitle => '連続タップで状態を巡回';

	/// ja: '同じボタンを繰り返しタップすることで複数の状態を切り替える「サイクル操作」は、音楽プレイヤーに限らず多くのアプリで使われるUXパターンだ。'
	String get tapDesc => '同じボタンを繰り返しタップすることで複数の状態を切り替える「サイクル操作」は、音楽プレイヤーに限らず多くのアプリで使われるUXパターンだ。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '歌詞エリアをどうやって引き上げた？'
	String get title => '歌詞エリアをどうやって引き上げた？';

	/// ja: 'ドラッグシートの「引き上げ」パターン'
	String get subtitle => 'ドラッグシートの「引き上げ」パターン';

	/// ja: '下部シートを上に引き上げる'
	String get dragTitle => '下部シートを上に引き上げる';

	/// ja: '画面下部に少しだけ見えるパネルを上にスワイプして全画面に引き上げる操作は、Googleマップの場所情報シートで広く普及した。「つかんで引き上げる」物理的な感覚がそのままUIに反映されている。'
	String get dragDesc => '画面下部に少しだけ見えるパネルを上にスワイプして全画面に引き上げる操作は、Googleマップの場所情報シートで広く普及した。「つかんで引き上げる」物理的な感覚がそのままUIに反映されている。';

	/// ja: 'ドラッグハンドルが「操作できる」を伝える'
	String get handleTitle => 'ドラッグハンドルが「操作できる」を伝える';

	/// ja: 'パネル上部の細い横棒（ドラッグハンドル）は、このUIが上下にドラッグできることを示すシグナル。文字の代わりに形状でインタラクティブ性を伝えるアフォーダンスの典型例だ。'
	String get handleDesc => 'パネル上部の細い横棒（ドラッグハンドル）は、このUIが上下にドラッグできることを示すシグナル。文字の代わりに形状でインタラクティブ性を伝えるアフォーダンスの典型例だ。';

	/// ja: '歌詞表示はスクロールと組み合わせ'
	String get lyricsTitle => '歌詞表示はスクロールと組み合わせ';

	/// ja: '引き上げたシート内で歌詞がスクロールできる構造は、「一度引き上げれば好きなだけ読める」という期待に応える。シートの状態とコンテンツの状態を分離した優れた設計だ。'
	String get lyricsDesc => '引き上げたシート内で歌詞がスクロールできる構造は、「一度引き上げれば好きなだけ読める」という期待に応える。シートの状態とコンテンツの状態を分離した優れた設計だ。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'この曲じゃないなぁ。次の曲に進めてみよう',
			'quiz1.insight.title' => 'なぜ次の曲に進めたの？',
			'quiz1.insight.subtitle' => 'スワイプで曲を変える感覚',
			'quiz1.insight.swipeTitle' => 'ジャケ写の左スワイプ',
			'quiz1.insight.swipeDesc' => 'アルバムアートを左にスワイプすると次の曲に進む操作は、スマホのギャラリー画像送りと同じ感覚。視覚的なカードUIが「送れる」ことを直感的に示している。',
			'quiz1.insight.skipTitle' => 'スキップボタン（⏭）の意味',
			'quiz1.insight.skipDesc' => 'カセットデッキの時代から続く「▶▶|」記号は、次のトラックへのスキップを意味する。音楽プレイヤー共通の配置（再生ボタンの右隣）が世界標準となっている。',
			'quiz1.insight.gestureTitle' => 'ジェスチャーとボタンの二重操作',
			'quiz1.insight.gestureDesc' => '同じ機能（曲送り）をスワイプとタップの両方で実現することで、ユーザーは好みの操作方法を選べる。これはモバイルUXの「複数の入力経路」の原則だ。',
			'quiz2.missionText' => '曲を探しに戻りたい。再生画面を小さくして収納しよう',
			'quiz2.insight.title' => 'なぜ画面を下に引けるとわかった？',
			'quiz2.insight.subtitle' => 'シートUIの「引き下げ」パターン',
			'quiz2.insight.dragTitle' => '下ドラッグで「閉じる」',
			'quiz2.insight.dragDesc' => '全画面から下にドラッグして画面を小さくする操作は、iOSのSpotify・Apple Musicで定着した。「引き下げ = 閉じる/収納」の概念がスマホユーザーの共通認識となっている。',
			'quiz2.insight.miniTitle' => 'ミニプレイヤーで音楽を継続',
			'quiz2.insight.miniDesc' => '全画面を閉じても音楽が止まらず、画面下部のミニプレイヤーで再生が続く。この「ながら操作」のUXパターンは、動画・音楽アプリで広く採用されている。',
			'quiz2.insight.notchTitle' => '上部のインジケーター（ノッチ）',
			'quiz2.insight.notchDesc' => '全画面シートの上部にある細い横棒（ドラッグハンドル）は、「このUIは引っ張れる」というシグナル。小さくても存在感があり、ユーザーに操作を促す。',
			'quiz3.missionText' => 'この曲最高！ずっとこれだけを繰り返し聴きたいな',
			'quiz3.insight.title' => '繰り返しボタンの意味がわかった？',
			'quiz3.insight.subtitle' => '3段階リピートの視覚的切り替え',
			'quiz3.insight.repeatTitle' => 'リピートボタンの3状態',
			'quiz3.insight.repeatDesc' => '🔁（全体リピート）→🔂（1曲リピート）→なし（オフ）の3段階が1つのボタンで切り替わる。「1」の数字バッジが付いて初めて1曲リピートとわかる記号表現だ。',
			'quiz3.insight.iconTitle' => '循環矢印＋「1」の組み合わせ',
			'quiz3.insight.iconDesc' => '2本の矢印が循環している記号は「繰り返し」を表すが、「1」が付くと「1曲だけ」の意味に変わる。修飾子（数字）で意味を拡張するUI表現の好例だ。',
			'quiz3.insight.tapTitle' => '連続タップで状態を巡回',
			'quiz3.insight.tapDesc' => '同じボタンを繰り返しタップすることで複数の状態を切り替える「サイクル操作」は、音楽プレイヤーに限らず多くのアプリで使われるUXパターンだ。',
			'quiz4.missionText' => 'なんて歌ってるんだろう？歌詞を確認してみて',
			'quiz4.insight.title' => '歌詞エリアをどうやって引き上げた？',
			'quiz4.insight.subtitle' => 'ドラッグシートの「引き上げ」パターン',
			'quiz4.insight.dragTitle' => '下部シートを上に引き上げる',
			'quiz4.insight.dragDesc' => '画面下部に少しだけ見えるパネルを上にスワイプして全画面に引き上げる操作は、Googleマップの場所情報シートで広く普及した。「つかんで引き上げる」物理的な感覚がそのままUIに反映されている。',
			'quiz4.insight.handleTitle' => 'ドラッグハンドルが「操作できる」を伝える',
			'quiz4.insight.handleDesc' => 'パネル上部の細い横棒（ドラッグハンドル）は、このUIが上下にドラッグできることを示すシグナル。文字の代わりに形状でインタラクティブ性を伝えるアフォーダンスの典型例だ。',
			'quiz4.insight.lyricsTitle' => '歌詞表示はスクロールと組み合わせ',
			'quiz4.insight.lyricsDesc' => '引き上げたシート内で歌詞がスクロールできる構造は、「一度引き上げれば好きなだけ読める」という期待に応える。シートの状態とコンテンツの状態を分離した優れた設計だ。',
			'common.appTitle' => 'MusicHub',
			'common.homeTab' => 'Home',
			'common.libraryTab' => 'Library',
			'common.searchTab' => 'Search',
			'common.likeButton' => 'Like',
			'common.moreButton' => 'More',
			'common.playlistTitle' => 'マイプレイリスト',
			'common.songCount' => '{count}曲',
			'common.lyrics' => '歌詞',
			'common.lyricsNotAvailable' => '歌詞はありません',
			'common.quitConfirmTitle' => 'ゲームを中断しますか？',
			'common.quitConfirmMessage' => 'プレイ中のゲームを終了します。',
			'common.continueButton' => '続ける',
			'common.quitButton' => '終了する',
			'songs.song1Title' => 'Starlight Drive',
			'songs.song1Artist' => 'The Cosmic Band',
			'songs.song1Lyrics' => 'Driving down the starlit road\nFeeling free, no heavy load\nNeon lights and city dreams\nNothing\'s ever what it seems\n\nRide with me through the night\nEverything will be alright\nStarlight drive, starlight drive\nKeep us feeling so alive',
			'songs.song2Title' => 'Ocean Waves',
			'songs.song2Artist' => 'Blue Horizon',
			'songs.song2Lyrics' => 'The ocean calls my name tonight\nWaves of blue in morning light\nSalt and sea and endless sky\nWatching seagulls as they fly\n\nLet the tide wash away\nAll the worries of the day\nOcean waves, ocean waves\nFind the peace that silence saves',
			_ => null,
		};
	}
}
