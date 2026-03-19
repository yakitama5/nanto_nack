import 'package:drift/drift.dart';

/// ユーザーステータステーブル
class UserStatus extends Table {
  /// キー (シングルトン行なので 'default' 固定)
  TextColumn get key => text().withDefault(const Constant('default'))();

  /// 本日のプレイ回数
  IntColumn get dailyPlayCount =>
      integer().withDefault(const Constant(0))();

  /// 課金済みフラグ (制限解除)
  BoolColumn get isPremium => boolean().withDefault(const Constant(false))();

  /// 最終リセット日
  DateTimeColumn get lastResetDate => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}
