// このファイルは quiz4 の実装変更前（取引履歴クイズ）のテストです。
// quiz4 は「支払い元変更クイズ」にリニューアルされたため、
// 新しいテストは quiz_change_payment_method_use_case_test.dart を参照してください。
//
// QuizViewHistoryUseCase は後方互換性のために残していますが、
// quiz4 のクイズには使用されなくなりました。

import 'package:flutter_test/flutter_test.dart';
import 'package:payment/src/application/quiz_view_history_use_case.dart';

void main() {
  const useCase = QuizViewHistoryUseCase();

  group('QuizViewHistoryUseCase', () {
    test('historyViewed が true のとき isClear は true を返す', () {
      expect(useCase.isClear(historyViewed: true), isTrue);
    });

    test('historyViewed が false のとき isClear は false を返す', () {
      expect(useCase.isClear(historyViewed: false), isFalse);
    });
  });
}
