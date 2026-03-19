import 'package:drift/drift.dart';

// ignore: uri_does_not_exist
import 'connection_unsupported.dart'
    if (dart.library.ffi) 'connection_native.dart'
    if (dart.library.js_interop) 'connection_web.dart';

/// プラットフォームに応じた DatabaseConnection を開く
QueryExecutor openConnection() => createConnection();
