import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/src/database/app_database_provider.dart';
import 'package:system/src/database/user_status_repository.dart';

final userStatusRepositoryProvider = Provider<UserStatusRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return UserStatusRepository(db);
});
