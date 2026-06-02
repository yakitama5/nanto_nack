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
}

// Path: quiz1
class _TranslationsQuiz1Xx extends TranslationsQuiz1Ja {
	_TranslationsQuiz1Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'How did the prices move yesterday? Try swiping the chart to go back in time';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Zoom out to see the full chart';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Long press to see the exact price at the peak';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Switch to the weekly chart';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Stock Chart';
	@override String get tickerSymbol => 'MOCK';
	@override String get periodOneDay => '1D';
	@override String get periodOneWeek => '1W';
	@override String get periodOneMonth => '1M';
	@override String get periodOneYear => '1Y';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did panning reveal the past?';
	@override String get subtitle => 'Left is past, right is present';
	@override String get panTitle => 'Swipe to move through time';
	@override String get panDesc => 'Drag the chart to browse time periods.';
	@override String get leftTitle => 'Left equals past';
	@override String get leftDesc => 'Left side is older data, right side is newest.';
	@override String get viewTitle => 'Scroll to reveal hidden data';
	@override String get viewDesc => 'Swipe right to see older data.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'How did pinch-in zoom out?';
	@override String get subtitle => 'Two fingers closing equals zoom out';
	@override String get pinchTitle => 'Pinch-in zooms out';
	@override String get pinchDesc => 'Close two fingers to zoom out.';
	@override String get zoomTitle => 'Zoom out to see big picture';
	@override String get zoomDesc => 'Zooming out shows trends.';
	@override String get overviewTitle => 'Find optimal view';
	@override String get overviewDesc => 'Pinch in or out for different views.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Long press reveals price';
	@override String get subtitle => 'Crosshair shows exact prices';
	@override String get crosshairTitle => 'Touch shows crosshair';
	@override String get crosshairDesc => 'Long press shows crosshair and price.';
	@override String get tooltipTitle => 'Tooltip shows exact price';
	@override String get tooltipDesc => 'Crosshair tooltip shows precise price.';
	@override String get longpressTitle => 'Long press for precision mode';
	@override String get longpressDesc => 'Long press signals intent to investigate.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chip tapping changes period';
	@override String get subtitle => '1D 1W 1M chips are universal UI';
	@override String get chipTitle => 'Chips switch time period';
	@override String get chipDesc => '1D 1W 1M 1Y chips used worldwide.';
	@override String get periodTitle => 'Period changes view resolution';
	@override String get periodDesc => 'Different periods show different details.';
	@override String get activeTitle => 'Active chip shows current period';
	@override String get activeDesc => 'Highlighted chip shows current view.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'How did the prices move yesterday? Try swiping the chart to go back in time',
			'quiz1.insight.title' => 'How did panning reveal the past?',
			'quiz1.insight.subtitle' => 'Left is past, right is present',
			'quiz1.insight.panTitle' => 'Swipe to move through time',
			'quiz1.insight.panDesc' => 'Drag the chart to browse time periods.',
			'quiz1.insight.leftTitle' => 'Left equals past',
			'quiz1.insight.leftDesc' => 'Left side is older data, right side is newest.',
			'quiz1.insight.viewTitle' => 'Scroll to reveal hidden data',
			'quiz1.insight.viewDesc' => 'Swipe right to see older data.',
			'quiz2.missionText' => 'Zoom out to see the full chart',
			'quiz2.insight.title' => 'How did pinch-in zoom out?',
			'quiz2.insight.subtitle' => 'Two fingers closing equals zoom out',
			'quiz2.insight.pinchTitle' => 'Pinch-in zooms out',
			'quiz2.insight.pinchDesc' => 'Close two fingers to zoom out.',
			'quiz2.insight.zoomTitle' => 'Zoom out to see big picture',
			'quiz2.insight.zoomDesc' => 'Zooming out shows trends.',
			'quiz2.insight.overviewTitle' => 'Find optimal view',
			'quiz2.insight.overviewDesc' => 'Pinch in or out for different views.',
			'quiz3.missionText' => 'Long press to see the exact price at the peak',
			'quiz3.insight.title' => 'Long press reveals price',
			'quiz3.insight.subtitle' => 'Crosshair shows exact prices',
			'quiz3.insight.crosshairTitle' => 'Touch shows crosshair',
			'quiz3.insight.crosshairDesc' => 'Long press shows crosshair and price.',
			'quiz3.insight.tooltipTitle' => 'Tooltip shows exact price',
			'quiz3.insight.tooltipDesc' => 'Crosshair tooltip shows precise price.',
			'quiz3.insight.longpressTitle' => 'Long press for precision mode',
			'quiz3.insight.longpressDesc' => 'Long press signals intent to investigate.',
			'quiz4.missionText' => 'Switch to the weekly chart',
			'quiz4.insight.title' => 'Chip tapping changes period',
			'quiz4.insight.subtitle' => '1D 1W 1M chips are universal UI',
			'quiz4.insight.chipTitle' => 'Chips switch time period',
			'quiz4.insight.chipDesc' => '1D 1W 1M 1Y chips used worldwide.',
			'quiz4.insight.periodTitle' => 'Period changes view resolution',
			'quiz4.insight.periodDesc' => 'Different periods show different details.',
			'quiz4.insight.activeTitle' => 'Active chip shows current period',
			'quiz4.insight.activeDesc' => 'Highlighted chip shows current view.',
			'common.appTitle' => 'Stock Chart',
			'common.tickerSymbol' => 'MOCK',
			'common.periodOneDay' => '1D',
			'common.periodOneWeek' => '1W',
			'common.periodOneMonth' => '1M',
			'common.periodOneYear' => '1Y',
			_ => null,
		};
	}
}
