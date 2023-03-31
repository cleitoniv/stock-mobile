import 'package:central_stock_mobile/app/modules/picking/picking_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PickingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PickingStore()),
  ];

  @override
  final List<ModularRoute> routes = [];
}
