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
}

// Path: quiz1
class TranslationsQuiz1En {
	TranslationsQuiz1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Archive the 3rd email from the top'
	String get missionText => 'Archive the 3rd email from the top';

	late final TranslationsQuiz1InsightEn insight = TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class TranslationsQuiz2En {
	TranslationsQuiz2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Empty the trash'
	String get missionText => 'Empty the trash';

	late final TranslationsQuiz2InsightEn insight = TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class TranslationsQuiz3En {
	TranslationsQuiz3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Select 3 emails and delete them'
	String get missionText => 'Select 3 emails and delete them';

	late final TranslationsQuiz3InsightEn insight = TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class TranslationsQuiz4En {
	TranslationsQuiz4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Search for emails larger than 5MB'
	String get missionText => 'Search for emails larger than 5MB';

	/// en: 'Tip: Use larger:5M to search by size!'
	String get hint => 'Tip: Use larger:5M to search by size!';

	late final TranslationsQuiz4InsightEn insight = TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Mail'
	String get appTitle => 'Mail';

	/// en: 'Inbox'
	String get inbox => 'Inbox';

	/// en: 'Sent'
	String get sent => 'Sent';

	/// en: 'Trash'
	String get trash => 'Trash';

	/// en: 'Archive'
	String get archive => 'Archive';

	/// en: 'Search mail'
	String get searchHint => 'Search mail';

	/// en: 'Empty Trash'
	String get emptyTrash => 'Empty Trash';

	/// en: '{count} selected'
	String get selectedCount => '{count} selected';

	/// en: 'No emails'
	String get noMails => 'No emails';

	/// en: 'Unread'
	String get unread => 'Unread';

	/// en: 'Archive'
	String get archiveAction => 'Archive';

	/// en: 'Delete'
	String get deleteAction => 'Delete';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightEn {
	TranslationsQuiz1InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know swiping would archive?'
	String get title => 'How did you know swiping would archive?';

	/// en: 'Direction and icons teach the action'
	String get subtitle => 'Direction and icons teach the action';

	/// en: 'Left swipe = sign of 'organizing''
	String get swipeTitle => 'Left swipe = sign of \'organizing\'';

	/// en: 'In mail and task apps, swiping right-to-left is a standard UI pattern meaning 'archive' or 'complete'. Gmail also uses this pattern.'
	String get swipeDesc => 'In mail and task apps, swiping right-to-left is a standard UI pattern meaning \'archive\' or \'complete\'. Gmail also uses this pattern.';

	/// en: 'Green = symbol of 'safe/save''
	String get greenTitle => 'Green = symbol of \'safe/save\'';

	/// en: 'While red means 'delete/danger', green is used in UIs worldwide to mean 'save/safe'.'
	String get greenDesc => 'While red means \'delete/danger\', green is used in UIs worldwide to mean \'save/safe\'.';

	/// en: 'Box icon = universal archive symbol'
	String get archiveTitle => 'Box icon = universal archive symbol';

	/// en: 'A box with a downward arrow (📦) is the common archive icon across Gmail and Outlook. Its meaning is understood without reading any language.'
	String get archiveDesc => 'A box with a downward arrow (📦) is the common archive icon across Gmail and Outlook. Its meaning is understood without reading any language.';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightEn {
	TranslationsQuiz2InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you navigate to trash via the drawer?'
	String get title => 'How did you navigate to trash via the drawer?';

	/// en: 'The hamburger menu is the folder gateway'
	String get subtitle => 'The hamburger menu is the folder gateway';

	/// en: 'Hamburger = sign of 'there's more''
	String get drawerTitle => 'Hamburger = sign of \'there\'s more\'';

	/// en: 'The three-line (☰) icon is a universal UI symbol meaning 'open hidden menu'. Gmail and Outlook use the same icon.'
	String get drawerDesc => 'The three-line (☰) icon is a universal UI symbol meaning \'open hidden menu\'. Gmail and Outlook use the same icon.';

	/// en: 'Trash icon = home for deleted items'
	String get trashTitle => 'Trash icon = home for deleted items';

	/// en: 'The 🗑️ icon indicates 'trash/deleted items' regardless of OS. Called Trash in Gmail and 'Deleted' in iOS, but the icon instantly identifies the location.'
	String get trashDesc => 'The 🗑️ icon indicates \'trash/deleted items\' regardless of OS. Called Trash in Gmail and \'Deleted\' in iOS, but the icon instantly identifies the location.';

	/// en: ''Empty' button permanently deletes'
	String get emptyTitle => '\'Empty\' button permanently deletes';

	/// en: 'Trash is a temporary storage area. The design that data remains until you press Empty Trash is a safety design to prevent accidental deletion.'
	String get emptyDesc => 'Trash is a temporary storage area. The design that data remains until you press Empty Trash is a safety design to prevent accidental deletion.';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightEn {
	TranslationsQuiz3InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you know long press enables multi-select?'
	String get title => 'How did you know long press enables multi-select?';

	/// en: 'Long press is the entry to selection mode'
	String get subtitle => 'Long press is the entry to selection mode';

	/// en: 'Long press = switch to selection mode'
	String get longPressTitle => 'Long press = switch to selection mode';

	/// en: 'In mail and file management apps, long press is the standard interaction to start multi-select mode. Gmail and iOS Mail use the same pattern.'
	String get longPressDesc => 'In mail and file management apps, long press is the standard interaction to start multi-select mode. Gmail and iOS Mail use the same pattern.';

	/// en: 'Checkmarks visualize selection state'
	String get checkTitle => 'Checkmarks visualize selection state';

	/// en: 'The ✓ mark is a universal symbol for 'selected'. Combined with checkboxes, you can see how many items are selected at a glance.'
	String get checkDesc => 'The ✓ mark is a universal symbol for \'selected\'. Combined with checkboxes, you can see how many items are selected at a glance.';

	/// en: 'Header changes to guide actions'
	String get headerTitle => 'Header changes to guide actions';

	/// en: 'Entering selection mode turns the header blue and shows count and action icons. This 'context-dependent UI change' is the standard Android Contextual Action Bar pattern.'
	String get headerDesc => 'Entering selection mode turns the header blue and shows count and action icons. This \'context-dependent UI change\' is the standard Android Contextual Action Bar pattern.';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightEn {
	TranslationsQuiz4InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you think of the 'larger:5M' command?'
	String get title => 'How did you think of the \'larger:5M\' command?';

	/// en: 'Search operators narrow down emails'
	String get subtitle => 'Search operators narrow down emails';

	/// en: 'Search operators = specify conditions with commands'
	String get operatorTitle => 'Search operators = specify conditions with commands';

	/// en: 'Gmail offers advanced filtering with search operators like 'larger:5M', 'from:alice', 'has:attachment'. This is not just for programmers - it's a feature for all users.'
	String get operatorDesc => 'Gmail offers advanced filtering with search operators like \'larger:5M\', \'from:alice\', \'has:attachment\'. This is not just for programmers - it\'s a feature for all users.';

	/// en: '5M = size specification of 5 megabytes'
	String get sizeTitle => '5M = size specification of 5 megabytes';

	/// en: ''M' stands for megabytes (MB). This search condition is used to find emails with large attachments - a standard Gmail feature for years.'
	String get sizeDesc => '\'M\' stands for megabytes (MB). This search condition is used to find emails with large attachments - a standard Gmail feature for years.';

	/// en: 'Hint feature guides to the answer'
	String get hintTitle => 'Hint feature guides to the answer';

	/// en: 'The '?' icon or 'Hint' button acts as a lifeline in many apps. Even if you don't know search commands, the hint design guides you to the answer.'
	String get hintDesc => 'The \'?\' icon or \'Hint\' button acts as a lifeline in many apps. Even if you don\'t know search commands, the hint design guides you to the answer.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
			'quiz2.insight.emptyTitle' => '\'Empty\' button permanently deletes',
			'quiz2.insight.emptyDesc' => 'Trash is a temporary storage area. The design that data remains until you press Empty Trash is a safety design to prevent accidental deletion.',
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
			_ => null,
		};
	}
}
