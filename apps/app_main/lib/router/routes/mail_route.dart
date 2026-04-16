/// メールカテゴリーのルートパスEnum。
enum MailRoute {
  list('/play/mail'),
  quiz1('/play/mail/quiz1'),
  quiz2('/play/mail/quiz2'),
  quiz3('/play/mail/quiz3'),
  quiz4('/play/mail/quiz4');

  const MailRoute(this.path);
  final String path;
}
