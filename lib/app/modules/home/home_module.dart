import 'package:central_stock_mobile/app/modules/home/home_page.dart';
import 'package:central_stock_mobile/app/repositories/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';

import 'home_initial_screen_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(repository: HomeRepository())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
