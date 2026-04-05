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
class TranslationsEn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsQuiz1En quiz1 = _TranslationsQuiz1En._(_root);
	@override late final _TranslationsQuiz2En quiz2 = _TranslationsQuiz2En._(_root);
	@override late final _TranslationsQuiz3En quiz3 = _TranslationsQuiz3En._(_root);
	@override late final _TranslationsQuiz4En quiz4 = _TranslationsQuiz4En._(_root);
	@override late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
	@override late final _TranslationsContactsEn contacts = _TranslationsContactsEn._(_root);
}

// Path: quiz1
class _TranslationsQuiz1En extends TranslationsQuiz1Ja {
	_TranslationsQuiz1En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please send a message';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please send a stamp';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Long press a message to delete it';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Create a group chat';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

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
class _TranslationsContactsEn extends TranslationsContactsJa {
	_TranslationsContactsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get alice => 'Alice';
	@override String get bob => 'Bob';
	@override String get carol => 'Carol';
	@override String get team => 'Project Team';
	@override String get mom => 'Mom';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Why could you operate despite not reading the text?';
	@override String get subtitle => 'Universal patterns in chat UI guide your actions';
	@override String get inputTitle => 'Input field is a universal UI';
	@override String get inputDesc => 'The text input box + send button combination is adopted in chat apps worldwide including WhatsApp, LINE, and Slack. Once experienced, you can intuitively operate it regardless of language.';
	@override String get sendTitle => 'The → button is a symbol for \'send\'';
	@override String get sendDesc => 'Right-pointing arrow (→) and paper plane icons have become established across cultures as symbols meaning \'send\' or \'proceed\'. Icons themselves serve as language.';
	@override String get bubbleTitle => 'Speech bubbles visualize conversation';
	@override String get bubbleDesc => 'Right = me, Left = other — this bubble layout is the de facto standard of chat UI. You can instantly judge who said what using only color and position.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know the stamp button?';
	@override String get subtitle => 'Emoji and stamps are the \'common language\' of emotions';
	@override String get emojiTitle => 'Emoji transcend language as emotional expression';
	@override String get emojiDesc => 'Emoji like 😊 and 👍 convey emotions directly without relying on language. Born in Japan in 1999, this culture is now a global standard.';
	@override String get iconTitle => 'Stamp button icons convey meaning';
	@override String get iconDesc => 'Smiley face (😊) or emoji palette icons intuitively indicate \'press here for stamps\'. UI icons convey meaning visually without reading text.';
	@override String get colorTitle => 'Green theme evokes \'chat\'';
	@override String get colorDesc => 'LINE\'s green color is deeply ingrained in Japanese people as the symbol of messaging apps. Recognizing by color alone that \'this is a chat app\' is the result of repeated UI patterns giving meaning to colors.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know long press would delete?';
	@override String get subtitle => 'Context menus are the door to hidden features';
	@override String get longPressTitle => 'Long press is a sign of \'more things you can do\'';
	@override String get longPressDesc => 'UIs that don\'t respond to a tap often show additional menus on long press. Established as a standard iOS/Android interaction pattern, users unconsciously try it.';
	@override String get contextMenuTitle => 'Context menus present available actions';
	@override String get contextMenuDesc => 'The menu appearing on long press lists \'what you can do with this item now\'. Patterns with delete, copy, reply options are standard spec in messaging apps.';
	@override String get destructiveTitle => 'Red color warns of \'dangerous operations\'';
	@override String get destructiveDesc => 'Delete buttons are red to warn about irreversible actions with color. Red = danger/warning is a cultural symbol ingrained from traffic lights, intentionally incorporated into UI design.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you understand the group creation steps?';
	@override String get subtitle => 'Wizard-style UI naturally guides through the process';
	@override String get plusTitle => '+ button is the symbol for \'create new\'';
	@override String get plusDesc => 'The + (plus) icon is a universal symbol meaning \'add\' or \'create\'. Placed at the bottom right as a FAB (Floating Action Button) is also Material Design standard, intuitively suggesting \'something can be created here\'.';
	@override String get wizardTitle => 'Step format breaks down complex operations';
	@override String get wizardDesc => 'The flow of group name input → member selection → creation confirmation is a wizard UI pattern that breaks complex actions into small steps. Each step teaches \'what to do next\', allowing operation even without understanding language.';
	@override String get checkboxTitle => 'Checkboxes visualize \'selected\' state';
	@override String get checkboxDesc => 'Checkboxes with ✓ marks intuitively indicate selection state. Used worldwide in forms, member selection, and filters as multi-select UI, their meaning is understood across languages.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
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
