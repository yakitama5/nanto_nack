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

// Presentation - Quiz 1 (Archive)
export 'src/presentation/quiz1_archive/archive_quiz_notifier.dart';
export 'src/presentation/quiz1_archive/archive_quiz_screen.dart';
export 'src/presentation/quiz1_archive/archive_quiz_state.dart';

// Presentation - Quiz 2 (Empty Trash)
export 'src/presentation/quiz2_empty_trash/empty_trash_quiz_notifier.dart';
export 'src/presentation/quiz2_empty_trash/empty_trash_quiz_screen.dart';
export 'src/presentation/quiz2_empty_trash/empty_trash_quiz_state.dart';

// Presentation - Quiz 3 (Select Delete)
export 'src/presentation/quiz3_select_delete/select_delete_quiz_notifier.dart';
export 'src/presentation/quiz3_select_delete/select_delete_quiz_screen.dart';
export 'src/presentation/quiz3_select_delete/select_delete_quiz_state.dart';

// Presentation - Quiz 4 (Search)
export 'src/presentation/quiz4_search/search_quiz_notifier.dart';
export 'src/presentation/quiz4_search/search_quiz_screen.dart';
export 'src/presentation/quiz4_search/search_quiz_state.dart';
