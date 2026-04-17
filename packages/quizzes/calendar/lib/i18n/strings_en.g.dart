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
	@override String get missionText => 'Check what events are scheduled next month';
	@override String get failureReason => 'Swipe left on the calendar to show next month';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Add a new event on the 15th';
	@override String get failureReason => 'Long press the 15th cell or use the + button in the bottom right to add an event';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Add a new event 2 days from now';
	@override String get failureReason => 'Tap the date 2 days from now or use the + button to add an event';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Got lost! Return to \'today\' instantly';
	@override String get failureReason => 'Tap the calendar icon (Today) button in the AppBar';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Calendar';
	@override String get today => 'Today';
	@override String get add => 'Add';
	@override String get save => 'Save';
	@override String get cancel => 'Cancel';
	@override String get newEvent => 'New Event';
	@override String get eventTitle => 'Event Title';
	@override String get addEventTitle => 'Add Event';
	@override List<String> get weekdays => [
		'Mon',
		'Tue',
		'Wed',
		'Thu',
		'Fri',
		'Sat',
		'Sun',
	];
	@override String dateLabel({required Object month, required Object day, required Object weekday}) => '${month}/${day} (${weekday})';
	@override String get eventInterview => 'Interview';
	@override String get eventParty => 'Party';
	@override String get eventMeeting => 'Meeting';
	@override String get eventHealth => 'Health Check';
	@override String get eventDentist => 'Dentist';
	@override String get eventLunch => 'Lunch';
	@override String get eventImportant => 'Important';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you check next month?';
	@override String get subtitle => 'Horizontal swipe switches months intuitively';
	@override String get swipeTitle => 'Horizontal swipe is the standard page-turn gesture';
	@override String get swipeDesc => 'In calendar apps, swiping left goes to the next month and swiping right goes to the previous month. This is consistent across almost all calendar apps.';
	@override String get calendarTitle => 'Calendars are managed month by month';
	@override String get calendarDesc => 'Smartphone calendar apps switch months by swiping rather than continuous scrolling. This month-by-month swipe UI design has become the mainstream.';
	@override String get gestureTitle => 'You can operate even hidden UI';
	@override String get gestureDesc => 'Even without a \'Next Month\' button on screen, you can navigate using swipe gestures. This is one of the defining features of smartphone UI design.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How could you add by long pressing?';
	@override String get subtitle => 'Long press reveals hidden action menus';
	@override String get longPressTitle => 'Long press opens a context menu';
	@override String get longPressDesc => 'Long pressing a calendar date lets you directly add an event for that day. This is a hidden but convenient feature adopted by many calendar apps.';
	@override String get fabTitle => 'The + button is the universal language for creation';
	@override String get fabDesc => 'The + (plus) button in the bottom right is a UI pattern that means \'create something new\', which has become a world standard centered around Google apps.';
	@override String get addTitle => 'Two operation paths exist';
	@override String get addDesc => 'Adding an event to the calendar can be done in two ways: \'long press a date\' or \'tap the + button\'. Knowing both expands your operational choices.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you add an event 2 days from now?';
	@override String get subtitle => 'Tapping a date to add events is intuitive';
	@override String get tapTitle => 'Tap a date to add an event';
	@override String get tapDesc => 'Tapping a calendar date lets you add an event for that day. This works not just for today, but for any future date with the same operation.';
	@override String get futureTitle => 'You can schedule events on future dates';
	@override String get futureDesc => 'Smartphone calendars let you register events for any date — days, weeks, or months ahead. Pre-entering future plans is the foundation of schedule management.';
	@override String get planTitle => 'Proactive planning improves your performance';
	@override String get planDesc => 'Registering what you need to do \'2 days from now\' lets you prepare in advance. The habit of entering events immediately helps you stay organized.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How could you return to \'today\' so quickly?';
	@override String get subtitle => 'The \'Today\' button saves you from getting lost';
	@override String get todayTitle => '\'Today\' button is an essential calendar feature';
	@override String get todayDesc => 'Calendar apps have a dedicated button to jump to today\'s date. Even after navigating far into the future or past, you can return instantly.';
	@override String get iconTitle => 'Calendar icon = return to today';
	@override String get iconDesc => 'The calendar icon displayed in the AppBar means \'show today\'s date\'. This is a typical example of communicating function through icon design.';
	@override String get jumpTitle => 'Jumping is more efficient than scrolling';
	@override String get jumpDesc => 'When returning from years in the future or past to the present, jumping directly with a dedicated button is overwhelmingly faster than swiping back one month at a time.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Check what events are scheduled next month',
			'quiz1.failureReason' => 'Swipe left on the calendar to show next month',
			'quiz1.insight.title' => 'How did you check next month?',
			'quiz1.insight.subtitle' => 'Horizontal swipe switches months intuitively',
			'quiz1.insight.swipeTitle' => 'Horizontal swipe is the standard page-turn gesture',
			'quiz1.insight.swipeDesc' => 'In calendar apps, swiping left goes to the next month and swiping right goes to the previous month. This is consistent across almost all calendar apps.',
			'quiz1.insight.calendarTitle' => 'Calendars are managed month by month',
			'quiz1.insight.calendarDesc' => 'Smartphone calendar apps switch months by swiping rather than continuous scrolling. This month-by-month swipe UI design has become the mainstream.',
			'quiz1.insight.gestureTitle' => 'You can operate even hidden UI',
			'quiz1.insight.gestureDesc' => 'Even without a \'Next Month\' button on screen, you can navigate using swipe gestures. This is one of the defining features of smartphone UI design.',
			'quiz2.missionText' => 'Add a new event on the 15th',
			'quiz2.failureReason' => 'Long press the 15th cell or use the + button in the bottom right to add an event',
			'quiz2.insight.title' => 'How could you add by long pressing?',
			'quiz2.insight.subtitle' => 'Long press reveals hidden action menus',
			'quiz2.insight.longPressTitle' => 'Long press opens a context menu',
			'quiz2.insight.longPressDesc' => 'Long pressing a calendar date lets you directly add an event for that day. This is a hidden but convenient feature adopted by many calendar apps.',
			'quiz2.insight.fabTitle' => 'The + button is the universal language for creation',
			'quiz2.insight.fabDesc' => 'The + (plus) button in the bottom right is a UI pattern that means \'create something new\', which has become a world standard centered around Google apps.',
			'quiz2.insight.addTitle' => 'Two operation paths exist',
			'quiz2.insight.addDesc' => 'Adding an event to the calendar can be done in two ways: \'long press a date\' or \'tap the + button\'. Knowing both expands your operational choices.',
			'quiz3.missionText' => 'Add a new event 2 days from now',
			'quiz3.failureReason' => 'Tap the date 2 days from now or use the + button to add an event',
			'quiz3.insight.title' => 'How did you add an event 2 days from now?',
			'quiz3.insight.subtitle' => 'Tapping a date to add events is intuitive',
			'quiz3.insight.tapTitle' => 'Tap a date to add an event',
			'quiz3.insight.tapDesc' => 'Tapping a calendar date lets you add an event for that day. This works not just for today, but for any future date with the same operation.',
			'quiz3.insight.futureTitle' => 'You can schedule events on future dates',
			'quiz3.insight.futureDesc' => 'Smartphone calendars let you register events for any date — days, weeks, or months ahead. Pre-entering future plans is the foundation of schedule management.',
			'quiz3.insight.planTitle' => 'Proactive planning improves your performance',
			'quiz3.insight.planDesc' => 'Registering what you need to do \'2 days from now\' lets you prepare in advance. The habit of entering events immediately helps you stay organized.',
			'quiz4.missionText' => 'Got lost! Return to \'today\' instantly',
			'quiz4.failureReason' => 'Tap the calendar icon (Today) button in the AppBar',
			'quiz4.insight.title' => 'How could you return to \'today\' so quickly?',
			'quiz4.insight.subtitle' => 'The \'Today\' button saves you from getting lost',
			'quiz4.insight.todayTitle' => '\'Today\' button is an essential calendar feature',
			'quiz4.insight.todayDesc' => 'Calendar apps have a dedicated button to jump to today\'s date. Even after navigating far into the future or past, you can return instantly.',
			'quiz4.insight.iconTitle' => 'Calendar icon = return to today',
			'quiz4.insight.iconDesc' => 'The calendar icon displayed in the AppBar means \'show today\'s date\'. This is a typical example of communicating function through icon design.',
			'quiz4.insight.jumpTitle' => 'Jumping is more efficient than scrolling',
			'quiz4.insight.jumpDesc' => 'When returning from years in the future or past to the present, jumping directly with a dedicated button is overwhelmingly faster than swiping back one month at a time.',
			'common.appTitle' => 'Calendar',
			'common.today' => 'Today',
			'common.add' => 'Add',
			'common.save' => 'Save',
			'common.cancel' => 'Cancel',
			'common.newEvent' => 'New Event',
			'common.eventTitle' => 'Event Title',
			'common.addEventTitle' => 'Add Event',
			'common.weekdays.0' => 'Mon',
			'common.weekdays.1' => 'Tue',
			'common.weekdays.2' => 'Wed',
			'common.weekdays.3' => 'Thu',
			'common.weekdays.4' => 'Fri',
			'common.weekdays.5' => 'Sat',
			'common.weekdays.6' => 'Sun',
			'common.dateLabel' => ({required Object month, required Object day, required Object weekday}) => '${month}/${day} (${weekday})',
			'common.eventInterview' => 'Interview',
			'common.eventParty' => 'Party',
			'common.eventMeeting' => 'Meeting',
			'common.eventHealth' => 'Health Check',
			'common.eventDentist' => 'Dentist',
			'common.eventLunch' => 'Lunch',
			'common.eventImportant' => 'Important',
			_ => null,
		};
	}
}
