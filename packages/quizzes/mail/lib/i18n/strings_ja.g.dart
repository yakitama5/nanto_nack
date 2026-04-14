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

	/// ja: '上から3番目のメールをアーカイブしよう'
	String get missionText => '上から3番目のメールをアーカイブしよう';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ゴミ箱を空にしよう'
	String get missionText => 'ゴミ箱を空にしよう';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '3件のメールを選択して削除しよう'
	String get missionText => '3件のメールを選択して削除しよう';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '5Mバイト以上のメールを検索しよう'
	String get missionText => '5Mバイト以上のメールを検索しよう';

	/// ja: 'ヒント: サイズ指定検索は larger:5M のように入力！'
	String get hint => 'ヒント: サイズ指定検索は larger:5M のように入力！';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'Mail'
	String get appTitle => 'Mail';

	/// ja: '受信トレイ'
	String get inbox => '受信トレイ';

	/// ja: '送信済み'
	String get sent => '送信済み';

	/// ja: 'ゴミ箱'
	String get trash => 'ゴミ箱';

	/// ja: 'アーカイブ'
	String get archive => 'アーカイブ';

	/// ja: 'メールを検索'
	String get searchHint => 'メールを検索';

	/// ja: 'ゴミ箱を空にする'
	String get emptyTrash => 'ゴミ箱を空にする';

	/// ja: '{count}件選択中'
	String get selectedCount => '{count}件選択中';

	/// ja: 'メールはありません'
	String get noMails => 'メールはありません';

	/// ja: '未読'
	String get unread => '未読';

	/// ja: 'アーカイブ'
	String get archiveAction => 'アーカイブ';

	/// ja: '削除'
	String get deleteAction => '削除';

	/// ja: '検索クエリを入力してEnterを押してください'
	String get searchPrompt => '検索クエリを入力してEnterを押してください';

	/// ja: 'ヒント'
	String get hintTooltip => 'ヒント';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜスワイプでアーカイブできるとわかった？'
	String get title => 'なぜスワイプでアーカイブできるとわかった？';

	/// ja: '方向とアイコンが操作を教えてくれる'
	String get subtitle => '方向とアイコンが操作を教えてくれる';

	/// ja: '左スワイプ＝「整理する」のサイン'
	String get swipeTitle => '左スワイプ＝「整理する」のサイン';

	/// ja: 'メール・タスクアプリで右から左へのスワイプは「アーカイブ」や「完了」を意味する標準UIパターン。Gmailなどでも採用されている。'
	String get swipeDesc => 'メール・タスクアプリで右から左へのスワイプは「アーカイブ」や「完了」を意味する標準UIパターン。Gmailなどでも採用されている。';

	/// ja: '緑色＝「安全・保存」の記号'
	String get greenTitle => '緑色＝「安全・保存」の記号';

	/// ja: '赤が「削除・危険」なのに対し、緑は「保存・安全」を意味する色として世界中のUIで使われている。'
	String get greenDesc => '赤が「削除・危険」なのに対し、緑は「保存・安全」を意味する色として世界中のUIで使われている。';

	/// ja: '箱アイコン＝アーカイブの世界標準'
	String get archiveTitle => '箱アイコン＝アーカイブの世界標準';

	/// ja: '下向き矢印付きの箱（📦）はGmail・Outlook問わず「アーカイブ」を示す共通アイコン。言語を読まなくても意味が伝わる。'
	String get archiveDesc => '下向き矢印付きの箱（📦）はGmail・Outlook問わず「アーカイブ」を示す共通アイコン。言語を読まなくても意味が伝わる。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜドロワーからゴミ箱に移動できた？'
	String get title => 'なぜドロワーからゴミ箱に移動できた？';

	/// ja: 'ハンバーガーメニューはフォルダの入口'
	String get subtitle => 'ハンバーガーメニューはフォルダの入口';

	/// ja: 'ハンバーガー＝「もっとある」のサイン'
	String get drawerTitle => 'ハンバーガー＝「もっとある」のサイン';

	/// ja: '三本線（☰）アイコンは「隠れたメニューを開く」を意味する世界共通のUI記号。GmailやOutlookでも同じアイコンが使われている。'
	String get drawerDesc => '三本線（☰）アイコンは「隠れたメニューを開く」を意味する世界共通のUI記号。GmailやOutlookでも同じアイコンが使われている。';

	/// ja: 'ゴミ箱アイコン＝削除済みの置き場'
	String get trashTitle => 'ゴミ箱アイコン＝削除済みの置き場';

	/// ja: '🗑️アイコンはOSを問わず「ゴミ箱・削除済みアイテム」を示す。GmailではTrash、iOSでは「削除済み」フォルダと呼ばれるが、アイコンで場所を瞬時に特定できる。'
	String get trashDesc => '🗑️アイコンはOSを問わず「ゴミ箱・削除済みアイテム」を示す。GmailではTrash、iOSでは「削除済み」フォルダと呼ばれるが、アイコンで場所を瞬時に特定できる。';

	/// ja: '「空にする」ボタンで永久削除'
	String get emptyTitle => '「空にする」ボタンで永久削除';

	/// ja: 'ゴミ箱は「一時保管場所」。Empty Trash（空にする）ボタンを押すまでデータは残るという設計は、誤削除を防ぐ安全設計だ。'
	String get emptyDesc => 'ゴミ箱は「一時保管場所」。Empty Trash（空にする）ボタンを押すまでデータは残るという設計は、誤削除を防ぐ安全設計だ。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ長押しで複数選択できるとわかった？'
	String get title => 'なぜ長押しで複数選択できるとわかった？';

	/// ja: '選択モードへの入口は「長押し」'
	String get subtitle => '選択モードへの入口は「長押し」';

	/// ja: '長押し＝「選択モード」への切り替え'
	String get longPressTitle => '長押し＝「選択モード」への切り替え';

	/// ja: 'メール・ファイル管理アプリで長押しは「複数選択モードを開始する」標準インタラクション。GmailもiOSメールも同じパターン。'
	String get longPressDesc => 'メール・ファイル管理アプリで長押しは「複数選択モードを開始する」標準インタラクション。GmailもiOSメールも同じパターン。';

	/// ja: 'チェックマークが選択状態を可視化する'
	String get checkTitle => 'チェックマークが選択状態を可視化する';

	/// ja: '✓マークは「選択済み」を示す世界共通の記号。チェックボックスと組み合わせることで、何件選んだかが一目でわかる。'
	String get checkDesc => '✓マークは「選択済み」を示す世界共通の記号。チェックボックスと組み合わせることで、何件選んだかが一目でわかる。';

	/// ja: 'ヘッダーが変化して操作を案内する'
	String get headerTitle => 'ヘッダーが変化して操作を案内する';

	/// ja: '選択モードに入るとヘッダーが青くなり件数と操作アイコンが現れる。この「コンテキスト依存UI変化」はAndroid Contextual Action Barの標準パターン。'
	String get headerDesc => '選択モードに入るとヘッダーが青くなり件数と操作アイコンが現れる。この「コンテキスト依存UI変化」はAndroid Contextual Action Barの標準パターン。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ「larger:5M」というコマンドを思いついた？'
	String get title => 'なぜ「larger:5M」というコマンドを思いついた？';

	/// ja: '検索演算子がメールを絞り込む'
	String get subtitle => '検索演算子がメールを絞り込む';

	/// ja: '検索演算子＝コマンドで条件を指定'
	String get operatorTitle => '検索演算子＝コマンドで条件を指定';

	/// ja: 'Gmailでは「larger:5M」「from:alice」「has:attachment」など検索演算子で高度な絞り込みができる。これはプログラマー向けではなく、一般ユーザー向けの機能だ。'
	String get operatorDesc => 'Gmailでは「larger:5M」「from:alice」「has:attachment」など検索演算子で高度な絞り込みができる。これはプログラマー向けではなく、一般ユーザー向けの機能だ。';

	/// ja: '5M＝5メガバイトのサイズ指定'
	String get sizeTitle => '5M＝5メガバイトのサイズ指定';

	/// ja: '「M」はメガバイト（MB）の略。大きな添付ファイルのあるメールを探すときに使う検索条件で、Gmailが長年提供している標準機能。'
	String get sizeDesc => '「M」はメガバイト（MB）の略。大きな添付ファイルのあるメールを探すときに使う検索条件で、Gmailが長年提供している標準機能。';

	/// ja: 'ヒント機能が正解へ誘導する'
	String get hintTitle => 'ヒント機能が正解へ誘導する';

	/// ja: '「？」アイコンや「ヒント」ボタンは「困ったときの助け船」として多くのアプリに用意されている。検索の使い方を知らなくても、ヒントが正解を教えてくれる設計だ。'
	String get hintDesc => '「？」アイコンや「ヒント」ボタンは「困ったときの助け船」として多くのアプリに用意されている。検索の使い方を知らなくても、ヒントが正解を教えてくれる設計だ。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => '上から3番目のメールをアーカイブしよう',
			'quiz1.insight.title' => 'なぜスワイプでアーカイブできるとわかった？',
			'quiz1.insight.subtitle' => '方向とアイコンが操作を教えてくれる',
			'quiz1.insight.swipeTitle' => '左スワイプ＝「整理する」のサイン',
			'quiz1.insight.swipeDesc' => 'メール・タスクアプリで右から左へのスワイプは「アーカイブ」や「完了」を意味する標準UIパターン。Gmailなどでも採用されている。',
			'quiz1.insight.greenTitle' => '緑色＝「安全・保存」の記号',
			'quiz1.insight.greenDesc' => '赤が「削除・危険」なのに対し、緑は「保存・安全」を意味する色として世界中のUIで使われている。',
			'quiz1.insight.archiveTitle' => '箱アイコン＝アーカイブの世界標準',
			'quiz1.insight.archiveDesc' => '下向き矢印付きの箱（📦）はGmail・Outlook問わず「アーカイブ」を示す共通アイコン。言語を読まなくても意味が伝わる。',
			'quiz2.missionText' => 'ゴミ箱を空にしよう',
			'quiz2.insight.title' => 'なぜドロワーからゴミ箱に移動できた？',
			'quiz2.insight.subtitle' => 'ハンバーガーメニューはフォルダの入口',
			'quiz2.insight.drawerTitle' => 'ハンバーガー＝「もっとある」のサイン',
			'quiz2.insight.drawerDesc' => '三本線（☰）アイコンは「隠れたメニューを開く」を意味する世界共通のUI記号。GmailやOutlookでも同じアイコンが使われている。',
			'quiz2.insight.trashTitle' => 'ゴミ箱アイコン＝削除済みの置き場',
			'quiz2.insight.trashDesc' => '🗑️アイコンはOSを問わず「ゴミ箱・削除済みアイテム」を示す。GmailではTrash、iOSでは「削除済み」フォルダと呼ばれるが、アイコンで場所を瞬時に特定できる。',
			'quiz2.insight.emptyTitle' => '「空にする」ボタンで永久削除',
			'quiz2.insight.emptyDesc' => 'ゴミ箱は「一時保管場所」。Empty Trash（空にする）ボタンを押すまでデータは残るという設計は、誤削除を防ぐ安全設計だ。',
			'quiz3.missionText' => '3件のメールを選択して削除しよう',
			'quiz3.insight.title' => 'なぜ長押しで複数選択できるとわかった？',
			'quiz3.insight.subtitle' => '選択モードへの入口は「長押し」',
			'quiz3.insight.longPressTitle' => '長押し＝「選択モード」への切り替え',
			'quiz3.insight.longPressDesc' => 'メール・ファイル管理アプリで長押しは「複数選択モードを開始する」標準インタラクション。GmailもiOSメールも同じパターン。',
			'quiz3.insight.checkTitle' => 'チェックマークが選択状態を可視化する',
			'quiz3.insight.checkDesc' => '✓マークは「選択済み」を示す世界共通の記号。チェックボックスと組み合わせることで、何件選んだかが一目でわかる。',
			'quiz3.insight.headerTitle' => 'ヘッダーが変化して操作を案内する',
			'quiz3.insight.headerDesc' => '選択モードに入るとヘッダーが青くなり件数と操作アイコンが現れる。この「コンテキスト依存UI変化」はAndroid Contextual Action Barの標準パターン。',
			'quiz4.missionText' => '5Mバイト以上のメールを検索しよう',
			'quiz4.hint' => 'ヒント: サイズ指定検索は larger:5M のように入力！',
			'quiz4.insight.title' => 'なぜ「larger:5M」というコマンドを思いついた？',
			'quiz4.insight.subtitle' => '検索演算子がメールを絞り込む',
			'quiz4.insight.operatorTitle' => '検索演算子＝コマンドで条件を指定',
			'quiz4.insight.operatorDesc' => 'Gmailでは「larger:5M」「from:alice」「has:attachment」など検索演算子で高度な絞り込みができる。これはプログラマー向けではなく、一般ユーザー向けの機能だ。',
			'quiz4.insight.sizeTitle' => '5M＝5メガバイトのサイズ指定',
			'quiz4.insight.sizeDesc' => '「M」はメガバイト（MB）の略。大きな添付ファイルのあるメールを探すときに使う検索条件で、Gmailが長年提供している標準機能。',
			'quiz4.insight.hintTitle' => 'ヒント機能が正解へ誘導する',
			'quiz4.insight.hintDesc' => '「？」アイコンや「ヒント」ボタンは「困ったときの助け船」として多くのアプリに用意されている。検索の使い方を知らなくても、ヒントが正解を教えてくれる設計だ。',
			'common.appTitle' => 'Mail',
			'common.inbox' => '受信トレイ',
			'common.sent' => '送信済み',
			'common.trash' => 'ゴミ箱',
			'common.archive' => 'アーカイブ',
			'common.searchHint' => 'メールを検索',
			'common.emptyTrash' => 'ゴミ箱を空にする',
			'common.selectedCount' => '{count}件選択中',
			'common.noMails' => 'メールはありません',
			'common.unread' => '未読',
			'common.archiveAction' => 'アーカイブ',
			'common.deleteAction' => '削除',
			'common.searchPrompt' => '検索クエリを入力してEnterを押してください',
			'common.hintTooltip' => 'ヒント',
			_ => null,
		};
	}
}
