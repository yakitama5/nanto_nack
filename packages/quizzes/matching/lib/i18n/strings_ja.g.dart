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

	/// ja: '素敵な人を見つけた！『いいね』を送ってみよう'
	String get missionText => '素敵な人を見つけた！『いいね』を送ってみよう';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ちょっとタイプじゃないかも……スキップして次の人を見よう'
	String get missionText => 'ちょっとタイプじゃないかも……スキップして次の人を見よう';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'この人、他の写真はないのかな？2枚目の写真を見てみよう'
	String get missionText => 'この人、他の写真はないのかな？2枚目の写真を見てみよう';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '運命の人だ！！特別な『超いいね』で強烈にアピールしよう'
	String get missionText => '運命の人だ！！特別な『超いいね』で強烈にアピールしよう';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'マッチング'
	String get appTitle => 'マッチング';

	/// ja: 'いいね'
	String get like => 'いいね';

	/// ja: 'スキップ'
	String get nope => 'スキップ';

	/// ja: '超いいね'
	String get superLike => '超いいね';

	/// ja: 'プロフィールがありません'
	String get noMoreProfiles => 'プロフィールがありません';

	/// ja: 'あなたの近くにいる人'
	String get profilesLabel => 'あなたの近くにいる人';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ右スワイプで『いいね』だとわかった？'
	String get title => 'なぜ右スワイプで『いいね』だとわかった？';

	/// ja: '右スワイプはYES・承認の世界標準ジェスチャー'
	String get subtitle => '右スワイプはYES・承認の世界標準ジェスチャー';

	/// ja: '右スワイプ＝いいね（LIKE）の世界標準'
	String get swipeTitle => '右スワイプ＝いいね（LIKE）の世界標準';

	/// ja: 'Tinderが2012年に生み出した「右で好き・左でスキップ」のスワイプUI。今や世界中のマッチングアプリで採用されている定番インタラクション。'
	String get swipeDesc => 'Tinderが2012年に生み出した「右で好き・左でスキップ」のスワイプUI。今や世界中のマッチングアプリで採用されている定番インタラクション。';

	/// ja: '❤ハートボタンも同じ効果'
	String get heartTitle => '❤ハートボタンも同じ効果';

	/// ja: '画面下部のハートアイコンボタンをタップしても同じ「いいね」アクションが発動する。スワイプの代替UIとして設計されている。'
	String get heartDesc => '画面下部のハートアイコンボタンをタップしても同じ「いいね」アクションが発動する。スワイプの代替UIとして設計されている。';

	/// ja: '即時フィードバックがわかりやすさを生む'
	String get feedbackTitle => '即時フィードバックがわかりやすさを生む';

	/// ja: 'カードが右に飛んでいくアニメーションが、操作の結果を直感的に伝える。視覚的フィードバックがあるから迷わず使える。'
	String get feedbackDesc => 'カードが右に飛んでいくアニメーションが、操作の結果を直感的に伝える。視覚的フィードバックがあるから迷わず使える。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ左スワイプで『スキップ』だとわかった？'
	String get title => 'なぜ左スワイプで『スキップ』だとわかった？';

	/// ja: '左スワイプはNO・却下の対になるジェスチャー'
	String get subtitle => '左スワイプはNO・却下の対になるジェスチャー';

	/// ja: '左スワイプ＝スキップ（NOPE）の世界標準'
	String get swipeTitle => '左スワイプ＝スキップ（NOPE）の世界標準';

	/// ja: '右がYESなら左はNO。この対称的なデザインが直感を生む。マッチングアプリだけでなく、カード型UIを持つあらゆるアプリで同じ法則が使われている。'
	String get swipeDesc => '右がYESなら左はNO。この対称的なデザインが直感を生む。マッチングアプリだけでなく、カード型UIを持つあらゆるアプリで同じ法則が使われている。';

	/// ja: '×ボタンも同じ効果'
	String get xTitle => '×ボタンも同じ効果';

	/// ja: '左下の×（バツ）ボタンは「スキップ」を意味する。世界共通の『×＝拒否・キャンセル』のアイコン言語が活かされている。'
	String get xDesc => '左下の×（バツ）ボタンは「スキップ」を意味する。世界共通の『×＝拒否・キャンセル』のアイコン言語が活かされている。';

	/// ja: 'ジェスチャーの対称性がUXを簡単にする'
	String get gestureTitle => 'ジェスチャーの対称性がUXを簡単にする';

	/// ja: '「右＝OK・左＝NG」という一貫したルールにより、新しいアプリでも説明なしに使い始められる。学習コストをゼロにする設計思想。'
	String get gestureDesc => '「右＝OK・左＝NG」という一貫したルールにより、新しいアプリでも説明なしに使い始められる。学習コストをゼロにする設計思想。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜタップで次の写真に切り替わるとわかった？'
	String get title => 'なぜタップで次の写真に切り替わるとわかった？';

	/// ja: 'タップで写真を送るのはスマホ閲覧の定番操作'
	String get subtitle => 'タップで写真を送るのはスマホ閲覧の定番操作';

	/// ja: '右タップ＝次の写真、左タップ＝前の写真'
	String get tapTitle => '右タップ＝次の写真、左タップ＝前の写真';

	/// ja: 'プロフィールカードの右半分をタップすると次の写真へ、左半分で前の写真へ戻る。インスタグラムのストーリーと同じ直感的な操作性。'
	String get tapDesc => 'プロフィールカードの右半分をタップすると次の写真へ、左半分で前の写真へ戻る。インスタグラムのストーリーと同じ直感的な操作性。';

	/// ja: '上部のバーが写真枚数を示すインジケーター'
	String get indicatorTitle => '上部のバーが写真枚数を示すインジケーター';

	/// ja: 'カード上部に並ぶ短いバーは、写真の総枚数と今何枚目を表示しているかを示す。明るいバーが現在位置。'
	String get indicatorDesc => 'カード上部に並ぶ短いバーは、写真の総枚数と今何枚目を表示しているかを示す。明るいバーが現在位置。';

	/// ja: '複数写真でより自分らしさを伝える'
	String get multiPhotoTitle => '複数写真でより自分らしさを伝える';

	/// ja: 'マッチングアプリでは1枚より複数枚の写真を見てもらうことで、人柄や雰囲気が伝わりやすい。写真枚数は選択の重要な判断材料。'
	String get multiPhotoDesc => 'マッチングアプリでは1枚より複数枚の写真を見てもらうことで、人柄や雰囲気が伝わりやすい。写真枚数は選択の重要な判断材料。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ上スワイプで『超いいね』だとわかった？'
	String get title => 'なぜ上スワイプで『超いいね』だとわかった？';

	/// ja: '上スワイプは特別なアクションの直感ジェスチャー'
	String get subtitle => '上スワイプは特別なアクションの直感ジェスチャー';

	/// ja: '上スワイプ＝超いいね（SUPER LIKE）'
	String get superTitle => '上スワイプ＝超いいね（SUPER LIKE）';

	/// ja: 'Tinderが追加した上スワイプは「特別な関心」を示す差別化アクション。右・左の2択を超えた第3の選択肢として、目立たせる効果がある。'
	String get superDesc => 'Tinderが追加した上スワイプは「特別な関心」を示す差別化アクション。右・左の2択を超えた第3の選択肢として、目立たせる効果がある。';

	/// ja: '★ボタンも同じ超いいね効果'
	String get starTitle => '★ボタンも同じ超いいね効果';

	/// ja: '画面下部の星（★）ボタンをタップしても同じ超いいねが発動する。スワイプが難しいシーンでもボタンで確実に操作できる。'
	String get starDesc => '画面下部の星（★）ボタンをタップしても同じ超いいねが発動する。スワイプが難しいシーンでもボタンで確実に操作できる。';

	/// ja: '希少性がアピール力を高める'
	String get specialTitle => '希少性がアピール力を高める';

	/// ja: '超いいねは通常のいいねより相手に強く通知される仕組みになっており、マッチング率が上がるとされている。数が限られているほど価値が高まる心理を活用した設計。'
	String get specialDesc => '超いいねは通常のいいねより相手に強く通知される仕組みになっており、マッチング率が上がるとされている。数が限られているほど価値が高まる心理を活用した設計。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '素敵な人を見つけた！『いいね』を送ってみよう',
			'quiz1.insight.title' => 'なぜ右スワイプで『いいね』だとわかった？',
			'quiz1.insight.subtitle' => '右スワイプはYES・承認の世界標準ジェスチャー',
			'quiz1.insight.swipeTitle' => '右スワイプ＝いいね（LIKE）の世界標準',
			'quiz1.insight.swipeDesc' => 'Tinderが2012年に生み出した「右で好き・左でスキップ」のスワイプUI。今や世界中のマッチングアプリで採用されている定番インタラクション。',
			'quiz1.insight.heartTitle' => '❤ハートボタンも同じ効果',
			'quiz1.insight.heartDesc' => '画面下部のハートアイコンボタンをタップしても同じ「いいね」アクションが発動する。スワイプの代替UIとして設計されている。',
			'quiz1.insight.feedbackTitle' => '即時フィードバックがわかりやすさを生む',
			'quiz1.insight.feedbackDesc' => 'カードが右に飛んでいくアニメーションが、操作の結果を直感的に伝える。視覚的フィードバックがあるから迷わず使える。',
			'quiz2.missionText' => 'ちょっとタイプじゃないかも……スキップして次の人を見よう',
			'quiz2.insight.title' => 'なぜ左スワイプで『スキップ』だとわかった？',
			'quiz2.insight.subtitle' => '左スワイプはNO・却下の対になるジェスチャー',
			'quiz2.insight.swipeTitle' => '左スワイプ＝スキップ（NOPE）の世界標準',
			'quiz2.insight.swipeDesc' => '右がYESなら左はNO。この対称的なデザインが直感を生む。マッチングアプリだけでなく、カード型UIを持つあらゆるアプリで同じ法則が使われている。',
			'quiz2.insight.xTitle' => '×ボタンも同じ効果',
			'quiz2.insight.xDesc' => '左下の×（バツ）ボタンは「スキップ」を意味する。世界共通の『×＝拒否・キャンセル』のアイコン言語が活かされている。',
			'quiz2.insight.gestureTitle' => 'ジェスチャーの対称性がUXを簡単にする',
			'quiz2.insight.gestureDesc' => '「右＝OK・左＝NG」という一貫したルールにより、新しいアプリでも説明なしに使い始められる。学習コストをゼロにする設計思想。',
			'quiz3.missionText' => 'この人、他の写真はないのかな？2枚目の写真を見てみよう',
			'quiz3.insight.title' => 'なぜタップで次の写真に切り替わるとわかった？',
			'quiz3.insight.subtitle' => 'タップで写真を送るのはスマホ閲覧の定番操作',
			'quiz3.insight.tapTitle' => '右タップ＝次の写真、左タップ＝前の写真',
			'quiz3.insight.tapDesc' => 'プロフィールカードの右半分をタップすると次の写真へ、左半分で前の写真へ戻る。インスタグラムのストーリーと同じ直感的な操作性。',
			'quiz3.insight.indicatorTitle' => '上部のバーが写真枚数を示すインジケーター',
			'quiz3.insight.indicatorDesc' => 'カード上部に並ぶ短いバーは、写真の総枚数と今何枚目を表示しているかを示す。明るいバーが現在位置。',
			'quiz3.insight.multiPhotoTitle' => '複数写真でより自分らしさを伝える',
			'quiz3.insight.multiPhotoDesc' => 'マッチングアプリでは1枚より複数枚の写真を見てもらうことで、人柄や雰囲気が伝わりやすい。写真枚数は選択の重要な判断材料。',
			'quiz4.missionText' => '運命の人だ！！特別な『超いいね』で強烈にアピールしよう',
			'quiz4.insight.title' => 'なぜ上スワイプで『超いいね』だとわかった？',
			'quiz4.insight.subtitle' => '上スワイプは特別なアクションの直感ジェスチャー',
			'quiz4.insight.superTitle' => '上スワイプ＝超いいね（SUPER LIKE）',
			'quiz4.insight.superDesc' => 'Tinderが追加した上スワイプは「特別な関心」を示す差別化アクション。右・左の2択を超えた第3の選択肢として、目立たせる効果がある。',
			'quiz4.insight.starTitle' => '★ボタンも同じ超いいね効果',
			'quiz4.insight.starDesc' => '画面下部の星（★）ボタンをタップしても同じ超いいねが発動する。スワイプが難しいシーンでもボタンで確実に操作できる。',
			'quiz4.insight.specialTitle' => '希少性がアピール力を高める',
			'quiz4.insight.specialDesc' => '超いいねは通常のいいねより相手に強く通知される仕組みになっており、マッチング率が上がるとされている。数が限られているほど価値が高まる心理を活用した設計。',
			'common.appTitle' => 'マッチング',
			'common.like' => 'いいね',
			'common.nope' => 'スキップ',
			'common.superLike' => '超いいね',
			'common.noMoreProfiles' => 'プロフィールがありません',
			'common.profilesLabel' => 'あなたの近くにいる人',
			_ => null,
		};
	}
}
