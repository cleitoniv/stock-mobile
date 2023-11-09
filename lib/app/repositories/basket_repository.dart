import 'dart:convert';

import 'package:central_stock_mobile/app/config/client_http.dart';
import 'package:central_stock_mobile/app/config/storage.dart';
import 'package:dio/dio.dart';

class BasketRepository {
  final http = ClientHttp().getClient();

  Future<Response> select(uid) async {
    final storage = new SecureStorage();
    Map auth = await storage.readAll();
    return http.post(
      "/api/agent/select_basket",
      data: jsonEncode({'basket_uid': uid}),
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${auth['auth']}"
        },
      ),
    );
  }
}
