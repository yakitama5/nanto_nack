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
	@override String get missionText => 'Bshjm wsexsjx pfxkz! Zfi wxjmrjp k \'Crax\'';
	@override late final _TranslationsQuiz1InsightXx insight = _TranslationsQuiz1InsightXx._(_root);
}

// Path: quiz2
class _TranslationsQuiz2Xx extends TranslationsQuiz2Ja {
	_TranslationsQuiz2Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Jsz lhrzx ishf zioх... waро kjm wxx zyx jxtz oxfwsj';
	@override late final _TranslationsQuiz2InsightXx insight = _TranslationsQuiz2InsightXx._(_root);
}

// Path: quiz3
class _TranslationsQuiz3Xx extends TranslationsQuiz3Ja {
	_TranslationsQuiz3Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'R gsjmxf rb zyrw oxfwsj ykw szyxf oyszswq Cxzʼw cssа kz zyx wxusjm oyszs';
	@override late final _TranslationsQuiz3InsightXx insight = _TranslationsQuiz3InsightXx._(_root);
}

// Path: quiz4
class _TranslationsQuiz4Xx extends TranslationsQuiz4Ja {
	_TranslationsQuiz4Xx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get missionText => 'Zyrw rw mxwzrji!! Ekax k wzfsjp reofxwwrsj grzy k wxoхrкc \'Whoef Crax\'';
	@override late final _TranslationsQuiz4InsightXx insight = _TranslationsQuiz4InsightXx._(_root);
}

// Path: common
class _TranslationsCommonXx extends TranslationsCommonJa {
	_TranslationsCommonXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Ekzuyrjp';
	@override String get like => 'CRAX';
	@override String get nope => 'JSOX';
	@override String get superLike => 'WHOEF';
	@override String get noMoreProfiles => 'Js esfx ofsbrcxw';
	@override String get profilesLabel => 'Oxsocx jxkf ish';
}

// Path: quiz1.insight
class _TranslationsQuiz1InsightXx extends TranslationsQuiz1InsightJa {
	_TranslationsQuiz1InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ysg mrm ish ajsg k frpyz wgrox exkjw \'Crax\'?';
	@override String get subtitle => 'Frpyz wgrox rw zyx gsfcm wzkjmkfm pxwzhfx bsf IXW/koofsnkc';
	@override String get swipeTitle => 'Frpyz wgrox = CRAX (gsfcm wzkjmkfm)';
	@override String get swipeDesc => 'Zrjmxf ufxkzxm zyx \'frpyz bsf crax, cxbz bsf waroʼ wgrox HR rj πηγπ. Jsg rz rw zyx wzkjmkfm rjzxfkuzrsj kmsozxm di ekzuyrjp koow gsfcmgrmx.';
	@override String get heartTitle => 'Zyx yxkfz dhzzsj ykw zyx wkex xbbxuz';
	@override String get heartDesc => 'Zkoorjp zyx yxkfz rusj dhzzsj kz zyx dszzsе sb zyx wufxxj zfrppxfw zyx wkex \'Crax\' kuzrsj. Rz rw mxwrpjxm kw kj kczxfjkzrnx HR zs wgrорjp.';
	@override String get feedbackTitle => 'Reexmrkzx bxxmdkua ufxkzxw uckfrzi';
	@override String get feedbackDesc => 'Zyx kjrekzrsj sb zyx ukfm bcirjp zs zyx frpyz rjzhrzrnxci usjnxiw zyx fxwhcz sb zyx kuzrsj. Nrwhkc bxxmdkua kccsgw hwxfw zs kuz grzyshz yxwrzkzrsj.';
}

// Path: quiz2.insight
class _TranslationsQuiz2InsightXx extends TranslationsQuiz2InsightJa {
	_TranslationsQuiz2InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ysg mrm ish ajsg k cxbz wgrox exkjw \'Waро\'?';
	@override String get subtitle => 'Cxbz wgrox rw zyx soosrjp pxwzhfx bsf JS/fxvxuzrsj';
	@override String get swipeTitle => 'Cxbz wgrox = JSOX (gsfcm wzkjmkfm)';
	@override String get swipeDesc => 'Rb frpyz rw IXW, cxbz rw JS. Zyrw wиeexzfrukc mxwrpj ufxkzxw rjzhrzrsj. Zyx wkex fhcx rw hwxm rj kji koo grzy k ukfm-dkwxm HR, jsz vhwz ekzuyrjp koow.';
	@override String get xTitle => 'Zyx T dhzzsj ykw zyx wkex xbbxuz';
	@override String get xDesc => 'Zyx T (ufsww) dhzzsj kz zyx dszzsе cxbz exkjw \'waро\'. Rz cxnxfkpxw zyx hjrnxfwkc rusj ckjphkpx gyxfx \'T = fxvxuz/ukjuxc\'.';
	@override String get gestureTitle => 'Pxwzhfx wиeexzfi eкaxw HTW wreoсх';
	@override String get gestureDesc => 'Zyx usjwrwzxjz fhcx sb \'frpyz = SA, cxbz = JP\' kccsgw hwxfw zs wzkfz hwrjp k jxg koo grzyshz xtockjkzrsj. K mxwrpj oyrcswsoyi zykz fxmhuxw cxkfjrjp uswz zs qxfs.';
}

// Path: quiz3.insight
class _TranslationsQuiz3InsightXx extends TranslationsQuiz3InsightJa {
	_TranslationsQuiz3InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ysg mrm ish ajsg k zko gshcm wgrzuy zs zyx jxtz oyszs?';
	@override String get subtitle => 'Zkoorjp zs kmnkjux oyszs rw k wzkjmkfm wekfzоysj dfsgwrjp soxfkzrsj';
	@override String get tapTitle => 'Zko frpyz = jxtz oyszs, zko cxbz = ofxnrshw oyszs';
	@override String get tapDesc => 'Zkoorjp zyx frpyz ykcb sb zyx ofsbrcх ukfm kmnkjuxw zs zyx jxtz oyszs; zkoorjp zyx cxbz ykcb pзxw dkua. Zyx wkex rjzhrzrnx soxfkzrsj kw Rjwzkpfke Wzsfрxw.';
	@override String get indicatorTitle => 'Zyx dkfw kz zyx zso kfx oyszs ushjz rjmrukzsfw';
	@override String get indicatorDesc => 'Zyx wysfz dkfw kz zyx zso sb zyx ukfm wysg zyx zszkc jhеdxf sb oyszow kjm gyruу sjx rw uhffxjzci mrwockixm. Zyx dfrpyz dкf rjmrukzxw zyx uhffxjz oswrzrsj.';
	@override String get multiPhotoTitle => 'Ehczrocх oyszow dxzzxf usjnxi oxfwsjkcrzi';
	@override String get multiPhotoDesc => 'Rj ekзuyrjp koow, yknrjp ehczrocх oyszow nrxgxm usjnxiw oxfwsjkcrzi kjm kзeswoyxfx dxzzxf zykj vhwz sjx. Zyx jhedxf sb oyszow rw kj reosфzkjz bkuzсf rj wxcxuzrsj.';
}

// Path: quiz4.insight
class _TranslationsQuiz4InsightXx extends TranslationsQuiz4InsightJa {
	_TranslationsQuiz4InsightXx._(TranslationsXx root) : this._root = root, super.internal(root);

	final TranslationsXx _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ysg mrm ish ajsg kj hoгkfm wgrox exkjw \'Whoef Crax\'?';
	@override String get subtitle => 'Hoгkfm wgrox rw zyx rjzhrzrnx pxwzhfx bsf k woxurкc kuzrsj';
	@override String get superTitle => 'Hoгkfm wgrox = Whoef Crax';
	@override String get superDesc => 'Zyx hoгkfm wgrox kmmxm di Zrjmxf rw k mrbbxfxjzrkzrjp kuzrsj zykz wysgw \'woxurкc rjzxfxwz\'. Rz wzkjmw shz kw k zyrfm sozrsj dxisjm zyx frpyz/cxbz drjkfi uysrux.';
	@override String get starTitle => 'Zyx wzкf dhzzsj kcws zfrppxfw Whoef Crax';
	@override String get starDesc => 'Zkoorjp zyx wzкf dhzzsj kz zyx dszzsе sb zyx wufxxj zfrppxfw zyx wкex Whoef Crax. Zyrw kccsgw fxcrkdcx soxfkzrsj xnxj rj wrzхkzrsjw gyxfx wgrорjp rw mrbbрuхcz.';
	@override String get specialTitle => 'Wukfurzi rjufxkwxw kооxкc';
	@override String get specialDesc => 'Whoef Crax jsзrbrxw zyx szyxf oxfwsj esfx wzfsjpci zykj k fxpхckf crax, wкrm zs rjufxkwx ekzuy fкzx. K mxwrpj zykz cxnxfkpxw zyx owиuyscspи zykz nкchх rjufxkwxw zyx esfx crerzxm wсexzyrjp rw.';
}

/// The flat map containing all translations for locale <xx>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsXx {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'quiz1.missionText' => 'Bshjm wsexsjx pfxkz! Zfi wxjmrjp k \'Crax\'',
			'quiz1.insight.title' => 'Ysg mrm ish ajsg k frpyz wgrox exkjw \'Crax\'?',
			'quiz1.insight.subtitle' => 'Frpyz wgrox rw zyx gsfcm wzkjmkfm pxwzhfx bsf IXW/koofsnkc',
			'quiz1.insight.swipeTitle' => 'Frpyz wgrox = CRAX (gsfcm wzkjmkfm)',
			'quiz1.insight.swipeDesc' => 'Zrjmxf ufxkzxm zyx \'frpyz bsf crax, cxbz bsf waroʼ wgrox HR rj πηγπ. Jsg rz rw zyx wzkjmkfm rjzxfkuzrsj kmsozxm di ekzuyrjp koow gsfcmgrmx.',
			'quiz1.insight.heartTitle' => 'Zyx yxkfz dhzzsj ykw zyx wkex xbbxuz',
			'quiz1.insight.heartDesc' => 'Zkoorjp zyx yxkfz rusj dhzzsj kz zyx dszzsе sb zyx wufxxj zfrppxfw zyx wkex \'Crax\' kuzrsj. Rz rw mxwrpjxm kw kj kczxfjkzrnx HR zs wgrорjp.',
			'quiz1.insight.feedbackTitle' => 'Reexmrkzx bxxmdkua ufxkzxw uckfrzi',
			'quiz1.insight.feedbackDesc' => 'Zyx kjrekzrsj sb zyx ukfm bcirjp zs zyx frpyz rjzhrzrnxci usjnxiw zyx fxwhcz sb zyx kuzrsj. Nrwhkc bxxmdkua kccsgw hwxfw zs kuz grzyshz yxwrzkzrsj.',
			'quiz2.missionText' => 'Jsz lhrzx ishf zioх... waро kjm wxx zyx jxtz oxfwsj',
			'quiz2.insight.title' => 'Ysg mrm ish ajsg k cxbz wgrox exkjw \'Waро\'?',
			'quiz2.insight.subtitle' => 'Cxbz wgrox rw zyx soosrjp pxwzhfx bsf JS/fxvxuzrsj',
			'quiz2.insight.swipeTitle' => 'Cxbz wgrox = JSOX (gsfcm wzkjmkfm)',
			'quiz2.insight.swipeDesc' => 'Rb frpyz rw IXW, cxbz rw JS. Zyrw wиeexzfrukc mxwrpj ufxkzxw rjzhrzrsj. Zyx wkex fhcx rw hwxm rj kji koo grzy k ukfm-dkwxm HR, jsz vhwz ekzuyrjp koow.',
			'quiz2.insight.xTitle' => 'Zyx T dhzzsj ykw zyx wkex xbbxuz',
			'quiz2.insight.xDesc' => 'Zyx T (ufsww) dhzzsj kz zyx dszzsе cxbz exkjw \'waро\'. Rz cxnxfkpxw zyx hjrnxfwkc rusj ckjphkpx gyxfx \'T = fxvxuz/ukjuxc\'.',
			'quiz2.insight.gestureTitle' => 'Pxwzhfx wиeexzfi eкaxw HTW wreoсх',
			'quiz2.insight.gestureDesc' => 'Zyx usjwrwzxjz fhcx sb \'frpyz = SA, cxbz = JP\' kccsgw hwxfw zs wzkfz hwrjp k jxg koo grzyshz xtockjkzrsj. K mxwrpj oyrcswsoyi zykz fxmhuxw cxkfjrjp uswz zs qxfs.',
			'quiz3.missionText' => 'R gsjmxf rb zyrw oxfwsj ykw szyxf oyszswq Cxzʼw cssа kz zyx wxusjm oyszs',
			'quiz3.insight.title' => 'Ysg mrm ish ajsg k zko gshcm wgrzuy zs zyx jxtz oyszs?',
			'quiz3.insight.subtitle' => 'Zkoorjp zs kmnkjux oyszs rw k wzkjmkfm wekfzоysj dfsgwrjp soxfkzrsj',
			'quiz3.insight.tapTitle' => 'Zko frpyz = jxtz oyszs, zko cxbz = ofxnrshw oyszs',
			'quiz3.insight.tapDesc' => 'Zkoorjp zyx frpyz ykcb sb zyx ofsbrcх ukfm kmnkjuxw zs zyx jxtz oyszs; zkoorjp zyx cxbz ykcb pзxw dkua. Zyx wkex rjzhrzrnx soxfkzrsj kw Rjwzkpfke Wzsfрxw.',
			'quiz3.insight.indicatorTitle' => 'Zyx dkfw kz zyx zso kfx oyszs ushjz rjmrukzsfw',
			'quiz3.insight.indicatorDesc' => 'Zyx wysfz dkfw kz zyx zso sb zyx ukfm wysg zyx zszkc jhеdxf sb oyszow kjm gyruу sjx rw uhffxjzci mrwockixm. Zyx dfrpyz dкf rjmrukzxw zyx uhffxjz oswrzrsj.',
			'quiz3.insight.multiPhotoTitle' => 'Ehczrocх oyszow dxzzxf usjnxi oxfwsjkcrzi',
			'quiz3.insight.multiPhotoDesc' => 'Rj ekзuyrjp koow, yknrjp ehczrocх oyszow nrxgxm usjnxiw oxfwsjkcrzi kjm kзeswoyxfx dxzzxf zykj vhwz sjx. Zyx jhedxf sb oyszow rw kj reosфzkjz bkuzсf rj wxcxuzrsj.',
			'quiz4.missionText' => 'Zyrw rw mxwzrji!! Ekax k wzfsjp reofxwwrsj grzy k wxoхrкc \'Whoef Crax\'',
			'quiz4.insight.title' => 'Ysg mrm ish ajsg kj hoгkfm wgrox exkjw \'Whoef Crax\'?',
			'quiz4.insight.subtitle' => 'Hoгkfm wgrox rw zyx rjzhrzrnx pxwzhfx bsf k woxurкc kuzrsj',
			'quiz4.insight.superTitle' => 'Hoгkfm wgrox = Whoef Crax',
			'quiz4.insight.superDesc' => 'Zyx hoгkfm wgrox kmmxm di Zrjmxf rw k mrbbxfxjzrkzrjp kuzrsj zykz wysgw \'woxurкc rjzxfxwz\'. Rz wzkjmw shz kw k zyrfm sozrsj dxisjm zyx frpyz/cxbz drjkfi uysrux.',
			'quiz4.insight.starTitle' => 'Zyx wzкf dhzzsj kcws zfrppxfw Whoef Crax',
			'quiz4.insight.starDesc' => 'Zkoorjp zyx wzкf dhzzsj kz zyx dszzsе sb zyx wufxxj zfrppxfw zyx wкex Whoef Crax. Zyrw kccsgw fxcrkdcx soxfkzrsj xnxj rj wrzхkzrsjw gyxfx wgrорjp rw mrbbрuхcz.',
			'quiz4.insight.specialTitle' => 'Wukfurzi rjufxkwxw kооxкc',
			'quiz4.insight.specialDesc' => 'Whoef Crax jsзrbrxw zyx szyxf oxfwsj esfx wzfsjpci zykj k fxpхckf crax, wкrm zs rjufxkwx ekzuy fкzx. K mxwrpj zykz cxnxfkpxw zyx owиuyscspи zykz nкchх rjufxkwxw zyx esfx crerzxm wсexzyrjp rw.',
			'common.appTitle' => 'Ekzuyrjp',
			'common.like' => 'CRAX',
			'common.nope' => 'JSOX',
			'common.superLike' => 'WHOEF',
			'common.noMoreProfiles' => 'Js esfx ofsbrcxw',
			'common.profilesLabel' => 'Oxsocx jxkf ish',
			_ => null,
		};
	}
}
