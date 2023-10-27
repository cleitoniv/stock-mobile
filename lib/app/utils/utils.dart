import 'package:flutter_modular/flutter_modular.dart';

class Utils {
  static void redirectFun(s) {
    switch (s['state']) {
      case 'selecting_basket':
      // print("tela não alterada automaticamente pois o switch foi desativado");
        Modular.to.pushNamed('/basket');
        break;
      case 'product_picking':
      // print("tela não alterada automaticamente pois o switch foi desativado");
        Modular.to.pushNamed('/picking');
        break;
      case 'submiting_baskets':
      // print("tela não alterada automaticamente pois o switch foi desativado");
        Modular.to.pushNamed('/picking/submit');
        break;
      case 'idle':
      // print("tela não alterada automaticamente pois o switch foi desativado");
        Modular.to.pushNamed('/home/');
        break;
    }
  }

  static String parseDate(s) {
    if (s == null) {
      return '';
    }
    var d = DateTime.parse(s);
    return "${d.day}/${d.month}/${d.year} ${d.hour}:${d.minute}:${d.second}";
  }
}
