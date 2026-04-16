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
	late final TranslationsPlacesJa places = TranslationsPlacesJa.internal(_root);
}

// Path: quiz1
class TranslationsQuiz1Ja {
	TranslationsQuiz1Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '現在地を表示してください'
	String get missionText => '現在地を表示してください';

	/// ja: '現在地ボタンをタップしてください'
	String get failureReason => '現在地ボタンをタップしてください';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '登録した学校の情報を表示してください'
	String get missionText => '登録した学校の情報を表示してください';

	/// ja: '学校のアイコンがついた場所をタップしてください'
	String get failureReason => '学校のアイコンがついた場所をタップしてください';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '公園まで電車でルートを案内してください'
	String get missionText => '公園まで電車でルートを案内してください';

	/// ja: '公園を選んで電車でルートを案内してください'
	String get failureReason => '公園を選んで電車でルートを案内してください';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '駅をお気に入りに追加してください'
	String get missionText => '駅をお気に入りに追加してください';

	/// ja: '電車のアイコンの場所をタップしてお気に入りに追加してください'
	String get failureReason => '電車のアイコンの場所をタップしてお気に入りに追加してください';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'MapNavi'
	String get appTitle => 'MapNavi';

	/// ja: 'Search here'
	String get searchHint => 'Search here';

	/// ja: 'Current location'
	String get currentLocation => 'Current location';

	/// ja: 'Directions'
	String get directions => 'Directions';

	/// ja: 'Start'
	String get startNavigation => 'Start';

	/// ja: 'Save'
	String get savePlace => 'Save';

	/// ja: 'Saved places'
	String get savedPlaces => 'Saved places';

	/// ja: 'Drive'
	String get drive => 'Drive';

	/// ja: 'Walk'
	String get walk => 'Walk';

	/// ja: 'Transit'
	String get transit => 'Transit';

	/// ja: 'Bike'
	String get bike => 'Bike';

	/// ja: 'Nearby'
	String get nearby => 'Nearby';

	/// ja: 'Explore'
	String get explore => 'Explore';

	/// ja: 'Go'
	String get go => 'Go';

	/// ja: 'min'
	String get min => 'min';

	/// ja: 'km'
	String get km => 'km';

	/// ja: 'ゲームを中断しますか？'
	String get confirmQuitTitle => 'ゲームを中断しますか？';

	/// ja: 'プレイ中のゲームを終了します。'
	String get confirmQuitMessage => 'プレイ中のゲームを終了します。';

	/// ja: '続ける'
	String get continueGame => '続ける';

	/// ja: '終了する'
	String get quitGame => '終了する';
}

// Path: places
class TranslationsPlacesJa {
	TranslationsPlacesJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'City Hall'
	String get p1Name => 'City Hall';

	/// ja: '1-1 Central Ave'
	String get p1Address => '1-1 Central Ave';

	/// ja: 'Grand Park'
	String get p2Name => 'Grand Park';

	/// ja: '2-5 Park Blvd'
	String get p2Address => '2-5 Park Blvd';

	/// ja: 'Main Station'
	String get p3Name => 'Main Station';

	/// ja: '3-10 Station St'
	String get p3Address => '3-10 Station St';

	/// ja: 'Shopping Mall'
	String get p4Name => 'Shopping Mall';

	/// ja: '4-2 Commerce Rd'
	String get p4Address => '4-2 Commerce Rd';

	/// ja: 'University'
	String get p5Name => 'University';

	/// ja: '5-8 Campus Dr'
	String get p5Address => '5-8 Campus Dr';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ現在地ボタンがわかった？'
	String get title => 'なぜ現在地ボタンがわかった？';

	/// ja: '位置情報アイコンは世界共通の「現在地」の記号'
	String get subtitle => '位置情報アイコンは世界共通の「現在地」の記号';

	/// ja: 'ピンアイコンは「ここにいる」を表す'
	String get locationTitle => 'ピンアイコンは「ここにいる」を表す';

	/// ja: '実際の地図ピンを模したアイコンは、デジタル地図で「現在地」を意味する世界標準の記号として定着している。'
	String get locationDesc => '実際の地図ピンを模したアイコンは、デジタル地図で「現在地」を意味する世界標準の記号として定着している。';

	/// ja: 'コンパスが方角を示す'
	String get compassTitle => 'コンパスが方角を示す';

	/// ja: '画面端のコンパスアイコンをタップすると北向きに戻る。向きの基準が直感的にわかるUIパターン。'
	String get compassDesc => '画面端のコンパスアイコンをタップすると北向きに戻る。向きの基準が直感的にわかるUIパターン。';

	/// ja: '地図の拡大・縮小はピンチで操作'
	String get zoomTitle => '地図の拡大・縮小はピンチで操作';

	/// ja: '2本指でのピンチイン/アウトは、スマートフォン地図アプリの標準ジェスチャー。言語を超えて世界中で使われている。'
	String get zoomDesc => '2本指でのピンチイン/アウトは、スマートフォン地図アプリの標準ジェスチャー。言語を超えて世界中で使われている。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ学校アイコンに気づけた？'
	String get title => 'なぜ学校アイコンに気づけた？';

	/// ja: '🏫 アイコンが場所の「種類」を伝える'
	String get subtitle => '🏫 アイコンが場所の「種類」を伝える';

	/// ja: 'アイコンが施設の種類を示す'
	String get iconTitle => 'アイコンが施設の種類を示す';

	/// ja: '地図アプリでは、学校・病院・駅など施設の種類をアイコンで直感的に区別できる。言語がわからなくても識別できるUIデザイン。'
	String get iconDesc => '地図アプリでは、学校・病院・駅など施設の種類をアイコンで直感的に区別できる。言語がわからなくても識別できるUIデザイン。';

	/// ja: 'タップで詳細情報を表示'
	String get tapTitle => 'タップで詳細情報を表示';

	/// ja: 'ピンやアイコンをタップすると、その場所の詳細情報（名前・住所等）が下部パネルに表示される。地図アプリの基本的な操作パターン。'
	String get tapDesc => 'ピンやアイコンをタップすると、その場所の詳細情報（名前・住所等）が下部パネルに表示される。地図アプリの基本的な操作パターン。';

	/// ja: '登録済み情報がすぐ確認できる'
	String get infoTitle => '登録済み情報がすぐ確認できる';

	/// ja: '保存した場所はマップ上で常にアイコン表示され、タップするだけで詳細を確認できる。ブックマーク機能の直感的なUI。'
	String get infoDesc => '保存した場所はマップ上で常にアイコン表示され、タップするだけで詳細を確認できる。ブックマーク機能の直感的なUI。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ目的地と交通手段を選べた？'
	String get title => 'なぜ目的地と交通手段を選べた？';

	/// ja: '🗺️ 地図アプリのルート検索3ステップ'
	String get subtitle => '🗺️ 地図アプリのルート検索3ステップ';

	/// ja: 'ピンをタップして目的地を選ぶ'
	String get destinationTitle => 'ピンをタップして目的地を選ぶ';

	/// ja: '地図上のアイコンをタップすると場所の詳細が表示され、そのままルート検索に進める。地図アプリの基本的な操作フロー。'
	String get destinationDesc => '地図上のアイコンをタップすると場所の詳細が表示され、そのままルート検索に進める。地図アプリの基本的な操作フロー。';

	/// ja: '交通手段アイコンの並びは世界共通'
	String get transportTitle => '交通手段アイコンの並びは世界共通';

	/// ja: '車・徒歩・電車・自転車の順で並ぶアイコンは、主要地図アプリで定着した標準的なUI。'
	String get transportDesc => '車・徒歩・電車・自転車の順で並ぶアイコンは、主要地図アプリで定着した標準的なUI。';

	/// ja: '「開始」で案内スタート'
	String get startTitle => '「開始」で案内スタート';

	/// ja: '目的地と交通手段を選んで開始ボタンを押すだけ。シンプルな3ステップで案内を開始できる。'
	String get startDesc => '目的地と交通手段を選んで開始ボタンを押すだけ。シンプルな3ステップで案内を開始できる。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜお気に入りボタンを見つけられた？'
	String get title => 'なぜお気に入りボタンを見つけられた？';

	/// ja: '⭐ 星マークは「お気に入り」の万国共通語'
	String get subtitle => '⭐ 星マークは「お気に入り」の万国共通語';

	/// ja: '星マークはお気に入りの国際標準記号'
	String get starTitle => '星マークはお気に入りの国際標準記号';

	/// ja: '星（★）はブックマーク・お気に入り・評価を意味するアイコンとして、地図・レビュー・SNSで統一されている。'
	String get starDesc => '星（★）はブックマーク・お気に入り・評価を意味するアイコンとして、地図・レビュー・SNSで統一されている。';

	/// ja: '保存済み一覧でいつでも確認'
	String get savedTitle => '保存済み一覧でいつでも確認';

	/// ja: 'お気に入りに追加した場所は「保存済み」リストで確認できる。コンテンツ管理UIの基本パターン。'
	String get savedDesc => 'お気に入りに追加した場所は「保存済み」リストで確認できる。コンテンツ管理UIの基本パターン。';

	/// ja: '色変化が登録完了を伝える'
	String get colorTitle => '色変化が登録完了を伝える';

	/// ja: 'グレーから黄色に変わる星の色変化は、「未登録→登録済み」の状態遷移を視覚的に伝えるUIパターン。'
	String get colorDesc => 'グレーから黄色に変わる星の色変化は、「未登録→登録済み」の状態遷移を視覚的に伝えるUIパターン。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '現在地を表示してください',
			'quiz1.failureReason' => '現在地ボタンをタップしてください',
			'quiz1.insight.title' => 'なぜ現在地ボタンがわかった？',
			'quiz1.insight.subtitle' => '位置情報アイコンは世界共通の「現在地」の記号',
			'quiz1.insight.locationTitle' => 'ピンアイコンは「ここにいる」を表す',
			'quiz1.insight.locationDesc' => '実際の地図ピンを模したアイコンは、デジタル地図で「現在地」を意味する世界標準の記号として定着している。',
			'quiz1.insight.compassTitle' => 'コンパスが方角を示す',
			'quiz1.insight.compassDesc' => '画面端のコンパスアイコンをタップすると北向きに戻る。向きの基準が直感的にわかるUIパターン。',
			'quiz1.insight.zoomTitle' => '地図の拡大・縮小はピンチで操作',
			'quiz1.insight.zoomDesc' => '2本指でのピンチイン/アウトは、スマートフォン地図アプリの標準ジェスチャー。言語を超えて世界中で使われている。',
			'quiz2.missionText' => '登録した学校の情報を表示してください',
			'quiz2.failureReason' => '学校のアイコンがついた場所をタップしてください',
			'quiz2.insight.title' => 'なぜ学校アイコンに気づけた？',
			'quiz2.insight.subtitle' => '🏫 アイコンが場所の「種類」を伝える',
			'quiz2.insight.iconTitle' => 'アイコンが施設の種類を示す',
			'quiz2.insight.iconDesc' => '地図アプリでは、学校・病院・駅など施設の種類をアイコンで直感的に区別できる。言語がわからなくても識別できるUIデザイン。',
			'quiz2.insight.tapTitle' => 'タップで詳細情報を表示',
			'quiz2.insight.tapDesc' => 'ピンやアイコンをタップすると、その場所の詳細情報（名前・住所等）が下部パネルに表示される。地図アプリの基本的な操作パターン。',
			'quiz2.insight.infoTitle' => '登録済み情報がすぐ確認できる',
			'quiz2.insight.infoDesc' => '保存した場所はマップ上で常にアイコン表示され、タップするだけで詳細を確認できる。ブックマーク機能の直感的なUI。',
			'quiz3.missionText' => '公園まで電車でルートを案内してください',
			'quiz3.failureReason' => '公園を選んで電車でルートを案内してください',
			'quiz3.insight.title' => 'なぜ目的地と交通手段を選べた？',
			'quiz3.insight.subtitle' => '🗺️ 地図アプリのルート検索3ステップ',
			'quiz3.insight.destinationTitle' => 'ピンをタップして目的地を選ぶ',
			'quiz3.insight.destinationDesc' => '地図上のアイコンをタップすると場所の詳細が表示され、そのままルート検索に進める。地図アプリの基本的な操作フロー。',
			'quiz3.insight.transportTitle' => '交通手段アイコンの並びは世界共通',
			'quiz3.insight.transportDesc' => '車・徒歩・電車・自転車の順で並ぶアイコンは、主要地図アプリで定着した標準的なUI。',
			'quiz3.insight.startTitle' => '「開始」で案内スタート',
			'quiz3.insight.startDesc' => '目的地と交通手段を選んで開始ボタンを押すだけ。シンプルな3ステップで案内を開始できる。',
			'quiz4.missionText' => '駅をお気に入りに追加してください',
			'quiz4.failureReason' => '電車のアイコンの場所をタップしてお気に入りに追加してください',
			'quiz4.insight.title' => 'なぜお気に入りボタンを見つけられた？',
			'quiz4.insight.subtitle' => '⭐ 星マークは「お気に入り」の万国共通語',
			'quiz4.insight.starTitle' => '星マークはお気に入りの国際標準記号',
			'quiz4.insight.starDesc' => '星（★）はブックマーク・お気に入り・評価を意味するアイコンとして、地図・レビュー・SNSで統一されている。',
			'quiz4.insight.savedTitle' => '保存済み一覧でいつでも確認',
			'quiz4.insight.savedDesc' => 'お気に入りに追加した場所は「保存済み」リストで確認できる。コンテンツ管理UIの基本パターン。',
			'quiz4.insight.colorTitle' => '色変化が登録完了を伝える',
			'quiz4.insight.colorDesc' => 'グレーから黄色に変わる星の色変化は、「未登録→登録済み」の状態遷移を視覚的に伝えるUIパターン。',
			'common.appTitle' => 'MapNavi',
			'common.searchHint' => 'Search here',
			'common.currentLocation' => 'Current location',
			'common.directions' => 'Directions',
			'common.startNavigation' => 'Start',
			'common.savePlace' => 'Save',
			'common.savedPlaces' => 'Saved places',
			'common.drive' => 'Drive',
			'common.walk' => 'Walk',
			'common.transit' => 'Transit',
			'common.bike' => 'Bike',
			'common.nearby' => 'Nearby',
			'common.explore' => 'Explore',
			'common.go' => 'Go',
			'common.min' => 'min',
			'common.km' => 'km',
			'common.confirmQuitTitle' => 'ゲームを中断しますか？',
			'common.confirmQuitMessage' => 'プレイ中のゲームを終了します。',
			'common.continueGame' => '続ける',
			'common.quitGame' => '終了する',
			'places.p1Name' => 'City Hall',
			'places.p1Address' => '1-1 Central Ave',
			'places.p2Name' => 'Grand Park',
			'places.p2Address' => '2-5 Park Blvd',
			'places.p3Name' => 'Main Station',
			'places.p3Address' => '3-10 Station St',
			'places.p4Name' => 'Shopping Mall',
			'places.p4Address' => '4-2 Commerce Rd',
			'places.p5Name' => 'University',
			'places.p5Address' => '5-8 Campus Dr',
			_ => null,
		};
	}
}
