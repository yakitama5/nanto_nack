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
	@override late final _TranslationsAppEn app = _TranslationsAppEn._(_root);
	@override late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
	@override late final _TranslationsStageEn stage = _TranslationsStageEn._(_root);
	@override late final _TranslationsQuizEn quiz = _TranslationsQuizEn._(_root);
	@override late final _TranslationsPurchaseEn purchase = _TranslationsPurchaseEn._(_root);
	@override late final _TranslationsErrorEn error = _TranslationsErrorEn._(_root);
	@override late final _TranslationsDashboardEn dashboard = _TranslationsDashboardEn._(_root);
	@override late final _TranslationsPlayEn play = _TranslationsPlayEn._(_root);
}

// Path: app
class _TranslationsAppEn extends TranslationsAppJa {
	_TranslationsAppEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'NantoNack';
	@override String get subtitle => 'UI/UX Intuition Quiz';
}

// Path: home
class _TranslationsHomeEn extends TranslationsHomeJa {
	_TranslationsHomeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get stageList => 'Stage List';
	@override String get playCount => 'Played {count} times';
}

// Path: stage
class _TranslationsStageEn extends TranslationsStageJa {
	_TranslationsStageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get cleared => 'Cleared';
	@override String get available => 'Available';
	@override String get locked => 'Complete previous stage';
	@override String get play => 'Play';
	@override String get clearTime => 'Clear Time: {time}';
	@override String get score => 'Score: {score}pts';
}

// Path: quiz
class _TranslationsQuizEn extends TranslationsQuizJa {
	_TranslationsQuizEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get correct => 'Correct!';
	@override String get incorrect => 'Incorrect';
	@override String get timeUp => 'Time\'s Up';
	@override String get result => 'Result';
	@override String get retry => 'Retry';
	@override String get next => 'Next';
	@override String get back => 'Back';
}

// Path: purchase
class _TranslationsPurchaseEn extends TranslationsPurchaseJa {
	_TranslationsPurchaseEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get limitReached => 'Daily play limit reached';
	@override String get unlockDescription => 'Upgrade to Premium to play\nwithout limits';
	@override String get upgrade => 'Upgrade';
	@override String get later => 'Later';
}

// Path: error
class _TranslationsErrorEn extends TranslationsErrorJa {
	_TranslationsErrorEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get unknown => 'An error occurred';
	@override String get retry => 'Retry';
}

// Path: dashboard
class _TranslationsDashboardEn extends TranslationsDashboardJa {
	_TranslationsDashboardEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dashboard';
	@override String get todayTip => 'Today\'s UI/UX Tip';
	@override String get remainingPlays => 'Remaining Plays';
	@override String get remainingPlaysCount => '{count} remaining';
	@override String get unlimitedPlays => 'Unlimited';
	@override String get streak => 'Streak';
	@override String get streakDays => '{days} days streak';
	@override String get activityHistory => 'Play History';
	@override String get noActivity => 'No play history yet';
}

// Path: play
class _TranslationsPlayEn extends TranslationsPlayJa {
	_TranslationsPlayEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get startPlay => 'Play Now';
	@override String get selectCategory => 'Select Category';
	@override String get selectCategoryDescription => 'Choose a category to challenge';
	@override String get selectStage => 'Select Stage';
	@override String get stageCount => '{count} stages';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'NantoNack',
			'app.subtitle' => 'UI/UX Intuition Quiz',
			'home.stageList' => 'Stage List',
			'home.playCount' => 'Played {count} times',
			'stage.cleared' => 'Cleared',
			'stage.available' => 'Available',
			'stage.locked' => 'Complete previous stage',
			'stage.play' => 'Play',
			'stage.clearTime' => 'Clear Time: {time}',
			'stage.score' => 'Score: {score}pts',
			'quiz.correct' => 'Correct!',
			'quiz.incorrect' => 'Incorrect',
			'quiz.timeUp' => 'Time\'s Up',
			'quiz.result' => 'Result',
			'quiz.retry' => 'Retry',
			'quiz.next' => 'Next',
			'quiz.back' => 'Back',
			'purchase.limitReached' => 'Daily play limit reached',
			'purchase.unlockDescription' => 'Upgrade to Premium to play\nwithout limits',
			'purchase.upgrade' => 'Upgrade',
			'purchase.later' => 'Later',
			'error.unknown' => 'An error occurred',
			'error.retry' => 'Retry',
			'dashboard.title' => 'Dashboard',
			'dashboard.todayTip' => 'Today\'s UI/UX Tip',
			'dashboard.remainingPlays' => 'Remaining Plays',
			'dashboard.remainingPlaysCount' => '{count} remaining',
			'dashboard.unlimitedPlays' => 'Unlimited',
			'dashboard.streak' => 'Streak',
			'dashboard.streakDays' => '{days} days streak',
			'dashboard.activityHistory' => 'Play History',
			'dashboard.noActivity' => 'No play history yet',
			'play.startPlay' => 'Play Now',
			'play.selectCategory' => 'Select Category',
			'play.selectCategoryDescription' => 'Choose a category to challenge',
			'play.selectStage' => 'Select Stage',
			'play.stageCount' => '{count} stages',
			_ => null,
		};
	}
}
