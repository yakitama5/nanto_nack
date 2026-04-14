import 'dart:collection';

import 'package:mail/src/domain/entities/mail.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';

/// メールアプリの共通UI状態
///
/// 各クイズの状態クラスに埋め込んで使用する。
/// [mails] と [selectedMailIds] は不変ビューとして公開し、
/// 外部からの直接変更（add / remove 等）を防ぐ。
class MailAppState {
  MailAppState({
    required List<Mail> mails,
    required this.currentFolder,
    required Set<String> selectedMailIds,
    required this.searchQuery,
  })  : mails = UnmodifiableListView(mails),
        selectedMailIds = UnmodifiableSetView(selectedMailIds);

  /// 全メールのリスト（読み取り専用）
  final UnmodifiableListView<Mail> mails;

  /// 現在表示中のフォルダ
  final MailFolder currentFolder;

  /// 長押し選択されたメールIDのセット（空なら通常モード、読み取り専用）
  final UnmodifiableSetView<String> selectedMailIds;

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
      mails: mails ?? this.mails.toList(),
      currentFolder: currentFolder ?? this.currentFolder,
      selectedMailIds: selectedMailIds ?? this.selectedMailIds.toSet(),
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
