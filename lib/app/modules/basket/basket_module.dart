import 'package:central_stock_mobile/app/modules/basket/basket_page.dart';
import 'package:central_stock_mobile/app/modules/basket/basket_store.dart';
import 'package:central_stock_mobile/app/repositories/basket_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BasketModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BasketStore(repository: BasketRepository())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => BasketPage())
  ];
}
