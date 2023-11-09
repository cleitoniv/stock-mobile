import 'package:central_stock_mobile/app/modules/Expedition/expedition_store.dart';
import 'package:central_stock_mobile/app/modules/Expedition/select_expedition_type_page.dart';
import 'package:central_stock_mobile/app/repositories/expedition_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'expedition_page.dart';
import 'select_activity_page.dart';
import 'select_client_page.dart';
import 'select_route_page.dart';
import 'service_ticket_page.dart';
import 'transport_ticket_page.dart';

class ExpeditionModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ExpeditionStore(repository: ExpeditionRepository())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const SelectExpeditionTypePage()),
    ChildRoute('/conference', child: (_, args) => const ExpeditionPage()),
    ChildRoute('/select_activity', child: (_, args) => const SelectActivityPage()),
    ChildRoute('/select_client', child: (_, args) => const SelectClientPage()),
    ChildRoute('/select_route', child: (_, args) => const SelectRoutePage()),
    // ChildRoute('/type_expedition', child: (_, args) => const SelectExpeditionTypePage()),
    ChildRoute('/service_ticket', child: (_, args) => const ServiceTicketPage()),
    ChildRoute('/transport_ticket', child: (_, args) => const TransportTicketPage()),
  ];

}