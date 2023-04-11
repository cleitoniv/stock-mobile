import 'package:central_stock_mobile/app/modules/picking/picking_page.dart';
import 'package:central_stock_mobile/app/modules/picking/picking_store.dart';
import 'package:central_stock_mobile/app/modules/picking/submit_baskets_page.dart';
import 'package:central_stock_mobile/app/repositories/picking_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PickingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PickingStore(repository: PickingRepository())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const PickingPage()),
    ChildRoute('/submit', child: (_, args) => const SubmitBasketsPage())
  ];
}
