// TODO(migration): drift/web.dart は非推奨。drift/wasm.dart へ移行予定
// ignore_for_file: deprecated_member_use
import 'package:drift/drift.dart';
import 'package:drift/web.dart';

/// Web環境用のデータベース接続 (インメモリ: 揮発性)
/// 本番環境では drift/wasm.dart の WasmDatabase への移行が必要
QueryExecutor createConnection() {
  return WebDatabase.withStorage(DriftWebStorage.volatile());
}
