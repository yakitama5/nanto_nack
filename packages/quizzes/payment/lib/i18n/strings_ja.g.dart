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

	/// ja: 'QRコードを表示してください'
	String get missionText => 'QRコードを表示してください';

	/// ja: '「QRコード」ボタンをタップしてください'
	String get failureReason => '「QRコード」ボタンをタップしてください';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '残高を確認してください'
	String get missionText => '残高を確認してください';

	/// ja: '残高エリアをタップしてブラーを解除してください'
	String get failureReason => '残高エリアをタップしてブラーを解除してください';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '誰かに送金してください'
	String get missionText => '誰かに送金してください';

	/// ja: '送金先を選んで金額を入力し、送金ボタンをタップしてください'
	String get failureReason => '送金先を選んで金額を入力し、送金ボタンをタップしてください';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '取引履歴を確認してください'
	String get missionText => '取引履歴を確認してください';

	/// ja: '「履歴」タブまたは明細ボタンをタップしてください'
	String get failureReason => '「履歴」タブまたは明細ボタンをタップしてください';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'Pay'
	String get appTitle => 'Pay';

	/// ja: '残高'
	String get balance => '残高';

	/// ja: '送る'
	String get send => '送る';

	/// ja: '受け取る'
	String get receive => '受け取る';

	/// ja: '履歴'
	String get history => '履歴';

	/// ja: 'QRコード'
	String get qrCode => 'QRコード';

	/// ja: '読み取る'
	String get scanQr => '読み取る';

	/// ja: 'ポイント'
	String get point => 'ポイント';

	/// ja: 'チャージ'
	String get topUp => 'チャージ';

	/// ja: '金額'
	String get amount => '金額';

	/// ja: '確認'
	String get confirm => '確認';

	/// ja: '送金する'
	String get sendMoney => '送金する';

	/// ja: 'キャンセル'
	String get cancel => 'キャンセル';

	/// ja: 'タップして確認'
	String get tapToReveal => 'タップして確認';

	/// ja: '円'
	String get yen => '円';

	/// ja: '田中 太郎'
	String get contact1 => '田中 太郎';

	/// ja: '山田 花子'
	String get contact2 => '山田 花子';

	/// ja: '鈴木 次郎'
	String get contact3 => '鈴木 次郎';

	/// ja: '佐藤 みどり'
	String get contact4 => '佐藤 みどり';

	/// ja: 'コンビニ決済'
	String get txTitle1 => 'コンビニ決済';

	/// ja: 'ランチ代'
	String get txTitle2 => 'ランチ代';

	/// ja: 'お友達から'
	String get txTitle3 => 'お友達から';

	/// ja: '書籍購入'
	String get txTitle4 => '書籍購入';

	/// ja: '電車代'
	String get txTitle5 => '電車代';

	/// ja: '-580'
	String get txAmount1 => '-580';

	/// ja: '-1200'
	String get txAmount2 => '-1200';

	/// ja: '+3000'
	String get txAmount3 => '+3000';

	/// ja: '-2800'
	String get txAmount4 => '-2800';

	/// ja: '-240'
	String get txAmount5 => '-240';

	/// ja: '今日'
	String get txDate1 => '今日';

	/// ja: '昨日'
	String get txDate2 => '昨日';

	/// ja: '昨日'
	String get txDate3 => '昨日';

	/// ja: '3日前'
	String get txDate4 => '3日前';

	/// ja: '4日前'
	String get txDate5 => '4日前';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜQRコードボタンがわかった？'
	String get title => 'なぜQRコードボタンがわかった？';

	/// ja: 'QRコード＝スキャン払いの入口'
	String get subtitle => 'QRコード＝スキャン払いの入口';

	/// ja: 'QRコードは「支払い」を意味する'
	String get qrTitle => 'QRコードは「支払い」を意味する';

	/// ja: '四角いモザイク柄（QRコード）のアイコンは、キャッシュレス決済アプリで「QR払い」の入口として世界共通で使われている。'
	String get qrDesc => '四角いモザイク柄（QRコード）のアイコンは、キャッシュレス決済アプリで「QR払い」の入口として世界共通で使われている。';

	/// ja: 'カメラアイコンは「読み取り」を意味する'
	String get cameraTitle => 'カメラアイコンは「読み取り」を意味する';

	/// ja: 'カメラや読み取りアイコンはQRコードを「受け取る側」の操作。支払い時に使うQRコード表示とは目的が異なる。'
	String get cameraDesc => 'カメラや読み取りアイコンはQRコードを「受け取る側」の操作。支払い時に使うQRコード表示とは目的が異なる。';

	/// ja: '目立つ色は「メインアクション」のサイン'
	String get colorTitle => '目立つ色は「メインアクション」のサイン';

	/// ja: 'アプリのメインカラーで強調されたボタンは、最もよく使われる操作を示している。決済アプリでは多くの場合それがQRコード払い。'
	String get colorDesc => 'アプリのメインカラーで強調されたボタンは、最もよく使われる操作を示している。決済アプリでは多くの場合それがQRコード払い。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ残高のブラーを解除できた？'
	String get title => 'なぜ残高のブラーを解除できた？';

	/// ja: 'ぼかし＝「隠れた情報がある」サイン'
	String get subtitle => 'ぼかし＝「隠れた情報がある」サイン';

	/// ja: 'ブラーは「隠された情報」を示す'
	String get blurTitle => 'ブラーは「隠された情報」を示す';

	/// ja: '残高などの金額にかかっているブラーは、プライバシー保護のために意図的に隠されている。タップで解除できるのは「タップ可能なUI」であるサイン。'
	String get blurDesc => '残高などの金額にかかっているブラーは、プライバシー保護のために意図的に隠されている。タップで解除できるのは「タップ可能なUI」であるサイン。';

	/// ja: '目のアイコンは「表示/非表示」を意味する'
	String get eyeTitle => '目のアイコンは「表示/非表示」を意味する';

	/// ja: '目を閉じたアイコンは「情報が非表示」、開いたアイコンは「表示」を意味する。パスワードフィールドや残高表示に広く使われるUIパターン。'
	String get eyeDesc => '目を閉じたアイコンは「情報が非表示」、開いたアイコンは「表示」を意味する。パスワードフィールドや残高表示に広く使われるUIパターン。';

	/// ja: 'ブラーが解けた＝正しい操作'
	String get privacyTitle => 'ブラーが解けた＝正しい操作';

	/// ja: '情報が正しく表示されることで、自分が正しい操作をしたことがわかる。UIからのフィードバックが正しい操作を確認させてくれる。'
	String get privacyDesc => '情報が正しく表示されることで、自分が正しい操作をしたことがわかる。UIからのフィードバックが正しい操作を確認させてくれる。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ送金の手順がわかった？'
	String get title => 'なぜ送金の手順がわかった？';

	/// ja: '3ステップが送金UIの定番フロー'
	String get subtitle => '3ステップが送金UIの定番フロー';

	/// ja: '「送る」アイコンは上矢印または紙飛行機'
	String get sendTitle => '「送る」アイコンは上矢印または紙飛行機';

	/// ja: '送信・送金を表すUIアイコンとして、上向きの矢印や紙飛行機が広く使われている。メールやSNSの送信ボタンと同じ感覚で操作できる。'
	String get sendDesc => '送信・送金を表すUIアイコンとして、上向きの矢印や紙飛行機が広く使われている。メールやSNSの送信ボタンと同じ感覚で操作できる。';

	/// ja: '数字キーボードは金額入力の定番'
	String get amountTitle => '数字キーボードは金額入力の定番';

	/// ja: '金額入力にはテンキー（数字キーボード）が表示される。銀行アプリ・キャッシュレス決済アプリともに共通するUIパターン。'
	String get amountDesc => '金額入力にはテンキー（数字キーボード）が表示される。銀行アプリ・キャッシュレス決済アプリともに共通するUIパターン。';

	/// ja: '最終確認画面は「間違えた時のため」'
	String get confirmTitle => '最終確認画面は「間違えた時のため」';

	/// ja: '送金などの重要な操作では、実行前に確認画面を挟むことが多い。これにより誤操作を防ぐ安全設計になっている。'
	String get confirmDesc => '送金などの重要な操作では、実行前に確認画面を挟むことが多い。これにより誤操作を防ぐ安全設計になっている。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ取引履歴がわかった？'
	String get title => 'なぜ取引履歴がわかった？';

	/// ja: '時計・リスト＝履歴UIの記号'
	String get subtitle => '時計・リスト＝履歴UIの記号';

	/// ja: '時計アイコンは「履歴・過去」を表す'
	String get historyTitle => '時計アイコンは「履歴・過去」を表す';

	/// ja: '時計やリスト形式のアイコンは「過去の記録・履歴」を表すUIパターンとして、銀行アプリや決済アプリで広く使われている。'
	String get historyDesc => '時計やリスト形式のアイコンは「過去の記録・履歴」を表すUIパターンとして、銀行アプリや決済アプリで広く使われている。';

	/// ja: 'リスト表示は情報の一覧を意味する'
	String get listTitle => 'リスト表示は情報の一覧を意味する';

	/// ja: '縦に並んだリスト形式のUIは、複数の情報（取引・メッセージ・注文など）の一覧を示す最もシンプルで直感的なUIパターン。'
	String get listDesc => '縦に並んだリスト形式のUIは、複数の情報（取引・メッセージ・注文など）の一覧を示す最もシンプルで直感的なUIパターン。';

	/// ja: 'タブは「カテゴリ切り替え」を意味する'
	String get tabTitle => 'タブは「カテゴリ切り替え」を意味する';

	/// ja: '画面下部や上部に並ぶタブは、異なるカテゴリのコンテンツへ切り替える操作。「ホーム」「送金」「履歴」などの機能分類に使われる。'
	String get tabDesc => '画面下部や上部に並ぶタブは、異なるカテゴリのコンテンツへ切り替える操作。「ホーム」「送金」「履歴」などの機能分類に使われる。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'QRコードを表示してください',
			'quiz1.failureReason' => '「QRコード」ボタンをタップしてください',
			'quiz1.insight.title' => 'なぜQRコードボタンがわかった？',
			'quiz1.insight.subtitle' => 'QRコード＝スキャン払いの入口',
			'quiz1.insight.qrTitle' => 'QRコードは「支払い」を意味する',
			'quiz1.insight.qrDesc' => '四角いモザイク柄（QRコード）のアイコンは、キャッシュレス決済アプリで「QR払い」の入口として世界共通で使われている。',
			'quiz1.insight.cameraTitle' => 'カメラアイコンは「読み取り」を意味する',
			'quiz1.insight.cameraDesc' => 'カメラや読み取りアイコンはQRコードを「受け取る側」の操作。支払い時に使うQRコード表示とは目的が異なる。',
			'quiz1.insight.colorTitle' => '目立つ色は「メインアクション」のサイン',
			'quiz1.insight.colorDesc' => 'アプリのメインカラーで強調されたボタンは、最もよく使われる操作を示している。決済アプリでは多くの場合それがQRコード払い。',
			'quiz2.missionText' => '残高を確認してください',
			'quiz2.failureReason' => '残高エリアをタップしてブラーを解除してください',
			'quiz2.insight.title' => 'なぜ残高のブラーを解除できた？',
			'quiz2.insight.subtitle' => 'ぼかし＝「隠れた情報がある」サイン',
			'quiz2.insight.blurTitle' => 'ブラーは「隠された情報」を示す',
			'quiz2.insight.blurDesc' => '残高などの金額にかかっているブラーは、プライバシー保護のために意図的に隠されている。タップで解除できるのは「タップ可能なUI」であるサイン。',
			'quiz2.insight.eyeTitle' => '目のアイコンは「表示/非表示」を意味する',
			'quiz2.insight.eyeDesc' => '目を閉じたアイコンは「情報が非表示」、開いたアイコンは「表示」を意味する。パスワードフィールドや残高表示に広く使われるUIパターン。',
			'quiz2.insight.privacyTitle' => 'ブラーが解けた＝正しい操作',
			'quiz2.insight.privacyDesc' => '情報が正しく表示されることで、自分が正しい操作をしたことがわかる。UIからのフィードバックが正しい操作を確認させてくれる。',
			'quiz3.missionText' => '誰かに送金してください',
			'quiz3.failureReason' => '送金先を選んで金額を入力し、送金ボタンをタップしてください',
			'quiz3.insight.title' => 'なぜ送金の手順がわかった？',
			'quiz3.insight.subtitle' => '3ステップが送金UIの定番フロー',
			'quiz3.insight.sendTitle' => '「送る」アイコンは上矢印または紙飛行機',
			'quiz3.insight.sendDesc' => '送信・送金を表すUIアイコンとして、上向きの矢印や紙飛行機が広く使われている。メールやSNSの送信ボタンと同じ感覚で操作できる。',
			'quiz3.insight.amountTitle' => '数字キーボードは金額入力の定番',
			'quiz3.insight.amountDesc' => '金額入力にはテンキー（数字キーボード）が表示される。銀行アプリ・キャッシュレス決済アプリともに共通するUIパターン。',
			'quiz3.insight.confirmTitle' => '最終確認画面は「間違えた時のため」',
			'quiz3.insight.confirmDesc' => '送金などの重要な操作では、実行前に確認画面を挟むことが多い。これにより誤操作を防ぐ安全設計になっている。',
			'quiz4.missionText' => '取引履歴を確認してください',
			'quiz4.failureReason' => '「履歴」タブまたは明細ボタンをタップしてください',
			'quiz4.insight.title' => 'なぜ取引履歴がわかった？',
			'quiz4.insight.subtitle' => '時計・リスト＝履歴UIの記号',
			'quiz4.insight.historyTitle' => '時計アイコンは「履歴・過去」を表す',
			'quiz4.insight.historyDesc' => '時計やリスト形式のアイコンは「過去の記録・履歴」を表すUIパターンとして、銀行アプリや決済アプリで広く使われている。',
			'quiz4.insight.listTitle' => 'リスト表示は情報の一覧を意味する',
			'quiz4.insight.listDesc' => '縦に並んだリスト形式のUIは、複数の情報（取引・メッセージ・注文など）の一覧を示す最もシンプルで直感的なUIパターン。',
			'quiz4.insight.tabTitle' => 'タブは「カテゴリ切り替え」を意味する',
			'quiz4.insight.tabDesc' => '画面下部や上部に並ぶタブは、異なるカテゴリのコンテンツへ切り替える操作。「ホーム」「送金」「履歴」などの機能分類に使われる。',
			'common.appTitle' => 'Pay',
			'common.balance' => '残高',
			'common.send' => '送る',
			'common.receive' => '受け取る',
			'common.history' => '履歴',
			'common.qrCode' => 'QRコード',
			'common.scanQr' => '読み取る',
			'common.point' => 'ポイント',
			'common.topUp' => 'チャージ',
			'common.amount' => '金額',
			'common.confirm' => '確認',
			'common.sendMoney' => '送金する',
			'common.cancel' => 'キャンセル',
			'common.tapToReveal' => 'タップして確認',
			'common.yen' => '円',
			'common.contact1' => '田中 太郎',
			'common.contact2' => '山田 花子',
			'common.contact3' => '鈴木 次郎',
			'common.contact4' => '佐藤 みどり',
			'common.txTitle1' => 'コンビニ決済',
			'common.txTitle2' => 'ランチ代',
			'common.txTitle3' => 'お友達から',
			'common.txTitle4' => '書籍購入',
			'common.txTitle5' => '電車代',
			'common.txAmount1' => '-580',
			'common.txAmount2' => '-1200',
			'common.txAmount3' => '+3000',
			'common.txAmount4' => '-2800',
			'common.txAmount5' => '-240',
			'common.txDate1' => '今日',
			'common.txDate2' => '昨日',
			'common.txDate3' => '昨日',
			'common.txDate4' => '3日前',
			'common.txDate5' => '4日前',
			_ => null,
		};
	}
}
