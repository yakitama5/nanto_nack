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
	@override late final _TranslationsMissionEn mission = _TranslationsMissionEn._(_root);
	@override late final _TranslationsPurchaseEn purchase = _TranslationsPurchaseEn._(_root);
	@override late final _TranslationsErrorEn error = _TranslationsErrorEn._(_root);
	@override late final _TranslationsDashboardEn dashboard = _TranslationsDashboardEn._(_root);
	@override late final _TranslationsPlayEn play = _TranslationsPlayEn._(_root);
	@override late final _TranslationsSceneEn scene = _TranslationsSceneEn._(_root);
	@override late final _TranslationsTipEn tip = _TranslationsTipEn._(_root);
	@override late final _TranslationsTutorialEn tutorial = _TranslationsTutorialEn._(_root);
	@override late final _TranslationsSettingsEn settings = _TranslationsSettingsEn._(_root);
	@override late final _TranslationsSupportEn support = _TranslationsSupportEn._(_root);
	@override late final _TranslationsMaintenanceEn maintenance = _TranslationsMaintenanceEn._(_root);
	@override late final _TranslationsUpdateEn update = _TranslationsUpdateEn._(_root);
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
	@override String get subtitle => 'UI/UX Intuition Quiz';
	@override String get remainingPlaysLabel => 'Remaining plays today';
	@override String get playButton => 'Play';
	@override String get nextStageHint => 'Proceed to next stage';
	@override String get past60Days => 'Clear history\nof last 60 days';
	@override String get noActivityHistory => 'No play history\nyet';
	@override String get categoriesLabel => 'Categories';
	@override String get categoryLockedLabel => 'Unlock after clearing';
	@override String get categoryClearCount => '{cleared}/{total} cleared';
	@override String get dateFormat => '{month}/{day} ({weekday})';
	@override late final _TranslationsHomeWeekdayEn weekday = _TranslationsHomeWeekdayEn._(_root);
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
	@override String get giveUp => 'Gave Up...';
	@override String get result => 'Result';
	@override String get retry => 'Retry';
	@override String get next => 'Next';
	@override String get back => 'Back';
	@override String get score => 'Score: {score}pts';
	@override String get elapsedTime => 'Time: {time}s';
	@override String get exitDialogTitle => 'Quit the game?';
	@override String get exitDialogContent => 'Your current progress will be lost.';
	@override String get exitDialogContinue => 'Continue';
	@override String get exitDialogExit => 'Quit';
}

// Path: mission
class _TranslationsMissionEn extends TranslationsMissionJa {
	_TranslationsMissionEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'MISSION';
	@override String get topic => 'Mission';
	@override String get useHint => 'Use Hint';
	@override String get giveUp => 'Give Up';
	@override String get timeLimit => 'Time Limit: {seconds}s';
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
	@override String get noStages => 'No stages available';
	@override String get comingSoon => 'Coming Soon';
	@override late final _TranslationsPlayCategoryLabelEn categoryLabel = _TranslationsPlayCategoryLabelEn._(_root);
	@override late final _TranslationsPlayCategoryDescriptionEn categoryDescription = _TranslationsPlayCategoryDescriptionEn._(_root);
	@override late final _TranslationsPlayStageTitleEn stageTitle = _TranslationsPlayStageTitleEn._(_root);
	@override late final _TranslationsPlayStageDescriptionEn stageDescription = _TranslationsPlayStageDescriptionEn._(_root);
}

// Path: scene
class _TranslationsSceneEn extends TranslationsSceneJa {
	_TranslationsSceneEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSceneGreetingEn greeting = _TranslationsSceneGreetingEn._(_root);
}

// Path: tip
class _TranslationsTipEn extends TranslationsTipJa {
	_TranslationsTipEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get defaultTitle => 'Learn UI/UX';
	@override String get defaultContent => 'Sharpen your UI/UX intuition by solving quizzes!';
}

// Path: tutorial
class _TranslationsTutorialEn extends TranslationsTutorialJa {
	_TranslationsTutorialEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get skip => 'Skip';
	@override String get step1 => 'Welcome! I\'m Nantom!';
	@override String get step2 => 'These are apps I\'ve made!';
	@override String get step3 => 'I worked hard on them, so give them a try!';
	@override String get step4 => 'Let\'s start with the shopping app. Here we go!';
	@override String get step5 => 'Whoa! The text has become unreadable!';
	@override String get step6 => 'Maybe my curse spread to it...';
	@override String get step7 => 'But don\'t worry! Even without reading the text, icons and colors should give you a "feeling". Give it a try!';
}

// Path: settings
class _TranslationsSettingsEn extends TranslationsSettingsJa {
	_TranslationsSettingsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Settings';
	@override late final _TranslationsSettingsAppearanceEn appearance = _TranslationsSettingsAppearanceEn._(_root);
	@override late final _TranslationsSettingsDataEn data = _TranslationsSettingsDataEn._(_root);
	@override late final _TranslationsSettingsAboutEn about = _TranslationsSettingsAboutEn._(_root);
}

// Path: support
class _TranslationsSupportEn extends TranslationsSupportJa {
	_TranslationsSupportEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Support the Developer';
	@override String get totalCoffeesLabel => 'Coffees you\'ve sent so far';
	@override String get totalCoffeesCount => '☕️ x {count}';
	@override String get description => 'Thank you for supporting NantoNack!\nYour support will be used to improve the app and keep it running.\n※No special features are unlocked by this.';
	@override String get sendCoffeeButton => 'Send a Coffee';
	@override String get restoreButton => 'Restore Purchases (Sync count)';
	@override String get restoreSuccess => 'Support history synced';
	@override String get thankYouTitle => 'Thank you! ☕️';
	@override String get thankYouMessage => 'Your coffee will fuel more improvements to the app!';
	@override String get close => 'Close';
	@override String get fetchError => 'Error: {error}';
	@override String get purchaseError => 'Purchase failed. Please try again.';
	@override String get restoreError => 'Failed to restore purchases. Please try again.';
	@override String get noOfferings => 'No plans available at the moment.';
	@override late final _TranslationsSupportPackageNameEn packageName = _TranslationsSupportPackageNameEn._(_root);
}

// Path: maintenance
class _TranslationsMaintenanceEn extends TranslationsMaintenanceJa {
	_TranslationsMaintenanceEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Under Maintenance';
	@override String get defaultMessage => 'We are currently under maintenance.\nPlease try again later.';
}

// Path: update
class _TranslationsUpdateEn extends TranslationsUpdateJa {
	_TranslationsUpdateEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Update Available';
	@override String get forceMessage => 'Please update the app to continue using it.';
	@override String get optionalMessage => 'A new version is available. We recommend updating.';
	@override String get updateButton => 'Update';
	@override String get laterButton => 'Later';
}

// Path: home.weekday
class _TranslationsHomeWeekdayEn extends TranslationsHomeWeekdayJa {
	_TranslationsHomeWeekdayEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get mon => 'Mon';
	@override String get tue => 'Tue';
	@override String get wed => 'Wed';
	@override String get thu => 'Thu';
	@override String get fri => 'Fri';
	@override String get sat => 'Sat';
	@override String get sun => 'Sun';
}

// Path: play.categoryLabel
class _TranslationsPlayCategoryLabelEn extends TranslationsPlayCategoryLabelJa {
	_TranslationsPlayCategoryLabelEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get shopping => 'Shopping';
	@override String get chat => 'Chat';
	@override String get streaming => 'Video';
	@override String get map => 'Map';
	@override String get alarm => 'Alarm';
	@override String get payment => 'Payment';
	@override String get mail => 'Mail';
	@override String get news => 'News';
	@override String get calendar => 'Calendar';
	@override String get sns => 'SNS';
	@override String get comic => 'Manga App';
}

// Path: play.categoryDescription
class _TranslationsPlayCategoryDescriptionEn extends TranslationsPlayCategoryDescriptionJa {
	_TranslationsPlayCategoryDescriptionEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get shopping => 'Experience e-commerce UI/UX';
	@override String get chat => 'Experience messaging app UI/UX';
	@override String get streaming => 'Experience video app UI/UX';
	@override String get map => 'Experience map app UI/UX';
	@override String get alarm => 'Experience clock & alarm app UI/UX';
	@override String get payment => 'Experience mobile payment app UI/UX';
	@override String get mail => 'Experience email app UI/UX';
	@override String get news => 'Experience news app UI/UX';
	@override String get calendar => 'Experience calendar app UI/UX';
	@override String get sns => 'Experience social media app UI/UX';
	@override String get comic => 'Master manga app operations';
}

// Path: play.stageTitle
class _TranslationsPlayStageTitleEn extends TranslationsPlayStageTitleJa {
	_TranslationsPlayStageTitleEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get shopping_quiz1 => 'Buy 2 Waters';
	@override String get shopping_quiz2 => 'Complete Checkout';
	@override String get shopping_quiz3 => 'Reorder Recent Purchase';
	@override String get shopping_quiz4 => 'Select Cart Total';
	@override String get chat_quiz1 => 'Reply with a Sticker';
	@override String get chat_quiz2 => 'React to a Message';
	@override String get chat_quiz3 => 'Send a Photo';
	@override String get chat_quiz4 => 'Unsend a Message';
	@override String get streaming_quiz1 => 'Turn on Subtitles';
	@override String get streaming_quiz2 => 'Skip to the Middle';
	@override String get streaming_quiz3 => 'Play at 2x Speed';
	@override String get streaming_quiz4 => 'Download a Video';
	@override String get map_quiz1 => 'Show Current Location';
	@override String get map_quiz2 => 'Show School Information';
	@override String get map_quiz3 => 'Navigate to Park by Train';
	@override String get map_quiz4 => 'Save the Station to Favorites';
	@override String get alarm_quiz1 => 'Add an Alarm';
	@override String get alarm_quiz2 => 'Set Weekday Only';
	@override String get alarm_quiz3 => 'Turn Off Snooze';
	@override String get alarm_quiz4 => 'Delete an Alarm';
	@override String get payment_quiz1 => 'Show QR Code';
	@override String get payment_quiz2 => 'Hide Your Balance';
	@override String get payment_quiz3 => 'Send Money';
	@override String get payment_quiz4 => 'Change Payment Method';
	@override String get mail_quiz1 => 'Archive an Email';
	@override String get mail_quiz2 => 'Empty the Trash';
	@override String get mail_quiz3 => 'Delete 3 Emails';
	@override String get mail_quiz4 => 'Search for Large Emails';
	@override String get news_quiz1 => 'Refresh the News';
	@override String get news_quiz2 => 'Show Sports Category';
	@override String get news_quiz3 => 'Change Font Size to Large';
	@override String get news_quiz4 => 'Hide an Unwanted Article';
	@override String get calendar_quiz1 => 'View Next Month Events';
	@override String get calendar_quiz2 => 'Add an Event Quickly';
	@override String get calendar_quiz3 => 'Change Event Date';
	@override String get calendar_quiz4 => 'Return to Today Instantly';
	@override String get sns_quiz1 => 'Like the cat photo on the timeline';
	@override String get sns_quiz2 => 'Post something!';
	@override String get sns_quiz3 => 'Open an image and return to the previous screen';
	@override String get sns_quiz4 => 'Search for nantom\'s (@nantom) posts';
	@override String get comic_quiz1 => 'Go Back 3 Pages';
	@override String get comic_quiz2 => 'Zoom In';
	@override String get comic_quiz3 => 'Show the Menu';
	@override String get comic_quiz4 => 'Support the Creator';
}

// Path: play.stageDescription
class _TranslationsPlayStageDescriptionEn extends TranslationsPlayStageDescriptionJa {
	_TranslationsPlayStageDescriptionEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get shopping_quiz1 => 'Add 2 waters to the cart and purchase on the e-commerce site';
	@override String get shopping_quiz2 => 'Complete 3 steps: address, payment method, and order confirmation';
	@override String get shopping_quiz3 => 'Reorder the most recently purchased item from order history';
	@override String get shopping_quiz4 => 'Select the total amount of items in the cart from 4 choices';
	@override String get chat_quiz1 => 'Reply with one sticker in the chat app';
	@override String get chat_quiz2 => 'React to the other person\'s message with a heart';
	@override String get chat_quiz3 => 'Send one photo in the chat app';
	@override String get chat_quiz4 => 'Unsend your last sent message';
	@override String get streaming_quiz1 => 'Turn on the subtitle feature in the video app';
	@override String get streaming_quiz2 => 'Go to the next video and skip to the middle';
	@override String get streaming_quiz3 => 'Play a video at 2x speed in the video app';
	@override String get streaming_quiz4 => 'Change to highest quality and download the video';
	@override String get map_quiz1 => 'Show your current location in the map app';
	@override String get map_quiz2 => 'Tap the school icon on the map to show its information';
	@override String get map_quiz3 => 'Select the park and choose train to navigate in the map app';
	@override String get map_quiz4 => 'Tap the station on the map and save it to favorites in the map app';
	@override String get alarm_quiz1 => 'Add a new alarm in the clock app';
	@override String get alarm_quiz2 => 'Set an alarm to repeat only Monday through Friday';
	@override String get alarm_quiz3 => 'Turn off the snooze feature and save';
	@override String get alarm_quiz4 => 'Delete the top alarm from the alarm list';
	@override String get payment_quiz1 => 'Show the QR code in the payment app';
	@override String get payment_quiz2 => 'Tap the eye icon to hide your balance in the payment app';
	@override String get payment_quiz3 => 'Send money to someone in the payment app';
	@override String get payment_quiz4 => 'Change the payment method to a credit card and show the QR code in the payment app';
	@override String get mail_quiz1 => 'Archive the 3rd email from the top in the mail app';
	@override String get mail_quiz2 => 'Empty the trash folder in the mail app';
	@override String get mail_quiz3 => 'Select 3 emails and delete them in the mail app';
	@override String get mail_quiz4 => 'Search for emails larger than 5 megabytes in the mail app';
	@override String get news_quiz1 => 'Pull down to refresh the news feed';
	@override String get news_quiz2 => 'Swipe or tap the tab to show Sports';
	@override String get news_quiz3 => 'Open an article and change the font size to Large';
	@override String get news_quiz4 => 'Hide the movie review article from the menu';
	@override String get calendar_quiz1 => 'Use the calendar to check the events for next month';
	@override String get calendar_quiz2 => 'Add a new event on the 15th';
	@override String get calendar_quiz3 => 'Move the dentist appointment to the next day';
	@override String get calendar_quiz4 => 'After navigating years ahead, return to today\'s date';
	@override String get sns_quiz1 => 'Double tap the cat photo to like it';
	@override String get sns_quiz2 => 'Post something in the SNS app';
	@override String get sns_quiz3 => 'Open an image in fullscreen, then swipe down to close and return to the previous screen';
	@override String get sns_quiz4 => 'Search for Nantom\'s (@nantom) posts in the SNS app';
	@override String get comic_quiz1 => 'Go back 3 pages in the manga app';
	@override String get comic_quiz2 => 'Zoom in to read the small text';
	@override String get comic_quiz3 => 'Show the menu in the manga app';
	@override String get comic_quiz4 => 'Tap the support button 10 times';
}

// Path: scene.greeting
class _TranslationsSceneGreetingEn extends TranslationsSceneGreetingJa {
	_TranslationsSceneGreetingEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get sunriseMorning => 'Good morning';
	@override String get sunnyDay => 'Beautiful day today';
	@override String get cloudyDay => 'A cloudy day';
	@override String get rainyDay => 'A rainy day';
	@override String get sunsetEvening => 'Good work today';
	@override String get nightSky => 'Good work today';
}

// Path: settings.appearance
class _TranslationsSettingsAppearanceEn extends TranslationsSettingsAppearanceJa {
	_TranslationsSettingsAppearanceEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Appearance';
	@override String get theme => 'Theme';
	@override String get themeSystem => 'System Default';
	@override String get themeLight => 'Light Theme';
	@override String get themeDark => 'Dark Theme';
	@override String get uiStyle => 'UI Style';
	@override String get uiStyleSystem => 'System Default';
	@override String get uiStyleMaterial => 'Material (Android)';
	@override String get uiStyleCupertino => 'Cupertino (iOS)';
}

// Path: settings.data
class _TranslationsSettingsDataEn extends TranslationsSettingsDataJa {
	_TranslationsSettingsDataEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Data & Account';
	@override String get restorePurchase => 'Restore Purchase';
	@override String get resetData => 'Reset Play Data';
	@override String get resetDataDialogTitle => 'Erase your memory?';
	@override String get resetDataDialogMessage => 'All your learning will vanish…🥺\nAll clear records and play history will be deleted.';
	@override String get resetDataCancel => 'Keep it';
	@override String get resetDataOk => 'Erase';
	@override String get resetDataSuccess => 'Data has been reset';
}

// Path: settings.about
class _TranslationsSettingsAboutEn extends TranslationsSettingsAboutJa {
	_TranslationsSettingsAboutEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'About';
	@override String get developerX => 'Developer X (Twitter)';
	@override String get privacyPolicy => 'Privacy Policy';
	@override String get contact => 'Contact';
	@override String get licenses => 'Licenses';
	@override String get version => 'Version {version}';
}

// Path: support.packageName
class _TranslationsSupportPackageNameEn extends TranslationsSupportPackageNameJa {
	_TranslationsSupportPackageNameEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get coffee100 => '1 Coffee';
	@override String get coffee300 => '3 Coffees';
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
			'quiz.exitDialogTitle' => 'Quit the game?',
			'quiz.exitDialogContent' => 'Your current progress will be lost.',
			'quiz.exitDialogContinue' => 'Continue',
			'quiz.exitDialogExit' => 'Quit',
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
			'play.categoryLabel.mail' => 'Mail',
			'play.categoryLabel.news' => 'News',
			'play.categoryLabel.calendar' => 'Calendar',
			'play.categoryLabel.sns' => 'SNS',
			'play.categoryLabel.comic' => 'Manga App',
			'play.categoryDescription.shopping' => 'Experience e-commerce UI/UX',
			'play.categoryDescription.chat' => 'Experience messaging app UI/UX',
			'play.categoryDescription.streaming' => 'Experience video app UI/UX',
			'play.categoryDescription.map' => 'Experience map app UI/UX',
			'play.categoryDescription.alarm' => 'Experience clock & alarm app UI/UX',
			'play.categoryDescription.payment' => 'Experience mobile payment app UI/UX',
			'play.categoryDescription.mail' => 'Experience email app UI/UX',
			'play.categoryDescription.news' => 'Experience news app UI/UX',
			'play.categoryDescription.calendar' => 'Experience calendar app UI/UX',
			'play.categoryDescription.sns' => 'Experience social media app UI/UX',
			'play.categoryDescription.comic' => 'Master manga app operations',
			'play.stageTitle.shopping_quiz1' => 'Buy 2 Waters',
			'play.stageTitle.shopping_quiz2' => 'Complete Checkout',
			'play.stageTitle.shopping_quiz3' => 'Reorder Recent Purchase',
			'play.stageTitle.shopping_quiz4' => 'Select Cart Total',
			'play.stageTitle.chat_quiz1' => 'Reply with a Sticker',
			'play.stageTitle.chat_quiz2' => 'React to a Message',
			'play.stageTitle.chat_quiz3' => 'Send a Photo',
			'play.stageTitle.chat_quiz4' => 'Unsend a Message',
			'play.stageTitle.streaming_quiz1' => 'Turn on Subtitles',
			'play.stageTitle.streaming_quiz2' => 'Skip to the Middle',
			'play.stageTitle.streaming_quiz3' => 'Play at 2x Speed',
			'play.stageTitle.streaming_quiz4' => 'Download a Video',
			'play.stageTitle.map_quiz1' => 'Show Current Location',
			'play.stageTitle.map_quiz2' => 'Show School Information',
			'play.stageTitle.map_quiz3' => 'Navigate to Park by Train',
			'play.stageTitle.map_quiz4' => 'Save the Station to Favorites',
			'play.stageTitle.alarm_quiz1' => 'Add an Alarm',
			'play.stageTitle.alarm_quiz2' => 'Set Weekday Only',
			'play.stageTitle.alarm_quiz3' => 'Turn Off Snooze',
			'play.stageTitle.alarm_quiz4' => 'Delete an Alarm',
			'play.stageTitle.payment_quiz1' => 'Show QR Code',
			'play.stageTitle.payment_quiz2' => 'Hide Your Balance',
			'play.stageTitle.payment_quiz3' => 'Send Money',
			'play.stageTitle.payment_quiz4' => 'Change Payment Method',
			'play.stageTitle.mail_quiz1' => 'Archive an Email',
			'play.stageTitle.mail_quiz2' => 'Empty the Trash',
			'play.stageTitle.mail_quiz3' => 'Delete 3 Emails',
			'play.stageTitle.mail_quiz4' => 'Search for Large Emails',
			'play.stageTitle.news_quiz1' => 'Refresh the News',
			'play.stageTitle.news_quiz2' => 'Show Sports Category',
			'play.stageTitle.news_quiz3' => 'Change Font Size to Large',
			'play.stageTitle.news_quiz4' => 'Hide an Unwanted Article',
			'play.stageTitle.calendar_quiz1' => 'View Next Month Events',
			'play.stageTitle.calendar_quiz2' => 'Add an Event Quickly',
			'play.stageTitle.calendar_quiz3' => 'Change Event Date',
			'play.stageTitle.calendar_quiz4' => 'Return to Today Instantly',
			'play.stageTitle.sns_quiz1' => 'Like the cat photo on the timeline',
			'play.stageTitle.sns_quiz2' => 'Post something!',
			'play.stageTitle.sns_quiz3' => 'Open an image and return to the previous screen',
			'play.stageTitle.sns_quiz4' => 'Search for nantom\'s (@nantom) posts',
			'play.stageTitle.comic_quiz1' => 'Go Back 3 Pages',
			'play.stageTitle.comic_quiz2' => 'Zoom In',
			'play.stageTitle.comic_quiz3' => 'Show the Menu',
			'play.stageTitle.comic_quiz4' => 'Support the Creator',
			'play.stageDescription.shopping_quiz1' => 'Add 2 waters to the cart and purchase on the e-commerce site',
			'play.stageDescription.shopping_quiz2' => 'Complete 3 steps: address, payment method, and order confirmation',
			'play.stageDescription.shopping_quiz3' => 'Reorder the most recently purchased item from order history',
			'play.stageDescription.shopping_quiz4' => 'Select the total amount of items in the cart from 4 choices',
			'play.stageDescription.chat_quiz1' => 'Reply with one sticker in the chat app',
			'play.stageDescription.chat_quiz2' => 'React to the other person\'s message with a heart',
			'play.stageDescription.chat_quiz3' => 'Send one photo in the chat app',
			'play.stageDescription.chat_quiz4' => 'Unsend your last sent message',
			'play.stageDescription.streaming_quiz1' => 'Turn on the subtitle feature in the video app',
			'play.stageDescription.streaming_quiz2' => 'Go to the next video and skip to the middle',
			'play.stageDescription.streaming_quiz3' => 'Play a video at 2x speed in the video app',
			'play.stageDescription.streaming_quiz4' => 'Change to highest quality and download the video',
			'play.stageDescription.map_quiz1' => 'Show your current location in the map app',
			'play.stageDescription.map_quiz2' => 'Tap the school icon on the map to show its information',
			'play.stageDescription.map_quiz3' => 'Select the park and choose train to navigate in the map app',
			'play.stageDescription.map_quiz4' => 'Tap the station on the map and save it to favorites in the map app',
			'play.stageDescription.alarm_quiz1' => 'Add a new alarm in the clock app',
			'play.stageDescription.alarm_quiz2' => 'Set an alarm to repeat only Monday through Friday',
			'play.stageDescription.alarm_quiz3' => 'Turn off the snooze feature and save',
			'play.stageDescription.alarm_quiz4' => 'Delete the top alarm from the alarm list',
			'play.stageDescription.payment_quiz1' => 'Show the QR code in the payment app',
			'play.stageDescription.payment_quiz2' => 'Tap the eye icon to hide your balance in the payment app',
			'play.stageDescription.payment_quiz3' => 'Send money to someone in the payment app',
			'play.stageDescription.payment_quiz4' => 'Change the payment method to a credit card and show the QR code in the payment app',
			'play.stageDescription.mail_quiz1' => 'Archive the 3rd email from the top in the mail app',
			'play.stageDescription.mail_quiz2' => 'Empty the trash folder in the mail app',
			'play.stageDescription.mail_quiz3' => 'Select 3 emails and delete them in the mail app',
			'play.stageDescription.mail_quiz4' => 'Search for emails larger than 5 megabytes in the mail app',
			'play.stageDescription.news_quiz1' => 'Pull down to refresh the news feed',
			'play.stageDescription.news_quiz2' => 'Swipe or tap the tab to show Sports',
			'play.stageDescription.news_quiz3' => 'Open an article and change the font size to Large',
			'play.stageDescription.news_quiz4' => 'Hide the movie review article from the menu',
			'play.stageDescription.calendar_quiz1' => 'Use the calendar to check the events for next month',
			'play.stageDescription.calendar_quiz2' => 'Add a new event on the 15th',
			'play.stageDescription.calendar_quiz3' => 'Move the dentist appointment to the next day',
			'play.stageDescription.calendar_quiz4' => 'After navigating years ahead, return to today\'s date',
			'play.stageDescription.sns_quiz1' => 'Double tap the cat photo to like it',
			'play.stageDescription.sns_quiz2' => 'Post something in the SNS app',
			'play.stageDescription.sns_quiz3' => 'Open an image in fullscreen, then swipe down to close and return to the previous screen',
			'play.stageDescription.sns_quiz4' => 'Search for Nantom\'s (@nantom) posts in the SNS app',
			'play.stageDescription.comic_quiz1' => 'Go back 3 pages in the manga app',
			'play.stageDescription.comic_quiz2' => 'Zoom in to read the small text',
			'play.stageDescription.comic_quiz3' => 'Show the menu in the manga app',
			'play.stageDescription.comic_quiz4' => 'Tap the support button 10 times',
			'scene.greeting.sunriseMorning' => 'Good morning',
			'scene.greeting.sunnyDay' => 'Beautiful day today',
			'scene.greeting.cloudyDay' => 'A cloudy day',
			'scene.greeting.rainyDay' => 'A rainy day',
			'scene.greeting.sunsetEvening' => 'Good work today',
			'scene.greeting.nightSky' => 'Good work today',
			'tip.defaultTitle' => 'Learn UI/UX',
			'tip.defaultContent' => 'Sharpen your UI/UX intuition by solving quizzes!',
			'tutorial.skip' => 'Skip',
			'tutorial.step1' => 'Welcome! I\'m Nantom!',
			'tutorial.step2' => 'These are apps I\'ve made!',
			'tutorial.step3' => 'I worked hard on them, so give them a try!',
			'tutorial.step4' => 'Let\'s start with the shopping app. Here we go!',
			'tutorial.step5' => 'Whoa! The text has become unreadable!',
			'tutorial.step6' => 'Maybe my curse spread to it...',
			'tutorial.step7' => 'But don\'t worry! Even without reading the text, icons and colors should give you a "feeling". Give it a try!',
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
			'settings.about.privacyPolicy' => 'Privacy Policy',
			'settings.about.contact' => 'Contact',
			'settings.about.licenses' => 'Licenses',
			'settings.about.version' => 'Version {version}',
			'support.title' => 'Support the Developer',
			'support.totalCoffeesLabel' => 'Coffees you\'ve sent so far',
			'support.totalCoffeesCount' => '☕️ x {count}',
			'support.description' => 'Thank you for supporting NantoNack!\nYour support will be used to improve the app and keep it running.\n※No special features are unlocked by this.',
			'support.sendCoffeeButton' => 'Send a Coffee',
			'support.restoreButton' => 'Restore Purchases (Sync count)',
			'support.restoreSuccess' => 'Support history synced',
			'support.thankYouTitle' => 'Thank you! ☕️',
			'support.thankYouMessage' => 'Your coffee will fuel more improvements to the app!',
			'support.close' => 'Close',
			'support.fetchError' => 'Error: {error}',
			'support.purchaseError' => 'Purchase failed. Please try again.',
			'support.restoreError' => 'Failed to restore purchases. Please try again.',
			'support.noOfferings' => 'No plans available at the moment.',
			'support.packageName.coffee100' => '1 Coffee',
			'support.packageName.coffee300' => '3 Coffees',
			'maintenance.title' => 'Under Maintenance',
			'maintenance.defaultMessage' => 'We are currently under maintenance.\nPlease try again later.',
			'update.title' => 'Update Available',
			'update.forceMessage' => 'Please update the app to continue using it.',
			'update.optionalMessage' => 'A new version is available. We recommend updating.',
			'update.updateButton' => 'Update',
			'update.laterButton' => 'Later',
			_ => null,
		};
	}
}
