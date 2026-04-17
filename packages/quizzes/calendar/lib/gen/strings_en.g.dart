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

	/// en: 'Check what events are scheduled next month'
	String get missionText => 'Check what events are scheduled next month';

	/// en: 'Swipe left on the calendar to show next month'
	String get failureReason => 'Swipe left on the calendar to show next month';

	late final TranslationsQuiz1InsightEn insight = TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class TranslationsQuiz2En {
	TranslationsQuiz2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add a new event on the 15th'
	String get missionText => 'Add a new event on the 15th';

	/// en: 'Long press the 15th cell to add an event'
	String get failureReason => 'Long press the 15th cell to add an event';

	late final TranslationsQuiz2InsightEn insight = TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class TranslationsQuiz3En {
	TranslationsQuiz3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Move the event to tomorrow'
	String get missionText => 'Move the event to tomorrow';

	/// en: 'Long press the event and drag & drop it to the next day'
	String get failureReason => 'Long press the event and drag & drop it to the next day';

	late final TranslationsQuiz3InsightEn insight = TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class TranslationsQuiz4En {
	TranslationsQuiz4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Got lost! Return to 'today' instantly'
	String get missionText => 'Got lost! Return to \'today\' instantly';

	/// en: 'Tap the calendar icon (Today) button in the AppBar'
	String get failureReason => 'Tap the calendar icon (Today) button in the AppBar';

	late final TranslationsQuiz4InsightEn insight = TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Calendar'
	String get appTitle => 'Calendar';

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'New Event'
	String get newEvent => 'New Event';

	/// en: 'Event Title'
	String get eventTitle => 'Event Title';

	/// en: 'Add Event'
	String get addEventTitle => 'Add Event';

	List<String> get weekdays => [
		'Mon',
		'Tue',
		'Wed',
		'Thu',
		'Fri',
		'Sat',
		'Sun',
	];

	/// en: '$month/$day ($weekday)'
	String dateLabel({required Object month, required Object day, required Object weekday}) => '${month}/${day} (${weekday})';

	/// en: 'Interview'
	String get eventInterview => 'Interview';

	/// en: 'Party'
	String get eventParty => 'Party';

	/// en: 'Meeting'
	String get eventMeeting => 'Meeting';

	/// en: 'Health Check'
	String get eventHealth => 'Health Check';

	/// en: 'Dentist'
	String get eventDentist => 'Dentist';

	/// en: 'Lunch'
	String get eventLunch => 'Lunch';

	/// en: 'Important'
	String get eventImportant => 'Important';
}

// Path: quiz1.insight
class TranslationsQuiz1InsightEn {
	TranslationsQuiz1InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you check next month?'
	String get title => 'How did you check next month?';

	/// en: 'Horizontal swipe switches months intuitively'
	String get subtitle => 'Horizontal swipe switches months intuitively';

	/// en: 'Horizontal swipe is the standard page-turn gesture'
	String get swipeTitle => 'Horizontal swipe is the standard page-turn gesture';

	/// en: 'In calendar apps, swiping left goes to the next month and swiping right goes to the previous month. This is consistent across almost all calendar apps.'
	String get swipeDesc => 'In calendar apps, swiping left goes to the next month and swiping right goes to the previous month. This is consistent across almost all calendar apps.';

	/// en: 'Calendars are managed month by month'
	String get calendarTitle => 'Calendars are managed month by month';

	/// en: 'Smartphone calendar apps switch months by swiping rather than continuous scrolling. This month-by-month swipe UI design has become the mainstream.'
	String get calendarDesc => 'Smartphone calendar apps switch months by swiping rather than continuous scrolling. This month-by-month swipe UI design has become the mainstream.';

	/// en: 'You can operate even hidden UI'
	String get gestureTitle => 'You can operate even hidden UI';

	/// en: 'Even without a 'Next Month' button on screen, you can navigate using swipe gestures. This is one of the defining features of smartphone UI design.'
	String get gestureDesc => 'Even without a \'Next Month\' button on screen, you can navigate using swipe gestures. This is one of the defining features of smartphone UI design.';
}

// Path: quiz2.insight
class TranslationsQuiz2InsightEn {
	TranslationsQuiz2InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How could you add by long pressing?'
	String get title => 'How could you add by long pressing?';

	/// en: 'Long press reveals hidden action menus'
	String get subtitle => 'Long press reveals hidden action menus';

	/// en: 'Long press opens a context menu'
	String get longPressTitle => 'Long press opens a context menu';

	/// en: 'Long pressing a calendar date lets you directly add an event for that day. This is a hidden but convenient feature adopted by many calendar apps.'
	String get longPressDesc => 'Long pressing a calendar date lets you directly add an event for that day. This is a hidden but convenient feature adopted by many calendar apps.';

	/// en: 'The + button is the universal language for creation'
	String get fabTitle => 'The + button is the universal language for creation';

	/// en: 'The + (plus) button in the bottom right is a UI pattern that means 'create something new', which has become a world standard centered around Google apps.'
	String get fabDesc => 'The + (plus) button in the bottom right is a UI pattern that means \'create something new\', which has become a world standard centered around Google apps.';

	/// en: 'Two operation paths exist'
	String get addTitle => 'Two operation paths exist';

	/// en: 'Adding an event to the calendar can be done in two ways: 'long press a date' or 'tap the + button'. Knowing both expands your operational choices.'
	String get addDesc => 'Adding an event to the calendar can be done in two ways: \'long press a date\' or \'tap the + button\'. Knowing both expands your operational choices.';
}

// Path: quiz3.insight
class TranslationsQuiz3InsightEn {
	TranslationsQuiz3InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How did you move the event to the next day?'
	String get title => 'How did you move the event to the next day?';

	/// en: 'Drag & drop is intuitive for moving events'
	String get subtitle => 'Drag & drop is intuitive for moving events';

	/// en: 'Long press and drag to move events'
	String get tapTitle => 'Long press and drag to move events';

	/// en: 'Long pressing an event lets you drag it to a new date. This works for rescheduling existing events to different days.'
	String get tapDesc => 'Long pressing an event lets you drag it to a new date. This works for rescheduling existing events to different days.';

	/// en: 'You can reschedule events to future dates'
	String get futureTitle => 'You can reschedule events to future dates';

	/// en: 'Smartphone calendars let you move events to any date — days, weeks, or months ahead. Adjusting schedules is key to effective time management.'
	String get futureDesc => 'Smartphone calendars let you move events to any date — days, weeks, or months ahead. Adjusting schedules is key to effective time management.';

	/// en: 'Flexible planning improves your adaptability'
	String get planTitle => 'Flexible planning improves your adaptability';

	/// en: 'Moving what you need to do to the next day lets you adjust plans as needed. The ability to reschedule events helps you stay organized amidst changes.'
	String get planDesc => 'Moving what you need to do to the next day lets you adjust plans as needed. The ability to reschedule events helps you stay organized amidst changes.';
}

// Path: quiz4.insight
class TranslationsQuiz4InsightEn {
	TranslationsQuiz4InsightEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How could you return to 'today' so quickly?'
	String get title => 'How could you return to \'today\' so quickly?';

	/// en: 'The 'Today' button saves you from getting lost'
	String get subtitle => 'The \'Today\' button saves you from getting lost';

	/// en: ''Today' button is an essential calendar feature'
	String get todayTitle => '\'Today\' button is an essential calendar feature';

	/// en: 'Calendar apps have a dedicated button to jump to today's date. Even after navigating far into the future or past, you can return instantly.'
	String get todayDesc => 'Calendar apps have a dedicated button to jump to today\'s date. Even after navigating far into the future or past, you can return instantly.';

	/// en: 'Calendar icon = return to today'
	String get iconTitle => 'Calendar icon = return to today';

	/// en: 'The calendar icon displayed in the AppBar means 'show today's date'. This is a typical example of communicating function through icon design.'
	String get iconDesc => 'The calendar icon displayed in the AppBar means \'show today\'s date\'. This is a typical example of communicating function through icon design.';

	/// en: 'Jumping is more efficient than scrolling'
	String get jumpTitle => 'Jumping is more efficient than scrolling';

	/// en: 'When returning from years in the future or past to the present, jumping directly with a dedicated button is overwhelmingly faster than swiping back one month at a time.'
	String get jumpDesc => 'When returning from years in the future or past to the present, jumping directly with a dedicated button is overwhelmingly faster than swiping back one month at a time.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
			'quiz2.failureReason' => 'Long press the 15th cell to add an event',
			'quiz2.insight.title' => 'How could you add by long pressing?',
			'quiz2.insight.subtitle' => 'Long press reveals hidden action menus',
			'quiz2.insight.longPressTitle' => 'Long press opens a context menu',
			'quiz2.insight.longPressDesc' => 'Long pressing a calendar date lets you directly add an event for that day. This is a hidden but convenient feature adopted by many calendar apps.',
			'quiz2.insight.fabTitle' => 'The + button is the universal language for creation',
			'quiz2.insight.fabDesc' => 'The + (plus) button in the bottom right is a UI pattern that means \'create something new\', which has become a world standard centered around Google apps.',
			'quiz2.insight.addTitle' => 'Two operation paths exist',
			'quiz2.insight.addDesc' => 'Adding an event to the calendar can be done in two ways: \'long press a date\' or \'tap the + button\'. Knowing both expands your operational choices.',
			'quiz3.missionText' => 'Move the event to tomorrow',
			'quiz3.failureReason' => 'Long press the event and drag & drop it to the next day',
			'quiz3.insight.title' => 'How did you move the event to the next day?',
			'quiz3.insight.subtitle' => 'Drag & drop is intuitive for moving events',
			'quiz3.insight.tapTitle' => 'Long press and drag to move events',
			'quiz3.insight.tapDesc' => 'Long pressing an event lets you drag it to a new date. This works for rescheduling existing events to different days.',
			'quiz3.insight.futureTitle' => 'You can reschedule events to future dates',
			'quiz3.insight.futureDesc' => 'Smartphone calendars let you move events to any date — days, weeks, or months ahead. Adjusting schedules is key to effective time management.',
			'quiz3.insight.planTitle' => 'Flexible planning improves your adaptability',
			'quiz3.insight.planDesc' => 'Moving what you need to do to the next day lets you adjust plans as needed. The ability to reschedule events helps you stay organized amidst changes.',
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
