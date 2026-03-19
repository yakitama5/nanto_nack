// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $QuizResultsTable extends QuizResults
    with TableInfo<$QuizResultsTable, QuizResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _quizIdMeta = const VerificationMeta('quizId');
  @override
  late final GeneratedColumn<String> quizId = GeneratedColumn<String>(
    'quiz_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isClearedMeta = const VerificationMeta(
    'isCleared',
  );
  @override
  late final GeneratedColumn<bool> isCleared = GeneratedColumn<bool>(
    'is_cleared',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_cleared" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _clearTimeMsMeta = const VerificationMeta(
    'clearTimeMs',
  );
  @override
  late final GeneratedColumn<int> clearTimeMs = GeneratedColumn<int>(
    'clear_time_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _failureCountMeta = const VerificationMeta(
    'failureCount',
  );
  @override
  late final GeneratedColumn<int> failureCount = GeneratedColumn<int>(
    'failure_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastPlayedAtMeta = const VerificationMeta(
    'lastPlayedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastPlayedAt = GeneratedColumn<DateTime>(
    'last_played_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    quizId,
    isCleared,
    clearTimeMs,
    score,
    failureCount,
    lastPlayedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quiz_results';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuizResult> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('quiz_id')) {
      context.handle(
        _quizIdMeta,
        quizId.isAcceptableOrUnknown(data['quiz_id']!, _quizIdMeta),
      );
    } else if (isInserting) {
      context.missing(_quizIdMeta);
    }
    if (data.containsKey('is_cleared')) {
      context.handle(
        _isClearedMeta,
        isCleared.isAcceptableOrUnknown(data['is_cleared']!, _isClearedMeta),
      );
    }
    if (data.containsKey('clear_time_ms')) {
      context.handle(
        _clearTimeMsMeta,
        clearTimeMs.isAcceptableOrUnknown(
          data['clear_time_ms']!,
          _clearTimeMsMeta,
        ),
      );
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    }
    if (data.containsKey('failure_count')) {
      context.handle(
        _failureCountMeta,
        failureCount.isAcceptableOrUnknown(
          data['failure_count']!,
          _failureCountMeta,
        ),
      );
    }
    if (data.containsKey('last_played_at')) {
      context.handle(
        _lastPlayedAtMeta,
        lastPlayedAt.isAcceptableOrUnknown(
          data['last_played_at']!,
          _lastPlayedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {quizId};
  @override
  QuizResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizResult(
      quizId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quiz_id'],
      )!,
      isCleared: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_cleared'],
      )!,
      clearTimeMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}clear_time_ms'],
      ),
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      failureCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}failure_count'],
      )!,
      lastPlayedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_played_at'],
      ),
    );
  }

  @override
  $QuizResultsTable createAlias(String alias) {
    return $QuizResultsTable(attachedDatabase, alias);
  }
}

class QuizResult extends DataClass implements Insertable<QuizResult> {
  /// クイズID (例: 'shopping_water')
  final String quizId;

  /// クリア済みかどうか
  final bool isCleared;

  /// クリア時間 (ミリ秒)
  final int? clearTimeMs;

  /// スコア
  final int score;

  /// 失敗回数
  final int failureCount;

  /// 最終プレイ日時
  final DateTime? lastPlayedAt;
  const QuizResult({
    required this.quizId,
    required this.isCleared,
    this.clearTimeMs,
    required this.score,
    required this.failureCount,
    this.lastPlayedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['quiz_id'] = Variable<String>(quizId);
    map['is_cleared'] = Variable<bool>(isCleared);
    if (!nullToAbsent || clearTimeMs != null) {
      map['clear_time_ms'] = Variable<int>(clearTimeMs);
    }
    map['score'] = Variable<int>(score);
    map['failure_count'] = Variable<int>(failureCount);
    if (!nullToAbsent || lastPlayedAt != null) {
      map['last_played_at'] = Variable<DateTime>(lastPlayedAt);
    }
    return map;
  }

  QuizResultsCompanion toCompanion(bool nullToAbsent) {
    return QuizResultsCompanion(
      quizId: Value(quizId),
      isCleared: Value(isCleared),
      clearTimeMs: clearTimeMs == null && nullToAbsent
          ? const Value.absent()
          : Value(clearTimeMs),
      score: Value(score),
      failureCount: Value(failureCount),
      lastPlayedAt: lastPlayedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPlayedAt),
    );
  }

  factory QuizResult.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizResult(
      quizId: serializer.fromJson<String>(json['quizId']),
      isCleared: serializer.fromJson<bool>(json['isCleared']),
      clearTimeMs: serializer.fromJson<int?>(json['clearTimeMs']),
      score: serializer.fromJson<int>(json['score']),
      failureCount: serializer.fromJson<int>(json['failureCount']),
      lastPlayedAt: serializer.fromJson<DateTime?>(json['lastPlayedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'quizId': serializer.toJson<String>(quizId),
      'isCleared': serializer.toJson<bool>(isCleared),
      'clearTimeMs': serializer.toJson<int?>(clearTimeMs),
      'score': serializer.toJson<int>(score),
      'failureCount': serializer.toJson<int>(failureCount),
      'lastPlayedAt': serializer.toJson<DateTime?>(lastPlayedAt),
    };
  }

  QuizResult copyWith({
    String? quizId,
    bool? isCleared,
    Value<int?> clearTimeMs = const Value.absent(),
    int? score,
    int? failureCount,
    Value<DateTime?> lastPlayedAt = const Value.absent(),
  }) => QuizResult(
    quizId: quizId ?? this.quizId,
    isCleared: isCleared ?? this.isCleared,
    clearTimeMs: clearTimeMs.present ? clearTimeMs.value : this.clearTimeMs,
    score: score ?? this.score,
    failureCount: failureCount ?? this.failureCount,
    lastPlayedAt: lastPlayedAt.present ? lastPlayedAt.value : this.lastPlayedAt,
  );
  QuizResult copyWithCompanion(QuizResultsCompanion data) {
    return QuizResult(
      quizId: data.quizId.present ? data.quizId.value : this.quizId,
      isCleared: data.isCleared.present ? data.isCleared.value : this.isCleared,
      clearTimeMs: data.clearTimeMs.present
          ? data.clearTimeMs.value
          : this.clearTimeMs,
      score: data.score.present ? data.score.value : this.score,
      failureCount: data.failureCount.present
          ? data.failureCount.value
          : this.failureCount,
      lastPlayedAt: data.lastPlayedAt.present
          ? data.lastPlayedAt.value
          : this.lastPlayedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuizResult(')
          ..write('quizId: $quizId, ')
          ..write('isCleared: $isCleared, ')
          ..write('clearTimeMs: $clearTimeMs, ')
          ..write('score: $score, ')
          ..write('failureCount: $failureCount, ')
          ..write('lastPlayedAt: $lastPlayedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    quizId,
    isCleared,
    clearTimeMs,
    score,
    failureCount,
    lastPlayedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizResult &&
          other.quizId == this.quizId &&
          other.isCleared == this.isCleared &&
          other.clearTimeMs == this.clearTimeMs &&
          other.score == this.score &&
          other.failureCount == this.failureCount &&
          other.lastPlayedAt == this.lastPlayedAt);
}

class QuizResultsCompanion extends UpdateCompanion<QuizResult> {
  final Value<String> quizId;
  final Value<bool> isCleared;
  final Value<int?> clearTimeMs;
  final Value<int> score;
  final Value<int> failureCount;
  final Value<DateTime?> lastPlayedAt;
  final Value<int> rowid;
  const QuizResultsCompanion({
    this.quizId = const Value.absent(),
    this.isCleared = const Value.absent(),
    this.clearTimeMs = const Value.absent(),
    this.score = const Value.absent(),
    this.failureCount = const Value.absent(),
    this.lastPlayedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuizResultsCompanion.insert({
    required String quizId,
    this.isCleared = const Value.absent(),
    this.clearTimeMs = const Value.absent(),
    this.score = const Value.absent(),
    this.failureCount = const Value.absent(),
    this.lastPlayedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : quizId = Value(quizId);
  static Insertable<QuizResult> custom({
    Expression<String>? quizId,
    Expression<bool>? isCleared,
    Expression<int>? clearTimeMs,
    Expression<int>? score,
    Expression<int>? failureCount,
    Expression<DateTime>? lastPlayedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (quizId != null) 'quiz_id': quizId,
      if (isCleared != null) 'is_cleared': isCleared,
      if (clearTimeMs != null) 'clear_time_ms': clearTimeMs,
      if (score != null) 'score': score,
      if (failureCount != null) 'failure_count': failureCount,
      if (lastPlayedAt != null) 'last_played_at': lastPlayedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuizResultsCompanion copyWith({
    Value<String>? quizId,
    Value<bool>? isCleared,
    Value<int?>? clearTimeMs,
    Value<int>? score,
    Value<int>? failureCount,
    Value<DateTime?>? lastPlayedAt,
    Value<int>? rowid,
  }) {
    return QuizResultsCompanion(
      quizId: quizId ?? this.quizId,
      isCleared: isCleared ?? this.isCleared,
      clearTimeMs: clearTimeMs ?? this.clearTimeMs,
      score: score ?? this.score,
      failureCount: failureCount ?? this.failureCount,
      lastPlayedAt: lastPlayedAt ?? this.lastPlayedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (quizId.present) {
      map['quiz_id'] = Variable<String>(quizId.value);
    }
    if (isCleared.present) {
      map['is_cleared'] = Variable<bool>(isCleared.value);
    }
    if (clearTimeMs.present) {
      map['clear_time_ms'] = Variable<int>(clearTimeMs.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (failureCount.present) {
      map['failure_count'] = Variable<int>(failureCount.value);
    }
    if (lastPlayedAt.present) {
      map['last_played_at'] = Variable<DateTime>(lastPlayedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizResultsCompanion(')
          ..write('quizId: $quizId, ')
          ..write('isCleared: $isCleared, ')
          ..write('clearTimeMs: $clearTimeMs, ')
          ..write('score: $score, ')
          ..write('failureCount: $failureCount, ')
          ..write('lastPlayedAt: $lastPlayedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserStatusTable extends UserStatus
    with TableInfo<$UserStatusTable, UserStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserStatusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('default'),
  );
  static const VerificationMeta _dailyPlayCountMeta = const VerificationMeta(
    'dailyPlayCount',
  );
  @override
  late final GeneratedColumn<int> dailyPlayCount = GeneratedColumn<int>(
    'daily_play_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isPremiumMeta = const VerificationMeta(
    'isPremium',
  );
  @override
  late final GeneratedColumn<bool> isPremium = GeneratedColumn<bool>(
    'is_premium',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_premium" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _lastResetDateMeta = const VerificationMeta(
    'lastResetDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastResetDate =
      GeneratedColumn<DateTime>(
        'last_reset_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    dailyPlayCount,
    isPremium,
    lastResetDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_status';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserStatusData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    }
    if (data.containsKey('daily_play_count')) {
      context.handle(
        _dailyPlayCountMeta,
        dailyPlayCount.isAcceptableOrUnknown(
          data['daily_play_count']!,
          _dailyPlayCountMeta,
        ),
      );
    }
    if (data.containsKey('is_premium')) {
      context.handle(
        _isPremiumMeta,
        isPremium.isAcceptableOrUnknown(data['is_premium']!, _isPremiumMeta),
      );
    }
    if (data.containsKey('last_reset_date')) {
      context.handle(
        _lastResetDateMeta,
        lastResetDate.isAcceptableOrUnknown(
          data['last_reset_date']!,
          _lastResetDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  UserStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserStatusData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      dailyPlayCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_play_count'],
      )!,
      isPremium: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_premium'],
      )!,
      lastResetDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reset_date'],
      ),
    );
  }

  @override
  $UserStatusTable createAlias(String alias) {
    return $UserStatusTable(attachedDatabase, alias);
  }
}

class UserStatusData extends DataClass implements Insertable<UserStatusData> {
  /// キー (シングルトン行なので 'default' 固定)
  final String key;

  /// 本日のプレイ回数
  final int dailyPlayCount;

  /// 課金済みフラグ (制限解除)
  final bool isPremium;

  /// 最終リセット日
  final DateTime? lastResetDate;
  const UserStatusData({
    required this.key,
    required this.dailyPlayCount,
    required this.isPremium,
    this.lastResetDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['daily_play_count'] = Variable<int>(dailyPlayCount);
    map['is_premium'] = Variable<bool>(isPremium);
    if (!nullToAbsent || lastResetDate != null) {
      map['last_reset_date'] = Variable<DateTime>(lastResetDate);
    }
    return map;
  }

  UserStatusCompanion toCompanion(bool nullToAbsent) {
    return UserStatusCompanion(
      key: Value(key),
      dailyPlayCount: Value(dailyPlayCount),
      isPremium: Value(isPremium),
      lastResetDate: lastResetDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastResetDate),
    );
  }

  factory UserStatusData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserStatusData(
      key: serializer.fromJson<String>(json['key']),
      dailyPlayCount: serializer.fromJson<int>(json['dailyPlayCount']),
      isPremium: serializer.fromJson<bool>(json['isPremium']),
      lastResetDate: serializer.fromJson<DateTime?>(json['lastResetDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'dailyPlayCount': serializer.toJson<int>(dailyPlayCount),
      'isPremium': serializer.toJson<bool>(isPremium),
      'lastResetDate': serializer.toJson<DateTime?>(lastResetDate),
    };
  }

  UserStatusData copyWith({
    String? key,
    int? dailyPlayCount,
    bool? isPremium,
    Value<DateTime?> lastResetDate = const Value.absent(),
  }) => UserStatusData(
    key: key ?? this.key,
    dailyPlayCount: dailyPlayCount ?? this.dailyPlayCount,
    isPremium: isPremium ?? this.isPremium,
    lastResetDate: lastResetDate.present
        ? lastResetDate.value
        : this.lastResetDate,
  );
  UserStatusData copyWithCompanion(UserStatusCompanion data) {
    return UserStatusData(
      key: data.key.present ? data.key.value : this.key,
      dailyPlayCount: data.dailyPlayCount.present
          ? data.dailyPlayCount.value
          : this.dailyPlayCount,
      isPremium: data.isPremium.present ? data.isPremium.value : this.isPremium,
      lastResetDate: data.lastResetDate.present
          ? data.lastResetDate.value
          : this.lastResetDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserStatusData(')
          ..write('key: $key, ')
          ..write('dailyPlayCount: $dailyPlayCount, ')
          ..write('isPremium: $isPremium, ')
          ..write('lastResetDate: $lastResetDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(key, dailyPlayCount, isPremium, lastResetDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserStatusData &&
          other.key == this.key &&
          other.dailyPlayCount == this.dailyPlayCount &&
          other.isPremium == this.isPremium &&
          other.lastResetDate == this.lastResetDate);
}

class UserStatusCompanion extends UpdateCompanion<UserStatusData> {
  final Value<String> key;
  final Value<int> dailyPlayCount;
  final Value<bool> isPremium;
  final Value<DateTime?> lastResetDate;
  final Value<int> rowid;
  const UserStatusCompanion({
    this.key = const Value.absent(),
    this.dailyPlayCount = const Value.absent(),
    this.isPremium = const Value.absent(),
    this.lastResetDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserStatusCompanion.insert({
    this.key = const Value.absent(),
    this.dailyPlayCount = const Value.absent(),
    this.isPremium = const Value.absent(),
    this.lastResetDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<UserStatusData> custom({
    Expression<String>? key,
    Expression<int>? dailyPlayCount,
    Expression<bool>? isPremium,
    Expression<DateTime>? lastResetDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (dailyPlayCount != null) 'daily_play_count': dailyPlayCount,
      if (isPremium != null) 'is_premium': isPremium,
      if (lastResetDate != null) 'last_reset_date': lastResetDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserStatusCompanion copyWith({
    Value<String>? key,
    Value<int>? dailyPlayCount,
    Value<bool>? isPremium,
    Value<DateTime?>? lastResetDate,
    Value<int>? rowid,
  }) {
    return UserStatusCompanion(
      key: key ?? this.key,
      dailyPlayCount: dailyPlayCount ?? this.dailyPlayCount,
      isPremium: isPremium ?? this.isPremium,
      lastResetDate: lastResetDate ?? this.lastResetDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (dailyPlayCount.present) {
      map['daily_play_count'] = Variable<int>(dailyPlayCount.value);
    }
    if (isPremium.present) {
      map['is_premium'] = Variable<bool>(isPremium.value);
    }
    if (lastResetDate.present) {
      map['last_reset_date'] = Variable<DateTime>(lastResetDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserStatusCompanion(')
          ..write('key: $key, ')
          ..write('dailyPlayCount: $dailyPlayCount, ')
          ..write('isPremium: $isPremium, ')
          ..write('lastResetDate: $lastResetDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $QuizResultsTable quizResults = $QuizResultsTable(this);
  late final $UserStatusTable userStatus = $UserStatusTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [quizResults, userStatus];
}

typedef $$QuizResultsTableCreateCompanionBuilder =
    QuizResultsCompanion Function({
      required String quizId,
      Value<bool> isCleared,
      Value<int?> clearTimeMs,
      Value<int> score,
      Value<int> failureCount,
      Value<DateTime?> lastPlayedAt,
      Value<int> rowid,
    });
typedef $$QuizResultsTableUpdateCompanionBuilder =
    QuizResultsCompanion Function({
      Value<String> quizId,
      Value<bool> isCleared,
      Value<int?> clearTimeMs,
      Value<int> score,
      Value<int> failureCount,
      Value<DateTime?> lastPlayedAt,
      Value<int> rowid,
    });

class $$QuizResultsTableFilterComposer
    extends Composer<_$AppDatabase, $QuizResultsTable> {
  $$QuizResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get quizId => $composableBuilder(
    column: $table.quizId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCleared => $composableBuilder(
    column: $table.isCleared,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get clearTimeMs => $composableBuilder(
    column: $table.clearTimeMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get failureCount => $composableBuilder(
    column: $table.failureCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuizResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuizResultsTable> {
  $$QuizResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get quizId => $composableBuilder(
    column: $table.quizId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCleared => $composableBuilder(
    column: $table.isCleared,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get clearTimeMs => $composableBuilder(
    column: $table.clearTimeMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get failureCount => $composableBuilder(
    column: $table.failureCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuizResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuizResultsTable> {
  $$QuizResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get quizId =>
      $composableBuilder(column: $table.quizId, builder: (column) => column);

  GeneratedColumn<bool> get isCleared =>
      $composableBuilder(column: $table.isCleared, builder: (column) => column);

  GeneratedColumn<int> get clearTimeMs => $composableBuilder(
    column: $table.clearTimeMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<int> get failureCount => $composableBuilder(
    column: $table.failureCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastPlayedAt => $composableBuilder(
    column: $table.lastPlayedAt,
    builder: (column) => column,
  );
}

class $$QuizResultsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuizResultsTable,
          QuizResult,
          $$QuizResultsTableFilterComposer,
          $$QuizResultsTableOrderingComposer,
          $$QuizResultsTableAnnotationComposer,
          $$QuizResultsTableCreateCompanionBuilder,
          $$QuizResultsTableUpdateCompanionBuilder,
          (
            QuizResult,
            BaseReferences<_$AppDatabase, $QuizResultsTable, QuizResult>,
          ),
          QuizResult,
          PrefetchHooks Function()
        > {
  $$QuizResultsTableTableManager(_$AppDatabase db, $QuizResultsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuizResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuizResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuizResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> quizId = const Value.absent(),
                Value<bool> isCleared = const Value.absent(),
                Value<int?> clearTimeMs = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<int> failureCount = const Value.absent(),
                Value<DateTime?> lastPlayedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuizResultsCompanion(
                quizId: quizId,
                isCleared: isCleared,
                clearTimeMs: clearTimeMs,
                score: score,
                failureCount: failureCount,
                lastPlayedAt: lastPlayedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String quizId,
                Value<bool> isCleared = const Value.absent(),
                Value<int?> clearTimeMs = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<int> failureCount = const Value.absent(),
                Value<DateTime?> lastPlayedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuizResultsCompanion.insert(
                quizId: quizId,
                isCleared: isCleared,
                clearTimeMs: clearTimeMs,
                score: score,
                failureCount: failureCount,
                lastPlayedAt: lastPlayedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuizResultsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuizResultsTable,
      QuizResult,
      $$QuizResultsTableFilterComposer,
      $$QuizResultsTableOrderingComposer,
      $$QuizResultsTableAnnotationComposer,
      $$QuizResultsTableCreateCompanionBuilder,
      $$QuizResultsTableUpdateCompanionBuilder,
      (
        QuizResult,
        BaseReferences<_$AppDatabase, $QuizResultsTable, QuizResult>,
      ),
      QuizResult,
      PrefetchHooks Function()
    >;
typedef $$UserStatusTableCreateCompanionBuilder =
    UserStatusCompanion Function({
      Value<String> key,
      Value<int> dailyPlayCount,
      Value<bool> isPremium,
      Value<DateTime?> lastResetDate,
      Value<int> rowid,
    });
typedef $$UserStatusTableUpdateCompanionBuilder =
    UserStatusCompanion Function({
      Value<String> key,
      Value<int> dailyPlayCount,
      Value<bool> isPremium,
      Value<DateTime?> lastResetDate,
      Value<int> rowid,
    });

class $$UserStatusTableFilterComposer
    extends Composer<_$AppDatabase, $UserStatusTable> {
  $$UserStatusTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyPlayCount => $composableBuilder(
    column: $table.dailyPlayCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPremium => $composableBuilder(
    column: $table.isPremium,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastResetDate => $composableBuilder(
    column: $table.lastResetDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserStatusTableOrderingComposer
    extends Composer<_$AppDatabase, $UserStatusTable> {
  $$UserStatusTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyPlayCount => $composableBuilder(
    column: $table.dailyPlayCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPremium => $composableBuilder(
    column: $table.isPremium,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastResetDate => $composableBuilder(
    column: $table.lastResetDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserStatusTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserStatusTable> {
  $$UserStatusTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<int> get dailyPlayCount => $composableBuilder(
    column: $table.dailyPlayCount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPremium =>
      $composableBuilder(column: $table.isPremium, builder: (column) => column);

  GeneratedColumn<DateTime> get lastResetDate => $composableBuilder(
    column: $table.lastResetDate,
    builder: (column) => column,
  );
}

class $$UserStatusTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserStatusTable,
          UserStatusData,
          $$UserStatusTableFilterComposer,
          $$UserStatusTableOrderingComposer,
          $$UserStatusTableAnnotationComposer,
          $$UserStatusTableCreateCompanionBuilder,
          $$UserStatusTableUpdateCompanionBuilder,
          (
            UserStatusData,
            BaseReferences<_$AppDatabase, $UserStatusTable, UserStatusData>,
          ),
          UserStatusData,
          PrefetchHooks Function()
        > {
  $$UserStatusTableTableManager(_$AppDatabase db, $UserStatusTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserStatusTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserStatusTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserStatusTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<int> dailyPlayCount = const Value.absent(),
                Value<bool> isPremium = const Value.absent(),
                Value<DateTime?> lastResetDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserStatusCompanion(
                key: key,
                dailyPlayCount: dailyPlayCount,
                isPremium: isPremium,
                lastResetDate: lastResetDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<int> dailyPlayCount = const Value.absent(),
                Value<bool> isPremium = const Value.absent(),
                Value<DateTime?> lastResetDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserStatusCompanion.insert(
                key: key,
                dailyPlayCount: dailyPlayCount,
                isPremium: isPremium,
                lastResetDate: lastResetDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserStatusTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserStatusTable,
      UserStatusData,
      $$UserStatusTableFilterComposer,
      $$UserStatusTableOrderingComposer,
      $$UserStatusTableAnnotationComposer,
      $$UserStatusTableCreateCompanionBuilder,
      $$UserStatusTableUpdateCompanionBuilder,
      (
        UserStatusData,
        BaseReferences<_$AppDatabase, $UserStatusTable, UserStatusData>,
      ),
      UserStatusData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$QuizResultsTableTableManager get quizResults =>
      $$QuizResultsTableTableManager(_db, _db.quizResults);
  $$UserStatusTableTableManager get userStatus =>
      $$UserStatusTableTableManager(_db, _db.userStatus);
}
