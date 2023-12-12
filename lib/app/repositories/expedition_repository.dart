import 'dart:convert';
import 'package:central_stock_mobile/app/config/client_http.dart';
import 'package:central_stock_mobile/app/config/storage.dart';
import 'package:dio/dio.dart';

class ExpeditionRepository {
  final http = ClientHttp().getClient();

  Future<Response> expedClient(params) async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.get(
      "/api/agent/exped_clients?params=$params",
      data: jsonEncode(params),
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        },
      ),
    );
  }

  Future<Response> expedRoutes(params) async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.get(
      "/api/agent/exped_routes?params=$params",
      data: jsonEncode(params),
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        },
      ),
    );
  }

  Future<Response> expedOrder(params) async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return await http.get(
      "/api/agent/exped_order?params=$params",
      data: jsonEncode(params),
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        },
      ),
    );
  }

  Future<Response> expedActivities(params) async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.get(
      "/api/agent/exped_activities?params=$params",
      data: jsonEncode(params),
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        },
      ),
    );
  }

  Future<Response> genTicketRoute(param) async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.post(
      "/api/agent/gen_ticket_route",
      data: jsonEncode({'params': param}),
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        },
      ),
    );
  }

  Future<Response> genTicketClient(param) async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.post(
      "/api/agent/gen_ticket_client",
      data: jsonEncode({'params': param}),
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        },
      ),
    );
  }

  Future<Response> genTicketActivity(param) async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.post(
      "/api/agent/gen_ticket_activity",
      data: jsonEncode({'params': param}),
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        },
      ),
    );
  }
}
