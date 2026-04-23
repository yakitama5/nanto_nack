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
	@override String get missionText => 'Found someone great! Try sending a \'Like\'';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Not quite your type... skip and see the next person';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'I wonder if this person has other photos? Let\'s look at the second photo';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'This is destiny!! Make a strong impression with a special \'Super Like\'';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Matching';
	@override String get like => 'LIKE';
	@override String get nope => 'NOPE';
	@override String get superLike => 'SUPER';
	@override String get noMoreProfiles => 'No more profiles';
	@override String get profilesLabel => 'People near you';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know a right swipe means \'Like\'?';
	@override String get subtitle => 'Right swipe is the world standard gesture for YES/approval';
	@override String get swipeTitle => 'Right swipe = LIKE (world standard)';
	@override String get swipeDesc => 'Tinder created the \'right for like, left for skip\' swipe UI in 2012. Now it is the standard interaction adopted by matching apps worldwide.';
	@override String get heartTitle => 'The heart button has the same effect';
	@override String get heartDesc => 'Tapping the heart icon button at the bottom of the screen triggers the same \'Like\' action. It is designed as an alternative UI to swiping.';
	@override String get feedbackTitle => 'Immediate feedback creates clarity';
	@override String get feedbackDesc => 'The animation of the card flying to the right intuitively conveys the result of the action. Visual feedback allows users to act without hesitation.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know a left swipe means \'Skip\'?';
	@override String get subtitle => 'Left swipe is the opposing gesture for NO/rejection';
	@override String get swipeTitle => 'Left swipe = NOPE (world standard)';
	@override String get swipeDesc => 'If right is YES, left is NO. This symmetrical design creates intuition. The same rule is used in any app with a card-based UI, not just matching apps.';
	@override String get xTitle => 'The X button has the same effect';
	@override String get xDesc => 'The X (cross) button at the bottom left means \'skip\'. It leverages the universal icon language where \'X = reject/cancel\'.';
	@override String get gestureTitle => 'Gesture symmetry makes UX simple';
	@override String get gestureDesc => 'The consistent rule of \'right = OK, left = NG\' allows users to start using a new app without explanation. A design philosophy that reduces learning cost to zero.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know a tap would switch to the next photo?';
	@override String get subtitle => 'Tapping to advance photos is a standard smartphone browsing operation';
	@override String get tapTitle => 'Tap right = next photo, tap left = previous photo';
	@override String get tapDesc => 'Tapping the right half of the profile card advances to the next photo; tapping the left half goes back. The same intuitive operation as Instagram Stories.';
	@override String get indicatorTitle => 'The bars at the top are photo count indicators';
	@override String get indicatorDesc => 'The short bars at the top of the card show the total number of photos and which one is currently displayed. The bright bar indicates the current position.';
	@override String get multiPhotoTitle => 'Multiple photos better convey personality';
	@override String get multiPhotoDesc => 'In matching apps, having multiple photos viewed conveys personality and atmosphere better than just one. The number of photos is an important factor in selection.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know an upward swipe means \'Super Like\'?';
	@override String get subtitle => 'Upward swipe is the intuitive gesture for a special action';
	@override String get superTitle => 'Upward swipe = Super Like';
	@override String get superDesc => 'The upward swipe added by Tinder is a differentiating action that shows \'special interest\'. It stands out as a third option beyond the right/left binary choice.';
	@override String get starTitle => 'The star button also triggers Super Like';
	@override String get starDesc => 'Tapping the star button at the bottom of the screen triggers the same Super Like. This allows reliable operation even in situations where swiping is difficult.';
	@override String get specialTitle => 'Scarcity increases appeal';
	@override String get specialDesc => 'Super Like notifies the other person more strongly than a regular like, said to increase match rate. A design that leverages the psychology that value increases the more limited something is.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Found someone great! Try sending a \'Like\'',
			'quiz1.insight.title' => 'How did you know a right swipe means \'Like\'?',
			'quiz1.insight.subtitle' => 'Right swipe is the world standard gesture for YES/approval',
			'quiz1.insight.swipeTitle' => 'Right swipe = LIKE (world standard)',
			'quiz1.insight.swipeDesc' => 'Tinder created the \'right for like, left for skip\' swipe UI in 2012. Now it is the standard interaction adopted by matching apps worldwide.',
			'quiz1.insight.heartTitle' => 'The heart button has the same effect',
			'quiz1.insight.heartDesc' => 'Tapping the heart icon button at the bottom of the screen triggers the same \'Like\' action. It is designed as an alternative UI to swiping.',
			'quiz1.insight.feedbackTitle' => 'Immediate feedback creates clarity',
			'quiz1.insight.feedbackDesc' => 'The animation of the card flying to the right intuitively conveys the result of the action. Visual feedback allows users to act without hesitation.',
			'quiz2.missionText' => 'Not quite your type... skip and see the next person',
			'quiz2.insight.title' => 'How did you know a left swipe means \'Skip\'?',
			'quiz2.insight.subtitle' => 'Left swipe is the opposing gesture for NO/rejection',
			'quiz2.insight.swipeTitle' => 'Left swipe = NOPE (world standard)',
			'quiz2.insight.swipeDesc' => 'If right is YES, left is NO. This symmetrical design creates intuition. The same rule is used in any app with a card-based UI, not just matching apps.',
			'quiz2.insight.xTitle' => 'The X button has the same effect',
			'quiz2.insight.xDesc' => 'The X (cross) button at the bottom left means \'skip\'. It leverages the universal icon language where \'X = reject/cancel\'.',
			'quiz2.insight.gestureTitle' => 'Gesture symmetry makes UX simple',
			'quiz2.insight.gestureDesc' => 'The consistent rule of \'right = OK, left = NG\' allows users to start using a new app without explanation. A design philosophy that reduces learning cost to zero.',
			'quiz3.missionText' => 'I wonder if this person has other photos? Let\'s look at the second photo',
			'quiz3.insight.title' => 'How did you know a tap would switch to the next photo?',
			'quiz3.insight.subtitle' => 'Tapping to advance photos is a standard smartphone browsing operation',
			'quiz3.insight.tapTitle' => 'Tap right = next photo, tap left = previous photo',
			'quiz3.insight.tapDesc' => 'Tapping the right half of the profile card advances to the next photo; tapping the left half goes back. The same intuitive operation as Instagram Stories.',
			'quiz3.insight.indicatorTitle' => 'The bars at the top are photo count indicators',
			'quiz3.insight.indicatorDesc' => 'The short bars at the top of the card show the total number of photos and which one is currently displayed. The bright bar indicates the current position.',
			'quiz3.insight.multiPhotoTitle' => 'Multiple photos better convey personality',
			'quiz3.insight.multiPhotoDesc' => 'In matching apps, having multiple photos viewed conveys personality and atmosphere better than just one. The number of photos is an important factor in selection.',
			'quiz4.missionText' => 'This is destiny!! Make a strong impression with a special \'Super Like\'',
			'quiz4.insight.title' => 'How did you know an upward swipe means \'Super Like\'?',
			'quiz4.insight.subtitle' => 'Upward swipe is the intuitive gesture for a special action',
			'quiz4.insight.superTitle' => 'Upward swipe = Super Like',
			'quiz4.insight.superDesc' => 'The upward swipe added by Tinder is a differentiating action that shows \'special interest\'. It stands out as a third option beyond the right/left binary choice.',
			'quiz4.insight.starTitle' => 'The star button also triggers Super Like',
			'quiz4.insight.starDesc' => 'Tapping the star button at the bottom of the screen triggers the same Super Like. This allows reliable operation even in situations where swiping is difficult.',
			'quiz4.insight.specialTitle' => 'Scarcity increases appeal',
			'quiz4.insight.specialDesc' => 'Super Like notifies the other person more strongly than a regular like, said to increase match rate. A design that leverages the psychology that value increases the more limited something is.',
			'common.appTitle' => 'Matching',
			'common.like' => 'LIKE',
			'common.nope' => 'NOPE',
			'common.superLike' => 'SUPER',
			'common.noMoreProfiles' => 'No more profiles',
			'common.profilesLabel' => 'People near you',
			_ => null,
		};
	}
}
