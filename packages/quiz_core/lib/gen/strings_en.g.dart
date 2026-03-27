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
	late final TranslationsAppEn app = TranslationsAppEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsStageEn stage = TranslationsStageEn._(_root);
	late final TranslationsQuizEn quiz = TranslationsQuizEn._(_root);
	late final TranslationsPurchaseEn purchase = TranslationsPurchaseEn._(_root);
	late final TranslationsErrorEn error = TranslationsErrorEn._(_root);
	late final TranslationsDashboardEn dashboard = TranslationsDashboardEn._(_root);
	late final TranslationsPlayEn play = TranslationsPlayEn._(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'NantoNack'
	String get title => 'NantoNack';

	/// en: 'UI/UX Intuition Quiz'
	String get subtitle => 'UI/UX Intuition Quiz';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Stage List'
	String get stageList => 'Stage List';

	/// en: 'Played {count} times'
	String get playCount => 'Played {count} times';
}

// Path: stage
class TranslationsStageEn {
	TranslationsStageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cleared'
	String get cleared => 'Cleared';

	/// en: 'Available'
	String get available => 'Available';

	/// en: 'Complete previous stage'
	String get locked => 'Complete previous stage';

	/// en: 'Play'
	String get play => 'Play';

	/// en: 'Clear Time: {time}'
	String get clearTime => 'Clear Time: {time}';

	/// en: 'Score: {score}pts'
	String get score => 'Score: {score}pts';
}

// Path: quiz
class TranslationsQuizEn {
	TranslationsQuizEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Correct!'
	String get correct => 'Correct!';

	/// en: 'Incorrect'
	String get incorrect => 'Incorrect';

	/// en: 'Time's Up'
	String get timeUp => 'Time\'s Up';

	/// en: 'Result'
	String get result => 'Result';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Back'
	String get back => 'Back';
}

// Path: purchase
class TranslationsPurchaseEn {
	TranslationsPurchaseEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Daily play limit reached'
	String get limitReached => 'Daily play limit reached';

	/// en: 'Upgrade to Premium to play without limits'
	String get unlockDescription => 'Upgrade to Premium to play\nwithout limits';

	/// en: 'Upgrade'
	String get upgrade => 'Upgrade';

	/// en: 'Later'
	String get later => 'Later';
}

// Path: error
class TranslationsErrorEn {
	TranslationsErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'An error occurred'
	String get unknown => 'An error occurred';

	/// en: 'Retry'
	String get retry => 'Retry';
}

// Path: dashboard
class TranslationsDashboardEn {
	TranslationsDashboardEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dashboard'
	String get title => 'Dashboard';

	/// en: 'Today's UI/UX Tip'
	String get todayTip => 'Today\'s UI/UX Tip';

	/// en: 'Remaining Plays'
	String get remainingPlays => 'Remaining Plays';

	/// en: '{count} remaining'
	String get remainingPlaysCount => '{count} remaining';

	/// en: 'Unlimited'
	String get unlimitedPlays => 'Unlimited';

	/// en: 'Streak'
	String get streak => 'Streak';

	/// en: '{days} days streak'
	String get streakDays => '{days} days streak';

	/// en: 'Play History'
	String get activityHistory => 'Play History';

	/// en: 'No play history yet'
	String get noActivity => 'No play history yet';
}

// Path: play
class TranslationsPlayEn {
	TranslationsPlayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Play Now'
	String get startPlay => 'Play Now';

	/// en: 'Select Category'
	String get selectCategory => 'Select Category';

	/// en: 'Choose a category to challenge'
	String get selectCategoryDescription => 'Choose a category to challenge';

	/// en: 'Select Stage'
	String get selectStage => 'Select Stage';

	/// en: '{count} stages'
	String get stageCount => '{count} stages';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
