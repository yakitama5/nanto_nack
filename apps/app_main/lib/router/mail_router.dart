import 'package:go_router/go_router.dart';
import 'package:mail/mail.dart';

import '../presentation/play/stage_list_screen.dart';

List<GoRoute> get mailRoutes => [
      GoRoute(
        path: 'mail',
        builder: (context, state) =>
            const StageListScreen(categoryId: 'mail'),
        routes: [
          GoRoute(
            path: 'quiz1',
            builder: (context, state) => MailQuizScreen(
              type: MailQuizType.archive,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz2',
            builder: (context, state) => MailQuizScreen(
              type: MailQuizType.emptyTrash,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz3',
            builder: (context, state) => MailQuizScreen(
              type: MailQuizType.selectDelete,
              onCompleted: () => context.pop(),
            ),
          ),
          GoRoute(
            path: 'quiz4',
            builder: (context, state) => MailQuizScreen(
              type: MailQuizType.search,
              onCompleted: () => context.pop(),
            ),
          ),
        ],
      ),
    ];
