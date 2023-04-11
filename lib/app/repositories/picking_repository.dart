import 'dart:convert';

import 'package:central_stock_mobile/app/config/client_http.dart';
import 'package:central_stock_mobile/app/config/storage.dart';
import 'package:dio/dio.dart';

class PickingRepository {
  final http = ClientHttp().getClient();

  Future<Response> pick(serie) async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.post("/api/agent/picking",
        data: jsonEncode({'serie': serie}),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        }));
  }

  Future<Response> submit() async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.post("/api/agent/submit",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        }));
  }

  Future<Response> getBasketOrder() async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.get("/api/agent/basket_order",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        }));
  }

  Future<Response> getOrder() async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.get("/api/agent/active_order",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        }));
  }
}
