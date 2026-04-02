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
	@override late final _TranslationsContactsJa contacts = _TranslationsContactsJa._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Ja implements TranslationsQuiz1En {
	_TranslationsQuiz1Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'メッセージを送ってください';
	@override late final _TranslationsQuiz1InsightJa insight = _TranslationsQuiz1InsightJa._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Ja implements TranslationsQuiz2En {
	_TranslationsQuiz2Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'スタンプを送ってください';
	@override late final _TranslationsQuiz2InsightJa insight = _TranslationsQuiz2InsightJa._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Ja implements TranslationsQuiz3En {
	_TranslationsQuiz3Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'メッセージを長押しして削除してください';
	@override late final _TranslationsQuiz3InsightJa insight = _TranslationsQuiz3InsightJa._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Ja implements TranslationsQuiz4En {
	_TranslationsQuiz4Ja._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'グループチャットを作成してください';
	@override late final _TranslationsQuiz4InsightJa insight = _TranslationsQuiz4InsightJa._(_root);
}

// Path: common
class _TranslationsCommonJa implements TranslationsCommonEn {
	_TranslationsCommonJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Talks';
	@override String get talkTab => 'Talks';
	@override String get searchTab => 'Search';
	@override String get callTab => 'Calls';
	@override String get walletTab => 'Wallet';
	@override String get newsTab => 'News';
	@override String get sendButton => 'Send';
	@override String get stampButton => 'Stamp';
	@override String get deleteButton => 'Delete';
	@override String get cancelButton => 'Cancel';
	@override String get confirmDelete => 'Delete this message?';
	@override String get createGroup => 'Create Group';
	@override String get groupName => 'Group Name';
	@override String get selectMembers => 'Select Members';
	@override String get createButton => 'Create';
	@override String get backButton => 'Back';
	@override String get members => '{count} members';
	@override String get online => 'Online';
	@override String get typeMessage => 'Type a message';
	@override String get newGroup => 'New Group';
	@override String get newChat => 'New Chat';
}

// Path: contacts
class _TranslationsContactsJa implements TranslationsContactsEn {
	_TranslationsContactsJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get alice => 'Alice';
	@override String get bob => 'Bob';
	@override String get carol => 'Carol';
	@override String get team => 'Project Team';
	@override String get mom => 'Mom';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightJa implements TranslationsQuiz1InsightEn {
	_TranslationsQuiz1InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ文字が読めなくても操作できた？';
	@override String get subtitle => 'チャットUIの普遍的なパターンが操作を導く';
	@override String get inputTitle => '入力欄は世界共通のUI';
	@override String get inputDesc => 'テキスト入力ボックス＋送信ボタンという組み合わせは、WhatsApp・LINE・Slack など世界中のチャットアプリで採用されている。このパターンを一度体験すると、言語に関係なく直感的に操作できるようになる。';
	@override String get sendTitle => '→ ボタンは「送信」の記号';
	@override String get sendDesc => '右向きの矢印（→）や紙飛行機アイコンは、「送る」「進む」を意味する記号として文化を超えて定着している。アイコンそのものが言語の役割を果たしている。';
	@override String get bubbleTitle => '吹き出しが会話を可視化する';
	@override String get bubbleDesc => '右側＝自分、左側＝相手という吹き出しレイアウトは、チャットUIのデファクトスタンダード。誰が何を言ったかを色と位置だけで瞬時に判断できる。';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightJa implements TranslationsQuiz2InsightEn {
	_TranslationsQuiz2InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜスタンプボタンがわかった？';
	@override String get subtitle => '絵文字とスタンプは感情の「共通言語」';
	@override String get emojiTitle => '絵文字は言語を超えた感情表現';
	@override String get emojiDesc => '😊や👍などの絵文字は、言語に依存せず感情をダイレクトに伝える記号だ。1999年に日本で生まれたこの文化は、現在は全世界の標準となっている。';
	@override String get iconTitle => 'スタンプボタンのアイコンが意味を伝える';
	@override String get iconDesc => 'スマイルマーク（😊）や絵文字パレットのアイコンは、「ここを押すとスタンプが出る」ことを直感的に示す。UIアイコンは文字を読まずとも意味を伝える視覚的なコードだ。';
	@override String get colorTitle => 'グリーンテーマが「チャット」を想起させる';
	@override String get colorDesc => 'LINEの緑色は「メッセージアプリ」の記号として日本人に深く刷り込まれている。色だけで「これはチャットアプリだ」と認識できるのは、反復されたUIパターンが色に意味を与えた結果だ。';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightJa implements TranslationsQuiz3InsightEn {
	_TranslationsQuiz3InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜ長押しで削除できるとわかった？';
	@override String get subtitle => 'コンテキストメニューは「隠れた機能」への扉';
	@override String get longPressTitle => '長押しは「もっとできること」のサイン';
	@override String get longPressDesc => 'タップして反応しないUIは、長押しで追加メニューが出ることが多い。iOS・Androidの標準的なインタラクションパターンとして定着しており、ユーザーは無意識に試してみるようになっている。';
	@override String get contextMenuTitle => 'コンテキストメニューが操作を提示する';
	@override String get contextMenuDesc => '長押しで出現するメニューは「このアイテムに対して今できること」をリスト化したもの。削除・コピー・返信などの選択肢が並ぶパターンは、メッセージアプリの標準仕様だ。';
	@override String get destructiveTitle => '赤色が「危険な操作」を警告する';
	@override String get destructiveDesc => '削除ボタンが赤い理由は、「取り消せない操作」を色で警告するためだ。赤＝危険・警告は信号機から染み込んだ文化的な記号であり、UIデザインに意図的に取り込まれている。';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightJa implements TranslationsQuiz4InsightEn {
	_TranslationsQuiz4InsightJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'なぜグループ作成の手順がわかった？';
	@override String get subtitle => 'ウィザード形式のUIが手順を自然に導く';
	@override String get plusTitle => '＋ボタンは「新しく作る」の記号';
	@override String get plusDesc => '＋（プラス）アイコンは「追加」「作成」を意味する世界共通の記号だ。FAB（フローティングアクションボタン）として画面右下に配置されるのもマテリアルデザインの標準パターンで、言語を問わず「ここで何かが作れる」と直感させる。';
	@override String get wizardTitle => 'ステップ形式が複雑な操作を分解する';
	@override String get wizardDesc => 'グループ名入力→メンバー選択→作成確認という流れは、複雑なアクションを小さなステップに分割するウィザードUIパターン。各ステップが「次に何をすべきか」を教えてくれるため、言語がわからなくても操作できる。';
	@override String get checkboxTitle => 'チェックボックスが「選択済み」を視覚化する';
	@override String get checkboxDesc => '✓マークのチェックボックスは選択状態を直感的に示す。複数選択UIとしてフォーム・メンバー選択・フィルターで世界中で使われており、その意味は言語を超えて理解されている。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'メッセージを送ってください',
			'quiz1.insight.title' => 'なぜ文字が読めなくても操作できた？',
			'quiz1.insight.subtitle' => 'チャットUIの普遍的なパターンが操作を導く',
			'quiz1.insight.inputTitle' => '入力欄は世界共通のUI',
			'quiz1.insight.inputDesc' => 'テキスト入力ボックス＋送信ボタンという組み合わせは、WhatsApp・LINE・Slack など世界中のチャットアプリで採用されている。このパターンを一度体験すると、言語に関係なく直感的に操作できるようになる。',
			'quiz1.insight.sendTitle' => '→ ボタンは「送信」の記号',
			'quiz1.insight.sendDesc' => '右向きの矢印（→）や紙飛行機アイコンは、「送る」「進む」を意味する記号として文化を超えて定着している。アイコンそのものが言語の役割を果たしている。',
			'quiz1.insight.bubbleTitle' => '吹き出しが会話を可視化する',
			'quiz1.insight.bubbleDesc' => '右側＝自分、左側＝相手という吹き出しレイアウトは、チャットUIのデファクトスタンダード。誰が何を言ったかを色と位置だけで瞬時に判断できる。',
			'quiz2.missionText' => 'スタンプを送ってください',
			'quiz2.insight.title' => 'なぜスタンプボタンがわかった？',
			'quiz2.insight.subtitle' => '絵文字とスタンプは感情の「共通言語」',
			'quiz2.insight.emojiTitle' => '絵文字は言語を超えた感情表現',
			'quiz2.insight.emojiDesc' => '😊や👍などの絵文字は、言語に依存せず感情をダイレクトに伝える記号だ。1999年に日本で生まれたこの文化は、現在は全世界の標準となっている。',
			'quiz2.insight.iconTitle' => 'スタンプボタンのアイコンが意味を伝える',
			'quiz2.insight.iconDesc' => 'スマイルマーク（😊）や絵文字パレットのアイコンは、「ここを押すとスタンプが出る」ことを直感的に示す。UIアイコンは文字を読まずとも意味を伝える視覚的なコードだ。',
			'quiz2.insight.colorTitle' => 'グリーンテーマが「チャット」を想起させる',
			'quiz2.insight.colorDesc' => 'LINEの緑色は「メッセージアプリ」の記号として日本人に深く刷り込まれている。色だけで「これはチャットアプリだ」と認識できるのは、反復されたUIパターンが色に意味を与えた結果だ。',
			'quiz3.missionText' => 'メッセージを長押しして削除してください',
			'quiz3.insight.title' => 'なぜ長押しで削除できるとわかった？',
			'quiz3.insight.subtitle' => 'コンテキストメニューは「隠れた機能」への扉',
			'quiz3.insight.longPressTitle' => '長押しは「もっとできること」のサイン',
			'quiz3.insight.longPressDesc' => 'タップして反応しないUIは、長押しで追加メニューが出ることが多い。iOS・Androidの標準的なインタラクションパターンとして定着しており、ユーザーは無意識に試してみるようになっている。',
			'quiz3.insight.contextMenuTitle' => 'コンテキストメニューが操作を提示する',
			'quiz3.insight.contextMenuDesc' => '長押しで出現するメニューは「このアイテムに対して今できること」をリスト化したもの。削除・コピー・返信などの選択肢が並ぶパターンは、メッセージアプリの標準仕様だ。',
			'quiz3.insight.destructiveTitle' => '赤色が「危険な操作」を警告する',
			'quiz3.insight.destructiveDesc' => '削除ボタンが赤い理由は、「取り消せない操作」を色で警告するためだ。赤＝危険・警告は信号機から染み込んだ文化的な記号であり、UIデザインに意図的に取り込まれている。',
			'quiz4.missionText' => 'グループチャットを作成してください',
			'quiz4.insight.title' => 'なぜグループ作成の手順がわかった？',
			'quiz4.insight.subtitle' => 'ウィザード形式のUIが手順を自然に導く',
			'quiz4.insight.plusTitle' => '＋ボタンは「新しく作る」の記号',
			'quiz4.insight.plusDesc' => '＋（プラス）アイコンは「追加」「作成」を意味する世界共通の記号だ。FAB（フローティングアクションボタン）として画面右下に配置されるのもマテリアルデザインの標準パターンで、言語を問わず「ここで何かが作れる」と直感させる。',
			'quiz4.insight.wizardTitle' => 'ステップ形式が複雑な操作を分解する',
			'quiz4.insight.wizardDesc' => 'グループ名入力→メンバー選択→作成確認という流れは、複雑なアクションを小さなステップに分割するウィザードUIパターン。各ステップが「次に何をすべきか」を教えてくれるため、言語がわからなくても操作できる。',
			'quiz4.insight.checkboxTitle' => 'チェックボックスが「選択済み」を視覚化する',
			'quiz4.insight.checkboxDesc' => '✓マークのチェックボックスは選択状態を直感的に示す。複数選択UIとしてフォーム・メンバー選択・フィルターで世界中で使われており、その意味は言語を超えて理解されている。',
			'common.appTitle' => 'Talks',
			'common.talkTab' => 'Talks',
			'common.searchTab' => 'Search',
			'common.callTab' => 'Calls',
			'common.walletTab' => 'Wallet',
			'common.newsTab' => 'News',
			'common.sendButton' => 'Send',
			'common.stampButton' => 'Stamp',
			'common.deleteButton' => 'Delete',
			'common.cancelButton' => 'Cancel',
			'common.confirmDelete' => 'Delete this message?',
			'common.createGroup' => 'Create Group',
			'common.groupName' => 'Group Name',
			'common.selectMembers' => 'Select Members',
			'common.createButton' => 'Create',
			'common.backButton' => 'Back',
			'common.members' => '{count} members',
			'common.online' => 'Online',
			'common.typeMessage' => 'Type a message',
			'common.newGroup' => 'New Group',
			'common.newChat' => 'New Chat',
			'contacts.alice' => 'Alice',
			'contacts.bob' => 'Bob',
			'contacts.carol' => 'Carol',
			'contacts.team' => 'Project Team',
			'contacts.mom' => 'Mom',
			_ => null,
		};
	}
}
