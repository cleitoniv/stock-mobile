import 'package:central_stock_mobile/app/modules/Expedition/expedition_module.dart';
import 'package:central_stock_mobile/app/modules/Expedition/expedition_page.dart';
import 'package:central_stock_mobile/app/modules/Expedition/expedition_store.dart';
import 'package:central_stock_mobile/app/modules/Expedition/select_activity_page.dart';
import 'package:central_stock_mobile/app/modules/Expedition/select_client_page.dart';
import 'package:central_stock_mobile/app/modules/Expedition/select_expedition_type_page.dart';
import 'package:central_stock_mobile/app/modules/Expedition/select_route_page.dart';
import 'package:central_stock_mobile/app/modules/Expedition/service_ticket_page.dart';
import 'package:central_stock_mobile/app/modules/Expedition/transport_ticket_page.dart';
import 'package:central_stock_mobile/app/repositories/expedition_repository.dart';
import 'package:central_stock_mobile/app/modules/basket/basket_module.dart';
import 'package:central_stock_mobile/app/modules/home/home_initial_screen_page.dart';
import 'package:central_stock_mobile/app/modules/login/login_module.dart';
import 'package:central_stock_mobile/app/modules/order/order_module.dart';
import 'package:central_stock_mobile/app/modules/picking/picking_module.dart';
import 'package:central_stock_mobile/app/widgets/scanner_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ExpeditionRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    // ModuleRoute('/initial_screen', module: HomeModule()),
    ModuleRoute('/order', module: OrderModule()),
    ModuleRoute('/basket', module: BasketModule()),
    ModuleRoute('/picking', module: PickingModule()),
    ChildRoute('/scanner', child: (_, args) => const ScannerPage()),
    ChildRoute('/conference', child: (_, args) => const ExpeditionPage()),
    ChildRoute('/select_activity', child: (_, args) => const SelectActivityPage()),
    ChildRoute('/select_client', child: (_, args) => const SelectClientPage()),
    ChildRoute('/select_route', child: (_, args) => const SelectRoutePage()),
    ModuleRoute('/type_expedition', module: ExpeditionModule()),
    // ChildRoute('/type_expedition', child: (_, args) => const SelectExpeditionTypePage()),
    ChildRoute('/service_ticket', child: (_, args) => const ServiceTicketPage()),
    ChildRoute('/transport_ticket', child: (_, args) => const TransportTicketPage()),
    ChildRoute('/initial_screen',
        child: (_, args) => const HomeInitialScreenPage()),
  ];
}
