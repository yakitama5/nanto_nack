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
	@override String get missionText => 'Add new alarm';
	@override String get failureReason => 'Tap plus to add alarm';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Set the middle alarm to weekdays only';
	@override String get failureReason => 'Select 5 weekday buttons';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Turn off snooze on the top alarm';
	@override String get failureReason => 'Toggle snooze off and save';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Delete top alarm';
	@override String get failureReason => 'Swipe left to delete';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

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
	@override String get everyday => 'Every Day';
	@override String get editAlarm => 'Edit Alarm';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find the add button?';
	@override String get subtitle => 'Plus sign means create';
	@override String get plusTitle => 'Plus button means add';
	@override String get plusDesc => 'Plus icon means add new on any platform.';
	@override String get pickerTitle => 'Drum roll for time input';
	@override String get pickerDesc => 'Scroll picker is standard for time entry.';
	@override String get saveTitle => 'Save in top right';
	@override String get saveDesc => 'Save action is top right corner.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you find day settings?';
	@override String get subtitle => '7 circles equals one week';
	@override String get dotTitle => '7 circles are weekdays';
	@override String get dotDesc => '7 buttons in a row represent weekday selection.';
	@override String get weekdayTitle => '5 in a row equals weekdays';
	@override String get weekdayDesc => 'Selecting 5 consecutive days means weekdays only.';
	@override String get highlightTitle => 'Color shows selection';
	@override String get highlightDesc => 'Highlighted buttons are the selected days.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you turn off snooze?';
	@override String get subtitle => 'Toggle switch means on or off';
	@override String get toggleTitle => 'Toggle switch is on or off';
	@override String get toggleDesc => 'Toggle switches control feature on or off.';
	@override String get vs_arrow_title => 'Arrow vs toggle';
	@override String get vs_arrow_desc => 'Arrow navigates, toggle switches state.';
	@override String get colorTitle => 'Gray off colored on';
	@override String get colorDesc => 'Gray means off, colored means on.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you delete by swiping?';
	@override String get subtitle => 'Left swipe reveals hidden actions';
	@override String get swipeTitle => 'Left swipe shows hidden actions';
	@override String get swipeDesc => 'Swipe left to reveal delete action.';
	@override String get redTitle => 'Red means delete';
	@override String get redDesc => 'Red area means delete universally.';
	@override String get hiddenTitle => 'Hidden UIs exist';
	@override String get hiddenDesc => 'Gestures reveal hidden UI actions.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Add new alarm',
			'quiz1.failureReason' => 'Tap plus to add alarm',
			'quiz1.insight.title' => 'How did you find the add button?',
			'quiz1.insight.subtitle' => 'Plus sign means create',
			'quiz1.insight.plusTitle' => 'Plus button means add',
			'quiz1.insight.plusDesc' => 'Plus icon means add new on any platform.',
			'quiz1.insight.pickerTitle' => 'Drum roll for time input',
			'quiz1.insight.pickerDesc' => 'Scroll picker is standard for time entry.',
			'quiz1.insight.saveTitle' => 'Save in top right',
			'quiz1.insight.saveDesc' => 'Save action is top right corner.',
			'quiz2.missionText' => 'Set the middle alarm to weekdays only',
			'quiz2.failureReason' => 'Select 5 weekday buttons',
			'quiz2.insight.title' => 'How did you find day settings?',
			'quiz2.insight.subtitle' => '7 circles equals one week',
			'quiz2.insight.dotTitle' => '7 circles are weekdays',
			'quiz2.insight.dotDesc' => '7 buttons in a row represent weekday selection.',
			'quiz2.insight.weekdayTitle' => '5 in a row equals weekdays',
			'quiz2.insight.weekdayDesc' => 'Selecting 5 consecutive days means weekdays only.',
			'quiz2.insight.highlightTitle' => 'Color shows selection',
			'quiz2.insight.highlightDesc' => 'Highlighted buttons are the selected days.',
			'quiz3.missionText' => 'Turn off snooze on the top alarm',
			'quiz3.failureReason' => 'Toggle snooze off and save',
			'quiz3.insight.title' => 'How did you turn off snooze?',
			'quiz3.insight.subtitle' => 'Toggle switch means on or off',
			'quiz3.insight.toggleTitle' => 'Toggle switch is on or off',
			'quiz3.insight.toggleDesc' => 'Toggle switches control feature on or off.',
			'quiz3.insight.vs_arrow_title' => 'Arrow vs toggle',
			'quiz3.insight.vs_arrow_desc' => 'Arrow navigates, toggle switches state.',
			'quiz3.insight.colorTitle' => 'Gray off colored on',
			'quiz3.insight.colorDesc' => 'Gray means off, colored means on.',
			'quiz4.missionText' => 'Delete top alarm',
			'quiz4.failureReason' => 'Swipe left to delete',
			'quiz4.insight.title' => 'How did you delete by swiping?',
			'quiz4.insight.subtitle' => 'Left swipe reveals hidden actions',
			'quiz4.insight.swipeTitle' => 'Left swipe shows hidden actions',
			'quiz4.insight.swipeDesc' => 'Swipe left to reveal delete action.',
			'quiz4.insight.redTitle' => 'Red means delete',
			'quiz4.insight.redDesc' => 'Red area means delete universally.',
			'quiz4.insight.hiddenTitle' => 'Hidden UIs exist',
			'quiz4.insight.hiddenDesc' => 'Gestures reveal hidden UI actions.',
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
			'common.everyday' => 'Every Day',
			'common.editAlarm' => 'Edit Alarm',
			_ => null,
		};
	}
}
