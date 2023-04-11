import 'package:central_stock_mobile/app/repositories/basket_repository.dart';
import 'package:central_stock_mobile/app/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_triple/flutter_triple.dart';

class BasketStore extends NotifierStore<Exception, Map> {
  final BasketRepository repository;
  BasketStore({required this.repository}) : super({});

  select(uid) async {
    setLoading(true);
    try {
      Response resp = await repository.select(uid);
      print("14");
      print(resp);
      Utils.redirectFun(resp.data['data']['agent']);
    } on Exception catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }
}
