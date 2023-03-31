import 'dart:convert';
import 'dart:developer';
import 'package:central_stock_mobile/app/config/storage.dart';
import 'package:central_stock_mobile/app/repositories/login_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:central_stock_mobile/app/config/client_http.dart';
import 'package:central_stock_mobile/app/config/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class LoginStore extends NotifierStore<Exception, Map> {
  final LoginRepository repository;

  LoginStore({required this.repository}) : super({'value': 1, 'error': null});

  doLogin(username) async {
    setLoading(true);
    try {
      Response resp = await repository.login(username);
      if (resp.statusCode == 200) {
        // ignore: prefer_const_constructors
        final storage = SecureStorage();
        inspect(resp.data);
        await storage.writeSecureData("auth", resp.data["data"]);
        print("24");
        print(await storage.readAll());
        Modular.to.pushNamed('/home/');
      } else {
        update({...state, 'error': 'Login Ivalido'});
      }
    } on Exception catch (e) {
      update({...state, 'error': 'Login Ivalido'});
    } finally {
      setLoading(false);
    }
  }
}
