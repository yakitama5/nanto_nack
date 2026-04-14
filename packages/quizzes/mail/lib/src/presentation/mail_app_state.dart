import 'package:mail/src/domain/entities/mail.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';

/// メールアプリの共通UI状態
///
/// 各クイズの状態クラスに埋め込んで使用する。
class MailAppState {
  const MailAppState({
    required this.mails,
    required this.currentFolder,
    required this.selectedMailIds,
    required this.searchQuery,
  });

  /// 全メールのリスト
  final List<Mail> mails;

  /// 現在表示中のフォルダ
  final MailFolder currentFolder;

  /// 長押し選択されたメールIDのセット（空なら通常モード）
  final Set<String> selectedMailIds;

  /// 検索ボックスの入力値
  final String searchQuery;

  factory MailAppState.initial({required List<Mail> initialMails}) =>
      MailAppState(
        mails: initialMails,
        currentFolder: MailFolder.inbox,
        selectedMailIds: const {},
        searchQuery: '',
      );

  /// 現在フォルダのメール一覧（フォルダでフィルタリング済み）
  List<Mail> get currentFolderMails =>
      mails.where((m) => m.folder == currentFolder).toList();

  /// 選択モードかどうか
  bool get isSelectionMode => selectedMailIds.isNotEmpty;

  MailAppState copyWith({
    List<Mail>? mails,
    MailFolder? currentFolder,
    Set<String>? selectedMailIds,
    String? searchQuery,
  }) {
    return MailAppState(
      mails: mails ?? this.mails,
      currentFolder: currentFolder ?? this.currentFolder,
      selectedMailIds: selectedMailIds ?? this.selectedMailIds,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
