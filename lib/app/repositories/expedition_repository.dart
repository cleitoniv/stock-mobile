import 'dart:convert';
import 'package:central_stock_mobile/app/config/client_http.dart';
import 'package:central_stock_mobile/app/config/storage.dart';
import 'package:dio/dio.dart';

class ExpeditionRepository {
  final http = ClientHttp().getClient();

  Future<Response> expedClient(params) async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.post(
      "/api/agent/exped_clients",
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
    return http.post(
      "/api/agent/exped_activities",
      data: jsonEncode(params),
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        },
      ),
    );
  }

  // Future<Response> currentUser() async {
  //   final store = new SecureStorage();
  //   Map auth = await store.readAll();
  //   return http.get("/api/agent/current_user",
  //       options: Options(headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer ${auth['auth']}"
  //       }));
  // }

  // Future<Response> start() async {
  //   final store = new SecureStorage();
  //   Map auth = await store.readAll();
  //   return http.post("/api/agent/start",
  //       options: Options(headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer ${auth['auth']}"
  //       }));
  // }
}
