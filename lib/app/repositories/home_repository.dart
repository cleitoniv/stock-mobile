import 'dart:convert';

import 'package:central_stock_mobile/app/config/client_http.dart';
import 'package:central_stock_mobile/app/config/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeRepository {
  final http = ClientHttp().getClient();

  Future<Response> currentUser() async {
    final store = new SecureStorage();
    Map auth = await store.readAll();
    return http.get("/api/agent/current_user",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        }));
  }

  Future<Response> start() async {
    final store = new SecureStorage();
    Map auth = await store.readAll();
    return http.post("/api/agent/start",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        }));
  }
}
