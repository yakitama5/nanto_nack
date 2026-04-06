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
	@override String get missionText => 'Please send one stamp reply';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please react to the message with a heart';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please send one photo';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please unsend your last message';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Talks';
	@override String get homeTab => 'Home';
	@override String get talkTab => 'Talks';
	@override String get newsTab => 'News';
	@override String get sendButton => 'Send';
	@override String get stampButton => 'Stamp';
	@override String get unsendMessage => 'Unsend';
	@override String get copyMessage => 'Copy';
	@override String get replyMessage => 'Reply';
	@override String get cancelButton => 'Cancel';
	@override String get typeMessage => 'Type a message';
	@override String get photoButton => 'Photo';
	@override String get online => 'Online';
	@override String get searchTab => 'Search';
	@override String get callTab => 'Calls';
	@override String get walletTab => 'Wallet';
	@override String get deleteButton => 'Delete';
	@override String get confirmDelete => 'Delete this message?';
	@override String get createGroup => 'Create Group';
	@override String get groupName => 'Group Name';
	@override String get selectMembers => 'Select Members';
	@override String get createButton => 'Create';
	@override String get backButton => 'Back';
	@override String get members => '{count} members';
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
	@override String get title => 'Why could you switch tabs and send a stamp?';
	@override String get subtitle => 'Badges and icons guide your actions';
	@override String get badgeTitle => 'Badge equals new messages';
	@override String get badgeDesc => 'A red number badge means unread messages. This is an international symbol shared across SNS email and messaging apps that naturally guides users.';
	@override String get stampTitle => 'Emoji icon equals gateway to stamps';
	@override String get stampDesc => 'The smiley icon means open emoji stamp panel a globally universal UI. Even without reading language this icons meaning is understood worldwide.';
	@override String get tabTitle => 'Tab switching signals different function';
	@override String get tabDesc => 'Bottom navigation tabs list what you can do in this app. Icon plus number badge naturally guides you to your destination.';
	@override String get inputTitle => 'Input field is a universal UI';
	@override String get inputDesc => 'The text input box plus send button combination is adopted in chat apps worldwide. Once experienced you can intuitively operate it regardless of language.';
	@override String get sendTitle => 'The arrow button means send';
	@override String get sendDesc => 'Right-pointing arrow and paper plane icons have become established across cultures as symbols meaning send or proceed.';
	@override String get bubbleTitle => 'Speech bubbles visualize conversation';
	@override String get bubbleDesc => 'Right is me Left is other. This bubble layout is the de facto standard of chat UI.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the reaction button?';
	@override String get subtitle => 'The small icon beside the bubble teaches the action';
	@override String get reactionTitle => 'Reactions are emotional shortcuts';
	@override String get reactionDesc => 'Reaction emoji are established worldwide across SNS and chat apps as a way to convey emotion without a reply.';
	@override String get iconTitle => 'The emoji icon beside the speech bubble';
	@override String get iconDesc => 'The emoji icon shown next to received messages indicates you can react to this message. Even small its position and shape carry meaning.';
	@override String get heartTitle => 'Heart is the universal language of like';
	@override String get heartDesc => 'Across all platforms the heart means positive reaction the most widely used emoji symbol regardless of platform.';
	@override String get emojiTitle => 'Emoji transcend language';
	@override String get emojiDesc => 'Emoji convey emotions directly without relying on language.';
	@override String get colorTitle => 'Green theme evokes chat';
	@override String get colorDesc => 'The green color is deeply associated with messaging apps.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know the plus button could send images?';
	@override String get subtitle => 'Media sending is handled by the add icon';
	@override String get plusTitle => 'Plus sign means something can be added';
	@override String get plusDesc => 'The plus icon on the left of the input field shows you can send more than text. Camera files location various media entry points are hidden here a universal UI pattern.';
	@override String get photoTitle => 'Camera icon is universal for image';
	@override String get photoDesc => 'The camera icon does not depend on language. It is established in all cultures as a symbol for photo image and you can predict tapping it opens image selection.';
	@override String get galleryTitle => 'Bottom sheet reveals choices';
	@override String get galleryDesc => 'The bottom sheet sliding up from below shows candidates you can select with this action. When an image grid appears selecting and sending becomes intuitively clear.';
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
	@override String get title => 'How did you know long press could unsend?';
	@override String get subtitle => 'Multiple layers of UI literacy combine to solve it';
	@override String get listTitle => 'List is sorted by recency';
	@override String get listDesc => 'The chat list is ordered by most recently messaged. The top being the most recent talk room is a rule shared across all messaging apps.';
	@override String get longPressTitle => 'Long press reveals hidden features';
	@override String get longPressDesc => 'UIs that do not respond to a tap often show additional menus on long press. Established as a standard interaction users unconsciously try it.';
	@override String get redTitle => 'Red text warns of dangerous operation';
	@override String get redDesc => 'Irreversible actions like unsend and delete are displayed in red by UI design convention. Red equals danger ingrained from traffic lights as a cultural symbol.';
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
			'quiz1.missionText' => 'Please send one stamp reply',
			'quiz1.insight.title' => 'Why could you switch tabs and send a stamp?',
			'quiz1.insight.subtitle' => 'Badges and icons guide your actions',
			'quiz1.insight.badgeTitle' => 'Badge equals new messages',
			'quiz1.insight.badgeDesc' => 'A red number badge means unread messages. This is an international symbol shared across SNS email and messaging apps that naturally guides users.',
			'quiz1.insight.stampTitle' => 'Emoji icon equals gateway to stamps',
			'quiz1.insight.stampDesc' => 'The smiley icon means open emoji stamp panel a globally universal UI. Even without reading language this icons meaning is understood worldwide.',
			'quiz1.insight.tabTitle' => 'Tab switching signals different function',
			'quiz1.insight.tabDesc' => 'Bottom navigation tabs list what you can do in this app. Icon plus number badge naturally guides you to your destination.',
			'quiz1.insight.inputTitle' => 'Input field is a universal UI',
			'quiz1.insight.inputDesc' => 'The text input box plus send button combination is adopted in chat apps worldwide. Once experienced you can intuitively operate it regardless of language.',
			'quiz1.insight.sendTitle' => 'The arrow button means send',
			'quiz1.insight.sendDesc' => 'Right-pointing arrow and paper plane icons have become established across cultures as symbols meaning send or proceed.',
			'quiz1.insight.bubbleTitle' => 'Speech bubbles visualize conversation',
			'quiz1.insight.bubbleDesc' => 'Right is me Left is other. This bubble layout is the de facto standard of chat UI.',
			'quiz2.missionText' => 'Please react to the message with a heart',
			'quiz2.insight.title' => 'How did you find the reaction button?',
			'quiz2.insight.subtitle' => 'The small icon beside the bubble teaches the action',
			'quiz2.insight.reactionTitle' => 'Reactions are emotional shortcuts',
			'quiz2.insight.reactionDesc' => 'Reaction emoji are established worldwide across SNS and chat apps as a way to convey emotion without a reply.',
			'quiz2.insight.iconTitle' => 'The emoji icon beside the speech bubble',
			'quiz2.insight.iconDesc' => 'The emoji icon shown next to received messages indicates you can react to this message. Even small its position and shape carry meaning.',
			'quiz2.insight.heartTitle' => 'Heart is the universal language of like',
			'quiz2.insight.heartDesc' => 'Across all platforms the heart means positive reaction the most widely used emoji symbol regardless of platform.',
			'quiz2.insight.emojiTitle' => 'Emoji transcend language',
			'quiz2.insight.emojiDesc' => 'Emoji convey emotions directly without relying on language.',
			'quiz2.insight.colorTitle' => 'Green theme evokes chat',
			'quiz2.insight.colorDesc' => 'The green color is deeply associated with messaging apps.',
			'quiz3.missionText' => 'Please send one photo',
			'quiz3.insight.title' => 'How did you know the plus button could send images?',
			'quiz3.insight.subtitle' => 'Media sending is handled by the add icon',
			'quiz3.insight.plusTitle' => 'Plus sign means something can be added',
			'quiz3.insight.plusDesc' => 'The plus icon on the left of the input field shows you can send more than text. Camera files location various media entry points are hidden here a universal UI pattern.',
			'quiz3.insight.photoTitle' => 'Camera icon is universal for image',
			'quiz3.insight.photoDesc' => 'The camera icon does not depend on language. It is established in all cultures as a symbol for photo image and you can predict tapping it opens image selection.',
			'quiz3.insight.galleryTitle' => 'Bottom sheet reveals choices',
			'quiz3.insight.galleryDesc' => 'The bottom sheet sliding up from below shows candidates you can select with this action. When an image grid appears selecting and sending becomes intuitively clear.',
			'quiz3.insight.longPressTitle' => 'Long press reveals more options',
			'quiz3.insight.longPressDesc' => 'UIs that do not respond to a tap often show additional menus on long press.',
			'quiz3.insight.contextMenuTitle' => 'Context menus show available actions',
			'quiz3.insight.contextMenuDesc' => 'The menu appearing on long press lists what you can do with this item.',
			'quiz3.insight.destructiveTitle' => 'Red warns of dangerous operations',
			'quiz3.insight.destructiveDesc' => 'Delete buttons are red to warn about irreversible actions.',
			'quiz4.missionText' => 'Please unsend your last message',
			'quiz4.insight.title' => 'How did you know long press could unsend?',
			'quiz4.insight.subtitle' => 'Multiple layers of UI literacy combine to solve it',
			'quiz4.insight.listTitle' => 'List is sorted by recency',
			'quiz4.insight.listDesc' => 'The chat list is ordered by most recently messaged. The top being the most recent talk room is a rule shared across all messaging apps.',
			'quiz4.insight.longPressTitle' => 'Long press reveals hidden features',
			'quiz4.insight.longPressDesc' => 'UIs that do not respond to a tap often show additional menus on long press. Established as a standard interaction users unconsciously try it.',
			'quiz4.insight.redTitle' => 'Red text warns of dangerous operation',
			'quiz4.insight.redDesc' => 'Irreversible actions like unsend and delete are displayed in red by UI design convention. Red equals danger ingrained from traffic lights as a cultural symbol.',
			'quiz4.insight.plusTitle' => 'Plus button means create new',
			'quiz4.insight.plusDesc' => 'The plus icon is a universal symbol meaning add or create.',
			'quiz4.insight.wizardTitle' => 'Step format breaks down complex operations',
			'quiz4.insight.wizardDesc' => 'The flow breaks complex actions into small steps teaching what to do next.',
			'quiz4.insight.checkboxTitle' => 'Checkboxes show selected state',
			'quiz4.insight.checkboxDesc' => 'Checkboxes with check marks intuitively indicate selection state.',
			'common.appTitle' => 'Talks',
			'common.homeTab' => 'Home',
			'common.talkTab' => 'Talks',
			'common.newsTab' => 'News',
			'common.sendButton' => 'Send',
			'common.stampButton' => 'Stamp',
			'common.unsendMessage' => 'Unsend',
			'common.copyMessage' => 'Copy',
			'common.replyMessage' => 'Reply',
			'common.cancelButton' => 'Cancel',
			'common.typeMessage' => 'Type a message',
			'common.photoButton' => 'Photo',
			'common.online' => 'Online',
			'common.searchTab' => 'Search',
			'common.callTab' => 'Calls',
			'common.walletTab' => 'Wallet',
			'common.deleteButton' => 'Delete',
			'common.confirmDelete' => 'Delete this message?',
			'common.createGroup' => 'Create Group',
			'common.groupName' => 'Group Name',
			'common.selectMembers' => 'Select Members',
			'common.createButton' => 'Create',
			'common.backButton' => 'Back',
			'common.members' => '{count} members',
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
