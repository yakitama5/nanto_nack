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
	@override String get missionText => 'Xmvqk ktpln fzr wbn qrs';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Cls flscn img rtrn';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Jmp tp inst';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Swch sub acct';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'NnTwt';
	@override String get home => 'Hm';
	@override String get search => 'Srch';
	@override String get notifications => 'Ntfs';
	@override String get profile => 'Prfl';
	@override String get mainAccountName => 'Nn Usr';
	@override String get mainAccountId => '@nn_usr';
	@override String get subAccountName => 'Nn Alt';
	@override String get subAccountId => '@nn_alt';
	@override String get switchAccountLabel => 'Swch Acct';
	@override String get post1UserName => 'Nn Nyn';
	@override String get post1UserId => '@nn_nyn';
	@override String get post1Content => 'Ct pht tdy 🐱';
	@override String get post2UserName => 'Nn Wnk';
	@override String get post2UserId => '@nn_wnk';
	@override String get post2Content => 'Wlk rtnd 🐶';
	@override String get post3UserName => 'Nn Py';
	@override String get post3UserId => '@nn_py';
	@override String get post3Content => 'Py py! Enrgy 🐥';
	@override String get post4UserName => 'Nn Us';
	@override String get post4UserId => '@nn_us';
	@override String get post4Content => 'Crrt tdy 🥕';
	@override String get post5UserName => 'Nn Hm';
	@override String get post5UserId => '@nn_hm';
	@override String get post5Content => 'Whl spng 🐹';
	@override String get post6UserName => 'Nn Km';
	@override String get post6UserId => '@nn_km';
	@override String get post6Content => 'Sn bth 🐢';
	@override String get post7UserName => 'Nn Sk';
	@override String get post7UserId => '@nn_sk';
	@override String get post7Content => 'Tnk cln 🐟';
	@override String get post8UserName => 'Nn Sz';
	@override String get post8UserId => '@nn_sz';
	@override String get post8Content => 'Twt twt 🐦';
	@override String get post9UserName => 'Nn Nk2';
	@override String get post9UserId => '@nn_nk2';
	@override String get post9Content => 'Np tm 😴';
	@override String get post10UserName => 'Nn Km2';
	@override String get post10UserId => '@nn_km2';
	@override String get post10Content => 'Hny crv 🍯';
	@override String get post => 'Pst';
	@override String get cancel => 'Cncl';
	@override String get composeHint => 'Wht\'s hppng?';
	@override late final _TranslationsCommonTrendsXx trends = _TranslationsCommonTrendsXx._(_root);
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wzky blx rmpt?';
	@override String get subtitle => 'Dbl tp = lk';
	@override String get doubleTapTitle => 'Dbl Tp Shrtct';
	@override String get doubleTapDesc => 'Dbl tp on img to lk. No btn needed.';
	@override String get heartTitle => 'Hrt Anmtn';
	@override String get heartDesc => 'Lrg hrt on ctr of img cnfrms.';
	@override String get gestureTitle => 'Unvrsl Gstre';
	@override String get gestureDesc => 'Wrks acrss mny apps.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dwn swp cls?';
	@override String get subtitle => 'Swp dwn = cls';
	@override String get swipeTitle => 'Swp Dwn Cls';
	@override String get swipeDesc => 'Swp dwn on flscn img to cls.';
	@override String get fullscreenTitle => 'Flscn Opn Tp';
	@override String get fullscreenDesc => 'Tp img to opn flscn.';
	@override String get backTitle => 'No X Btn Ndd';
	@override String get backDesc => 'Swp to cls wthout X btn.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fst tp rttn?';
	@override String get subtitle => 'Sttsbr/Hm tp = tp';
	@override String get statusBarTitle => 'Sttsbr Tp';
	@override String get statusBarDesc => 'Tp sttsbr to scrl tp.';
	@override String get homeTabTitle => 'Hm Tb Re-Tp';
	@override String get homeTabDesc => 'Re-tp hm tb to scrl tp.';
	@override String get efficientTitle => 'Jmp Fstr Scrl';
	@override String get efficientDesc => 'Jmp shrtct mch fstr thn scrlng.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lng prs swch?';
	@override String get subtitle => 'Lng prs prfl = swch';
	@override String get searchCommandTitle => 'Lng Prs Prfl';
	@override String get searchCommandDesc => 'Lng prs prfl icn shws acct mnu.';
	@override String get searchTabIconTitle => 'Sub Acct Spr';
	@override String get searchTabIconDesc => 'Sub acct fr hbbs/anon.';
	@override String get autoFocusTitle => 'Mlti Acct Skll';
	@override String get autoFocusDesc => 'Mstr acct swching.';
}

// Path: common.trends
class _TranslationsCommonTrendsXx extends TranslationsCommonTrendsJa {
	_TranslationsCommonTrendsXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get trendingInJapan => 'Trnding in Jpn';
	@override String get technologyTrending => 'Tchnlgy · Trnding';
	@override String get gamingTrending => 'Gmng · Trnding';
	@override String get postsCountSuffix => ' psts';
	@override String get nantoNack => 'Nnto Nck';
	@override String get flutter => 'Flttr';
	@override String get retroGames => 'Rtro Gms';
	@override String get uiUxQuiz => 'UI/UX Qz';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Xmvqk ktpln fzr wbn qrs',
			'quiz1.insight.title' => 'Wzky blx rmpt?',
			'quiz1.insight.subtitle' => 'Dbl tp = lk',
			'quiz1.insight.doubleTapTitle' => 'Dbl Tp Shrtct',
			'quiz1.insight.doubleTapDesc' => 'Dbl tp on img to lk. No btn needed.',
			'quiz1.insight.heartTitle' => 'Hrt Anmtn',
			'quiz1.insight.heartDesc' => 'Lrg hrt on ctr of img cnfrms.',
			'quiz1.insight.gestureTitle' => 'Unvrsl Gstre',
			'quiz1.insight.gestureDesc' => 'Wrks acrss mny apps.',
			'quiz2.missionText' => 'Cls flscn img rtrn',
			'quiz2.insight.title' => 'Dwn swp cls?',
			'quiz2.insight.subtitle' => 'Swp dwn = cls',
			'quiz2.insight.swipeTitle' => 'Swp Dwn Cls',
			'quiz2.insight.swipeDesc' => 'Swp dwn on flscn img to cls.',
			'quiz2.insight.fullscreenTitle' => 'Flscn Opn Tp',
			'quiz2.insight.fullscreenDesc' => 'Tp img to opn flscn.',
			'quiz2.insight.backTitle' => 'No X Btn Ndd',
			'quiz2.insight.backDesc' => 'Swp to cls wthout X btn.',
			'quiz3.missionText' => 'Jmp tp inst',
			'quiz3.insight.title' => 'Fst tp rttn?',
			'quiz3.insight.subtitle' => 'Sttsbr/Hm tp = tp',
			'quiz3.insight.statusBarTitle' => 'Sttsbr Tp',
			'quiz3.insight.statusBarDesc' => 'Tp sttsbr to scrl tp.',
			'quiz3.insight.homeTabTitle' => 'Hm Tb Re-Tp',
			'quiz3.insight.homeTabDesc' => 'Re-tp hm tb to scrl tp.',
			'quiz3.insight.efficientTitle' => 'Jmp Fstr Scrl',
			'quiz3.insight.efficientDesc' => 'Jmp shrtct mch fstr thn scrlng.',
			'quiz4.missionText' => 'Swch sub acct',
			'quiz4.insight.title' => 'Lng prs swch?',
			'quiz4.insight.subtitle' => 'Lng prs prfl = swch',
			'quiz4.insight.searchCommandTitle' => 'Lng Prs Prfl',
			'quiz4.insight.searchCommandDesc' => 'Lng prs prfl icn shws acct mnu.',
			'quiz4.insight.searchTabIconTitle' => 'Sub Acct Spr',
			'quiz4.insight.searchTabIconDesc' => 'Sub acct fr hbbs/anon.',
			'quiz4.insight.autoFocusTitle' => 'Mlti Acct Skll',
			'quiz4.insight.autoFocusDesc' => 'Mstr acct swching.',
			'common.appTitle' => 'NnTwt',
			'common.home' => 'Hm',
			'common.search' => 'Srch',
			'common.notifications' => 'Ntfs',
			'common.profile' => 'Prfl',
			'common.mainAccountName' => 'Nn Usr',
			'common.mainAccountId' => '@nn_usr',
			'common.subAccountName' => 'Nn Alt',
			'common.subAccountId' => '@nn_alt',
			'common.switchAccountLabel' => 'Swch Acct',
			'common.post1UserName' => 'Nn Nyn',
			'common.post1UserId' => '@nn_nyn',
			'common.post1Content' => 'Ct pht tdy 🐱',
			'common.post2UserName' => 'Nn Wnk',
			'common.post2UserId' => '@nn_wnk',
			'common.post2Content' => 'Wlk rtnd 🐶',
			'common.post3UserName' => 'Nn Py',
			'common.post3UserId' => '@nn_py',
			'common.post3Content' => 'Py py! Enrgy 🐥',
			'common.post4UserName' => 'Nn Us',
			'common.post4UserId' => '@nn_us',
			'common.post4Content' => 'Crrt tdy 🥕',
			'common.post5UserName' => 'Nn Hm',
			'common.post5UserId' => '@nn_hm',
			'common.post5Content' => 'Whl spng 🐹',
			'common.post6UserName' => 'Nn Km',
			'common.post6UserId' => '@nn_km',
			'common.post6Content' => 'Sn bth 🐢',
			'common.post7UserName' => 'Nn Sk',
			'common.post7UserId' => '@nn_sk',
			'common.post7Content' => 'Tnk cln 🐟',
			'common.post8UserName' => 'Nn Sz',
			'common.post8UserId' => '@nn_sz',
			'common.post8Content' => 'Twt twt 🐦',
			'common.post9UserName' => 'Nn Nk2',
			'common.post9UserId' => '@nn_nk2',
			'common.post9Content' => 'Np tm 😴',
			'common.post10UserName' => 'Nn Km2',
			'common.post10UserId' => '@nn_km2',
			'common.post10Content' => 'Hny crv 🍯',
			'common.post' => 'Pst',
			'common.cancel' => 'Cncl',
			'common.composeHint' => 'Wht\'s hppng?',
			'common.trends.trendingInJapan' => 'Trnding in Jpn',
			'common.trends.technologyTrending' => 'Tchnlgy · Trnding',
			'common.trends.gamingTrending' => 'Gmng · Trnding',
			'common.trends.postsCountSuffix' => ' psts',
			'common.trends.nantoNack' => 'Nnto Nck',
			'common.trends.flutter' => 'Flttr',
			'common.trends.retroGames' => 'Rtro Gms',
			'common.trends.uiUxQuiz' => 'UI/UX Qz',
			_ => null,
		};
	}
}
