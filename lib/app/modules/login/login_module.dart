import 'package:central_stock_mobile/app/modules/login/login_page.dart';
import 'package:central_stock_mobile/app/modules/login/login_store.dart';
import 'package:central_stock_mobile/app/repositories/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore(repository: LoginRepository())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];
}
