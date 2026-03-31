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
	late final TranslationsContactsJa contacts = TranslationsContactsJa.internal(_root);
}

// Path: quiz1
class TranslationsQuiz1Ja {
	TranslationsQuiz1Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'メッセージを送ってください'
	String get missionText => 'メッセージを送ってください';

	late final TranslationsQuiz1InsightJa insight = TranslationsQuiz1InsightJa.internal(_root);
}

// Path: quiz2
class TranslationsQuiz2Ja {
	TranslationsQuiz2Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'スタンプを送ってください'
	String get missionText => 'スタンプを送ってください';

	late final TranslationsQuiz2InsightJa insight = TranslationsQuiz2InsightJa.internal(_root);
}

// Path: quiz3
class TranslationsQuiz3Ja {
	TranslationsQuiz3Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'メッセージを長押しして削除してください'
	String get missionText => 'メッセージを長押しして削除してください';

	late final TranslationsQuiz3InsightJa insight = TranslationsQuiz3InsightJa.internal(_root);
}

// Path: quiz4
class TranslationsQuiz4Ja {
	TranslationsQuiz4Ja.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'グループチャットを作成してください'
	String get missionText => 'グループチャットを作成してください';

	late final TranslationsQuiz4InsightJa insight = TranslationsQuiz4InsightJa.internal(_root);
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'Talks'
	String get appTitle => 'Talks';

	/// ja: 'Talks'
	String get talkTab => 'Talks';

	/// ja: 'Search'
	String get searchTab => 'Search';

	/// ja: 'Calls'
	String get callTab => 'Calls';

	/// ja: 'Wallet'
	String get walletTab => 'Wallet';

	/// ja: 'News'
	String get newsTab => 'News';

	/// ja: 'Send'
	String get sendButton => 'Send';

	/// ja: 'Stamp'
	String get stampButton => 'Stamp';

	/// ja: 'Delete'
	String get deleteButton => 'Delete';

	/// ja: 'Cancel'
	String get cancelButton => 'Cancel';

	/// ja: 'Delete this message?'
	String get confirmDelete => 'Delete this message?';

	/// ja: 'Create Group'
	String get createGroup => 'Create Group';

	/// ja: 'Group Name'
	String get groupName => 'Group Name';

	/// ja: 'Select Members'
	String get selectMembers => 'Select Members';

	/// ja: 'Create'
	String get createButton => 'Create';

	/// ja: 'Back'
	String get backButton => 'Back';

	/// ja: '{count} members'
	String get members => '{count} members';

	/// ja: 'Online'
	String get online => 'Online';

	/// ja: 'Type a message'
	String get typeMessage => 'Type a message';

	/// ja: 'New Group'
	String get newGroup => 'New Group';

	/// ja: 'New Chat'
	String get newChat => 'New Chat';
}

// Path: contacts
class TranslationsContactsJa {
	TranslationsContactsJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'Alice'
	String get alice => 'Alice';

	/// ja: 'Bob'
	String get bob => 'Bob';

	/// ja: 'Carol'
	String get carol => 'Carol';

	/// ja: 'Project Team'
	String get team => 'Project Team';

	/// ja: 'Mom'
	String get mom => 'Mom';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightJa {
	TranslationsQuiz1InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ文字が読めなくても操作できた？'
	String get title => 'なぜ文字が読めなくても操作できた？';

	/// ja: 'チャットUIの普遍的なパターンが操作を導く'
	String get subtitle => 'チャットUIの普遍的なパターンが操作を導く';

	/// ja: '入力欄は世界共通のUI'
	String get inputTitle => '入力欄は世界共通のUI';

	/// ja: 'テキスト入力ボックス＋送信ボタンという組み合わせは、WhatsApp・LINE・Slack など世界中のチャットアプリで採用されている。このパターンを一度体験すると、言語に関係なく直感的に操作できるようになる。'
	String get inputDesc => 'テキスト入力ボックス＋送信ボタンという組み合わせは、WhatsApp・LINE・Slack など世界中のチャットアプリで採用されている。このパターンを一度体験すると、言語に関係なく直感的に操作できるようになる。';

	/// ja: '→ ボタンは「送信」の記号'
	String get sendTitle => '→ ボタンは「送信」の記号';

	/// ja: '右向きの矢印（→）や紙飛行機アイコンは、「送る」「進む」を意味する記号として文化を超えて定着している。アイコンそのものが言語の役割を果たしている。'
	String get sendDesc => '右向きの矢印（→）や紙飛行機アイコンは、「送る」「進む」を意味する記号として文化を超えて定着している。アイコンそのものが言語の役割を果たしている。';

	/// ja: '吹き出しが会話を可視化する'
	String get bubbleTitle => '吹き出しが会話を可視化する';

	/// ja: '右側＝自分、左側＝相手という吹き出しレイアウトは、チャットUIのデファクトスタンダード。誰が何を言ったかを色と位置だけで瞬時に判断できる。'
	String get bubbleDesc => '右側＝自分、左側＝相手という吹き出しレイアウトは、チャットUIのデファクトスタンダード。誰が何を言ったかを色と位置だけで瞬時に判断できる。';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightJa {
	TranslationsQuiz2InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜスタンプボタンがわかった？'
	String get title => 'なぜスタンプボタンがわかった？';

	/// ja: '絵文字とスタンプは感情の「共通言語」'
	String get subtitle => '絵文字とスタンプは感情の「共通言語」';

	/// ja: '絵文字は言語を超えた感情表現'
	String get emojiTitle => '絵文字は言語を超えた感情表現';

	/// ja: '😊や👍などの絵文字は、言語に依存せず感情をダイレクトに伝える記号だ。1999年に日本で生まれたこの文化は、現在は全世界の標準となっている。'
	String get emojiDesc => '😊や👍などの絵文字は、言語に依存せず感情をダイレクトに伝える記号だ。1999年に日本で生まれたこの文化は、現在は全世界の標準となっている。';

	/// ja: 'スタンプボタンのアイコンが意味を伝える'
	String get iconTitle => 'スタンプボタンのアイコンが意味を伝える';

	/// ja: 'スマイルマーク（😊）や絵文字パレットのアイコンは、「ここを押すとスタンプが出る」ことを直感的に示す。UIアイコンは文字を読まずとも意味を伝える視覚的なコードだ。'
	String get iconDesc => 'スマイルマーク（😊）や絵文字パレットのアイコンは、「ここを押すとスタンプが出る」ことを直感的に示す。UIアイコンは文字を読まずとも意味を伝える視覚的なコードだ。';

	/// ja: 'グリーンテーマが「チャット」を想起させる'
	String get colorTitle => 'グリーンテーマが「チャット」を想起させる';

	/// ja: 'LINEの緑色は「メッセージアプリ」の記号として日本人に深く刷り込まれている。色だけで「これはチャットアプリだ」と認識できるのは、反復されたUIパターンが色に意味を与えた結果だ。'
	String get colorDesc => 'LINEの緑色は「メッセージアプリ」の記号として日本人に深く刷り込まれている。色だけで「これはチャットアプリだ」と認識できるのは、反復されたUIパターンが色に意味を与えた結果だ。';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightJa {
	TranslationsQuiz3InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜ長押しで削除できるとわかった？'
	String get title => 'なぜ長押しで削除できるとわかった？';

	/// ja: 'コンテキストメニューは「隠れた機能」への扉'
	String get subtitle => 'コンテキストメニューは「隠れた機能」への扉';

	/// ja: '長押しは「もっとできること」のサイン'
	String get longPressTitle => '長押しは「もっとできること」のサイン';

	/// ja: 'タップして反応しないUIは、長押しで追加メニューが出ることが多い。iOS・Androidの標準的なインタラクションパターンとして定着しており、ユーザーは無意識に試してみるようになっている。'
	String get longPressDesc => 'タップして反応しないUIは、長押しで追加メニューが出ることが多い。iOS・Androidの標準的なインタラクションパターンとして定着しており、ユーザーは無意識に試してみるようになっている。';

	/// ja: 'コンテキストメニューが操作を提示する'
	String get contextMenuTitle => 'コンテキストメニューが操作を提示する';

	/// ja: '長押しで出現するメニューは「このアイテムに対して今できること」をリスト化したもの。削除・コピー・返信などの選択肢が並ぶパターンは、メッセージアプリの標準仕様だ。'
	String get contextMenuDesc => '長押しで出現するメニューは「このアイテムに対して今できること」をリスト化したもの。削除・コピー・返信などの選択肢が並ぶパターンは、メッセージアプリの標準仕様だ。';

	/// ja: '赤色が「危険な操作」を警告する'
	String get destructiveTitle => '赤色が「危険な操作」を警告する';

	/// ja: '削除ボタンが赤い理由は、「取り消せない操作」を色で警告するためだ。赤＝危険・警告は信号機から染み込んだ文化的な記号であり、UIデザインに意図的に取り込まれている。'
	String get destructiveDesc => '削除ボタンが赤い理由は、「取り消せない操作」を色で警告するためだ。赤＝危険・警告は信号機から染み込んだ文化的な記号であり、UIデザインに意図的に取り込まれている。';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightJa {
	TranslationsQuiz4InsightJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'なぜグループ作成の手順がわかった？'
	String get title => 'なぜグループ作成の手順がわかった？';

	/// ja: 'ウィザード形式のUIが手順を自然に導く'
	String get subtitle => 'ウィザード形式のUIが手順を自然に導く';

	/// ja: '＋ボタンは「新しく作る」の記号'
	String get plusTitle => '＋ボタンは「新しく作る」の記号';

	/// ja: '＋（プラス）アイコンは「追加」「作成」を意味する世界共通の記号だ。FAB（フローティングアクションボタン）として画面右下に配置されるのもマテリアルデザインの標準パターンで、言語を問わず「ここで何かが作れる」と直感させる。'
	String get plusDesc => '＋（プラス）アイコンは「追加」「作成」を意味する世界共通の記号だ。FAB（フローティングアクションボタン）として画面右下に配置されるのもマテリアルデザインの標準パターンで、言語を問わず「ここで何かが作れる」と直感させる。';

	/// ja: 'ステップ形式が複雑な操作を分解する'
	String get wizardTitle => 'ステップ形式が複雑な操作を分解する';

	/// ja: 'グループ名入力→メンバー選択→作成確認という流れは、複雑なアクションを小さなステップに分割するウィザードUIパターン。各ステップが「次に何をすべきか」を教えてくれるため、言語がわからなくても操作できる。'
	String get wizardDesc => 'グループ名入力→メンバー選択→作成確認という流れは、複雑なアクションを小さなステップに分割するウィザードUIパターン。各ステップが「次に何をすべきか」を教えてくれるため、言語がわからなくても操作できる。';

	/// ja: 'チェックボックスが「選択済み」を視覚化する'
	String get checkboxTitle => 'チェックボックスが「選択済み」を視覚化する';

	/// ja: '✓マークのチェックボックスは選択状態を直感的に示す。複数選択UIとしてフォーム・メンバー選択・フィルターで世界中で使われており、その意味は言語を超えて理解されている。'
	String get checkboxDesc => '✓マークのチェックボックスは選択状態を直感的に示す。複数選択UIとしてフォーム・メンバー選択・フィルターで世界中で使われており、その意味は言語を超えて理解されている。';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
