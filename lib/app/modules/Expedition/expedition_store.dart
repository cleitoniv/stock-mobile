import 'package:central_stock_mobile/app/repositories/expedition_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../utils/utils.dart';

class ExpeditionStore extends NotifierStore<Exception, Map> {

  final ExpeditionRepository repository;
  ExpeditionStore({required this.repository}) : super({});

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