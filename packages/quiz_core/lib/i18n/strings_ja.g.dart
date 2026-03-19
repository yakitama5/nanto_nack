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
class TranslationsJa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppJa app = _TranslationsAppJa._(_root);
	@override late final _TranslationsHomeJa home = _TranslationsHomeJa._(_root);
	@override late final _TranslationsStageJa stage = _TranslationsStageJa._(_root);
	@override late final _TranslationsQuizJa quiz = _TranslationsQuizJa._(_root);
	@override late final _TranslationsPurchaseJa purchase = _TranslationsPurchaseJa._(_root);
	@override late final _TranslationsErrorJa error = _TranslationsErrorJa._(_root);
}

// Path: app
class _TranslationsAppJa implements TranslationsAppEn {
	_TranslationsAppJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'NantoNack';
	@override String get subtitle => 'UI/UX直感クイズ';
}

// Path: home
class _TranslationsHomeJa implements TranslationsHomeEn {
	_TranslationsHomeJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get stageList => 'ステージ一覧';
	@override String get playCount => '{count}回プレイ済み';
}

// Path: stage
class _TranslationsStageJa implements TranslationsStageEn {
	_TranslationsStageJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get cleared => 'クリア済み';
	@override String get available => 'プレイ可能';
	@override String get locked => 'クリア後に解放';
	@override String get play => 'プレイ';
	@override String get clearTime => 'クリアタイム: {time}';
	@override String get score => 'スコア: {score}点';
}

// Path: quiz
class _TranslationsQuizJa implements TranslationsQuizEn {
	_TranslationsQuizJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get correct => '正解！';
	@override String get incorrect => '不正解';
	@override String get timeUp => '時間切れ';
	@override String get result => '結果';
	@override String get retry => 'もう一度';
	@override String get next => '次へ';
	@override String get back => '戻る';
}

// Path: purchase
class _TranslationsPurchaseJa implements TranslationsPurchaseEn {
	_TranslationsPurchaseJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get limitReached => '本日のプレイ上限に達しました';
	@override String get unlockDescription => 'プレミアムにアップグレードすると\n無制限でプレイできます';
	@override String get upgrade => 'アップグレード';
	@override String get later => 'あとで';
}

// Path: error
class _TranslationsErrorJa implements TranslationsErrorEn {
	_TranslationsErrorJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get unknown => 'エラーが発生しました';
	@override String get retry => '再試行';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'NantoNack',
			'app.subtitle' => 'UI/UX直感クイズ',
			'home.stageList' => 'ステージ一覧',
			'home.playCount' => '{count}回プレイ済み',
			'stage.cleared' => 'クリア済み',
			'stage.available' => 'プレイ可能',
			'stage.locked' => 'クリア後に解放',
			'stage.play' => 'プレイ',
			'stage.clearTime' => 'クリアタイム: {time}',
			'stage.score' => 'スコア: {score}点',
			'quiz.correct' => '正解！',
			'quiz.incorrect' => '不正解',
			'quiz.timeUp' => '時間切れ',
			'quiz.result' => '結果',
			'quiz.retry' => 'もう一度',
			'quiz.next' => '次へ',
			'quiz.back' => '戻る',
			'purchase.limitReached' => '本日のプレイ上限に達しました',
			'purchase.unlockDescription' => 'プレミアムにアップグレードすると\n無制限でプレイできます',
			'purchase.upgrade' => 'アップグレード',
			'purchase.later' => 'あとで',
			'error.unknown' => 'エラーが発生しました',
			'error.retry' => '再試行',
			_ => null,
		};
	}
}
