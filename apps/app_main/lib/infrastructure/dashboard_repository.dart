import 'package:system/system.dart';

import '../domain/dashboard/daily_tip.dart';

/// ダッシュボード表示に必要なデータを取得するリポジトリの抽象インターフェース
abstract class DashboardRepository {
  /// TipsリストをRemote Config相当から取得
  List<DailyTip> fetchRawTips();

  /// 1日のプレイ回数制限をRemote Config相当から取得
  int getDailyPlayLimit();

  /// 1日のプレイ回数制限が有効かどうかをRemote Config相当から取得
  bool isPlayLimitEnabled();

  /// 指定日時以降にクリアされたクイズ履歴を取得
  Future<List<QuizResult>> getQuizHistorySince(DateTime since);

  /// 今日のプレイ回数を取得
  Future<int> getTodayPlayCount();

  /// プレミアム（課金済み）かどうかを確認
  Future<bool> isPremium();
}
