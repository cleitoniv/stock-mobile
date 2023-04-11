import 'dart:developer';

import 'package:central_stock_mobile/app/repositories/home_repository.dart';
import 'package:central_stock_mobile/app/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, Map> {
  final HomeRepository repository;
  HomeStore({required this.repository}) : super({});

  getUser() async {
    setLoading(true);
    try {
      Response resp = await repository.currentUser();
      if (resp.data['data']['state'] != 'idle') {
        Utils.redirectFun(resp.data['data']);
      } else {
        update(resp.data);
      }
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  start() async {
    setLoading(true);
    try {
      Response resp = await repository.start();
      print(resp.data);
      Utils.redirectFun(resp.data['data']['agent']);
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }
}
