import 'dart:convert';

import 'package:central_stock_mobile/app/config/client_http.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  final http = ClientHttp().getClient();

  Future<Response> login(username) async {
    return http.post("/api/agent/login",
        data: jsonEncode({
          'params': {'username': username}
        }),
        options: Options(headers: {"Content-Type": "application/json"}));
  }
}
