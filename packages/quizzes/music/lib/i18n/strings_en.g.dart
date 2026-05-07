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
	@override late final _TranslationsSongsEn songs = _TranslationsSongsEn._(_root);
}

// Path: quiz1
class _TranslationsQuiz1En extends TranslationsQuiz1Ja {
	_TranslationsQuiz1En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Don\'t like this song? Try skipping to the next one';
	@override late final _TranslationsQuiz1InsightEn insight = _TranslationsQuiz1InsightEn._(_root);
}

// Path: quiz2
class _TranslationsQuiz2En extends TranslationsQuiz2Ja {
	_TranslationsQuiz2En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Want to browse for a song? Minimize the player to go back';
	@override late final _TranslationsQuiz2InsightEn insight = _TranslationsQuiz2InsightEn._(_root);
}

// Path: quiz3
class _TranslationsQuiz3En extends TranslationsQuiz3Ja {
	_TranslationsQuiz3En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'This song is amazing! Set it to repeat just this one song';
	@override late final _TranslationsQuiz3InsightEn insight = _TranslationsQuiz3InsightEn._(_root);
}

// Path: quiz4
class _TranslationsQuiz4En extends TranslationsQuiz4Ja {
	_TranslationsQuiz4En._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'What are they singing? Try checking the lyrics';
	@override late final _TranslationsQuiz4InsightEn insight = _TranslationsQuiz4InsightEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'MusicHub';
	@override String get homeTab => 'Home';
	@override String get libraryTab => 'Library';
	@override String get searchTab => 'Search';
	@override String get likeButton => 'Like';
	@override String get moreButton => 'More';
	@override String get playlistTitle => 'My Playlist';
	@override String get songCount => '{count} songs';
	@override String get lyrics => 'Lyrics';
	@override String get lyricsNotAvailable => 'No lyrics available';
	@override String get quitConfirmTitle => 'Quit Game?';
	@override String get quitConfirmMessage => 'Your current game will end.';
	@override String get continueButton => 'Continue';
	@override String get quitButton => 'Quit';
}

// Path: songs
class _TranslationsSongsEn extends TranslationsSongsJa {
	_TranslationsSongsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get song1Title => 'Starlight Drive';
	@override String get song1Artist => 'The Cosmic Band';
	@override String get song1Lyrics => 'Driving down the starlit road\nFeeling free, no heavy load\nNeon lights and city dreams\nNothing\'s ever what it seems\n\nRide with me through the night\nEverything will be alright\nStarlight drive, starlight drive\nKeep us feeling so alive';
	@override String get song2Title => 'Ocean Waves';
	@override String get song2Artist => 'Blue Horizon';
	@override String get song2Lyrics => 'The ocean calls my name tonight\nWaves of blue in morning light\nSalt and sea and endless sky\nWatching seagulls as they fly\n\nLet the tide wash away\nAll the worries of the day\nOcean waves, ocean waves\nFind the peace that silence saves';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightEn extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you skip to the next song?';
	@override String get subtitle => 'The swipe-to-change feeling';
	@override String get swipeTitle => 'Left swipe on album art';
	@override String get swipeDesc => 'Swiping left on album artwork to go to the next song feels just like flipping through gallery photos. The visual card UI intuitively signals that it can be \'swiped\'.';
	@override String get skipTitle => 'The skip button (⏭) meaning';
	@override String get skipDesc => 'The \'▶▶|\' symbol from the cassette era means \'skip to next track\'. Its placement next to the play button (on the right) has become a global standard.';
	@override String get gestureTitle => 'Dual operation: gesture and button';
	@override String get gestureDesc => 'Offering the same function (song change) through both swipe and tap lets users choose their preferred input method — a \'multiple input paths\' principle of mobile UX.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightEn extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you know to drag the screen down?';
	@override String get subtitle => 'The sheet UI \'pull-down\' pattern';
	@override String get dragTitle => 'Drag down to \'close\'';
	@override String get dragDesc => 'Dragging down to minimize the full-screen player became popular through Spotify and Apple Music on iOS. \'Pull down = close/store\' is now a shared concept among smartphone users.';
	@override String get miniTitle => 'Music continues in mini player';
	@override String get miniDesc => 'Closing the full-screen view doesn\'t stop the music — playback continues in the mini player at the bottom. This \'keep doing other things while listening\' UX pattern is widely used.';
	@override String get notchTitle => 'The drag indicator (notch)';
	@override String get notchDesc => 'The thin horizontal bar at the top of the sheet signals \'this UI can be dragged\'. Small but visually significant, it prompts users to try pulling.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightEn extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Did you figure out the repeat button?';
	@override String get subtitle => 'The 3-state repeat button';
	@override String get repeatTitle => '3 states in one button';
	@override String get repeatDesc => '🔁 (loop all) → 🔂 (loop one) → off: three states cycle through one button. The \'1\' badge is what distinguishes \'loop one\' from \'loop all\' — a clever symbol extension.';
	@override String get iconTitle => 'Circular arrows + \'1\'';
	@override String get iconDesc => 'Two circular arrows mean \'repeat\', but adding \'1\' changes the meaning to \'repeat this one track\'. A great example of using a modifier number to expand meaning.';
	@override String get tapTitle => 'Tap to cycle through states';
	@override String get tapDesc => 'Repeatedly tapping the same button to cycle through states — the \'cycle operation\' UX pattern — is used in many apps beyond music players.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightEn extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did you pull up the lyrics panel?';
	@override String get subtitle => 'The bottom sheet \'pull-up\' pattern';
	@override String get dragTitle => 'Pull up the bottom sheet';
	@override String get dragDesc => 'Swiping up a partially visible panel at the bottom of the screen became mainstream through Google Maps\' place info sheet. The physical sensation of \'grab and pull up\' is directly reflected in the UI.';
	@override String get handleTitle => 'The drag handle says \'I can be dragged\'';
	@override String get handleDesc => 'The thin bar at the top of the panel signals that this UI can be dragged up and down. It\'s a classic affordance — using shape instead of text to communicate interactivity.';
	@override String get lyricsTitle => 'Lyrics combined with scrolling';
	@override String get lyricsDesc => 'Having lyrics scroll inside the pulled-up sheet answers the expectation of \'once pulled up, I can read as much as I want\' — a clean separation of sheet state and content state.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Don\'t like this song? Try skipping to the next one',
			'quiz1.insight.title' => 'How did you skip to the next song?',
			'quiz1.insight.subtitle' => 'The swipe-to-change feeling',
			'quiz1.insight.swipeTitle' => 'Left swipe on album art',
			'quiz1.insight.swipeDesc' => 'Swiping left on album artwork to go to the next song feels just like flipping through gallery photos. The visual card UI intuitively signals that it can be \'swiped\'.',
			'quiz1.insight.skipTitle' => 'The skip button (⏭) meaning',
			'quiz1.insight.skipDesc' => 'The \'▶▶|\' symbol from the cassette era means \'skip to next track\'. Its placement next to the play button (on the right) has become a global standard.',
			'quiz1.insight.gestureTitle' => 'Dual operation: gesture and button',
			'quiz1.insight.gestureDesc' => 'Offering the same function (song change) through both swipe and tap lets users choose their preferred input method — a \'multiple input paths\' principle of mobile UX.',
			'quiz2.missionText' => 'Want to browse for a song? Minimize the player to go back',
			'quiz2.insight.title' => 'How did you know to drag the screen down?',
			'quiz2.insight.subtitle' => 'The sheet UI \'pull-down\' pattern',
			'quiz2.insight.dragTitle' => 'Drag down to \'close\'',
			'quiz2.insight.dragDesc' => 'Dragging down to minimize the full-screen player became popular through Spotify and Apple Music on iOS. \'Pull down = close/store\' is now a shared concept among smartphone users.',
			'quiz2.insight.miniTitle' => 'Music continues in mini player',
			'quiz2.insight.miniDesc' => 'Closing the full-screen view doesn\'t stop the music — playback continues in the mini player at the bottom. This \'keep doing other things while listening\' UX pattern is widely used.',
			'quiz2.insight.notchTitle' => 'The drag indicator (notch)',
			'quiz2.insight.notchDesc' => 'The thin horizontal bar at the top of the sheet signals \'this UI can be dragged\'. Small but visually significant, it prompts users to try pulling.',
			'quiz3.missionText' => 'This song is amazing! Set it to repeat just this one song',
			'quiz3.insight.title' => 'Did you figure out the repeat button?',
			'quiz3.insight.subtitle' => 'The 3-state repeat button',
			'quiz3.insight.repeatTitle' => '3 states in one button',
			'quiz3.insight.repeatDesc' => '🔁 (loop all) → 🔂 (loop one) → off: three states cycle through one button. The \'1\' badge is what distinguishes \'loop one\' from \'loop all\' — a clever symbol extension.',
			'quiz3.insight.iconTitle' => 'Circular arrows + \'1\'',
			'quiz3.insight.iconDesc' => 'Two circular arrows mean \'repeat\', but adding \'1\' changes the meaning to \'repeat this one track\'. A great example of using a modifier number to expand meaning.',
			'quiz3.insight.tapTitle' => 'Tap to cycle through states',
			'quiz3.insight.tapDesc' => 'Repeatedly tapping the same button to cycle through states — the \'cycle operation\' UX pattern — is used in many apps beyond music players.',
			'quiz4.missionText' => 'What are they singing? Try checking the lyrics',
			'quiz4.insight.title' => 'How did you pull up the lyrics panel?',
			'quiz4.insight.subtitle' => 'The bottom sheet \'pull-up\' pattern',
			'quiz4.insight.dragTitle' => 'Pull up the bottom sheet',
			'quiz4.insight.dragDesc' => 'Swiping up a partially visible panel at the bottom of the screen became mainstream through Google Maps\' place info sheet. The physical sensation of \'grab and pull up\' is directly reflected in the UI.',
			'quiz4.insight.handleTitle' => 'The drag handle says \'I can be dragged\'',
			'quiz4.insight.handleDesc' => 'The thin bar at the top of the panel signals that this UI can be dragged up and down. It\'s a classic affordance — using shape instead of text to communicate interactivity.',
			'quiz4.insight.lyricsTitle' => 'Lyrics combined with scrolling',
			'quiz4.insight.lyricsDesc' => 'Having lyrics scroll inside the pulled-up sheet answers the expectation of \'once pulled up, I can read as much as I want\' — a clean separation of sheet state and content state.',
			'common.appTitle' => 'MusicHub',
			'common.homeTab' => 'Home',
			'common.libraryTab' => 'Library',
			'common.searchTab' => 'Search',
			'common.likeButton' => 'Like',
			'common.moreButton' => 'More',
			'common.playlistTitle' => 'My Playlist',
			'common.songCount' => '{count} songs',
			'common.lyrics' => 'Lyrics',
			'common.lyricsNotAvailable' => 'No lyrics available',
			'common.quitConfirmTitle' => 'Quit Game?',
			'common.quitConfirmMessage' => 'Your current game will end.',
			'common.continueButton' => 'Continue',
			'common.quitButton' => 'Quit',
			'songs.song1Title' => 'Starlight Drive',
			'songs.song1Artist' => 'The Cosmic Band',
			'songs.song1Lyrics' => 'Driving down the starlit road\nFeeling free, no heavy load\nNeon lights and city dreams\nNothing\'s ever what it seems\n\nRide with me through the night\nEverything will be alright\nStarlight drive, starlight drive\nKeep us feeling so alive',
			'songs.song2Title' => 'Ocean Waves',
			'songs.song2Artist' => 'Blue Horizon',
			'songs.song2Lyrics' => 'The ocean calls my name tonight\nWaves of blue in morning light\nSalt and sea and endless sky\nWatching seagulls as they fly\n\nLet the tide wash away\nAll the worries of the day\nOcean waves, ocean waves\nFind the peace that silence saves',
			_ => null,
		};
	}
}
