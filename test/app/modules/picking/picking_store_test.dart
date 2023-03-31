import 'package:flutter_test/flutter_test.dart';
import 'package:central_stock_mobile/app/modules/picking/picking_store.dart';
 
void main() {
  late PickingStore store;

  setUpAll(() {
    store = PickingStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}