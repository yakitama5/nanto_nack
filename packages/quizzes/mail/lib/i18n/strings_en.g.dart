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
}

// Path: quiz1
class _TranslationsQuiz1En extends TranslationsQuiz1Ja {
	_TranslationsQuiz1En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Archive the 3rd email from the top';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Empty the trash';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Select 3 emails and delete them';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Search for emails larger than 5MB';
	@override String get hint => 'Tip: Use larger:5M to search by size!';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Mail';
	@override String get inbox => 'Inbox';
	@override String get sent => 'Sent';
	@override String get trash => 'Trash';
	@override String get archive => 'Archive';
	@override String get searchHint => 'Search mail';
	@override String get emptyTrash => 'Empty Trash';
	@override String get selectedCount => '{count} selected';
	@override String get noMails => 'No emails';
	@override String get unread => 'Unread';
	@override String get archiveAction => 'Archive';
	@override String get deleteAction => 'Delete';
	@override String get searchPrompt => 'Enter a search query and press Enter';
	@override String get hintTooltip => 'Hint';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know swiping would archive?';
	@override String get subtitle => 'Direction and icons teach the action';
	@override String get swipeTitle => 'Left swipe = sign of \'organizing\'';
	@override String get swipeDesc => 'In mail and task apps, swiping right-to-left is a standard UI pattern meaning \'archive\' or \'complete\'. Gmail also uses this pattern.';
	@override String get greenTitle => 'Green = symbol of \'safe/save\'';
	@override String get greenDesc => 'While red means \'delete/danger\', green is used in UIs worldwide to mean \'save/safe\'.';
	@override String get archiveTitle => 'Box icon = universal archive symbol';
	@override String get archiveDesc => 'A box with a downward arrow (📦) is the common archive icon across Gmail and Outlook. Its meaning is understood without reading any language.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you navigate to trash via the drawer?';
	@override String get subtitle => 'The hamburger menu is the folder gateway';
	@override String get drawerTitle => 'Hamburger = sign of \'there\'s more\'';
	@override String get drawerDesc => 'The three-line (☰) icon is a universal UI symbol meaning \'open hidden menu\'. Gmail and Outlook use the same icon.';
	@override String get trashTitle => 'Trash icon = home for deleted items';
	@override String get trashDesc => 'The 🗑️ icon indicates \'trash/deleted items\' regardless of OS. Called Trash in Gmail and \'Deleted\' in iOS, but the icon instantly identifies the location.';
	@override String get emptyTitle => 'Use the top-right menu to empty';
	@override String get emptyDesc => 'Opening the trash folder reveals an action menu (⋮) in the top right. Selecting \'Empty Trash\' permanently deletes all emails. This two-step deletion is a safety design to prevent accidental data loss.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know long press enables multi-select?';
	@override String get subtitle => 'Long press is the entry to selection mode';
	@override String get longPressTitle => 'Long press = switch to selection mode';
	@override String get longPressDesc => 'In mail and file management apps, long press is the standard interaction to start multi-select mode. Gmail and iOS Mail use the same pattern.';
	@override String get checkTitle => 'Checkmarks visualize selection state';
	@override String get checkDesc => 'The ✓ mark is a universal symbol for \'selected\'. Combined with checkboxes, you can see how many items are selected at a glance.';
	@override String get headerTitle => 'Header changes to guide actions';
	@override String get headerDesc => 'Entering selection mode turns the header blue and shows count and action icons. This \'context-dependent UI change\' is the standard Android Contextual Action Bar pattern.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you think of the \'larger:5M\' command?';
	@override String get subtitle => 'Search operators narrow down emails';
	@override String get operatorTitle => 'Search operators = specify conditions with commands';
	@override String get operatorDesc => 'Gmail offers advanced filtering with search operators like \'larger:5M\', \'from:alice\', \'has:attachment\'. This is not just for programmers - it\'s a feature for all users.';
	@override String get sizeTitle => '5M = size specification of 5 megabytes';
	@override String get sizeDesc => '\'M\' stands for megabytes (MB). This search condition is used to find emails with large attachments - a standard Gmail feature for years.';
	@override String get hintTitle => 'Hint feature guides to the answer';
	@override String get hintDesc => 'The \'?\' icon or \'Hint\' button acts as a lifeline in many apps. Even if you don\'t know search commands, the hint design guides you to the answer.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Archive the 3rd email from the top',
			'quiz1.insight.title' => 'How did you know swiping would archive?',
			'quiz1.insight.subtitle' => 'Direction and icons teach the action',
			'quiz1.insight.swipeTitle' => 'Left swipe = sign of \'organizing\'',
			'quiz1.insight.swipeDesc' => 'In mail and task apps, swiping right-to-left is a standard UI pattern meaning \'archive\' or \'complete\'. Gmail also uses this pattern.',
			'quiz1.insight.greenTitle' => 'Green = symbol of \'safe/save\'',
			'quiz1.insight.greenDesc' => 'While red means \'delete/danger\', green is used in UIs worldwide to mean \'save/safe\'.',
			'quiz1.insight.archiveTitle' => 'Box icon = universal archive symbol',
			'quiz1.insight.archiveDesc' => 'A box with a downward arrow (📦) is the common archive icon across Gmail and Outlook. Its meaning is understood without reading any language.',
			'quiz2.missionText' => 'Empty the trash',
			'quiz2.insight.title' => 'How did you navigate to trash via the drawer?',
			'quiz2.insight.subtitle' => 'The hamburger menu is the folder gateway',
			'quiz2.insight.drawerTitle' => 'Hamburger = sign of \'there\'s more\'',
			'quiz2.insight.drawerDesc' => 'The three-line (☰) icon is a universal UI symbol meaning \'open hidden menu\'. Gmail and Outlook use the same icon.',
			'quiz2.insight.trashTitle' => 'Trash icon = home for deleted items',
			'quiz2.insight.trashDesc' => 'The 🗑️ icon indicates \'trash/deleted items\' regardless of OS. Called Trash in Gmail and \'Deleted\' in iOS, but the icon instantly identifies the location.',
			'quiz2.insight.emptyTitle' => 'Use the top-right menu to empty',
			'quiz2.insight.emptyDesc' => 'Opening the trash folder reveals an action menu (⋮) in the top right. Selecting \'Empty Trash\' permanently deletes all emails. This two-step deletion is a safety design to prevent accidental data loss.',
			'quiz3.missionText' => 'Select 3 emails and delete them',
			'quiz3.insight.title' => 'How did you know long press enables multi-select?',
			'quiz3.insight.subtitle' => 'Long press is the entry to selection mode',
			'quiz3.insight.longPressTitle' => 'Long press = switch to selection mode',
			'quiz3.insight.longPressDesc' => 'In mail and file management apps, long press is the standard interaction to start multi-select mode. Gmail and iOS Mail use the same pattern.',
			'quiz3.insight.checkTitle' => 'Checkmarks visualize selection state',
			'quiz3.insight.checkDesc' => 'The ✓ mark is a universal symbol for \'selected\'. Combined with checkboxes, you can see how many items are selected at a glance.',
			'quiz3.insight.headerTitle' => 'Header changes to guide actions',
			'quiz3.insight.headerDesc' => 'Entering selection mode turns the header blue and shows count and action icons. This \'context-dependent UI change\' is the standard Android Contextual Action Bar pattern.',
			'quiz4.missionText' => 'Search for emails larger than 5MB',
			'quiz4.hint' => 'Tip: Use larger:5M to search by size!',
			'quiz4.insight.title' => 'How did you think of the \'larger:5M\' command?',
			'quiz4.insight.subtitle' => 'Search operators narrow down emails',
			'quiz4.insight.operatorTitle' => 'Search operators = specify conditions with commands',
			'quiz4.insight.operatorDesc' => 'Gmail offers advanced filtering with search operators like \'larger:5M\', \'from:alice\', \'has:attachment\'. This is not just for programmers - it\'s a feature for all users.',
			'quiz4.insight.sizeTitle' => '5M = size specification of 5 megabytes',
			'quiz4.insight.sizeDesc' => '\'M\' stands for megabytes (MB). This search condition is used to find emails with large attachments - a standard Gmail feature for years.',
			'quiz4.insight.hintTitle' => 'Hint feature guides to the answer',
			'quiz4.insight.hintDesc' => 'The \'?\' icon or \'Hint\' button acts as a lifeline in many apps. Even if you don\'t know search commands, the hint design guides you to the answer.',
			'common.appTitle' => 'Mail',
			'common.inbox' => 'Inbox',
			'common.sent' => 'Sent',
			'common.trash' => 'Trash',
			'common.archive' => 'Archive',
			'common.searchHint' => 'Search mail',
			'common.emptyTrash' => 'Empty Trash',
			'common.selectedCount' => '{count} selected',
			'common.noMails' => 'No emails',
			'common.unread' => 'Unread',
			'common.archiveAction' => 'Archive',
			'common.deleteAction' => 'Delete',
			'common.searchPrompt' => 'Enter a search query and press Enter',
			'common.hintTooltip' => 'Hint',
			_ => null,
		};
	}
}
