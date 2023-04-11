import 'package:central_stock_mobile/app/repositories/picking_repository.dart';
import 'package:central_stock_mobile/app/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PickingStore extends NotifierStore<Exception, Map> {
  final PickingRepository repository;
  PickingStore({required this.repository}) : super({});

  pick(serie) async {
    try {
      Response resp = await repository.pick(serie);
      if (resp.statusCode == 200) {
        resp = await repository.getOrder();
        if (resp.data['data']['agent']['state'] != 'product_picking') {
          Utils.redirectFun(resp.data['data']['agent']);
        } else {
          update(resp.data['data']);
        }
      } else {
        setError(Exception("Erro na separacao"));
      }
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  submit() async {
    setLoading(true);
    try {
      Response resp = await repository.submit();
      Utils.redirectFun(resp.data['data']['agent']);
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  getBasketOrder() async {
    setLoading(true);
    try {
      Response resp = await repository.getBasketOrder();
      update(resp.data['data']);
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  getOrder() async {
    setLoading(true);
    try {
      Response resp = await repository.getOrder();
      update(resp.data['data']);
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }
}
