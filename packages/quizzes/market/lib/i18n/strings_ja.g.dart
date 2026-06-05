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

	/// ja: '裏側に傷がないか気になるな。最後の写真までスワイプして確認しよう'
	String get missionText => '裏側に傷がないか気になるな。最後の写真までスワイプして確認しよう';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '後で比較したいから、とりあえず『いいね』して保存しておこう'
	String get missionText => '後で比較したいから、とりあえず『いいね』して保存しておこう';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'この出品者、信頼できる人かな？プロフィールと評価を見に行こう'
	String get missionText => 'この出品者、信頼できる人かな？プロフィールと評価を見に行こう';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'よし、これに決めた！購入手続きに進もう'
	String get missionText => 'よし、これに決めた！購入手続きに進もう';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'フリマ'
	String get appTitle => 'フリマ';

	/// ja: 'ヴィンテージデニムジャケット'
	String get itemTitle => 'ヴィンテージデニムジャケット';

	/// ja: '¥3,800'
	String get itemPrice => '¥3,800';

	/// ja: '古着屋で購入した1990年代のデニムジャケット。若干の使用感はありますが、目立った傷・汚れなし。サイズはMです。'
	String get itemDescription => '古着屋で購入した1990年代のデニムジャケット。若干の使用感はありますが、目立った傷・汚れなし。サイズはMです。';

	/// ja: 'ビンテージ愛好家'
	String get sellerName => 'ビンテージ愛好家';

	/// ja: '購入手続きへ'
	String get buyButton => '購入手続きへ';

	/// ja: '表'
	String get imageLabel1 => '表';

	/// ja: '横'
	String get imageLabel2 => '横';

	/// ja: '裏'
	String get imageLabel3 => '裏';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜスワイプで確認できた？'
	String get title => 'なぜスワイプで確認できた？';

	/// ja: '複数枚の写真で商品の状態をチェックするのが常識'
	String get subtitle => '複数枚の写真で商品の状態をチェックするのが常識';

	/// ja: '左スワイプで次の写真へ'
	String get swipeTitle => '左スワイプで次の写真へ';

	/// ja: 'フリマアプリでは商品写真を複数枚登録できる。スワイプやタップで全ての写真を確認するのが購入前の基本だ。'
	String get swipeDesc => 'フリマアプリでは商品写真を複数枚登録できる。スワイプやタップで全ての写真を確認するのが購入前の基本だ。';

	/// ja: '裏面・傷・汚れを必ず確認'
	String get checkTitle => '裏面・傷・汚れを必ず確認';

	/// ja: '表側だけでなく、裏面・底面・ロゴ付近など見落としがちな部分を全ての写真で確認することがトラブル防止の第一歩だ。'
	String get checkDesc => '表側だけでなく、裏面・底面・ロゴ付近など見落としがちな部分を全ての写真で確認することがトラブル防止の第一歩だ。';

	/// ja: 'ドットインジケーターで枚数がわかる'
	String get dotTitle => 'ドットインジケーターで枚数がわかる';

	/// ja: '画像の下のドット（・・・）は現在何枚目を見ているかを示す。全部確認したかどうかをひと目で判断できる。'
	String get dotDesc => '画像の下のドット（・・・）は現在何枚目を見ているかを示す。全部確認したかどうかをひと目で判断できる。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜハートでキープできた？'
	String get title => 'なぜハートでキープできた？';

	/// ja: '『いいね』はフリマアプリの「ウィッシュリスト」機能'
	String get subtitle => '『いいね』はフリマアプリの「ウィッシュリスト」機能';

	/// ja: 'ハートで後でまとめて比較できる'
	String get heartTitle => 'ハートで後でまとめて比較できる';

	/// ja: 'いいねした商品は専用リストに保存され、複数の候補をまとめて比較検討できる。衝動買いを防ぐ賢い使い方だ。'
	String get heartDesc => 'いいねした商品は専用リストに保存され、複数の候補をまとめて比較検討できる。衝動買いを防ぐ賢い使い方だ。';

	/// ja: '価格変動を通知してもらえる'
	String get priceTitle => '価格変動を通知してもらえる';

	/// ja: 'いいねしておくと、出品者が価格を下げた際に通知が届くことがある。お気に入りに入れておくだけで値下げを逃さない。'
	String get priceDesc => 'いいねしておくと、出品者が価格を下げた際に通知が届くことがある。お気に入りに入れておくだけで値下げを逃さない。';

	/// ja: '売り切れリスクも把握できる'
	String get sellTitle => '売り切れリスクも把握できる';

	/// ja: 'いいね数が多い商品は人気が高く、すぐ売り切れる可能性がある。他のユーザーのいいね数を確認することで需要を判断できる。'
	String get sellDesc => 'いいね数が多い商品は人気が高く、すぐ売り切れる可能性がある。他のユーザーのいいね数を確認することで需要を判断できる。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜプロフィールで信頼性がわかった？'
	String get title => 'なぜプロフィールで信頼性がわかった？';

	/// ja: '出品者の評価は取引の安心感に直結する'
	String get subtitle => '出品者の評価は取引の安心感に直結する';

	/// ja: '星評価で信頼度が一目でわかる'
	String get ratingTitle => '星評価で信頼度が一目でわかる';

	/// ja: 'フリマアプリでは取引ごとに評価が蓄積される。高評価の出品者は誠実な取引履歴を持つ可能性が高く、購入の安心感につながる。'
	String get ratingDesc => 'フリマアプリでは取引ごとに評価が蓄積される。高評価の出品者は誠実な取引履歴を持つ可能性が高く、購入の安心感につながる。';

	/// ja: 'プロフィールタップで詳細確認'
	String get profileTitle => 'プロフィールタップで詳細確認';

	/// ja: '出品者名や評価エリアをタップすると詳細プロフィールに遷移できる。取引履歴・コメントを見て過去の実績を確認しよう。'
	String get profileDesc => '出品者名や評価エリアをタップすると詳細プロフィールに遷移できる。取引履歴・コメントを見て過去の実績を確認しよう。';

	/// ja: '評価数も信頼の指標'
	String get trustTitle => '評価数も信頼の指標';

	/// ja: '高評価でも評価数が少ない場合は判断が難しい。評価数が多いほど安定した取引実績があると判断できる。'
	String get trustDesc => '高評価でも評価数が少ない場合は判断が難しい。評価数が多いほど安定した取引実績があると判断できる。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ下のボタンで購入できた？'
	String get title => 'なぜ下のボタンで購入できた？';

	/// ja: '固定購入ボタンはECアプリの世界共通デザインパターン'
	String get subtitle => '固定購入ボタンはECアプリの世界共通デザインパターン';

	/// ja: '画面下部の固定ボタンが購入への導線'
	String get fixedTitle => '画面下部の固定ボタンが購入への導線';

	/// ja: 'フリマアプリ・ECサイトでは購入ボタンを画面下部に常時固定するデザインが一般的。スクロール位置に関わらずいつでも購入に進める。'
	String get fixedDesc => 'フリマアプリ・ECサイトでは購入ボタンを画面下部に常時固定するデザインが一般的。スクロール位置に関わらずいつでも購入に進める。';

	/// ja: '目立つ色で購買意欲を高める'
	String get ctaTitle => '目立つ色で購買意欲を高める';

	/// ja: '購入ボタンは赤・オレンジなど目を引く色で実装されることが多い。ユーザーの視線を集め、購入アクションを促すCTA（行動喚起）の役割を果たす。'
	String get ctaDesc => '購入ボタンは赤・オレンジなど目を引く色で実装されることが多い。ユーザーの視線を集め、購入アクションを促すCTA（行動喚起）の役割を果たす。';

	/// ja: '購入手続きは複数ステップ'
	String get safeTitle => '購入手続きは複数ステップ';

	/// ja: 'このボタンは購入手続きの入り口に過ぎない。住所確認・支払い方法選択などのステップが続くため、誤タップでいきなり購入完了にはならない設計が一般的だ。'
	String get safeDesc => 'このボタンは購入手続きの入り口に過ぎない。住所確認・支払い方法選択などのステップが続くため、誤タップでいきなり購入完了にはならない設計が一般的だ。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '裏側に傷がないか気になるな。最後の写真までスワイプして確認しよう',
			'quiz1.insight.title' => 'なぜスワイプで確認できた？',
			'quiz1.insight.subtitle' => '複数枚の写真で商品の状態をチェックするのが常識',
			'quiz1.insight.swipeTitle' => '左スワイプで次の写真へ',
			'quiz1.insight.swipeDesc' => 'フリマアプリでは商品写真を複数枚登録できる。スワイプやタップで全ての写真を確認するのが購入前の基本だ。',
			'quiz1.insight.checkTitle' => '裏面・傷・汚れを必ず確認',
			'quiz1.insight.checkDesc' => '表側だけでなく、裏面・底面・ロゴ付近など見落としがちな部分を全ての写真で確認することがトラブル防止の第一歩だ。',
			'quiz1.insight.dotTitle' => 'ドットインジケーターで枚数がわかる',
			'quiz1.insight.dotDesc' => '画像の下のドット（・・・）は現在何枚目を見ているかを示す。全部確認したかどうかをひと目で判断できる。',
			'quiz2.missionText' => '後で比較したいから、とりあえず『いいね』して保存しておこう',
			'quiz2.insight.title' => 'なぜハートでキープできた？',
			'quiz2.insight.subtitle' => '『いいね』はフリマアプリの「ウィッシュリスト」機能',
			'quiz2.insight.heartTitle' => 'ハートで後でまとめて比較できる',
			'quiz2.insight.heartDesc' => 'いいねした商品は専用リストに保存され、複数の候補をまとめて比較検討できる。衝動買いを防ぐ賢い使い方だ。',
			'quiz2.insight.priceTitle' => '価格変動を通知してもらえる',
			'quiz2.insight.priceDesc' => 'いいねしておくと、出品者が価格を下げた際に通知が届くことがある。お気に入りに入れておくだけで値下げを逃さない。',
			'quiz2.insight.sellTitle' => '売り切れリスクも把握できる',
			'quiz2.insight.sellDesc' => 'いいね数が多い商品は人気が高く、すぐ売り切れる可能性がある。他のユーザーのいいね数を確認することで需要を判断できる。',
			'quiz3.missionText' => 'この出品者、信頼できる人かな？プロフィールと評価を見に行こう',
			'quiz3.insight.title' => 'なぜプロフィールで信頼性がわかった？',
			'quiz3.insight.subtitle' => '出品者の評価は取引の安心感に直結する',
			'quiz3.insight.ratingTitle' => '星評価で信頼度が一目でわかる',
			'quiz3.insight.ratingDesc' => 'フリマアプリでは取引ごとに評価が蓄積される。高評価の出品者は誠実な取引履歴を持つ可能性が高く、購入の安心感につながる。',
			'quiz3.insight.profileTitle' => 'プロフィールタップで詳細確認',
			'quiz3.insight.profileDesc' => '出品者名や評価エリアをタップすると詳細プロフィールに遷移できる。取引履歴・コメントを見て過去の実績を確認しよう。',
			'quiz3.insight.trustTitle' => '評価数も信頼の指標',
			'quiz3.insight.trustDesc' => '高評価でも評価数が少ない場合は判断が難しい。評価数が多いほど安定した取引実績があると判断できる。',
			'quiz4.missionText' => 'よし、これに決めた！購入手続きに進もう',
			'quiz4.insight.title' => 'なぜ下のボタンで購入できた？',
			'quiz4.insight.subtitle' => '固定購入ボタンはECアプリの世界共通デザインパターン',
			'quiz4.insight.fixedTitle' => '画面下部の固定ボタンが購入への導線',
			'quiz4.insight.fixedDesc' => 'フリマアプリ・ECサイトでは購入ボタンを画面下部に常時固定するデザインが一般的。スクロール位置に関わらずいつでも購入に進める。',
			'quiz4.insight.ctaTitle' => '目立つ色で購買意欲を高める',
			'quiz4.insight.ctaDesc' => '購入ボタンは赤・オレンジなど目を引く色で実装されることが多い。ユーザーの視線を集め、購入アクションを促すCTA（行動喚起）の役割を果たす。',
			'quiz4.insight.safeTitle' => '購入手続きは複数ステップ',
			'quiz4.insight.safeDesc' => 'このボタンは購入手続きの入り口に過ぎない。住所確認・支払い方法選択などのステップが続くため、誤タップでいきなり購入完了にはならない設計が一般的だ。',
			'common.appTitle' => 'フリマ',
			'common.itemTitle' => 'ヴィンテージデニムジャケット',
			'common.itemPrice' => '¥3,800',
			'common.itemDescription' => '古着屋で購入した1990年代のデニムジャケット。若干の使用感はありますが、目立った傷・汚れなし。サイズはMです。',
			'common.sellerName' => 'ビンテージ愛好家',
			'common.buyButton' => '購入手続きへ',
			'common.imageLabel1' => '表',
			'common.imageLabel2' => '横',
			'common.imageLabel3' => '裏',
			_ => null,
		};
	}
}
