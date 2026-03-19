import 'package:system/system.dart';

import '../domain/dashboard/daily_tip.dart';

/// ダッシュボード表示に必要なデータを取得するリポジトリ
///
/// Remote Config（Tips）と Drift（プレイ履歴）を橋渡しする。
/// Remote Config は現フェーズではハードコードで代替する。
class DashboardRepository {
  const DashboardRepository({
    required AppDatabase db,
    required UserStatusRepository userStatusRepository,
  })  : _db = db,
        _userStatusRepository = userStatusRepository;

  final AppDatabase _db;
  final UserStatusRepository _userStatusRepository;

  /// TipsリストをRemote Config相当から取得
  /// 将来的には Firebase Remote Config の JSON を解析して返す
  List<DailyTip> fetchRawTips() => _kTips;

  /// 指定日時以降にクリアされたクイズ履歴を取得
  Future<List<QuizResult>> getQuizHistorySince(DateTime since) =>
      _db.getQuizHistorySince(since);

  /// 今日のプレイ回数を取得
  Future<int> getTodayPlayCount() async {
    final status = await _userStatusRepository.get();
    final today = DateTime.now();
    final lastReset = status.lastResetDate;

    final isToday = lastReset != null &&
        lastReset.year == today.year &&
        lastReset.month == today.month &&
        lastReset.day == today.day;

    return isToday ? status.dailyPlayCount : 0;
  }

  /// プレミアム（課金済み）かどうかを確認
  Future<bool> isPremium() async {
    final status = await _userStatusRepository.get();
    return status.isPremium;
  }
}

// ─── ハードコードされた UI/UX Tips マスターデータ ──────────────────────────
// 将来的には Firebase Remote Config の JSON から取得する
const _kTips = [
  DailyTip(
    id: 'tip_001',
    title: 'UIの第一印象',
    content: 'ユーザーはUIを見た瞬間、わずか0.05秒以内に印象を決定します。\n第一印象を大切にデザインしましょう。',
  ),
  DailyTip(
    id: 'tip_002',
    title: 'フィッツの法則',
    content: 'ターゲットが大きく・近いほど操作が速くなります。\n重要なボタンは大きく・手の届く場所に配置しましょう。',
  ),
  DailyTip(
    id: 'tip_003',
    title: '認知負荷を減らす',
    content: 'ユーザーが一度に覚えなければならない情報の量を最小限に。\nシンプルなUIが最強のUIです。',
  ),
  DailyTip(
    id: 'tip_004',
    title: 'ヒックの法則',
    content: '選択肢が多いほど決断に時間がかかります。\n選択肢は必要最小限に絞りましょう。',
  ),
  DailyTip(
    id: 'tip_005',
    title: 'アフォーダンス',
    content: 'ボタンはボタンらしく見えるようにデザインしましょう。\n操作方法を視覚的に伝えることが重要です。',
  ),
  DailyTip(
    id: 'tip_006',
    title: '即時フィードバック',
    content: 'ユーザーの操作に対して即座にフィードバックを。\n反応がないとユーザーは不安になります。',
  ),
  DailyTip(
    id: 'tip_007',
    title: 'コントラスト比',
    content: 'テキストと背景のコントラスト比はWCAGガイドラインの\n4.5:1以上を確保しましょう。',
  ),
];
