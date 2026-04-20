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
	@override String get missionText => 'Useocxzx zyx Dhi Erica zkwa';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Esnx zyx Ufxkzx Ofsoswkc zkwa zs zyx zso';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Ekfa zyx Oki Fxjz zkwa kw reosf zkjz';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Hjms zyx Ofxokfx Bsf Exxzrjp zkwa zykz gkw kuurmxjzkcci ekfaxm useocxzx';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Zkwaw';
	@override String get completedLabel => 'Useocxzxm';
	@override String get importantLabel => 'Reosf zkjz';
	@override String get noTasks => 'Js zkwaw';
	@override String get addTask => 'Kmm zkwa';
	@override String get importantAction => 'Ekfa kw reosf zkjz';
	@override String get completeAction => 'Ekfa kw useocxzx';
	@override String get uncompleteAction => 'Ekfa kw rjuseocxzx';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ysg mrm ish ajsg zkoorjp zyx uyxuadst sf wgroрjp cxbz gshcm useocxzx zyx zkwa?';
	@override String get subtitle => 'K fshgm uyxuadst rw zyx hjrnxfwkc wrpj bsf msjx';
	@override String get checkTitle => 'Fshgm uyxuadst = zko zs useocxzx';
	@override String get checkDesc => 'Zkoorjp zyx fshgm uyxuadst rj k ZSMS koo ekfaw zyx zkwa kw useocxzx. Eкji koow cрax Erufsrbz Zs Ms kms z rz.';
	@override String get swipeTitle => 'Cxbz-zs-frpyz wgrox = useocxzrsj pxwzhfx';
	@override String get swipeDesc => 'Eкji ZSMS koow kccsg ish zs useocxzx k zkwa di wгrorjp bfse cxbz zs frpyz. Zyrw hwxw zyx wkex mrfxuzrsjkc bxxc kw ekfarjp kj xekrc kw fxkm.';
	@override String get feedbackTitle => 'Nrwhkc bxxmdkua sj useocxzrsj';
	@override String get feedbackDesc => 'Gyxj k zkwa rw useocxzxm, k dchx dkuapfshgm kjm uyxua rusj kooxkf, rjzhrzrnxci useehgruкzrjp zyx exkjrjp sb zyx kuzrsj.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ysg mrm ish ajsg ish ushcm mfkp di csjp ofxwwrjp?';
	@override String get subtitle => 'Csjp ofxww + mfkp rw zyx hjrnxfwkc pxwzhfx bsf fxsfmxfrjp';
	@override String get longPressTitle => 'Csjp ofxww = pfkd wrpjkc';
	@override String get longPressDesc => 'Csjp ofxwwrjp k crwz rzxe zfrppxfw fxsfmxf esmx gрzy k ykorzu bxxmdkua. Zyrw rw k wzkjmkfm rjzxfkuzrsj sj dszy Kjmfsrm kjm rOW.';
	@override String get dragTitle => 'Mfkp kjm mfso zs uykjpx ofrsfrzи';
	@override String get dragDesc => 'Rj ZSMS koow, zkwaw yrpyxf rj zyx crwz sbzxj yknx yrpyxf ofrsfrzи. Mfkppрjp zs zyx zso wxzw zyx yrpyxwz ofrsfrzи zkwa.';
	@override String get handleTitle => 'Mfkp ykjmcx rusj wrpjkc';
	@override String get handleDesc => 'Zyfxx-crjx sf mszzxm rusjs rjmruкzx zykz kj rzxe ukj dx mfkppxm. Zyrw rw k hjrnxfwkc HR wiedsc bsf mfkppkdcx rzxew.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ysg mrm ish ajsg wgrорjp cxbz gshcm cxz ish ekfa rz kw reosf zkjz?';
	@override String get subtitle => 'Frpyz-zs-cxbz wgrox rw k wrpj sb kmmrzrsjkc kuzrsjw';
	@override String get swipeTitle => 'Frpyz-zs-cxbz wgrox = fxnxkcw yrmmsj kuzrsjw';
	@override String get swipeDesc => 'Rj ekrc kjm ZSMS koow, wрorjp bfse frpyz zs cxbz fxнxkcw kmmrzрsjkc kuzrsjw cрax mxcxzx, kfuyrнx, sf ekfa kw reosf zkjz.';
	@override String get starTitle => 'Wzkf ekfa = reosf zkjz zkwa wrpjkc';
	@override String get starDesc => 'Zyx wzkf rusj rw k useesj wiedsc bsf bknsfrzx sf reosf zkjz rj koow gsfcmгrmx. Rj ZSMS koow rz rw sbzxj hwxm zs esnx zkwaw zs Zsmki.';
	@override String get priorityTitle => 'Reofsnx bsuhw grzy reosf zkjz zkwaw';
	@override String get priorityDesc => 'Ofrsfrzrqrjp zkwaw yxcow ish bsuhw sj gykz zfhci jxxmw zs dx msjx. Hwx zyx reosf zkjz ekfa zs wzkjm shz kjm knorm erwwrjp zyxe.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ysg mrm ish ajsg ish ushcm hjms bfse zyx useocxzxm crwz?';
	@override String get subtitle => 'Zyx useocxzxm crwz rw kj kfuyrнx gyxfx ish ukj hjms kuzrsjw';
	@override String get accordionTitle => 'Uscckоwrdcx crwz = kuusfmrsj HR';
	@override String get accordionDesc => 'Zkооrjp zyx Useocxzxm Yxkmxf xtоkjmw zyx crwz sb useocxzxm zkwaw. Zyrw rw k ziox sb kuusfmrsj HR useesj rj xekrc bssmxfw kjm BKTw.';
	@override String get undoTitle => 'Hjms useocxzrsj zs brt erwzkaxw';
	@override String get undoDesc => 'Hjuyxuarjp k useocxzxm zkwa fxzhfjw rz zs rjuseocxzx wzkzhw. Mxwrpjw zykz kccsg xkwi usffxuzrsj sb erwzkaxw kfx bhjmkexjzkc zs esmxfj koow.';
	@override String get checkTitle => 'Esnrjp bfse useocxzxm dkua zs rjuseocxzx';
	@override String get checkDesc => 'Soxj zyx useocxzxm crwz kjm zko zyx uyxuaekfa sf wgrox cxbz zs fxwzsfx zyx zkwa zs rjuseocxzx wzkzhw.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Useocxzx zyx Dhi Erica zkwa',
			'quiz1.insight.title' => 'Ysg mrm ish ajsg zkoorjp zyx uyxuadst sf wgroрjp cxbz gshcm useocxzx zyx zkwa?',
			'quiz1.insight.subtitle' => 'K fshgm uyxuadst rw zyx hjrnxfwkc wrpj bsf msjx',
			'quiz1.insight.checkTitle' => 'Fshgm uyxuadst = zko zs useocxzx',
			'quiz1.insight.checkDesc' => 'Zkoorjp zyx fshgm uyxuadst rj k ZSMS koo ekfaw zyx zkwa kw useocxzx. Eкji koow cрax Erufsrbz Zs Ms kms z rz.',
			'quiz1.insight.swipeTitle' => 'Cxbz-zs-frpyz wgrox = useocxzrsj pxwzhfx',
			'quiz1.insight.swipeDesc' => 'Eкji ZSMS koow kccsg ish zs useocxzx k zkwa di wгrorjp bfse cxbz zs frpyz. Zyrw hwxw zyx wkex mrfxuzrsjkc bxxc kw ekfarjp kj xekrc kw fxkm.',
			'quiz1.insight.feedbackTitle' => 'Nrwhkc bxxmdkua sj useocxzrsj',
			'quiz1.insight.feedbackDesc' => 'Gyxj k zkwa rw useocxzxm, k dchx dkuapfshgm kjm uyxua rusj kooxkf, rjzhrzrnxci useehgruкzrjp zyx exkjrjp sb zyx kuzrsj.',
			'quiz2.missionText' => 'Esnx zyx Ufxkzx Ofsoswkc zkwa zs zyx zso',
			'quiz2.insight.title' => 'Ysg mrm ish ajsg ish ushcm mfkp di csjp ofxwwrjp?',
			'quiz2.insight.subtitle' => 'Csjp ofxww + mfkp rw zyx hjrnxfwkc pxwzhfx bsf fxsfmxfrjp',
			'quiz2.insight.longPressTitle' => 'Csjp ofxww = pfkd wrpjkc',
			'quiz2.insight.longPressDesc' => 'Csjp ofxwwrjp k crwz rzxe zfrppxfw fxsfmxf esmx gрzy k ykorzu bxxmdkua. Zyrw rw k wzkjmkfm rjzxfkuzrsj sj dszy Kjmfsrm kjm rOW.',
			'quiz2.insight.dragTitle' => 'Mfkp kjm mfso zs uykjpx ofrsfrzи',
			'quiz2.insight.dragDesc' => 'Rj ZSMS koow, zkwaw yrpyxf rj zyx crwz sbzxj yknx yrpyxf ofrsfrzи. Mfkppрjp zs zyx zso wxzw zyx yrpyxwz ofrsfrzи zkwa.',
			'quiz2.insight.handleTitle' => 'Mfkp ykjmcx rusj wrpjkc',
			'quiz2.insight.handleDesc' => 'Zyfxx-crjx sf mszzxm rusjs rjmruкzx zykz kj rzxe ukj dx mfkppxm. Zyrw rw k hjrnxfwkc HR wiedsc bsf mfkppkdcx rzxew.',
			'quiz3.missionText' => 'Ekfa zyx Oki Fxjz zkwa kw reosf zkjz',
			'quiz3.insight.title' => 'Ysg mrm ish ajsg wgrорjp cxbz gshcm cxz ish ekfa rz kw reosf zkjz?',
			'quiz3.insight.subtitle' => 'Frpyz-zs-cxbz wgrox rw k wrpj sb kmmrzrsjkc kuzrsjw',
			'quiz3.insight.swipeTitle' => 'Frpyz-zs-cxbz wgrox = fxnxkcw yrmmsj kuzrsjw',
			'quiz3.insight.swipeDesc' => 'Rj ekrc kjm ZSMS koow, wрorjp bfse frpyz zs cxbz fxнxkcw kmmrzрsjkc kuzrsjw cрax mxcxzx, kfuyrнx, sf ekfa kw reosf zkjz.',
			'quiz3.insight.starTitle' => 'Wzkf ekfa = reosf zkjz zkwa wrpjkc',
			'quiz3.insight.starDesc' => 'Zyx wzkf rusj rw k useesj wiedsc bsf bknsfrzx sf reosf zkjz rj koow gsfcmгrmx. Rj ZSMS koow rz rw sbzxj hwxm zs esnx zkwaw zs Zsmki.',
			'quiz3.insight.priorityTitle' => 'Reofsnx bsuhw grzy reosf zkjz zkwaw',
			'quiz3.insight.priorityDesc' => 'Ofrsfrzrqrjp zkwaw yxcow ish bsuhw sj gykz zfhci jxxmw zs dx msjx. Hwx zyx reosf zkjz ekfa zs wzkjm shz kjm knorm erwwrjp zyxe.',
			'quiz4.missionText' => 'Hjms zyx Ofxokfx Bsf Exxzrjp zkwa zykz gkw kuurmxjzkcci ekfaxm useocxzx',
			'quiz4.insight.title' => 'Ysg mrm ish ajsg ish ushcm hjms bfse zyx useocxzxm crwz?',
			'quiz4.insight.subtitle' => 'Zyx useocxzxm crwz rw kj kfuyrнx gyxfx ish ukj hjms kuzrsjw',
			'quiz4.insight.accordionTitle' => 'Uscckоwrdcx crwz = kuusfmrsj HR',
			'quiz4.insight.accordionDesc' => 'Zkооrjp zyx Useocxzxm Yxkmxf xtоkjmw zyx crwz sb useocxzxm zkwaw. Zyrw rw k ziox sb kuusfmrsj HR useesj rj xekrc bssmxfw kjm BKTw.',
			'quiz4.insight.undoTitle' => 'Hjms useocxzrsj zs brt erwzkaxw',
			'quiz4.insight.undoDesc' => 'Hjuyxuarjp k useocxzxm zkwa fxzhfjw rz zs rjuseocxzx wzkzhw. Mxwrpjw zykz kccsg xkwi usffxuzrsj sb erwzkaxw kfx bhjmkexjzkc zs esmxfj koow.',
			'quiz4.insight.checkTitle' => 'Esnrjp bfse useocxzxm dkua zs rjuseocxzx',
			'quiz4.insight.checkDesc' => 'Soxj zyx useocxzxm crwz kjm zko zyx uyxuaekfa sf wgrox cxbz zs fxwzsfx zyx zkwa zs rjuseocxzx wzkzhw.',
			'common.appTitle' => 'Zkwaw',
			'common.completedLabel' => 'Useocxzxm',
			'common.importantLabel' => 'Reosf zkjz',
			'common.noTasks' => 'Js zkwaw',
			'common.addTask' => 'Kmm zkwa',
			'common.importantAction' => 'Ekfa kw reosf zkjz',
			'common.completeAction' => 'Ekfa kw useocxzx',
			'common.uncompleteAction' => 'Ekfa kw rjuseocxzx',
			_ => null,
		};
	}
}
