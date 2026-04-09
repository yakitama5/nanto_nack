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

	/// ja: 'レジに来ました。バーコードを提示してください'
	String get missionText => 'レジに来ました。バーコードを提示してください';

	/// ja: '画面下部の一番大きなボタンをタップしてください'
	String get failureReason => '画面下部の一番大きなボタンをタップしてください';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '誰かに画面を見られそう！残高を隠してください'
	String get missionText => '誰かに画面を見られそう！残高を隠してください';

	/// ja: '残高の横にある「目のアイコン」をタップしてください'
	String get failureReason => '残高の横にある「目のアイコン」をタップしてください';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '友達に5,000円を送金してください'
	String get missionText => '友達に5,000円を送金してください';

	/// ja: '「送金」アイコンをタップして、5000と入力し、送金ボタンを押してください'
	String get failureReason => '「送金」アイコンをタップして、5000と入力し、送金ボタンを押してください';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '残高が足りません！支払い方法を「クレジットカード」に変更してバーコードを提示してください'
	String get missionText => '残高が足りません！支払い方法を「クレジットカード」に変更してバーコードを提示してください';

	/// ja: 'クレジットカードを選択してから支払い画面を開いてください'
	String get failureReason => 'クレジットカードを選択してから支払い画面を開いてください';

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

	/// ja: '送金'
	String get send => '送金';

	/// ja: '受け取る'
	String get receive => '受け取る';

	/// ja: '履歴'
	String get history => '履歴';

	/// ja: 'QRコード'
	String get qrCode => 'QRコード';

	/// ja: 'スキャン'
	String get scanQr => 'スキャン';

	/// ja: 'ポイント'
	String get point => 'ポイント';

	/// ja: 'チャージ'
	String get topUp => 'チャージ';

	/// ja: '金額'
	String get amount => '金額';

	/// ja: '確認'
	String get confirm => '確認';

	/// ja: '送金先'
	String get sendTo => '送金先';

	/// ja: '送金する'
	String get sendMoney => '送金する';

	/// ja: 'キャンセル'
	String get cancel => 'キャンセル';

	/// ja: 'タップして確認'
	String get tapToReveal => 'タップして確認';

	/// ja: '円'
	String get yen => '円';

	/// ja: '支払い'
	String get payment => '支払い';

	/// ja: 'クレジットカード'
	String get creditCard => 'クレジットカード';

	/// ja: '支払い元'
	String get paymentSource => '支払い元';

	/// ja: '残高払い'
	String get balancePayment => '残高払い';

	/// ja: 'スキャン'
	String get scan => 'スキャン';

	/// ja: 'その他'
	String get more => 'その他';

	/// ja: 'ホーム'
	String get home => 'ホーム';

	/// ja: 'アカウント'
	String get account => 'アカウント';

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

	/// ja: 'すべて'
	String get txFilterAll => 'すべて';

	/// ja: '支払い'
	String get txFilterOut => '支払い';

	/// ja: '受け取り'
	String get txFilterIn => '受け取り';

	/// ja: '今月'
	String get txMonthLabel => '今月';

	/// ja: '今月の合計'
	String get txMonthTotal => '今月の合計';

	/// ja: 'ポイント残高'
	String get pointBalance => 'ポイント残高';

	/// ja: '有効期限'
	String get pointExpiry => '有効期限';

	/// ja: '2026年12月31日まで'
	String get expiryDate => '2026年12月31日まで';

	/// ja: 'ポイントを貯める'
	String get earnPoints => 'ポイントを貯める';

	/// ja: 'ショッピング'
	String get shopService => 'ショッピング';

	/// ja: 'ミッション'
	String get missionService => 'ミッション';

	/// ja: 'キャンペーン'
	String get campaignService => 'キャンペーン';

	/// ja: 'ポイント履歴'
	String get pointHistory => 'ポイント履歴';

	/// ja: 'お買い物'
	String get pointItem1 => 'お買い物';

	/// ja: 'デイリーボーナス'
	String get pointItem2 => 'デイリーボーナス';

	/// ja: '友達招待'
	String get pointItem3 => '友達招待';

	/// ja: '+50'
	String get pointGained1 => '+50';

	/// ja: '+10'
	String get pointGained2 => '+10';

	/// ja: '+200'
	String get pointGained3 => '+200';

	/// ja: '今日'
	String get pointDate1 => '今日';

	/// ja: '昨日'
	String get pointDate2 => '昨日';

	/// ja: '3日前'
	String get pointDate3 => '3日前';

	/// ja: 'マイアカウント'
	String get myAccount => 'マイアカウント';

	/// ja: 'ユーザーID'
	String get userId => 'ユーザーID';

	/// ja: 'user_12345'
	String get userIdValue => 'user_12345';

	/// ja: '支払い方法'
	String get paymentMethods => '支払い方法';

	/// ja: 'クレジットカード登録済み'
	String get addedCard => 'クレジットカード登録済み';

	/// ja: '銀行口座'
	String get bankAccount => '銀行口座';

	/// ja: 'セキュリティ設定'
	String get securitySettings => 'セキュリティ設定';

	/// ja: '通知設定'
	String get notificationSettings => '通知設定';

	/// ja: 'アプリ設定'
	String get appSettings => 'アプリ設定';

	/// ja: 'ヘルプセンター'
	String get helpCenter => 'ヘルプセンター';

	/// ja: 'ログアウト'
	String get logOut => 'ログアウト';

	/// ja: 'P'
	String get pointUnit => 'P';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ支払いボタンがわかった？'
	String get title => 'なぜ支払いボタンがわかった？';

	/// ja: '一番大きなボタン＝アプリの主目的'
	String get subtitle => '一番大きなボタン＝アプリの主目的';

	/// ja: '中央の巨大ボタンは「メインアクション」'
	String get qrTitle => '中央の巨大ボタンは「メインアクション」';

	/// ja: 'ボトムナビゲーションの中央に突出したボタンは、そのアプリで最もよく使う操作を意味する。決済アプリでは「支払い」がそれにあたる。'
	String get qrDesc => 'ボトムナビゲーションの中央に突出したボタンは、そのアプリで最もよく使う操作を意味する。決済アプリでは「支払い」がそれにあたる。';

	/// ja: 'アプリのテーマカラーが「重要度」を示す'
	String get cameraTitle => 'アプリのテーマカラーが「重要度」を示す';

	/// ja: '赤や青など、アプリのメインカラーで強調されたボタンは、最も重要なアクションを示すサインとして使われる。'
	String get cameraDesc => '赤や青など、アプリのメインカラーで強調されたボタンは、最も重要なアクションを示すサインとして使われる。';

	/// ja: '出っ張ったデザイン＝「押してほしい」サイン'
	String get colorTitle => '出っ張ったデザイン＝「押してほしい」サイン';

	/// ja: '他のボタンより大きく、上方向に飛び出したデザインは「このボタンを使ってほしい」という強力なアフォーダンスを持つ。'
	String get colorDesc => '他のボタンより大きく、上方向に飛び出したデザインは「このボタンを使ってほしい」という強力なアフォーダンスを持つ。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ残高を隠せた？'
	String get title => 'なぜ残高を隠せた？';

	/// ja: '👁️ アイコン＝表示/非表示の切り替え'
	String get subtitle => '👁️ アイコン＝表示/非表示の切り替え';

	/// ja: '目のアイコンは「表示/非表示」を意味する'
	String get eyeTitle => '目のアイコンは「表示/非表示」を意味する';

	/// ja: '目を開いたアイコンは「情報が表示されている」状態で、タップすると非表示に切り替わる。パスワードフィールドや残高表示で広く使われるUIパターン。'
	String get eyeDesc => '目を開いたアイコンは「情報が表示されている」状態で、タップすると非表示に切り替わる。パスワードフィールドや残高表示で広く使われるUIパターン。';

	/// ja: '「***」は情報が隠れているサイン'
	String get maskTitle => '「***」は情報が隠れているサイン';

	/// ja: '金額などのセンシティブな情報をアスタリスク（***）で伏せる表示は、「情報は存在するが隠れている」ことを示すUIパターン。'
	String get maskDesc => '金額などのセンシティブな情報をアスタリスク（***）で伏せる表示は、「情報は存在するが隠れている」ことを示すUIパターン。';

	/// ja: 'プライバシー保護は「見た目」で伝わる'
	String get privacyTitle => 'プライバシー保護は「見た目」で伝わる';

	/// ja: '情報が隠れたことで、自分が正しい操作をしたとわかる。UIのフィードバックが操作の成否を即座に教えてくれる。'
	String get privacyDesc => '情報が隠れたことで、自分が正しい操作をしたとわかる。UIのフィードバックが操作の成否を即座に教えてくれる。';
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

	/// ja: 'なぜ支払い方法を変更できた？'
	String get title => 'なぜ支払い方法を変更できた？';

	/// ja: '2つのルートで支払い元を変えられる'
	String get subtitle => '2つのルートで支払い元を変えられる';

	/// ja: '支払い画面から変更（ルートA）'
	String get routeATitle => '支払い画面から変更（ルートA）';

	/// ja: '支払い画面を開き、バーコード下の「支払い元ボタン」をタップするとボトムシートが開いて支払い方法を選択できる。「現在の設定値＝タップで変更」というメンタルモデル。'
	String get routeADesc => '支払い画面を開き、バーコード下の「支払い元ボタン」をタップするとボトムシートが開いて支払い方法を選択できる。「現在の設定値＝タップで変更」というメンタルモデル。';

	/// ja: 'ホーム画面でスワイプして変更（ルートB）'
	String get routeBTitle => 'ホーム画面でスワイプして変更（ルートB）';

	/// ja: 'ホーム画面の「支払い元カード」を左右にスワイプすると支払い方法を切り替えられる。「カード状UIはスワイプで切替」という現代的なジェスチャーUIの理解。'
	String get routeBDesc => 'ホーム画面の「支払い元カード」を左右にスワイプすると支払い方法を切り替えられる。「カード状UIはスワイプで切替」という現代的なジェスチャーUIの理解。';

	/// ja: '設定値が書かれた場所はタップで変更できる'
	String get dropdownTitle => '設定値が書かれた場所はタップで変更できる';

	/// ja: '現在の設定が表示されているボタンやラベルは、タップでドロップダウンや選択画面が開くUIパターン。銀行・ショッピングアプリで広く使われる。'
	String get dropdownDesc => '現在の設定が表示されているボタンやラベルは、タップでドロップダウンや選択画面が開くUIパターン。銀行・ショッピングアプリで広く使われる。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'レジに来ました。バーコードを提示してください',
			'quiz1.failureReason' => '画面下部の一番大きなボタンをタップしてください',
			'quiz1.insight.title' => 'なぜ支払いボタンがわかった？',
			'quiz1.insight.subtitle' => '一番大きなボタン＝アプリの主目的',
			'quiz1.insight.qrTitle' => '中央の巨大ボタンは「メインアクション」',
			'quiz1.insight.qrDesc' => 'ボトムナビゲーションの中央に突出したボタンは、そのアプリで最もよく使う操作を意味する。決済アプリでは「支払い」がそれにあたる。',
			'quiz1.insight.cameraTitle' => 'アプリのテーマカラーが「重要度」を示す',
			'quiz1.insight.cameraDesc' => '赤や青など、アプリのメインカラーで強調されたボタンは、最も重要なアクションを示すサインとして使われる。',
			'quiz1.insight.colorTitle' => '出っ張ったデザイン＝「押してほしい」サイン',
			'quiz1.insight.colorDesc' => '他のボタンより大きく、上方向に飛び出したデザインは「このボタンを使ってほしい」という強力なアフォーダンスを持つ。',
			'quiz2.missionText' => '誰かに画面を見られそう！残高を隠してください',
			'quiz2.failureReason' => '残高の横にある「目のアイコン」をタップしてください',
			'quiz2.insight.title' => 'なぜ残高を隠せた？',
			'quiz2.insight.subtitle' => '👁️ アイコン＝表示/非表示の切り替え',
			'quiz2.insight.eyeTitle' => '目のアイコンは「表示/非表示」を意味する',
			'quiz2.insight.eyeDesc' => '目を開いたアイコンは「情報が表示されている」状態で、タップすると非表示に切り替わる。パスワードフィールドや残高表示で広く使われるUIパターン。',
			'quiz2.insight.maskTitle' => '「***」は情報が隠れているサイン',
			'quiz2.insight.maskDesc' => '金額などのセンシティブな情報をアスタリスク（***）で伏せる表示は、「情報は存在するが隠れている」ことを示すUIパターン。',
			'quiz2.insight.privacyTitle' => 'プライバシー保護は「見た目」で伝わる',
			'quiz2.insight.privacyDesc' => '情報が隠れたことで、自分が正しい操作をしたとわかる。UIのフィードバックが操作の成否を即座に教えてくれる。',
			'quiz3.missionText' => '友達に5,000円を送金してください',
			'quiz3.failureReason' => '「送金」アイコンをタップして、5000と入力し、送金ボタンを押してください',
			'quiz3.insight.title' => 'なぜ送金の手順がわかった？',
			'quiz3.insight.subtitle' => '3ステップが送金UIの定番フロー',
			'quiz3.insight.sendTitle' => '「送る」アイコンは上矢印または紙飛行機',
			'quiz3.insight.sendDesc' => '送信・送金を表すUIアイコンとして、上向きの矢印や紙飛行機が広く使われている。メールやSNSの送信ボタンと同じ感覚で操作できる。',
			'quiz3.insight.amountTitle' => '数字キーボードは金額入力の定番',
			'quiz3.insight.amountDesc' => '金額入力にはテンキー（数字キーボード）が表示される。銀行アプリ・キャッシュレス決済アプリともに共通するUIパターン。',
			'quiz3.insight.confirmTitle' => '最終確認画面は「間違えた時のため」',
			'quiz3.insight.confirmDesc' => '送金などの重要な操作では、実行前に確認画面を挟むことが多い。これにより誤操作を防ぐ安全設計になっている。',
			'quiz4.missionText' => '残高が足りません！支払い方法を「クレジットカード」に変更してバーコードを提示してください',
			'quiz4.failureReason' => 'クレジットカードを選択してから支払い画面を開いてください',
			'quiz4.insight.title' => 'なぜ支払い方法を変更できた？',
			'quiz4.insight.subtitle' => '2つのルートで支払い元を変えられる',
			'quiz4.insight.routeATitle' => '支払い画面から変更（ルートA）',
			'quiz4.insight.routeADesc' => '支払い画面を開き、バーコード下の「支払い元ボタン」をタップするとボトムシートが開いて支払い方法を選択できる。「現在の設定値＝タップで変更」というメンタルモデル。',
			'quiz4.insight.routeBTitle' => 'ホーム画面でスワイプして変更（ルートB）',
			'quiz4.insight.routeBDesc' => 'ホーム画面の「支払い元カード」を左右にスワイプすると支払い方法を切り替えられる。「カード状UIはスワイプで切替」という現代的なジェスチャーUIの理解。',
			'quiz4.insight.dropdownTitle' => '設定値が書かれた場所はタップで変更できる',
			'quiz4.insight.dropdownDesc' => '現在の設定が表示されているボタンやラベルは、タップでドロップダウンや選択画面が開くUIパターン。銀行・ショッピングアプリで広く使われる。',
			'common.appTitle' => 'Pay',
			'common.balance' => '残高',
			'common.send' => '送金',
			'common.receive' => '受け取る',
			'common.history' => '履歴',
			'common.qrCode' => 'QRコード',
			'common.scanQr' => 'スキャン',
			'common.point' => 'ポイント',
			'common.topUp' => 'チャージ',
			'common.amount' => '金額',
			'common.confirm' => '確認',
			'common.sendTo' => '送金先',
			'common.sendMoney' => '送金する',
			'common.cancel' => 'キャンセル',
			'common.tapToReveal' => 'タップして確認',
			'common.yen' => '円',
			'common.payment' => '支払い',
			'common.creditCard' => 'クレジットカード',
			'common.paymentSource' => '支払い元',
			'common.balancePayment' => '残高払い',
			'common.scan' => 'スキャン',
			'common.more' => 'その他',
			'common.home' => 'ホーム',
			'common.account' => 'アカウント',
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
			'common.txFilterAll' => 'すべて',
			'common.txFilterOut' => '支払い',
			'common.txFilterIn' => '受け取り',
			'common.txMonthLabel' => '今月',
			'common.txMonthTotal' => '今月の合計',
			'common.pointBalance' => 'ポイント残高',
			'common.pointExpiry' => '有効期限',
			'common.expiryDate' => '2026年12月31日まで',
			'common.earnPoints' => 'ポイントを貯める',
			'common.shopService' => 'ショッピング',
			'common.missionService' => 'ミッション',
			'common.campaignService' => 'キャンペーン',
			'common.pointHistory' => 'ポイント履歴',
			'common.pointItem1' => 'お買い物',
			'common.pointItem2' => 'デイリーボーナス',
			'common.pointItem3' => '友達招待',
			'common.pointGained1' => '+50',
			'common.pointGained2' => '+10',
			'common.pointGained3' => '+200',
			'common.pointDate1' => '今日',
			'common.pointDate2' => '昨日',
			'common.pointDate3' => '3日前',
			'common.myAccount' => 'マイアカウント',
			'common.userId' => 'ユーザーID',
			'common.userIdValue' => 'user_12345',
			'common.paymentMethods' => '支払い方法',
			'common.addedCard' => 'クレジットカード登録済み',
			'common.bankAccount' => '銀行口座',
			'common.securitySettings' => 'セキュリティ設定',
			'common.notificationSettings' => '通知設定',
			'common.appSettings' => 'アプリ設定',
			'common.helpCenter' => 'ヘルプセンター',
			'common.logOut' => 'ログアウト',
			'common.pointUnit' => 'P',
			_ => null,
		};
	}
}
