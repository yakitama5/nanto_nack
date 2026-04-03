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

	/// en: 'Please add a new alarm'
	String get missionText => 'Please add a new alarm';

	/// en: 'Tap the + button, set the time, and save'
	String get failureReason => 'Tap the + button, set the time, and save';

	late final TranslationsQuiz1InsightEn insight = TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class TranslationsQuiz2En {
	TranslationsQuiz2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please set the alarm to ring on weekdays only (Mon-Fri)'
	String get missionText => 'Please set the alarm to ring on weekdays only (Mon-Fri)';

	/// en: 'Please select the 5 weekday buttons (Mon-Fri)'
	String get failureReason => 'Please select the 5 weekday buttons (Mon-Fri)';

	late final TranslationsQuiz2InsightEn insight = TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class TranslationsQuiz3En {
	TranslationsQuiz3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please turn off the Snooze feature and save'
	String get missionText => 'Please turn off the Snooze feature and save';

	/// en: 'Turn off the snooze toggle and save'
	String get failureReason => 'Turn off the snooze toggle and save';

	late final TranslationsQuiz3InsightEn insight = TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class TranslationsQuiz4En {
	TranslationsQuiz4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please delete the top alarm'
	String get missionText => 'Please delete the top alarm';

	/// en: 'Swipe left on the alarm to delete it'
	String get failureReason => 'Swipe left on the alarm to delete it';

	late final TranslationsQuiz4InsightEn insight = TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Clock'
	String get appTitle => 'Clock';

	/// en: 'Alarms'
	String get alarmsTab => 'Alarms';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Snooze'
	String get snooze => 'Snooze';

	/// en: 'Label'
	String get label => 'Label';

	/// en: 'Sound'
	String get sound => 'Sound';

	/// en: 'Repeat'
	String get repeat => 'Repeat';

	/// en: 'AM'
	String get am => 'AM';

	/// en: 'PM'
	String get pm => 'PM';

	/// en: 'M'
	String get mon => 'M';

	/// en: 'T'
	String get tue => 'T';

	/// en: 'W'
	String get wed => 'W';

	/// en: 'T'
	String get thu => 'T';

	/// en: 'F'
	String get fri => 'F';

	/// en: 'S'
	String get sat => 'S';

	/// en: 'S'
	String get sun => 'S';

	/// en: 'Tomorrow'
	String get tomorrow => 'Tomorrow';

	/// en: 'Weekdays'
	String get weekdays => 'Weekdays';

	/// en: 'Edit Alarm'
	String get editAlarm => 'Edit Alarm';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightEn {
	TranslationsQuiz1InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the add button?'
	String get title => 'How did you find the add button?';

	/// en: 'Plus sign is the universal symbol for create new'
	String get subtitle => 'Plus sign is the universal symbol for create new';

	/// en: 'Plus button means add new'
	String get plusTitle => 'Plus button means add new';

	/// en: 'The + (plus) icon is a standard UI pattern representing 'create new / add' on both iOS and Android.'
	String get plusDesc => 'The + (plus) icon is a standard UI pattern representing \'create new / add\' on both iOS and Android.';

	/// en: 'Drum roll is the classic time input UI'
	String get pickerTitle => 'Drum roll is the classic time input UI';

	/// en: 'The vertically scrolling drum roll picker is widely used for time and date entry in clock and reservation apps.'
	String get pickerDesc => 'The vertically scrolling drum roll picker is widely used for time and date entry in clock and reservation apps.';

	/// en: ''Save' is placed in the top right'
	String get saveTitle => '\'Save\' is placed in the top right';

	/// en: 'A common pattern on iOS/Android: the Save/Done action in editing screens is placed in the top right corner.'
	String get saveDesc => 'A common pattern on iOS/Android: the Save/Done action in editing screens is placed in the top right corner.';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightEn {
	TranslationsQuiz2InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you find the day settings?'
	String get title => 'How did you find the day settings?';

	/// en: '7 circles = 1 week mental model'
	String get subtitle => '7 circles = 1 week mental model';

	/// en: '7 circles represent days of the week'
	String get dotTitle => '7 circles represent days of the week';

	/// en: 'When 7 round buttons are arranged horizontally, they represent weekday selection — a mental model shared by calendar and alarm apps worldwide.'
	String get dotDesc => 'When 7 round buttons are arranged horizontally, they represent weekday selection — a mental model shared by calendar and alarm apps worldwide.';

	/// en: '5 consecutive = weekdays'
	String get weekdayTitle => '5 consecutive = weekdays';

	/// en: 'Selecting Monday through Friday's 5 days means 'weekdays only'. The highlight state visually communicates selection completion.'
	String get weekdayDesc => 'Selecting Monday through Friday\'s 5 days means \'weekdays only\'. The highlight state visually communicates selection completion.';

	/// en: 'Color change indicates selection state'
	String get highlightTitle => 'Color change indicates selection state';

	/// en: 'Selected buttons become highlighted (colored), making it easy to see which days are active — a universal UI pattern.'
	String get highlightDesc => 'Selected buttons become highlighted (colored), making it easy to see which days are active — a universal UI pattern.';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightEn {
	TranslationsQuiz3InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you turn off snooze?'
	String get title => 'How did you turn off snooze?';

	/// en: 'Toggle switch = the symbol for on/off'
	String get subtitle => 'Toggle switch = the symbol for on/off';

	/// en: 'Toggle switch represents on/off'
	String get toggleTitle => 'Toggle switch represents on/off';

	/// en: 'A toggle switch (left/right switching UI) is a dedicated UI component for turning a feature on or off.'
	String get toggleDesc => 'A toggle switch (left/right switching UI) is a dedicated UI component for turning a feature on or off.';

	/// en: 'Arrow vs toggle: navigate vs switch'
	String get vs_arrow_title => 'Arrow vs toggle: navigate vs switch';

	/// en: ''>' means navigate to another screen, while a toggle switches on/off on the same screen. Understanding this distinction helps you find what you need.'
	String get vs_arrow_desc => '\'>\' means navigate to another screen, while a toggle switches on/off on the same screen. Understanding this distinction helps you find what you need.';

	/// en: 'Gray = off, colored = on'
	String get colorTitle => 'Gray = off, colored = on';

	/// en: 'When the toggle turns gray, it's off. When colored (often green), it's on — a universal color convention.'
	String get colorDesc => 'When the toggle turns gray, it\'s off. When colored (often green), it\'s on — a universal color convention.';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightEn {
	TranslationsQuiz4InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you delete with a swipe?'
	String get title => 'How did you delete with a swipe?';

	/// en: 'Left swipe = the classic hidden action gesture'
	String get subtitle => 'Left swipe = the classic hidden action gesture';

	/// en: 'Left swipe reveals hidden actions'
	String get swipeTitle => 'Left swipe reveals hidden actions';

	/// en: 'Swiping left on a list item to reveal delete/archive actions is a pattern used in iOS, Gmail, Slack, and many other apps.'
	String get swipeDesc => 'Swiping left on a list item to reveal delete/archive actions is a pattern used in iOS, Gmail, Slack, and many other apps.';

	/// en: 'Red area = the international color for delete'
	String get redTitle => 'Red area = the international color for delete';

	/// en: 'The red area or trash icon revealed by swiping means delete. Red representing danger/delete is a universal UI design principle.'
	String get redDesc => 'The red area or trash icon revealed by swiping means delete. Red representing danger/delete is a universal UI design principle.';

	/// en: 'Knowing hidden UIs matters'
	String get hiddenTitle => 'Knowing hidden UIs matters';

	/// en: 'Even UIs not visible on screen can be revealed by gestures. This hidden action pattern is part of what makes smartphone UIs deep.'
	String get hiddenDesc => 'Even UIs not visible on screen can be revealed by gestures. This hidden action pattern is part of what makes smartphone UIs deep.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Please add a new alarm',
			'quiz1.failureReason' => 'Tap the + button, set the time, and save',
			'quiz1.insight.title' => 'How did you find the add button?',
			'quiz1.insight.subtitle' => 'Plus sign is the universal symbol for create new',
			'quiz1.insight.plusTitle' => 'Plus button means add new',
			'quiz1.insight.plusDesc' => 'The + (plus) icon is a standard UI pattern representing \'create new / add\' on both iOS and Android.',
			'quiz1.insight.pickerTitle' => 'Drum roll is the classic time input UI',
			'quiz1.insight.pickerDesc' => 'The vertically scrolling drum roll picker is widely used for time and date entry in clock and reservation apps.',
			'quiz1.insight.saveTitle' => '\'Save\' is placed in the top right',
			'quiz1.insight.saveDesc' => 'A common pattern on iOS/Android: the Save/Done action in editing screens is placed in the top right corner.',
			'quiz2.missionText' => 'Please set the alarm to ring on weekdays only (Mon-Fri)',
			'quiz2.failureReason' => 'Please select the 5 weekday buttons (Mon-Fri)',
			'quiz2.insight.title' => 'How did you find the day settings?',
			'quiz2.insight.subtitle' => '7 circles = 1 week mental model',
			'quiz2.insight.dotTitle' => '7 circles represent days of the week',
			'quiz2.insight.dotDesc' => 'When 7 round buttons are arranged horizontally, they represent weekday selection — a mental model shared by calendar and alarm apps worldwide.',
			'quiz2.insight.weekdayTitle' => '5 consecutive = weekdays',
			'quiz2.insight.weekdayDesc' => 'Selecting Monday through Friday\'s 5 days means \'weekdays only\'. The highlight state visually communicates selection completion.',
			'quiz2.insight.highlightTitle' => 'Color change indicates selection state',
			'quiz2.insight.highlightDesc' => 'Selected buttons become highlighted (colored), making it easy to see which days are active — a universal UI pattern.',
			'quiz3.missionText' => 'Please turn off the Snooze feature and save',
			'quiz3.failureReason' => 'Turn off the snooze toggle and save',
			'quiz3.insight.title' => 'How did you turn off snooze?',
			'quiz3.insight.subtitle' => 'Toggle switch = the symbol for on/off',
			'quiz3.insight.toggleTitle' => 'Toggle switch represents on/off',
			'quiz3.insight.toggleDesc' => 'A toggle switch (left/right switching UI) is a dedicated UI component for turning a feature on or off.',
			'quiz3.insight.vs_arrow_title' => 'Arrow vs toggle: navigate vs switch',
			'quiz3.insight.vs_arrow_desc' => '\'>\' means navigate to another screen, while a toggle switches on/off on the same screen. Understanding this distinction helps you find what you need.',
			'quiz3.insight.colorTitle' => 'Gray = off, colored = on',
			'quiz3.insight.colorDesc' => 'When the toggle turns gray, it\'s off. When colored (often green), it\'s on — a universal color convention.',
			'quiz4.missionText' => 'Please delete the top alarm',
			'quiz4.failureReason' => 'Swipe left on the alarm to delete it',
			'quiz4.insight.title' => 'How did you delete with a swipe?',
			'quiz4.insight.subtitle' => 'Left swipe = the classic hidden action gesture',
			'quiz4.insight.swipeTitle' => 'Left swipe reveals hidden actions',
			'quiz4.insight.swipeDesc' => 'Swiping left on a list item to reveal delete/archive actions is a pattern used in iOS, Gmail, Slack, and many other apps.',
			'quiz4.insight.redTitle' => 'Red area = the international color for delete',
			'quiz4.insight.redDesc' => 'The red area or trash icon revealed by swiping means delete. Red representing danger/delete is a universal UI design principle.',
			'quiz4.insight.hiddenTitle' => 'Knowing hidden UIs matters',
			'quiz4.insight.hiddenDesc' => 'Even UIs not visible on screen can be revealed by gestures. This hidden action pattern is part of what makes smartphone UIs deep.',
			'common.appTitle' => 'Clock',
			'common.alarmsTab' => 'Alarms',
			'common.add' => 'Add',
			'common.save' => 'Save',
			'common.cancel' => 'Cancel',
			'common.delete' => 'Delete',
			'common.snooze' => 'Snooze',
			'common.label' => 'Label',
			'common.sound' => 'Sound',
			'common.repeat' => 'Repeat',
			'common.am' => 'AM',
			'common.pm' => 'PM',
			'common.mon' => 'M',
			'common.tue' => 'T',
			'common.wed' => 'W',
			'common.thu' => 'T',
			'common.fri' => 'F',
			'common.sat' => 'S',
			'common.sun' => 'S',
			'common.tomorrow' => 'Tomorrow',
			'common.weekdays' => 'Weekdays',
			'common.editAlarm' => 'Edit Alarm',
			_ => null,
		};
	}
}
