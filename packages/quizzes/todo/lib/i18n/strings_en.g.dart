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
	@override String get missionText => 'Complete the task \'Buy milk\'';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Move the task \'Create proposal\' to the top';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Mark the task \'Pay rent\' as important';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Undo the task \'Prepare for meeting\' that was accidentally marked as complete';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Tasks';
	@override String get completedLabel => 'Completed';
	@override String get importantLabel => 'Important';
	@override String get noTasks => 'No tasks';
	@override String get addTask => 'Add task';
	@override String get importantAction => 'Mark as important';
	@override String get completeAction => 'Mark as complete';
	@override String get uncompleteAction => 'Mark as incomplete';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know tapping the checkbox or swiping left would complete the task?';
	@override String get subtitle => 'A round checkbox is the universal sign for \'done\'';
	@override String get checkTitle => 'Round checkbox = tap to complete';
	@override String get checkDesc => 'Tapping the round checkbox in a TODO app marks the task as complete. This is adopted by many apps such as Microsoft To Do and Google Tasks.';
	@override String get swipeTitle => 'Left-to-right swipe = completion gesture';
	@override String get swipeDesc => 'Many TODO apps allow you to complete a task by swiping from left to right. This uses the same directional sense as marking an email as read.';
	@override String get feedbackTitle => 'Visual feedback on completion';
	@override String get feedbackDesc => 'When a task is completed, a blue background and check icon appear, intuitively communicating the meaning of the action.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know you could drag by long pressing?';
	@override String get subtitle => 'Long press + drag is the universal gesture for reordering';
	@override String get longPressTitle => 'Long press = grab signal';
	@override String get longPressDesc => 'Long pressing a list item triggers reorder mode with a haptic feedback sensation. This is a standard interaction supported on both Android and iOS.';
	@override String get dragTitle => 'Drag and drop to change priority';
	@override String get dragDesc => 'In TODO apps, tasks higher in the list often have higher priority. Dragging to the top sets the highest priority task.';
	@override String get handleTitle => 'Drag handle icon signal';
	@override String get handleDesc => 'Three-line (hamburger) or dotted icons indicate that an item can be dragged. This is a universal UI symbol for draggable items.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know swiping left would let you mark it as important?';
	@override String get subtitle => 'Right-to-left swipe is a sign of additional actions';
	@override String get swipeTitle => 'Right-to-left swipe = reveals hidden actions';
	@override String get swipeDesc => 'In mail and TODO apps, swiping from right to left reveals additional actions such as delete, archive, or mark as important.';
	@override String get starTitle => 'Star mark = important task signal';
	@override String get starDesc => 'The star icon is a common symbol for \'favorite\' or \'important\' in apps worldwide. In TODO apps, it is often used to move tasks to \'Today\'.';
	@override String get priorityTitle => 'Improve focus with important tasks';
	@override String get priorityDesc => 'Prioritizing tasks helps you focus on what truly needs to be done. Use the important mark to make tasks stand out and avoid missing them.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know you could undo from the completed list?';
	@override String get subtitle => 'The completed list is an archive where you can undo actions';
	@override String get accordionTitle => 'Collapsible list = accordion UI';
	@override String get accordionDesc => 'Tapping the \'Completed (X)\' header expands the list of completed tasks. This is a type of accordion UI commonly used in email folders and FAQs.';
	@override String get undoTitle => 'Undo completion to fix mistakes';
	@override String get undoDesc => 'Unchecking a completed task returns it to incomplete status. Designs that allow easy correction of mistakes are fundamental to modern apps.';
	@override String get checkTitle => 'Moving from completed back to incomplete';
	@override String get checkDesc => 'Open the completed list and tap the checkmark or swipe left to restore the task to incomplete status.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Complete the task \'Buy milk\'',
			'quiz1.insight.title' => 'How did you know tapping the checkbox or swiping left would complete the task?',
			'quiz1.insight.subtitle' => 'A round checkbox is the universal sign for \'done\'',
			'quiz1.insight.checkTitle' => 'Round checkbox = tap to complete',
			'quiz1.insight.checkDesc' => 'Tapping the round checkbox in a TODO app marks the task as complete. This is adopted by many apps such as Microsoft To Do and Google Tasks.',
			'quiz1.insight.swipeTitle' => 'Left-to-right swipe = completion gesture',
			'quiz1.insight.swipeDesc' => 'Many TODO apps allow you to complete a task by swiping from left to right. This uses the same directional sense as marking an email as read.',
			'quiz1.insight.feedbackTitle' => 'Visual feedback on completion',
			'quiz1.insight.feedbackDesc' => 'When a task is completed, a blue background and check icon appear, intuitively communicating the meaning of the action.',
			'quiz2.missionText' => 'Move the task \'Create proposal\' to the top',
			'quiz2.insight.title' => 'How did you know you could drag by long pressing?',
			'quiz2.insight.subtitle' => 'Long press + drag is the universal gesture for reordering',
			'quiz2.insight.longPressTitle' => 'Long press = grab signal',
			'quiz2.insight.longPressDesc' => 'Long pressing a list item triggers reorder mode with a haptic feedback sensation. This is a standard interaction supported on both Android and iOS.',
			'quiz2.insight.dragTitle' => 'Drag and drop to change priority',
			'quiz2.insight.dragDesc' => 'In TODO apps, tasks higher in the list often have higher priority. Dragging to the top sets the highest priority task.',
			'quiz2.insight.handleTitle' => 'Drag handle icon signal',
			'quiz2.insight.handleDesc' => 'Three-line (hamburger) or dotted icons indicate that an item can be dragged. This is a universal UI symbol for draggable items.',
			'quiz3.missionText' => 'Mark the task \'Pay rent\' as important',
			'quiz3.insight.title' => 'How did you know swiping left would let you mark it as important?',
			'quiz3.insight.subtitle' => 'Right-to-left swipe is a sign of additional actions',
			'quiz3.insight.swipeTitle' => 'Right-to-left swipe = reveals hidden actions',
			'quiz3.insight.swipeDesc' => 'In mail and TODO apps, swiping from right to left reveals additional actions such as delete, archive, or mark as important.',
			'quiz3.insight.starTitle' => 'Star mark = important task signal',
			'quiz3.insight.starDesc' => 'The star icon is a common symbol for \'favorite\' or \'important\' in apps worldwide. In TODO apps, it is often used to move tasks to \'Today\'.',
			'quiz3.insight.priorityTitle' => 'Improve focus with important tasks',
			'quiz3.insight.priorityDesc' => 'Prioritizing tasks helps you focus on what truly needs to be done. Use the important mark to make tasks stand out and avoid missing them.',
			'quiz4.missionText' => 'Undo the task \'Prepare for meeting\' that was accidentally marked as complete',
			'quiz4.insight.title' => 'How did you know you could undo from the completed list?',
			'quiz4.insight.subtitle' => 'The completed list is an archive where you can undo actions',
			'quiz4.insight.accordionTitle' => 'Collapsible list = accordion UI',
			'quiz4.insight.accordionDesc' => 'Tapping the \'Completed (X)\' header expands the list of completed tasks. This is a type of accordion UI commonly used in email folders and FAQs.',
			'quiz4.insight.undoTitle' => 'Undo completion to fix mistakes',
			'quiz4.insight.undoDesc' => 'Unchecking a completed task returns it to incomplete status. Designs that allow easy correction of mistakes are fundamental to modern apps.',
			'quiz4.insight.checkTitle' => 'Moving from completed back to incomplete',
			'quiz4.insight.checkDesc' => 'Open the completed list and tap the checkmark or swipe left to restore the task to incomplete status.',
			'common.appTitle' => 'Tasks',
			'common.completedLabel' => 'Completed',
			'common.importantLabel' => 'Important',
			'common.noTasks' => 'No tasks',
			'common.addTask' => 'Add task',
			'common.importantAction' => 'Mark as important',
			'common.completeAction' => 'Mark as complete',
			'common.uncompleteAction' => 'Mark as incomplete',
			_ => null,
		};
	}
}
