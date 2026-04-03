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
	@override late final _TranslationsPlacesJa places = _TranslationsPlacesJa._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Ja implements TranslationsQuiz1En {
	_TranslationsQuiz1Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '現在地を表示してください';
	@override String get failureReason => '現在地ボタンをタップしてください';
	@override late final _TranslationsQuiz1InsightJa insight = _TranslationsQuiz1InsightJa._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Ja implements TranslationsQuiz2En {
	_TranslationsQuiz2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '目的地を検索してください';
	@override String get failureReason => '検索バーで目的地を検索してください';
	@override late final _TranslationsQuiz2InsightJa insight = _TranslationsQuiz2InsightJa._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Ja implements TranslationsQuiz3En {
	_TranslationsQuiz3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'ルート案内を開始してください';
	@override String get failureReason => 'ルート案内を開始してください';
	@override late final _TranslationsQuiz3InsightJa insight = _TranslationsQuiz3InsightJa._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Ja implements TranslationsQuiz4En {
	_TranslationsQuiz4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'この場所をお気に入りに追加してください';
	@override String get failureReason => '場所をお気に入りに追加してください';
	@override late final _TranslationsQuiz4InsightJa insight = _TranslationsQuiz4InsightJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'MapNavi';
	@override String get searchHint => 'Search here';
	@override String get currentLocation => 'Current location';
	@override String get directions => 'Directions';
	@override String get startNavigation => 'Start';
	@override String get savePlace => 'Save';
	@override String get savedPlaces => 'Saved places';
	@override String get drive => 'Drive';
	@override String get walk => 'Walk';
	@override String get transit => 'Transit';
	@override String get bike => 'Bike';
	@override String get nearby => 'Nearby';
	@override String get explore => 'Explore';
	@override String get go => 'Go';
	@override String get min => 'min';
	@override String get km => 'km';
}

// Path: places
class _TranslationsPlacesJa implements TranslationsPlacesEn {
	_TranslationsPlacesJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get p1Name => 'City Hall';
	@override String get p1Address => '1-1 Central Ave';
	@override String get p2Name => 'Grand Park';
	@override String get p2Address => '2-5 Park Blvd';
	@override String get p3Name => 'Main Station';
	@override String get p3Address => '3-10 Station St';
	@override String get p4Name => 'Shopping Mall';
	@override String get p4Address => '4-2 Commerce Rd';
	@override String get p5Name => 'University';
	@override String get p5Address => '5-8 Campus Dr';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightJa implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ現在地ボタンがわかった？';
	@override String get subtitle => '位置情報アイコンは世界共通の「現在地」の記号';
	@override String get locationTitle => '📍 ピンアイコンは「ここにいる」を表す';
	@override String get locationDesc => '実際の地図ピンを模したアイコンは、デジタル地図で「現在地」を意味する世界標準の記号として定着している。';
	@override String get compassTitle => 'コンパスが方角を示す';
	@override String get compassDesc => '画面端のコンパスアイコンをタップすると北向きに戻る。向きの基準が直感的にわかるUIパターン。';
	@override String get zoomTitle => '地図の拡大・縮小はピンチで操作';
	@override String get zoomDesc => '2本指でのピンチイン/アウトは、スマートフォン地図アプリの標準ジェスチャー。言語を超えて世界中で使われている。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightJa implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ検索バーを見つけられた？';
	@override String get subtitle => '🔍 虫眼鏡は「探す」の万国共通語';
	@override String get searchTitle => '虫眼鏡アイコンは「検索」を意味する';
	@override String get searchDesc => '虫眼鏡（マグニファイヤー）は、GoogleからSNSまであらゆるアプリで「検索」を意味するアイコンとして統一されている。';
	@override String get suggestTitle => '検索候補が操作を助ける';
	@override String get suggestDesc => '入力中に候補リストが表示されるサジェスト機能は、地図アプリで標準的な操作パターン。';
	@override String get pinTitle => '結果選択でマップにピンが立つ';
	@override String get pinDesc => '検索結果をタップするとマップ上にピンが表示される。目的地の視覚的なフィードバックパターン。';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightJa implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜルート案内ボタンを見つけられた？';
	@override String get subtitle => '↗ 矢印は「案内する」を表す記号';
	@override String get routeTitle => '矢印アイコンがナビゲーションを表す';
	@override String get routeDesc => '右上を向く矢印アイコンは、Google マップ・Apple マップ共通のナビゲーション開始ボタンとして定着している。';
	@override String get transportTitle => '交通手段の選択が並ぶ';
	@override String get transportDesc => '車・電車・徒歩・自転車のアイコンが横並びになるパターンは、主要地図アプリで共通のUI。';
	@override String get stepTitle => 'ターンバイターン案内が直感的';
	@override String get stepDesc => '次の交差点での左右の指示が大きく表示されるターンバイターン案内は、カーナビ時代から続く直感的なUI。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightJa implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜお気に入りボタンを見つけられた？';
	@override String get subtitle => '⭐ 星マークは「お気に入り」の万国共通語';
	@override String get starTitle => '星マークはお気に入りの国際標準記号';
	@override String get starDesc => '星（★）はブックマーク・お気に入り・評価を意味するアイコンとして、地図・レビュー・SNSで統一されている。';
	@override String get savedTitle => '保存済み一覧でいつでも確認';
	@override String get savedDesc => 'お気に入りに追加した場所は「保存済み」リストで確認できる。コンテンツ管理UIの基本パターン。';
	@override String get colorTitle => '色変化が登録完了を伝える';
	@override String get colorDesc => 'グレーから黄色に変わる星の色変化は、「未登録→登録済み」の状態遷移を視覚的に伝えるUIパターン。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '現在地を表示してください',
			'quiz1.failureReason' => '現在地ボタンをタップしてください',
			'quiz1.insight.title' => 'なぜ現在地ボタンがわかった？',
			'quiz1.insight.subtitle' => '位置情報アイコンは世界共通の「現在地」の記号',
			'quiz1.insight.locationTitle' => '📍 ピンアイコンは「ここにいる」を表す',
			'quiz1.insight.locationDesc' => '実際の地図ピンを模したアイコンは、デジタル地図で「現在地」を意味する世界標準の記号として定着している。',
			'quiz1.insight.compassTitle' => 'コンパスが方角を示す',
			'quiz1.insight.compassDesc' => '画面端のコンパスアイコンをタップすると北向きに戻る。向きの基準が直感的にわかるUIパターン。',
			'quiz1.insight.zoomTitle' => '地図の拡大・縮小はピンチで操作',
			'quiz1.insight.zoomDesc' => '2本指でのピンチイン/アウトは、スマートフォン地図アプリの標準ジェスチャー。言語を超えて世界中で使われている。',
			'quiz2.missionText' => '目的地を検索してください',
			'quiz2.failureReason' => '検索バーで目的地を検索してください',
			'quiz2.insight.title' => 'なぜ検索バーを見つけられた？',
			'quiz2.insight.subtitle' => '🔍 虫眼鏡は「探す」の万国共通語',
			'quiz2.insight.searchTitle' => '虫眼鏡アイコンは「検索」を意味する',
			'quiz2.insight.searchDesc' => '虫眼鏡（マグニファイヤー）は、GoogleからSNSまであらゆるアプリで「検索」を意味するアイコンとして統一されている。',
			'quiz2.insight.suggestTitle' => '検索候補が操作を助ける',
			'quiz2.insight.suggestDesc' => '入力中に候補リストが表示されるサジェスト機能は、地図アプリで標準的な操作パターン。',
			'quiz2.insight.pinTitle' => '結果選択でマップにピンが立つ',
			'quiz2.insight.pinDesc' => '検索結果をタップするとマップ上にピンが表示される。目的地の視覚的なフィードバックパターン。',
			'quiz3.missionText' => 'ルート案内を開始してください',
			'quiz3.failureReason' => 'ルート案内を開始してください',
			'quiz3.insight.title' => 'なぜルート案内ボタンを見つけられた？',
			'quiz3.insight.subtitle' => '↗ 矢印は「案内する」を表す記号',
			'quiz3.insight.routeTitle' => '矢印アイコンがナビゲーションを表す',
			'quiz3.insight.routeDesc' => '右上を向く矢印アイコンは、Google マップ・Apple マップ共通のナビゲーション開始ボタンとして定着している。',
			'quiz3.insight.transportTitle' => '交通手段の選択が並ぶ',
			'quiz3.insight.transportDesc' => '車・電車・徒歩・自転車のアイコンが横並びになるパターンは、主要地図アプリで共通のUI。',
			'quiz3.insight.stepTitle' => 'ターンバイターン案内が直感的',
			'quiz3.insight.stepDesc' => '次の交差点での左右の指示が大きく表示されるターンバイターン案内は、カーナビ時代から続く直感的なUI。',
			'quiz4.missionText' => 'この場所をお気に入りに追加してください',
			'quiz4.failureReason' => '場所をお気に入りに追加してください',
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
