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
}

// Path: quiz1
class _TranslationsQuiz1Ja implements TranslationsQuiz1En {
	_TranslationsQuiz1Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '上から3番目のメールをアーカイブしよう';
	@override late final _TranslationsQuiz1InsightJa insight = _TranslationsQuiz1InsightJa._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Ja implements TranslationsQuiz2En {
	_TranslationsQuiz2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'ゴミ箱を空にしよう';
	@override late final _TranslationsQuiz2InsightJa insight = _TranslationsQuiz2InsightJa._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Ja implements TranslationsQuiz3En {
	_TranslationsQuiz3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '3件のメールを選択して削除しよう';
	@override late final _TranslationsQuiz3InsightJa insight = _TranslationsQuiz3InsightJa._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Ja implements TranslationsQuiz4En {
	_TranslationsQuiz4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => '5Mバイト以上のメールを検索しよう';
	@override String get hint => 'ヒント: サイズ指定検索は larger:5M のように入力！';
	@override late final _TranslationsQuiz4InsightJa insight = _TranslationsQuiz4InsightJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Mail';
	@override String get inbox => '受信トレイ';
	@override String get sent => '送信済み';
	@override String get trash => 'ゴミ箱';
	@override String get archive => 'アーカイブ';
	@override String get searchHint => 'メールを検索';
	@override String get emptyTrash => 'ゴミ箱を空にする';
	@override String get selectedCount => '{count}件選択中';
	@override String get noMails => 'メールはありません';
	@override String get unread => '未読';
	@override String get archiveAction => 'アーカイブ';
	@override String get deleteAction => '削除';
	@override String get searchPrompt => '検索クエリを入力してEnterを押してください';
	@override String get hintTooltip => 'ヒント';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightJa implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜスワイプでアーカイブできるとわかった？';
	@override String get subtitle => '方向とアイコンが操作を教えてくれる';
	@override String get swipeTitle => '左スワイプ＝「整理する」のサイン';
	@override String get swipeDesc => 'メール・タスクアプリで右から左へのスワイプは「アーカイブ」や「完了」を意味する標準UIパターン。Gmailなどでも採用されている。';
	@override String get greenTitle => '緑色＝「安全・保存」の記号';
	@override String get greenDesc => '赤が「削除・危険」なのに対し、緑は「保存・安全」を意味する色として世界中のUIで使われている。';
	@override String get archiveTitle => '箱アイコン＝アーカイブの世界標準';
	@override String get archiveDesc => '下向き矢印付きの箱（📦）はGmail・Outlook問わず「アーカイブ」を示す共通アイコン。言語を読まなくても意味が伝わる。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightJa implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜドロワーからゴミ箱に移動できた？';
	@override String get subtitle => 'ハンバーガーメニューはフォルダの入口';
	@override String get drawerTitle => 'ハンバーガー＝「もっとある」のサイン';
	@override String get drawerDesc => '三本線（☰）アイコンは「隠れたメニューを開く」を意味する世界共通のUI記号。GmailやOutlookでも同じアイコンが使われている。';
	@override String get trashTitle => 'ゴミ箱アイコン＝削除済みの置き場';
	@override String get trashDesc => '🗑️アイコンはOSを問わず「ゴミ箱・削除済みアイテム」を示す。GmailではTrash、iOSでは「削除済み」フォルダと呼ばれるが、アイコンで場所を瞬時に特定できる。';
	@override String get emptyTitle => '「空にする」ボタンで永久削除';
	@override String get emptyDesc => 'ゴミ箱は「一時保管場所」。Empty Trash（空にする）ボタンを押すまでデータは残るという設計は、誤削除を防ぐ安全設計だ。';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightJa implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ長押しで複数選択できるとわかった？';
	@override String get subtitle => '選択モードへの入口は「長押し」';
	@override String get longPressTitle => '長押し＝「選択モード」への切り替え';
	@override String get longPressDesc => 'メール・ファイル管理アプリで長押しは「複数選択モードを開始する」標準インタラクション。GmailもiOSメールも同じパターン。';
	@override String get checkTitle => 'チェックマークが選択状態を可視化する';
	@override String get checkDesc => '✓マークは「選択済み」を示す世界共通の記号。チェックボックスと組み合わせることで、何件選んだかが一目でわかる。';
	@override String get headerTitle => 'ヘッダーが変化して操作を案内する';
	@override String get headerDesc => '選択モードに入るとヘッダーが青くなり件数と操作アイコンが現れる。この「コンテキスト依存UI変化」はAndroid Contextual Action Barの標準パターン。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightJa implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ「larger:5M」というコマンドを思いついた？';
	@override String get subtitle => '検索演算子がメールを絞り込む';
	@override String get operatorTitle => '検索演算子＝コマンドで条件を指定';
	@override String get operatorDesc => 'Gmailでは「larger:5M」「from:alice」「has:attachment」など検索演算子で高度な絞り込みができる。これはプログラマー向けではなく、一般ユーザー向けの機能だ。';
	@override String get sizeTitle => '5M＝5メガバイトのサイズ指定';
	@override String get sizeDesc => '「M」はメガバイト（MB）の略。大きな添付ファイルのあるメールを探すときに使う検索条件で、Gmailが長年提供している標準機能。';
	@override String get hintTitle => 'ヒント機能が正解へ誘導する';
	@override String get hintDesc => '「？」アイコンや「ヒント」ボタンは「困ったときの助け船」として多くのアプリに用意されている。検索の使い方を知らなくても、ヒントが正解を教えてくれる設計だ。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
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
