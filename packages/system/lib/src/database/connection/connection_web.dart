// TODO(migration): drift/web.dart は非推奨。drift/wasm.dart へ移行予定
// ignore_for_file: deprecated_member_use, experimental_member_use
import 'package:drift/drift.dart';
import 'package:drift/web.dart';

/// Web環境用のデータベース接続 (IndexedDB による永続化)
/// ページリロード後もクリア結果などのデータが保持される。
/// 将来的には drift/wasm.dart の WasmDatabase への移行が推奨。
QueryExecutor createConnection() {
  return WebDatabase.withStorage(DriftWebStorage.indexedDb('nanto_nack'));
}
