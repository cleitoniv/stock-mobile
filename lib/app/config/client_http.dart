import 'package:central_stock_mobile/app/config/constants.dart';
import 'package:dio/dio.dart';

class ClientHttp {
  Dio dio = Dio();
  String _currentToken = '';

  ClientHttp() {
    dio.options.baseUrl = API;
    dio.options.connectTimeout = Duration(seconds: 30);
    dio.options.receiveTimeout = Duration(seconds: 30);
  }

  Dio getClient() => dio;
}
