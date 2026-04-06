import 'entities/payment_contact.dart';
import 'entities/payment_transaction.dart';
import 'payment_method.dart';

/// 決済アプリのマスターデータカタログ
class PaymentCatalog {
  PaymentCatalog._();

  /// 初期残高
  static const int initialBalance = 12480;

  /// デフォルト支払い元（残高払い）
  static const PaymentMethod defaultPaymentMethod = PaymentMethod.balance;

  /// コンタクト一覧
  static const List<PaymentContact> contacts = [
    PaymentContact(id: 'contact_1', name: '', initial: 'T'),
    PaymentContact(id: 'contact_2', name: '', initial: 'H'),
    PaymentContact(id: 'contact_3', name: '', initial: 'J'),
    PaymentContact(id: 'contact_4', name: '', initial: 'M'),
  ];

  /// 取引履歴
  static const List<PaymentTransaction> transactions = [
    PaymentTransaction(
      id: 'tx_1',
      title: '',
      amount: -580,
      dateLabel: '',
      isIncome: false,
    ),
    PaymentTransaction(
      id: 'tx_2',
      title: '',
      amount: -1200,
      dateLabel: '',
      isIncome: false,
    ),
    PaymentTransaction(
      id: 'tx_3',
      title: '',
      amount: 3000,
      dateLabel: '',
      isIncome: true,
    ),
    PaymentTransaction(
      id: 'tx_4',
      title: '',
      amount: -2800,
      dateLabel: '',
      isIncome: false,
    ),
    PaymentTransaction(
      id: 'tx_5',
      title: '',
      amount: -240,
      dateLabel: '',
      isIncome: false,
    ),
  ];

  /// 送金デフォルト金額
  static const int defaultSendAmount = 1000;
}
