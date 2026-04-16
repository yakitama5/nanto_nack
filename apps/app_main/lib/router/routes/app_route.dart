/// アプリ全体の共通ルートパスを管理するEnum。
enum AppRoute {
  splash('/splash'),
  maintenance('/maintenance'),
  home('/'),
  play('/play'),
  settings('/settings'),
  support('/support');

  const AppRoute(this.path);
  final String path;
}
