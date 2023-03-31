import 'dart:developer';

import 'package:central_stock_mobile/app/repositories/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, Map> {
  final HomeRepository repository;
  HomeStore({required this.repository}) : super({});

  getUser() async {
    setLoading(true);
    try {
      Response resp = await repository.currentUser();
      update(resp.data);
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
      update(resp.data);
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }
}
