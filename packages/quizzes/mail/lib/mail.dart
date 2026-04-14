// Domain
export 'src/domain/entities/mail.dart';
export 'src/domain/entities/mail_folder.dart';
export 'src/domain/mail_catalog.dart';

// Application
export 'src/application/quiz_archive_mail_use_case.dart';
export 'src/application/quiz_empty_trash_use_case.dart';
export 'src/application/quiz_search_use_case.dart';
export 'src/application/quiz_select_delete_use_case.dart';

// Infrastructure
export 'src/infrastructure/mail_quiz_repository.dart';
export 'src/infrastructure/mail_quiz_repository_provider.dart';

// Presentation - 共通（Quiz1〜4すべてで使用）
export 'src/presentation/mail_quiz_notifier.dart';
export 'src/presentation/mail_quiz_screen.dart';
export 'src/presentation/mail_quiz_state.dart';
export 'src/presentation/mail_quiz_type.dart';
