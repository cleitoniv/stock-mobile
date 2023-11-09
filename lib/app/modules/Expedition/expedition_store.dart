import 'package:central_stock_mobile/app/repositories/expedition_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../utils/utils.dart';

class ExpeditionStore extends NotifierStore<Exception, Map> {

  final ExpeditionRepository repository;
  ExpeditionStore({required this.repository}) : super({});

  getExpedActivities(params) async {
    setLoading(true);
    try {
      Response resp = await repository.expedActivities(params);
      print("16");
      print(resp);
      Utils.redirectFun(resp.data['data']);
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  Future getExpedRoutes(params) async {
    setLoading(true);
    try {
      Response resp = await repository.expedRoutes(params);
      print("30");
      print(resp);
      // Utils.redirectFun(resp.data['data']);
      return resp.data['data'];
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  getExpedClients(params) async {
    setLoading(true);
    try {
      Response resp = await repository.expedClient(params);
      print("44");
      print(resp);
      Utils.redirectFun(resp.data['data']);
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  Future getExpedOrder(params) async {
    setLoading(true);
    try {
      Response resp = await repository.expedOrder(params);
      print(resp.data['data']);
     return resp.data['data'];
     
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

}