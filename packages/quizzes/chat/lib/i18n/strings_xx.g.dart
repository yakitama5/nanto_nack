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
class TranslationsXx extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsXx({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.xx,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <xx>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsXx _root = this; // ignore: unused_field

	@override 
	TranslationsXx $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsXx(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsQuiz1Xx quiz1 = _TranslationsQuiz1Xx._(_root);
	@override late final _TranslationsQuiz2Xx quiz2 = _TranslationsQuiz2Xx._(_root);
	@override late final _TranslationsQuiz3Xx quiz3 = _TranslationsQuiz3Xx._(_root);
	@override late final _TranslationsQuiz4Xx quiz4 = _TranslationsQuiz4Xx._(_root);
	@override late final _TranslationsCommonXx common = _TranslationsCommonXx._(_root);
	@override late final _TranslationsContactsXx contacts = _TranslationsContactsXx._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Xx extends TranslationsQuiz1Ja {
	_TranslationsQuiz1Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Send a message';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Send a stamp';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Long press a message to delete';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Create a group chat';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
class _TranslationsContactsXx extends TranslationsContactsJa {
	_TranslationsContactsXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get alice => 'Alice';
	@override String get bob => 'Bob';
	@override String get carol => 'Carol';
	@override String get team => 'Project Team';
	@override String get mom => 'Mom';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Why could you operate despite not reading the text?';
	@override String get subtitle => 'Universal patterns in chat UI guide your actions';
	@override String get inputTitle => 'Input field is a universal UI';
	@override String get inputDesc => 'The text input box + send button combination is adopted in chat apps worldwide including WhatsApp, LINE, and Slack. Once experienced, you can intuitively operate it regardless of language.';
	@override String get sendTitle => 'The arrow button means send';
	@override String get sendDesc => 'Right-pointing arrow and paper plane icons have become established across cultures as symbols meaning send or proceed.';
	@override String get bubbleTitle => 'Speech bubbles visualize conversation';
	@override String get bubbleDesc => 'Right is me, Left is other. This bubble layout is the de facto standard of chat UI.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know the stamp button?';
	@override String get subtitle => 'Emoji and stamps are the common language of emotions';
	@override String get emojiTitle => 'Emoji transcend language';
	@override String get emojiDesc => 'Emoji convey emotions directly without relying on language.';
	@override String get iconTitle => 'Stamp icons convey meaning';
	@override String get iconDesc => 'Smiley face icons intuitively indicate press here for stamps.';
	@override String get colorTitle => 'Green theme evokes chat';
	@override String get colorDesc => 'The green color is deeply associated with messaging apps.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know long press would delete?';
	@override String get subtitle => 'Context menus are the door to hidden features';
	@override String get longPressTitle => 'Long press reveals more options';
	@override String get longPressDesc => 'UIs that do not respond to a tap often show additional menus on long press.';
	@override String get contextMenuTitle => 'Context menus show available actions';
	@override String get contextMenuDesc => 'The menu appearing on long press lists what you can do with this item.';
	@override String get destructiveTitle => 'Red warns of dangerous operations';
	@override String get destructiveDesc => 'Delete buttons are red to warn about irreversible actions.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you understand the group creation steps?';
	@override String get subtitle => 'Wizard UI naturally guides through the process';
	@override String get plusTitle => 'Plus button means create new';
	@override String get plusDesc => 'The plus icon is a universal symbol meaning add or create.';
	@override String get wizardTitle => 'Step format breaks down complex operations';
	@override String get wizardDesc => 'The flow breaks complex actions into small steps teaching what to do next.';
	@override String get checkboxTitle => 'Checkboxes show selected state';
	@override String get checkboxDesc => 'Checkboxes with check marks intuitively indicate selection state.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Send a message',
			'quiz1.insight.title' => 'Why could you operate despite not reading the text?',
			'quiz1.insight.subtitle' => 'Universal patterns in chat UI guide your actions',
			'quiz1.insight.inputTitle' => 'Input field is a universal UI',
			'quiz1.insight.inputDesc' => 'The text input box + send button combination is adopted in chat apps worldwide including WhatsApp, LINE, and Slack. Once experienced, you can intuitively operate it regardless of language.',
			'quiz1.insight.sendTitle' => 'The arrow button means send',
			'quiz1.insight.sendDesc' => 'Right-pointing arrow and paper plane icons have become established across cultures as symbols meaning send or proceed.',
			'quiz1.insight.bubbleTitle' => 'Speech bubbles visualize conversation',
			'quiz1.insight.bubbleDesc' => 'Right is me, Left is other. This bubble layout is the de facto standard of chat UI.',
			'quiz2.missionText' => 'Send a stamp',
			'quiz2.insight.title' => 'How did you know the stamp button?',
			'quiz2.insight.subtitle' => 'Emoji and stamps are the common language of emotions',
			'quiz2.insight.emojiTitle' => 'Emoji transcend language',
			'quiz2.insight.emojiDesc' => 'Emoji convey emotions directly without relying on language.',
			'quiz2.insight.iconTitle' => 'Stamp icons convey meaning',
			'quiz2.insight.iconDesc' => 'Smiley face icons intuitively indicate press here for stamps.',
			'quiz2.insight.colorTitle' => 'Green theme evokes chat',
			'quiz2.insight.colorDesc' => 'The green color is deeply associated with messaging apps.',
			'quiz3.missionText' => 'Long press a message to delete',
			'quiz3.insight.title' => 'How did you know long press would delete?',
			'quiz3.insight.subtitle' => 'Context menus are the door to hidden features',
			'quiz3.insight.longPressTitle' => 'Long press reveals more options',
			'quiz3.insight.longPressDesc' => 'UIs that do not respond to a tap often show additional menus on long press.',
			'quiz3.insight.contextMenuTitle' => 'Context menus show available actions',
			'quiz3.insight.contextMenuDesc' => 'The menu appearing on long press lists what you can do with this item.',
			'quiz3.insight.destructiveTitle' => 'Red warns of dangerous operations',
			'quiz3.insight.destructiveDesc' => 'Delete buttons are red to warn about irreversible actions.',
			'quiz4.missionText' => 'Create a group chat',
			'quiz4.insight.title' => 'How did you understand the group creation steps?',
			'quiz4.insight.subtitle' => 'Wizard UI naturally guides through the process',
			'quiz4.insight.plusTitle' => 'Plus button means create new',
			'quiz4.insight.plusDesc' => 'The plus icon is a universal symbol meaning add or create.',
			'quiz4.insight.wizardTitle' => 'Step format breaks down complex operations',
			'quiz4.insight.wizardDesc' => 'The flow breaks complex actions into small steps teaching what to do next.',
			'quiz4.insight.checkboxTitle' => 'Checkboxes show selected state',
			'quiz4.insight.checkboxDesc' => 'Checkboxes with check marks intuitively indicate selection state.',
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
