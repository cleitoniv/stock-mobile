import 'package:central_stock_mobile/app/modules/login/login_module.dart';
import 'package:central_stock_mobile/app/modules/order/order_module.dart';
import 'package:central_stock_mobile/app/widgets/scanner_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/order', module: OrderModule()),
    ChildRoute('/scanner', child: (_, args) => ScannerPage()),
  ];
}
