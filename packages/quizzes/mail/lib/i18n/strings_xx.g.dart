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
}

// Path: quiz1
class _TranslationsQuiz1Xx extends TranslationsQuiz1Ja {
	_TranslationsQuiz1Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Archive the 3rd email from the top';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Empty the trash';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Select 3 emails and delete them';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Search for emails larger than 5 megabytes';
	@override String get hint => 'Tip: Use larger:5M to search by size';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know swiping would archive?';
	@override String get subtitle => 'Direction and icons teach the action';
	@override String get swipeTitle => 'Left swipe means organizing';
	@override String get swipeDesc => 'In mail and task apps swiping right to left is a standard UI pattern meaning archive or complete.';
	@override String get greenTitle => 'Green means safe and save';
	@override String get greenDesc => 'While red means delete or danger green is used worldwide to mean save or safe.';
	@override String get archiveTitle => 'Box icon is the universal archive symbol';
	@override String get archiveDesc => 'A box with a downward arrow is the common archive icon across all mail apps.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you navigate to trash via the drawer?';
	@override String get subtitle => 'The hamburger menu is the folder gateway';
	@override String get drawerTitle => 'Hamburger means there is more';
	@override String get drawerDesc => 'The three line icon is a universal UI symbol meaning open hidden menu.';
	@override String get trashTitle => 'Trash icon is home for deleted items';
	@override String get trashDesc => 'The trash icon indicates deleted items regardless of operating system.';
	@override String get emptyTitle => 'Empty button permanently deletes';
	@override String get emptyDesc => 'Trash is a temporary storage area. Data remains until you press Empty Trash.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know long press enables multi select?';
	@override String get subtitle => 'Long press is the entry to selection mode';
	@override String get longPressTitle => 'Long press switches to selection mode';
	@override String get longPressDesc => 'In mail and file management apps long press is the standard interaction to start multi select mode.';
	@override String get checkTitle => 'Checkmarks show selection state';
	@override String get checkDesc => 'The check mark is a universal symbol for selected.';
	@override String get headerTitle => 'Header changes to guide actions';
	@override String get headerDesc => 'Entering selection mode turns the header blue and shows count and action icons.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you think of the larger:5M command?';
	@override String get subtitle => 'Search operators narrow down emails';
	@override String get operatorTitle => 'Search operators specify conditions with commands';
	@override String get operatorDesc => 'Mail apps offer advanced filtering with search operators like larger:5M or from alice.';
	@override String get sizeTitle => '5M means 5 megabytes';
	@override String get sizeDesc => 'M stands for megabytes. This search condition finds emails with large attachments.';
	@override String get hintTitle => 'Hint feature guides to the answer';
	@override String get hintDesc => 'The hint button acts as a lifeline in many apps guiding you to the answer.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Archive the 3rd email from the top',
			'quiz1.insight.title' => 'How did you know swiping would archive?',
			'quiz1.insight.subtitle' => 'Direction and icons teach the action',
			'quiz1.insight.swipeTitle' => 'Left swipe means organizing',
			'quiz1.insight.swipeDesc' => 'In mail and task apps swiping right to left is a standard UI pattern meaning archive or complete.',
			'quiz1.insight.greenTitle' => 'Green means safe and save',
			'quiz1.insight.greenDesc' => 'While red means delete or danger green is used worldwide to mean save or safe.',
			'quiz1.insight.archiveTitle' => 'Box icon is the universal archive symbol',
			'quiz1.insight.archiveDesc' => 'A box with a downward arrow is the common archive icon across all mail apps.',
			'quiz2.missionText' => 'Empty the trash',
			'quiz2.insight.title' => 'How did you navigate to trash via the drawer?',
			'quiz2.insight.subtitle' => 'The hamburger menu is the folder gateway',
			'quiz2.insight.drawerTitle' => 'Hamburger means there is more',
			'quiz2.insight.drawerDesc' => 'The three line icon is a universal UI symbol meaning open hidden menu.',
			'quiz2.insight.trashTitle' => 'Trash icon is home for deleted items',
			'quiz2.insight.trashDesc' => 'The trash icon indicates deleted items regardless of operating system.',
			'quiz2.insight.emptyTitle' => 'Empty button permanently deletes',
			'quiz2.insight.emptyDesc' => 'Trash is a temporary storage area. Data remains until you press Empty Trash.',
			'quiz3.missionText' => 'Select 3 emails and delete them',
			'quiz3.insight.title' => 'How did you know long press enables multi select?',
			'quiz3.insight.subtitle' => 'Long press is the entry to selection mode',
			'quiz3.insight.longPressTitle' => 'Long press switches to selection mode',
			'quiz3.insight.longPressDesc' => 'In mail and file management apps long press is the standard interaction to start multi select mode.',
			'quiz3.insight.checkTitle' => 'Checkmarks show selection state',
			'quiz3.insight.checkDesc' => 'The check mark is a universal symbol for selected.',
			'quiz3.insight.headerTitle' => 'Header changes to guide actions',
			'quiz3.insight.headerDesc' => 'Entering selection mode turns the header blue and shows count and action icons.',
			'quiz4.missionText' => 'Search for emails larger than 5 megabytes',
			'quiz4.hint' => 'Tip: Use larger:5M to search by size',
			'quiz4.insight.title' => 'How did you think of the larger:5M command?',
			'quiz4.insight.subtitle' => 'Search operators narrow down emails',
			'quiz4.insight.operatorTitle' => 'Search operators specify conditions with commands',
			'quiz4.insight.operatorDesc' => 'Mail apps offer advanced filtering with search operators like larger:5M or from alice.',
			'quiz4.insight.sizeTitle' => '5M means 5 megabytes',
			'quiz4.insight.sizeDesc' => 'M stands for megabytes. This search condition finds emails with large attachments.',
			'quiz4.insight.hintTitle' => 'Hint feature guides to the answer',
			'quiz4.insight.hintDesc' => 'The hint button acts as a lifeline in many apps guiding you to the answer.',
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
