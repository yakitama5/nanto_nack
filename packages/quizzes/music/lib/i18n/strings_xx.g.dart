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
	@override late final _TranslationsSongsXx songs = _TranslationsSongsXx._(_root);
}

// Path: quiz1
class _TranslationsQuiz1Xx extends TranslationsQuiz1Ja {
	_TranslationsQuiz1Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Skip to the next song';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Minimize the player';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Set to 1-song repeat';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Show the lyrics';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'MusicHub';
	@override String get homeTab => 'Home';
	@override String get libraryTab => 'Library';
	@override String get searchTab => 'Search';
	@override String get likeButton => 'Like';
	@override String get moreButton => 'More';
	@override String get playlistTitle => 'Playlist';
	@override String get songCount => '{count} songs';
	@override String get lyrics => 'Lyrics';
	@override String get lyricsNotAvailable => 'No lyrics';
	@override String get quitConfirmTitle => 'Quit?';
	@override String get quitConfirmMessage => 'Game will end.';
	@override String get continueButton => 'Continue';
	@override String get quitButton => 'Quit';
	@override String get mockCurrentTime => '1:12';
	@override String get mockDuration => '3:45';
}

// Path: songs
class _TranslationsSongsXx extends TranslationsSongsJa {
	_TranslationsSongsXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get song1Title => 'Starlight Drive';
	@override String get song1Artist => 'The Cosmic Band';
	@override String get song1Lyrics => 'Driving down the starlit road\nFeeling free, no heavy load\nNeon lights and city dreams\nNothing\'s ever what it seems\n\nRide with me through the night\nEverything will be alright';
	@override String get song2Title => 'Ocean Waves';
	@override String get song2Artist => 'Blue Horizon';
	@override String get song2Lyrics => 'The ocean calls my name tonight\nWaves of blue in morning light\nSalt and sea and endless sky\nWatching seagulls as they fly\n\nLet the tide wash away\nAll the worries of the day';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Song Navigation';
	@override String get subtitle => 'Swipe or skip';
	@override String get swipeTitle => 'Swipe artwork';
	@override String get swipeDesc => 'Swipe left to skip.';
	@override String get skipTitle => 'Skip button';
	@override String get skipDesc => 'Next track symbol.';
	@override String get gestureTitle => 'Two ways';
	@override String get gestureDesc => 'Swipe or tap works.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Player Control';
	@override String get subtitle => 'Pull down';
	@override String get dragTitle => 'Drag down';
	@override String get dragDesc => 'Pull to minimize.';
	@override String get miniTitle => 'Mini player';
	@override String get miniDesc => 'Music keeps playing.';
	@override String get notchTitle => 'Drag handle';
	@override String get notchDesc => 'Bar shows draggability.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Repeat Mode';
	@override String get subtitle => 'Tap to cycle';
	@override String get repeatTitle => '3 states';
	@override String get repeatDesc => 'Tap cycles repeat.';
	@override String get iconTitle => 'Arrow + 1';
	@override String get iconDesc => '1 badge means one.';
	@override String get tapTitle => 'Cycle tap';
	@override String get tapDesc => 'Same button cycles.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lyrics Panel';
	@override String get subtitle => 'Pull up';
	@override String get dragTitle => 'Pull up sheet';
	@override String get dragDesc => 'Swipe up to show.';
	@override String get handleTitle => 'Drag handle';
	@override String get handleDesc => 'Bar is draggable.';
	@override String get lyricsTitle => 'Lyrics scroll';
	@override String get lyricsDesc => 'Scroll inside sheet.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Skip to the next song',
			'quiz1.insight.title' => 'Song Navigation',
			'quiz1.insight.subtitle' => 'Swipe or skip',
			'quiz1.insight.swipeTitle' => 'Swipe artwork',
			'quiz1.insight.swipeDesc' => 'Swipe left to skip.',
			'quiz1.insight.skipTitle' => 'Skip button',
			'quiz1.insight.skipDesc' => 'Next track symbol.',
			'quiz1.insight.gestureTitle' => 'Two ways',
			'quiz1.insight.gestureDesc' => 'Swipe or tap works.',
			'quiz2.missionText' => 'Minimize the player',
			'quiz2.insight.title' => 'Player Control',
			'quiz2.insight.subtitle' => 'Pull down',
			'quiz2.insight.dragTitle' => 'Drag down',
			'quiz2.insight.dragDesc' => 'Pull to minimize.',
			'quiz2.insight.miniTitle' => 'Mini player',
			'quiz2.insight.miniDesc' => 'Music keeps playing.',
			'quiz2.insight.notchTitle' => 'Drag handle',
			'quiz2.insight.notchDesc' => 'Bar shows draggability.',
			'quiz3.missionText' => 'Set to 1-song repeat',
			'quiz3.insight.title' => 'Repeat Mode',
			'quiz3.insight.subtitle' => 'Tap to cycle',
			'quiz3.insight.repeatTitle' => '3 states',
			'quiz3.insight.repeatDesc' => 'Tap cycles repeat.',
			'quiz3.insight.iconTitle' => 'Arrow + 1',
			'quiz3.insight.iconDesc' => '1 badge means one.',
			'quiz3.insight.tapTitle' => 'Cycle tap',
			'quiz3.insight.tapDesc' => 'Same button cycles.',
			'quiz4.missionText' => 'Show the lyrics',
			'quiz4.insight.title' => 'Lyrics Panel',
			'quiz4.insight.subtitle' => 'Pull up',
			'quiz4.insight.dragTitle' => 'Pull up sheet',
			'quiz4.insight.dragDesc' => 'Swipe up to show.',
			'quiz4.insight.handleTitle' => 'Drag handle',
			'quiz4.insight.handleDesc' => 'Bar is draggable.',
			'quiz4.insight.lyricsTitle' => 'Lyrics scroll',
			'quiz4.insight.lyricsDesc' => 'Scroll inside sheet.',
			'common.appTitle' => 'MusicHub',
			'common.homeTab' => 'Home',
			'common.libraryTab' => 'Library',
			'common.searchTab' => 'Search',
			'common.likeButton' => 'Like',
			'common.moreButton' => 'More',
			'common.playlistTitle' => 'Playlist',
			'common.songCount' => '{count} songs',
			'common.lyrics' => 'Lyrics',
			'common.lyricsNotAvailable' => 'No lyrics',
			'common.quitConfirmTitle' => 'Quit?',
			'common.quitConfirmMessage' => 'Game will end.',
			'common.continueButton' => 'Continue',
			'common.quitButton' => 'Quit',
			'common.mockCurrentTime' => '1:12',
			'common.mockDuration' => '3:45',
			'songs.song1Title' => 'Starlight Drive',
			'songs.song1Artist' => 'The Cosmic Band',
			'songs.song1Lyrics' => 'Driving down the starlit road\nFeeling free, no heavy load\nNeon lights and city dreams\nNothing\'s ever what it seems\n\nRide with me through the night\nEverything will be alright',
			'songs.song2Title' => 'Ocean Waves',
			'songs.song2Artist' => 'Blue Horizon',
			'songs.song2Lyrics' => 'The ocean calls my name tonight\nWaves of blue in morning light\nSalt and sea and endless sky\nWatching seagulls as they fly\n\nLet the tide wash away\nAll the worries of the day',
			_ => null,
		};
	}
}
