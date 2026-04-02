///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
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
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsQuiz1En quiz1 = TranslationsQuiz1En._(_root);
	late final TranslationsQuiz2En quiz2 = TranslationsQuiz2En._(_root);
	late final TranslationsQuiz3En quiz3 = TranslationsQuiz3En._(_root);
	late final TranslationsQuiz4En quiz4 = TranslationsQuiz4En._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsContactsEn contacts = TranslationsContactsEn._(_root);
}

// Path: quiz1
class TranslationsQuiz1En {
	TranslationsQuiz1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please send a message'
	String get missionText => 'Please send a message';

	late final TranslationsQuiz1InsightEn insight = TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class TranslationsQuiz2En {
	TranslationsQuiz2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please send a stamp'
	String get missionText => 'Please send a stamp';

	late final TranslationsQuiz2InsightEn insight = TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class TranslationsQuiz3En {
	TranslationsQuiz3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Long press a message to delete it'
	String get missionText => 'Long press a message to delete it';

	late final TranslationsQuiz3InsightEn insight = TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class TranslationsQuiz4En {
	TranslationsQuiz4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Create a group chat'
	String get missionText => 'Create a group chat';

	late final TranslationsQuiz4InsightEn insight = TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Talks'
	String get appTitle => 'Talks';

	/// en: 'Talks'
	String get talkTab => 'Talks';

	/// en: 'Search'
	String get searchTab => 'Search';

	/// en: 'Calls'
	String get callTab => 'Calls';

	/// en: 'Wallet'
	String get walletTab => 'Wallet';

	/// en: 'News'
	String get newsTab => 'News';

	/// en: 'Send'
	String get sendButton => 'Send';

	/// en: 'Stamp'
	String get stampButton => 'Stamp';

	/// en: 'Delete'
	String get deleteButton => 'Delete';

	/// en: 'Cancel'
	String get cancelButton => 'Cancel';

	/// en: 'Delete this message?'
	String get confirmDelete => 'Delete this message?';

	/// en: 'Create Group'
	String get createGroup => 'Create Group';

	/// en: 'Group Name'
	String get groupName => 'Group Name';

	/// en: 'Select Members'
	String get selectMembers => 'Select Members';

	/// en: 'Create'
	String get createButton => 'Create';

	/// en: 'Back'
	String get backButton => 'Back';

	/// en: '{count} members'
	String get members => '{count} members';

	/// en: 'Online'
	String get online => 'Online';

	/// en: 'Type a message'
	String get typeMessage => 'Type a message';

	/// en: 'New Group'
	String get newGroup => 'New Group';

	/// en: 'New Chat'
	String get newChat => 'New Chat';
}

// Path: contacts
class TranslationsContactsEn {
	TranslationsContactsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Alice'
	String get alice => 'Alice';

	/// en: 'Bob'
	String get bob => 'Bob';

	/// en: 'Carol'
	String get carol => 'Carol';

	/// en: 'Project Team'
	String get team => 'Project Team';

	/// en: 'Mom'
	String get mom => 'Mom';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightEn {
	TranslationsQuiz1InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Why could you operate despite not reading the text?'
	String get title => 'Why could you operate despite not reading the text?';

	/// en: 'Universal patterns in chat UI guide your actions'
	String get subtitle => 'Universal patterns in chat UI guide your actions';

	/// en: 'Input field is a universal UI'
	String get inputTitle => 'Input field is a universal UI';

	/// en: 'The text input box + send button combination is adopted in chat apps worldwide including WhatsApp, LINE, and Slack. Once experienced, you can intuitively operate it regardless of language.'
	String get inputDesc => 'The text input box + send button combination is adopted in chat apps worldwide including WhatsApp, LINE, and Slack. Once experienced, you can intuitively operate it regardless of language.';

	/// en: 'The → button is a symbol for 'send''
	String get sendTitle => 'The → button is a symbol for \'send\'';

	/// en: 'Right-pointing arrow (→) and paper plane icons have become established across cultures as symbols meaning 'send' or 'proceed'. Icons themselves serve as language.'
	String get sendDesc => 'Right-pointing arrow (→) and paper plane icons have become established across cultures as symbols meaning \'send\' or \'proceed\'. Icons themselves serve as language.';

	/// en: 'Speech bubbles visualize conversation'
	String get bubbleTitle => 'Speech bubbles visualize conversation';

	/// en: 'Right = me, Left = other — this bubble layout is the de facto standard of chat UI. You can instantly judge who said what using only color and position.'
	String get bubbleDesc => 'Right = me, Left = other — this bubble layout is the de facto standard of chat UI. You can instantly judge who said what using only color and position.';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightEn {
	TranslationsQuiz2InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know the stamp button?'
	String get title => 'How did you know the stamp button?';

	/// en: 'Emoji and stamps are the 'common language' of emotions'
	String get subtitle => 'Emoji and stamps are the \'common language\' of emotions';

	/// en: 'Emoji transcend language as emotional expression'
	String get emojiTitle => 'Emoji transcend language as emotional expression';

	/// en: 'Emoji like 😊 and 👍 convey emotions directly without relying on language. Born in Japan in 1999, this culture is now a global standard.'
	String get emojiDesc => 'Emoji like 😊 and 👍 convey emotions directly without relying on language. Born in Japan in 1999, this culture is now a global standard.';

	/// en: 'Stamp button icons convey meaning'
	String get iconTitle => 'Stamp button icons convey meaning';

	/// en: 'Smiley face (😊) or emoji palette icons intuitively indicate 'press here for stamps'. UI icons convey meaning visually without reading text.'
	String get iconDesc => 'Smiley face (😊) or emoji palette icons intuitively indicate \'press here for stamps\'. UI icons convey meaning visually without reading text.';

	/// en: 'Green theme evokes 'chat''
	String get colorTitle => 'Green theme evokes \'chat\'';

	/// en: 'LINE's green color is deeply ingrained in Japanese people as the symbol of messaging apps. Recognizing by color alone that 'this is a chat app' is the result of repeated UI patterns giving meaning to colors.'
	String get colorDesc => 'LINE\'s green color is deeply ingrained in Japanese people as the symbol of messaging apps. Recognizing by color alone that \'this is a chat app\' is the result of repeated UI patterns giving meaning to colors.';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightEn {
	TranslationsQuiz3InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know long press would delete?'
	String get title => 'How did you know long press would delete?';

	/// en: 'Context menus are the door to hidden features'
	String get subtitle => 'Context menus are the door to hidden features';

	/// en: 'Long press is a sign of 'more things you can do''
	String get longPressTitle => 'Long press is a sign of \'more things you can do\'';

	/// en: 'UIs that don't respond to a tap often show additional menus on long press. Established as a standard iOS/Android interaction pattern, users unconsciously try it.'
	String get longPressDesc => 'UIs that don\'t respond to a tap often show additional menus on long press. Established as a standard iOS/Android interaction pattern, users unconsciously try it.';

	/// en: 'Context menus present available actions'
	String get contextMenuTitle => 'Context menus present available actions';

	/// en: 'The menu appearing on long press lists 'what you can do with this item now'. Patterns with delete, copy, reply options are standard spec in messaging apps.'
	String get contextMenuDesc => 'The menu appearing on long press lists \'what you can do with this item now\'. Patterns with delete, copy, reply options are standard spec in messaging apps.';

	/// en: 'Red color warns of 'dangerous operations''
	String get destructiveTitle => 'Red color warns of \'dangerous operations\'';

	/// en: 'Delete buttons are red to warn about irreversible actions with color. Red = danger/warning is a cultural symbol ingrained from traffic lights, intentionally incorporated into UI design.'
	String get destructiveDesc => 'Delete buttons are red to warn about irreversible actions with color. Red = danger/warning is a cultural symbol ingrained from traffic lights, intentionally incorporated into UI design.';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightEn {
	TranslationsQuiz4InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you understand the group creation steps?'
	String get title => 'How did you understand the group creation steps?';

	/// en: 'Wizard-style UI naturally guides through the process'
	String get subtitle => 'Wizard-style UI naturally guides through the process';

	/// en: '+ button is the symbol for 'create new''
	String get plusTitle => '+ button is the symbol for \'create new\'';

	/// en: 'The + (plus) icon is a universal symbol meaning 'add' or 'create'. Placed at the bottom right as a FAB (Floating Action Button) is also Material Design standard, intuitively suggesting 'something can be created here'.'
	String get plusDesc => 'The + (plus) icon is a universal symbol meaning \'add\' or \'create\'. Placed at the bottom right as a FAB (Floating Action Button) is also Material Design standard, intuitively suggesting \'something can be created here\'.';

	/// en: 'Step format breaks down complex operations'
	String get wizardTitle => 'Step format breaks down complex operations';

	/// en: 'The flow of group name input → member selection → creation confirmation is a wizard UI pattern that breaks complex actions into small steps. Each step teaches 'what to do next', allowing operation even without understanding language.'
	String get wizardDesc => 'The flow of group name input → member selection → creation confirmation is a wizard UI pattern that breaks complex actions into small steps. Each step teaches \'what to do next\', allowing operation even without understanding language.';

	/// en: 'Checkboxes visualize 'selected' state'
	String get checkboxTitle => 'Checkboxes visualize \'selected\' state';

	/// en: 'Checkboxes with ✓ marks intuitively indicate selection state. Used worldwide in forms, member selection, and filters as multi-select UI, their meaning is understood across languages.'
	String get checkboxDesc => 'Checkboxes with ✓ marks intuitively indicate selection state. Used worldwide in forms, member selection, and filters as multi-select UI, their meaning is understood across languages.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Please send a message',
			'quiz1.insight.title' => 'Why could you operate despite not reading the text?',
			'quiz1.insight.subtitle' => 'Universal patterns in chat UI guide your actions',
			'quiz1.insight.inputTitle' => 'Input field is a universal UI',
			'quiz1.insight.inputDesc' => 'The text input box + send button combination is adopted in chat apps worldwide including WhatsApp, LINE, and Slack. Once experienced, you can intuitively operate it regardless of language.',
			'quiz1.insight.sendTitle' => 'The → button is a symbol for \'send\'',
			'quiz1.insight.sendDesc' => 'Right-pointing arrow (→) and paper plane icons have become established across cultures as symbols meaning \'send\' or \'proceed\'. Icons themselves serve as language.',
			'quiz1.insight.bubbleTitle' => 'Speech bubbles visualize conversation',
			'quiz1.insight.bubbleDesc' => 'Right = me, Left = other — this bubble layout is the de facto standard of chat UI. You can instantly judge who said what using only color and position.',
			'quiz2.missionText' => 'Please send a stamp',
			'quiz2.insight.title' => 'How did you know the stamp button?',
			'quiz2.insight.subtitle' => 'Emoji and stamps are the \'common language\' of emotions',
			'quiz2.insight.emojiTitle' => 'Emoji transcend language as emotional expression',
			'quiz2.insight.emojiDesc' => 'Emoji like 😊 and 👍 convey emotions directly without relying on language. Born in Japan in 1999, this culture is now a global standard.',
			'quiz2.insight.iconTitle' => 'Stamp button icons convey meaning',
			'quiz2.insight.iconDesc' => 'Smiley face (😊) or emoji palette icons intuitively indicate \'press here for stamps\'. UI icons convey meaning visually without reading text.',
			'quiz2.insight.colorTitle' => 'Green theme evokes \'chat\'',
			'quiz2.insight.colorDesc' => 'LINE\'s green color is deeply ingrained in Japanese people as the symbol of messaging apps. Recognizing by color alone that \'this is a chat app\' is the result of repeated UI patterns giving meaning to colors.',
			'quiz3.missionText' => 'Long press a message to delete it',
			'quiz3.insight.title' => 'How did you know long press would delete?',
			'quiz3.insight.subtitle' => 'Context menus are the door to hidden features',
			'quiz3.insight.longPressTitle' => 'Long press is a sign of \'more things you can do\'',
			'quiz3.insight.longPressDesc' => 'UIs that don\'t respond to a tap often show additional menus on long press. Established as a standard iOS/Android interaction pattern, users unconsciously try it.',
			'quiz3.insight.contextMenuTitle' => 'Context menus present available actions',
			'quiz3.insight.contextMenuDesc' => 'The menu appearing on long press lists \'what you can do with this item now\'. Patterns with delete, copy, reply options are standard spec in messaging apps.',
			'quiz3.insight.destructiveTitle' => 'Red color warns of \'dangerous operations\'',
			'quiz3.insight.destructiveDesc' => 'Delete buttons are red to warn about irreversible actions with color. Red = danger/warning is a cultural symbol ingrained from traffic lights, intentionally incorporated into UI design.',
			'quiz4.missionText' => 'Create a group chat',
			'quiz4.insight.title' => 'How did you understand the group creation steps?',
			'quiz4.insight.subtitle' => 'Wizard-style UI naturally guides through the process',
			'quiz4.insight.plusTitle' => '+ button is the symbol for \'create new\'',
			'quiz4.insight.plusDesc' => 'The + (plus) icon is a universal symbol meaning \'add\' or \'create\'. Placed at the bottom right as a FAB (Floating Action Button) is also Material Design standard, intuitively suggesting \'something can be created here\'.',
			'quiz4.insight.wizardTitle' => 'Step format breaks down complex operations',
			'quiz4.insight.wizardDesc' => 'The flow of group name input → member selection → creation confirmation is a wizard UI pattern that breaks complex actions into small steps. Each step teaches \'what to do next\', allowing operation even without understanding language.',
			'quiz4.insight.checkboxTitle' => 'Checkboxes visualize \'selected\' state',
			'quiz4.insight.checkboxDesc' => 'Checkboxes with ✓ marks intuitively indicate selection state. Used worldwide in forms, member selection, and filters as multi-select UI, their meaning is understood across languages.',
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
