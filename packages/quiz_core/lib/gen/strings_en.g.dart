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
	late final TranslationsMissionEn mission = TranslationsMissionEn._(_root);
	late final TranslationsPurchaseEn purchase = TranslationsPurchaseEn._(_root);
	late final TranslationsErrorEn error = TranslationsErrorEn._(_root);
	late final TranslationsDashboardEn dashboard = TranslationsDashboardEn._(_root);
	late final TranslationsPlayEn play = TranslationsPlayEn._(_root);
	late final TranslationsSceneEn scene = TranslationsSceneEn._(_root);
	late final TranslationsTipEn tip = TranslationsTipEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
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

	/// en: 'UI/UX Intuition Quiz'
	String get subtitle => 'UI/UX Intuition Quiz';

	/// en: 'Remaining plays today'
	String get remainingPlaysLabel => 'Remaining plays today';

	/// en: 'Play'
	String get playButton => 'Play';

	/// en: 'Proceed to next stage'
	String get nextStageHint => 'Proceed to next stage';

	/// en: 'Clear history of last 60 days'
	String get past60Days => 'Clear history\nof last 60 days';

	/// en: 'No play history yet'
	String get noActivityHistory => 'No play history\nyet';

	/// en: 'Categories'
	String get categoriesLabel => 'Categories';

	/// en: 'Unlock after clearing'
	String get categoryLockedLabel => 'Unlock after clearing';

	/// en: '{cleared}/{total} cleared'
	String get categoryClearCount => '{cleared}/{total} cleared';

	/// en: '{month}/{day} ({weekday})'
	String get dateFormat => '{month}/{day} ({weekday})';

	late final TranslationsHomeWeekdayEn weekday = TranslationsHomeWeekdayEn._(_root);
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

	/// en: 'Gave Up...'
	String get giveUp => 'Gave Up...';

	/// en: 'Result'
	String get result => 'Result';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Score: {score}pts'
	String get score => 'Score: {score}pts';

	/// en: 'Time: {time}s'
	String get elapsedTime => 'Time: {time}s';
}

// Path: mission
class TranslationsMissionEn {
	TranslationsMissionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'MISSION'
	String get title => 'MISSION';

	/// en: 'Mission'
	String get topic => 'Mission';

	/// en: 'Use Hint'
	String get useHint => 'Use Hint';

	/// en: 'Give Up'
	String get giveUp => 'Give Up';

	/// en: 'Time Limit: {seconds}s'
	String get timeLimit => 'Time Limit: {seconds}s';
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

	/// en: 'No stages available'
	String get noStages => 'No stages available';

	/// en: 'Coming Soon'
	String get comingSoon => 'Coming Soon';

	late final TranslationsPlayCategoryLabelEn categoryLabel = TranslationsPlayCategoryLabelEn._(_root);
	late final TranslationsPlayCategoryDescriptionEn categoryDescription = TranslationsPlayCategoryDescriptionEn._(_root);
	late final TranslationsPlayStageTitleEn stageTitle = TranslationsPlayStageTitleEn._(_root);
	late final TranslationsPlayStageDescriptionEn stageDescription = TranslationsPlayStageDescriptionEn._(_root);
}

// Path: scene
class TranslationsSceneEn {
	TranslationsSceneEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSceneGreetingEn greeting = TranslationsSceneGreetingEn._(_root);
}

// Path: tip
class TranslationsTipEn {
	TranslationsTipEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Learn UI/UX'
	String get defaultTitle => 'Learn UI/UX';

	/// en: 'Sharpen your UI/UX intuition by solving quizzes!'
	String get defaultContent => 'Sharpen your UI/UX intuition by solving quizzes!';
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	late final TranslationsSettingsAppearanceEn appearance = TranslationsSettingsAppearanceEn._(_root);
	late final TranslationsSettingsDataEn data = TranslationsSettingsDataEn._(_root);
	late final TranslationsSettingsAboutEn about = TranslationsSettingsAboutEn._(_root);
}

// Path: home.weekday
class TranslationsHomeWeekdayEn {
	TranslationsHomeWeekdayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Mon'
	String get mon => 'Mon';

	/// en: 'Tue'
	String get tue => 'Tue';

	/// en: 'Wed'
	String get wed => 'Wed';

	/// en: 'Thu'
	String get thu => 'Thu';

	/// en: 'Fri'
	String get fri => 'Fri';

	/// en: 'Sat'
	String get sat => 'Sat';

	/// en: 'Sun'
	String get sun => 'Sun';
}

// Path: play.categoryLabel
class TranslationsPlayCategoryLabelEn {
	TranslationsPlayCategoryLabelEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Shopping'
	String get shopping => 'Shopping';

	/// en: 'Chat'
	String get chat => 'Chat';

	/// en: 'Video'
	String get streaming => 'Video';

	/// en: 'Map'
	String get map => 'Map';

	/// en: 'Alarm'
	String get alarm => 'Alarm';

	/// en: 'Payment'
	String get payment => 'Payment';
}

// Path: play.categoryDescription
class TranslationsPlayCategoryDescriptionEn {
	TranslationsPlayCategoryDescriptionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Experience e-commerce UI/UX'
	String get shopping => 'Experience e-commerce UI/UX';

	/// en: 'Experience messaging app UI/UX'
	String get chat => 'Experience messaging app UI/UX';

	/// en: 'Experience video app UI/UX'
	String get streaming => 'Experience video app UI/UX';

	/// en: 'Experience map app UI/UX'
	String get map => 'Experience map app UI/UX';

	/// en: 'Experience clock & alarm app UI/UX'
	String get alarm => 'Experience clock & alarm app UI/UX';

	/// en: 'Experience mobile payment app UI/UX'
	String get payment => 'Experience mobile payment app UI/UX';
}

// Path: play.stageTitle
class TranslationsPlayStageTitleEn {
	TranslationsPlayStageTitleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Buy 2 Waters'
	String get shopping_water => 'Buy 2 Waters';

	/// en: 'Complete Checkout'
	String get shopping_checkout => 'Complete Checkout';

	/// en: 'Reorder Recent Purchase'
	String get shopping_reorder => 'Reorder Recent Purchase';

	/// en: 'Select Cart Total'
	String get shopping_cart => 'Select Cart Total';

	/// en: 'Send a Message'
	String get chat_quiz1 => 'Send a Message';

	/// en: 'Send a Sticker'
	String get chat_quiz2 => 'Send a Sticker';

	/// en: 'Delete a Message'
	String get chat_quiz3 => 'Delete a Message';

	/// en: 'Create a Group'
	String get chat_quiz4 => 'Create a Group';

	/// en: 'Turn on Subtitles'
	String get streaming_quiz1 => 'Turn on Subtitles';

	/// en: 'Skip to the Middle'
	String get streaming_quiz2 => 'Skip to the Middle';

	/// en: 'Play at 2x Speed'
	String get streaming_quiz3 => 'Play at 2x Speed';

	/// en: 'Download a Video'
	String get streaming_quiz4 => 'Download a Video';

	/// en: 'Show Current Location'
	String get map_quiz1 => 'Show Current Location';

	/// en: 'Search for a Destination'
	String get map_quiz2 => 'Search for a Destination';

	/// en: 'Start Navigation'
	String get map_quiz3 => 'Start Navigation';

	/// en: 'Add to Favorites'
	String get map_quiz4 => 'Add to Favorites';

	/// en: 'Add an Alarm'
	String get alarm_quiz1 => 'Add an Alarm';

	/// en: 'Set Weekday Only'
	String get alarm_quiz2 => 'Set Weekday Only';

	/// en: 'Turn Off Snooze'
	String get alarm_quiz3 => 'Turn Off Snooze';

	/// en: 'Delete an Alarm'
	String get alarm_quiz4 => 'Delete an Alarm';

	/// en: 'Show QR Code'
	String get payment_quiz1 => 'Show QR Code';

	/// en: 'Check Balance'
	String get payment_quiz2 => 'Check Balance';

	/// en: 'Send Money'
	String get payment_quiz3 => 'Send Money';

	/// en: 'Check Transaction History'
	String get payment_quiz4 => 'Check Transaction History';
}

// Path: play.stageDescription
class TranslationsPlayStageDescriptionEn {
	TranslationsPlayStageDescriptionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add 2 waters to the cart and purchase on the e-commerce site'
	String get shopping_water => 'Add 2 waters to the cart and purchase on the e-commerce site';

	/// en: 'Complete 3 steps: address, payment method, and order confirmation'
	String get shopping_checkout => 'Complete 3 steps: address, payment method, and order confirmation';

	/// en: 'Reorder the most recently purchased item from order history'
	String get shopping_reorder => 'Reorder the most recently purchased item from order history';

	/// en: 'Select the total amount of items in the cart from 4 choices'
	String get shopping_cart => 'Select the total amount of items in the cart from 4 choices';

	/// en: 'Send a message in the chat app'
	String get chat_quiz1 => 'Send a message in the chat app';

	/// en: 'Send a sticker in the chat app'
	String get chat_quiz2 => 'Send a sticker in the chat app';

	/// en: 'Delete a sent message'
	String get chat_quiz3 => 'Delete a sent message';

	/// en: 'Create a new group chat'
	String get chat_quiz4 => 'Create a new group chat';

	/// en: 'Turn on the subtitle feature in the video app'
	String get streaming_quiz1 => 'Turn on the subtitle feature in the video app';

	/// en: 'Go to the next video and skip to the middle'
	String get streaming_quiz2 => 'Go to the next video and skip to the middle';

	/// en: 'Play a video at 2x speed in the video app'
	String get streaming_quiz3 => 'Play a video at 2x speed in the video app';

	/// en: 'Change to highest quality and download the video'
	String get streaming_quiz4 => 'Change to highest quality and download the video';

	/// en: 'Show your current location in the map app'
	String get map_quiz1 => 'Show your current location in the map app';

	/// en: 'Search for a destination in the map app'
	String get map_quiz2 => 'Search for a destination in the map app';

	/// en: 'Start route navigation in the map app'
	String get map_quiz3 => 'Start route navigation in the map app';

	/// en: 'Save a location to favorites in the map app'
	String get map_quiz4 => 'Save a location to favorites in the map app';

	/// en: 'Add a new alarm in the clock app'
	String get alarm_quiz1 => 'Add a new alarm in the clock app';

	/// en: 'Set an alarm to repeat only Monday through Friday'
	String get alarm_quiz2 => 'Set an alarm to repeat only Monday through Friday';

	/// en: 'Turn off the snooze feature and save'
	String get alarm_quiz3 => 'Turn off the snooze feature and save';

	/// en: 'Delete the top alarm from the alarm list'
	String get alarm_quiz4 => 'Delete the top alarm from the alarm list';

	/// en: 'Show the QR code in the payment app'
	String get payment_quiz1 => 'Show the QR code in the payment app';

	/// en: 'Remove the blur and check the balance in the payment app'
	String get payment_quiz2 => 'Remove the blur and check the balance in the payment app';

	/// en: 'Send money to someone in the payment app'
	String get payment_quiz3 => 'Send money to someone in the payment app';

	/// en: 'Check the transaction history in the payment app'
	String get payment_quiz4 => 'Check the transaction history in the payment app';
}

// Path: scene.greeting
class TranslationsSceneGreetingEn {
	TranslationsSceneGreetingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Good morning'
	String get sunriseMorning => 'Good morning';

	/// en: 'Beautiful day today'
	String get sunnyDay => 'Beautiful day today';

	/// en: 'A cloudy day'
	String get cloudyDay => 'A cloudy day';

	/// en: 'A rainy day'
	String get rainyDay => 'A rainy day';

	/// en: 'Good work today'
	String get sunsetEvening => 'Good work today';

	/// en: 'Good work today'
	String get nightSky => 'Good work today';
}

// Path: settings.appearance
class TranslationsSettingsAppearanceEn {
	TranslationsSettingsAppearanceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Appearance'
	String get title => 'Appearance';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'System Default'
	String get themeSystem => 'System Default';

	/// en: 'Light Theme'
	String get themeLight => 'Light Theme';

	/// en: 'Dark Theme'
	String get themeDark => 'Dark Theme';

	/// en: 'UI Style'
	String get uiStyle => 'UI Style';

	/// en: 'System Default'
	String get uiStyleSystem => 'System Default';

	/// en: 'Material (Android)'
	String get uiStyleMaterial => 'Material (Android)';

	/// en: 'Cupertino (iOS)'
	String get uiStyleCupertino => 'Cupertino (iOS)';
}

// Path: settings.data
class TranslationsSettingsDataEn {
	TranslationsSettingsDataEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Data & Account'
	String get title => 'Data & Account';

	/// en: 'Restore Purchase'
	String get restorePurchase => 'Restore Purchase';

	/// en: 'Reset Play Data'
	String get resetData => 'Reset Play Data';

	/// en: 'Erase your memory?'
	String get resetDataDialogTitle => 'Erase your memory?';

	/// en: 'All your learning will vanish…🥺 All clear records and play history will be deleted.'
	String get resetDataDialogMessage => 'All your learning will vanish…🥺\nAll clear records and play history will be deleted.';

	/// en: 'Keep it'
	String get resetDataCancel => 'Keep it';

	/// en: 'Erase'
	String get resetDataOk => 'Erase';

	/// en: 'Data has been reset'
	String get resetDataSuccess => 'Data has been reset';
}

// Path: settings.about
class TranslationsSettingsAboutEn {
	TranslationsSettingsAboutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About'
	String get title => 'About';

	/// en: 'Developer X (Twitter)'
	String get developerX => 'Developer X (Twitter)';

	/// en: 'Terms of Service'
	String get terms => 'Terms of Service';

	/// en: 'Contact'
	String get contact => 'Contact';

	/// en: 'Licenses'
	String get licenses => 'Licenses';

	/// en: 'Version {version}'
	String get version => 'Version {version}';
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
			'home.subtitle' => 'UI/UX Intuition Quiz',
			'home.remainingPlaysLabel' => 'Remaining plays today',
			'home.playButton' => 'Play',
			'home.nextStageHint' => 'Proceed to next stage',
			'home.past60Days' => 'Clear history\nof last 60 days',
			'home.noActivityHistory' => 'No play history\nyet',
			'home.categoriesLabel' => 'Categories',
			'home.categoryLockedLabel' => 'Unlock after clearing',
			'home.categoryClearCount' => '{cleared}/{total} cleared',
			'home.dateFormat' => '{month}/{day} ({weekday})',
			'home.weekday.mon' => 'Mon',
			'home.weekday.tue' => 'Tue',
			'home.weekday.wed' => 'Wed',
			'home.weekday.thu' => 'Thu',
			'home.weekday.fri' => 'Fri',
			'home.weekday.sat' => 'Sat',
			'home.weekday.sun' => 'Sun',
			'stage.cleared' => 'Cleared',
			'stage.available' => 'Available',
			'stage.locked' => 'Complete previous stage',
			'stage.play' => 'Play',
			'stage.clearTime' => 'Clear Time: {time}',
			'stage.score' => 'Score: {score}pts',
			'quiz.correct' => 'Correct!',
			'quiz.incorrect' => 'Incorrect',
			'quiz.timeUp' => 'Time\'s Up',
			'quiz.giveUp' => 'Gave Up...',
			'quiz.result' => 'Result',
			'quiz.retry' => 'Retry',
			'quiz.next' => 'Next',
			'quiz.back' => 'Back',
			'quiz.score' => 'Score: {score}pts',
			'quiz.elapsedTime' => 'Time: {time}s',
			'mission.title' => 'MISSION',
			'mission.topic' => 'Mission',
			'mission.useHint' => 'Use Hint',
			'mission.giveUp' => 'Give Up',
			'mission.timeLimit' => 'Time Limit: {seconds}s',
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
			'play.noStages' => 'No stages available',
			'play.comingSoon' => 'Coming Soon',
			'play.categoryLabel.shopping' => 'Shopping',
			'play.categoryLabel.chat' => 'Chat',
			'play.categoryLabel.streaming' => 'Video',
			'play.categoryLabel.map' => 'Map',
			'play.categoryLabel.alarm' => 'Alarm',
			'play.categoryLabel.payment' => 'Payment',
			'play.categoryDescription.shopping' => 'Experience e-commerce UI/UX',
			'play.categoryDescription.chat' => 'Experience messaging app UI/UX',
			'play.categoryDescription.streaming' => 'Experience video app UI/UX',
			'play.categoryDescription.map' => 'Experience map app UI/UX',
			'play.categoryDescription.alarm' => 'Experience clock & alarm app UI/UX',
			'play.categoryDescription.payment' => 'Experience mobile payment app UI/UX',
			'play.stageTitle.shopping_water' => 'Buy 2 Waters',
			'play.stageTitle.shopping_checkout' => 'Complete Checkout',
			'play.stageTitle.shopping_reorder' => 'Reorder Recent Purchase',
			'play.stageTitle.shopping_cart' => 'Select Cart Total',
			'play.stageTitle.chat_quiz1' => 'Send a Message',
			'play.stageTitle.chat_quiz2' => 'Send a Sticker',
			'play.stageTitle.chat_quiz3' => 'Delete a Message',
			'play.stageTitle.chat_quiz4' => 'Create a Group',
			'play.stageTitle.streaming_quiz1' => 'Turn on Subtitles',
			'play.stageTitle.streaming_quiz2' => 'Skip to the Middle',
			'play.stageTitle.streaming_quiz3' => 'Play at 2x Speed',
			'play.stageTitle.streaming_quiz4' => 'Download a Video',
			'play.stageTitle.map_quiz1' => 'Show Current Location',
			'play.stageTitle.map_quiz2' => 'Search for a Destination',
			'play.stageTitle.map_quiz3' => 'Start Navigation',
			'play.stageTitle.map_quiz4' => 'Add to Favorites',
			'play.stageTitle.alarm_quiz1' => 'Add an Alarm',
			'play.stageTitle.alarm_quiz2' => 'Set Weekday Only',
			'play.stageTitle.alarm_quiz3' => 'Turn Off Snooze',
			'play.stageTitle.alarm_quiz4' => 'Delete an Alarm',
			'play.stageTitle.payment_quiz1' => 'Show QR Code',
			'play.stageTitle.payment_quiz2' => 'Check Balance',
			'play.stageTitle.payment_quiz3' => 'Send Money',
			'play.stageTitle.payment_quiz4' => 'Check Transaction History',
			'play.stageDescription.shopping_water' => 'Add 2 waters to the cart and purchase on the e-commerce site',
			'play.stageDescription.shopping_checkout' => 'Complete 3 steps: address, payment method, and order confirmation',
			'play.stageDescription.shopping_reorder' => 'Reorder the most recently purchased item from order history',
			'play.stageDescription.shopping_cart' => 'Select the total amount of items in the cart from 4 choices',
			'play.stageDescription.chat_quiz1' => 'Send a message in the chat app',
			'play.stageDescription.chat_quiz2' => 'Send a sticker in the chat app',
			'play.stageDescription.chat_quiz3' => 'Delete a sent message',
			'play.stageDescription.chat_quiz4' => 'Create a new group chat',
			'play.stageDescription.streaming_quiz1' => 'Turn on the subtitle feature in the video app',
			'play.stageDescription.streaming_quiz2' => 'Go to the next video and skip to the middle',
			'play.stageDescription.streaming_quiz3' => 'Play a video at 2x speed in the video app',
			'play.stageDescription.streaming_quiz4' => 'Change to highest quality and download the video',
			'play.stageDescription.map_quiz1' => 'Show your current location in the map app',
			'play.stageDescription.map_quiz2' => 'Search for a destination in the map app',
			'play.stageDescription.map_quiz3' => 'Start route navigation in the map app',
			'play.stageDescription.map_quiz4' => 'Save a location to favorites in the map app',
			'play.stageDescription.alarm_quiz1' => 'Add a new alarm in the clock app',
			'play.stageDescription.alarm_quiz2' => 'Set an alarm to repeat only Monday through Friday',
			'play.stageDescription.alarm_quiz3' => 'Turn off the snooze feature and save',
			'play.stageDescription.alarm_quiz4' => 'Delete the top alarm from the alarm list',
			'play.stageDescription.payment_quiz1' => 'Show the QR code in the payment app',
			'play.stageDescription.payment_quiz2' => 'Remove the blur and check the balance in the payment app',
			'play.stageDescription.payment_quiz3' => 'Send money to someone in the payment app',
			'play.stageDescription.payment_quiz4' => 'Check the transaction history in the payment app',
			'scene.greeting.sunriseMorning' => 'Good morning',
			'scene.greeting.sunnyDay' => 'Beautiful day today',
			'scene.greeting.cloudyDay' => 'A cloudy day',
			'scene.greeting.rainyDay' => 'A rainy day',
			'scene.greeting.sunsetEvening' => 'Good work today',
			'scene.greeting.nightSky' => 'Good work today',
			'tip.defaultTitle' => 'Learn UI/UX',
			'tip.defaultContent' => 'Sharpen your UI/UX intuition by solving quizzes!',
			'settings.title' => 'Settings',
			'settings.appearance.title' => 'Appearance',
			'settings.appearance.theme' => 'Theme',
			'settings.appearance.themeSystem' => 'System Default',
			'settings.appearance.themeLight' => 'Light Theme',
			'settings.appearance.themeDark' => 'Dark Theme',
			'settings.appearance.uiStyle' => 'UI Style',
			'settings.appearance.uiStyleSystem' => 'System Default',
			'settings.appearance.uiStyleMaterial' => 'Material (Android)',
			'settings.appearance.uiStyleCupertino' => 'Cupertino (iOS)',
			'settings.data.title' => 'Data & Account',
			'settings.data.restorePurchase' => 'Restore Purchase',
			'settings.data.resetData' => 'Reset Play Data',
			'settings.data.resetDataDialogTitle' => 'Erase your memory?',
			'settings.data.resetDataDialogMessage' => 'All your learning will vanish…🥺\nAll clear records and play history will be deleted.',
			'settings.data.resetDataCancel' => 'Keep it',
			'settings.data.resetDataOk' => 'Erase',
			'settings.data.resetDataSuccess' => 'Data has been reset',
			'settings.about.title' => 'About',
			'settings.about.developerX' => 'Developer X (Twitter)',
			'settings.about.terms' => 'Terms of Service',
			'settings.about.contact' => 'Contact',
			'settings.about.licenses' => 'Licenses',
			'settings.about.version' => 'Version {version}',
			_ => null,
		};
	}
}
