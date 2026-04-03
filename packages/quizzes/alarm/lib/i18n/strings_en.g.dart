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
	@override String get missionText => 'Please add a new alarm';
	@override String get failureReason => 'Tap the + button, set the time, and save';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please set the alarm to ring on weekdays only (Mon-Fri)';
	@override String get failureReason => 'Please select the 5 weekday buttons (Mon-Fri)';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please turn off the Snooze feature and save';
	@override String get failureReason => 'Turn off the snooze toggle and save';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Please delete the top alarm';
	@override String get failureReason => 'Swipe left on the alarm to delete it';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Clock';
	@override String get alarmsTab => 'Alarms';
	@override String get add => 'Add';
	@override String get save => 'Save';
	@override String get cancel => 'Cancel';
	@override String get delete => 'Delete';
	@override String get snooze => 'Snooze';
	@override String get label => 'Label';
	@override String get sound => 'Sound';
	@override String get repeat => 'Repeat';
	@override String get am => 'AM';
	@override String get pm => 'PM';
	@override String get mon => 'M';
	@override String get tue => 'T';
	@override String get wed => 'W';
	@override String get thu => 'T';
	@override String get fri => 'F';
	@override String get sat => 'S';
	@override String get sun => 'S';
	@override String get tomorrow => 'Tomorrow';
	@override String get weekdays => 'Weekdays';
	@override String get editAlarm => 'Edit Alarm';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the add button?';
	@override String get subtitle => 'Plus sign is the universal symbol for create new';
	@override String get plusTitle => 'Plus button means add new';
	@override String get plusDesc => 'The + (plus) icon is a standard UI pattern representing \'create new / add\' on both iOS and Android.';
	@override String get pickerTitle => 'Drum roll is the classic time input UI';
	@override String get pickerDesc => 'The vertically scrolling drum roll picker is widely used for time and date entry in clock and reservation apps.';
	@override String get saveTitle => '\'Save\' is placed in the top right';
	@override String get saveDesc => 'A common pattern on iOS/Android: the Save/Done action in editing screens is placed in the top right corner.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the day settings?';
	@override String get subtitle => '7 circles = 1 week mental model';
	@override String get dotTitle => '7 circles represent days of the week';
	@override String get dotDesc => 'When 7 round buttons are arranged horizontally, they represent weekday selection — a mental model shared by calendar and alarm apps worldwide.';
	@override String get weekdayTitle => '5 consecutive = weekdays';
	@override String get weekdayDesc => 'Selecting Monday through Friday\'s 5 days means \'weekdays only\'. The highlight state visually communicates selection completion.';
	@override String get highlightTitle => 'Color change indicates selection state';
	@override String get highlightDesc => 'Selected buttons become highlighted (colored), making it easy to see which days are active — a universal UI pattern.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you turn off snooze?';
	@override String get subtitle => 'Toggle switch = the symbol for on/off';
	@override String get toggleTitle => 'Toggle switch represents on/off';
	@override String get toggleDesc => 'A toggle switch (left/right switching UI) is a dedicated UI component for turning a feature on or off.';
	@override String get vs_arrow_title => 'Arrow vs toggle: navigate vs switch';
	@override String get vs_arrow_desc => '\'>\' means navigate to another screen, while a toggle switches on/off on the same screen. Understanding this distinction helps you find what you need.';
	@override String get colorTitle => 'Gray = off, colored = on';
	@override String get colorDesc => 'When the toggle turns gray, it\'s off. When colored (often green), it\'s on — a universal color convention.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you delete with a swipe?';
	@override String get subtitle => 'Left swipe = the classic hidden action gesture';
	@override String get swipeTitle => 'Left swipe reveals hidden actions';
	@override String get swipeDesc => 'Swiping left on a list item to reveal delete/archive actions is a pattern used in iOS, Gmail, Slack, and many other apps.';
	@override String get redTitle => 'Red area = the international color for delete';
	@override String get redDesc => 'The red area or trash icon revealed by swiping means delete. Red representing danger/delete is a universal UI design principle.';
	@override String get hiddenTitle => 'Knowing hidden UIs matters';
	@override String get hiddenDesc => 'Even UIs not visible on screen can be revealed by gestures. This hidden action pattern is part of what makes smartphone UIs deep.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
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
