import 'package:delivery/src/domain/delivery_view_state.dart';
import 'package:delivery/src/presentation/delivery_app_notifier.dart';
import 'package:delivery/src/presentation/delivery_app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() => container.dispose());

  group('DeliveryAppNotifier - browsing', () {
    test('初期状態: カテゴリが5つあり orderQuantity=1', () {
      final state = container
          .read(deliveryAppProvider(DeliveryViewState.browsing));
      expect(state.categories, hasLength(5));
      expect(state.orderQuantity, 1);
      expect(state.viewState, DeliveryViewState.browsing);
    });

    test('incrementQuantity() で orderQuantity が +1 される', () {
      final notifier = container
          .read(deliveryAppProvider(DeliveryViewState.browsing).notifier);
      notifier.incrementQuantity();
      final state =
          container.read(deliveryAppProvider(DeliveryViewState.browsing));
      expect(state.orderQuantity, 2);
    });

    test('decrementQuantity() は最小1で止まる', () {
      final notifier = container
          .read(deliveryAppProvider(DeliveryViewState.browsing).notifier);
      notifier.decrementQuantity();
      final state =
          container.read(deliveryAppProvider(DeliveryViewState.browsing));
      expect(state.orderQuantity, 1);
    });

    test('incrementQuantity() / decrementQuantity() のペアで元の値に戻る', () {
      final notifier = container
          .read(deliveryAppProvider(DeliveryViewState.browsing).notifier);
      notifier.incrementQuantity();
      notifier.incrementQuantity();
      notifier.decrementQuantity();
      final state =
          container.read(deliveryAppProvider(DeliveryViewState.browsing));
      expect(state.orderQuantity, 2);
    });

    test('tapCategory() で lastTappedCategoryId が更新される', () {
      final notifier = container
          .read(deliveryAppProvider(DeliveryViewState.browsing).notifier);
      notifier.tapCategory('pizza');
      final state =
          container.read(deliveryAppProvider(DeliveryViewState.browsing));
      expect(state.lastTappedCategoryId, 'pizza');
    });

    test('tapCartButton() で cartTapCount が増加する', () {
      final notifier = container
          .read(deliveryAppProvider(DeliveryViewState.browsing).notifier);
      notifier.tapCartButton();
      final state =
          container.read(deliveryAppProvider(DeliveryViewState.browsing));
      expect(state.cartTapCount, 1);
    });

    test('totalPrice は orderQuantity * 890 である', () {
      final notifier = container
          .read(deliveryAppProvider(DeliveryViewState.browsing).notifier);
      notifier.incrementQuantity();
      final state =
          container.read(deliveryAppProvider(DeliveryViewState.browsing));
      expect(state.totalPrice, 2 * 890);
    });
  });

  group('DeliveryAppNotifier - tracking', () {
    test('初期状態: viewState が tracking である', () {
      final state = container
          .read(deliveryAppProvider(DeliveryViewState.tracking));
      expect(state.viewState, DeliveryViewState.tracking);
    });

    test('updateTrackingSheetExtent() でシートの割合が更新される', () {
      final notifier = container
          .read(deliveryAppProvider(DeliveryViewState.tracking).notifier);
      notifier.updateTrackingSheetExtent(0.8);
      final state =
          container.read(deliveryAppProvider(DeliveryViewState.tracking));
      expect(state.trackingSheetExtent, closeTo(0.8, 0.001));
    });
  });

  group('DeliveryAppState.copyWith', () {
    test('指定したフィールドのみ更新される', () {
      const original = DeliveryAppState(
        categories: [],
        viewState: DeliveryViewState.browsing,
        orderQuantity: 1,
        trackingSheetExtent: 0.0,
      );
      final updated = original.copyWith(orderQuantity: 3);
      expect(updated.orderQuantity, 3);
      expect(updated.viewState, DeliveryViewState.browsing);
    });
  });
}
