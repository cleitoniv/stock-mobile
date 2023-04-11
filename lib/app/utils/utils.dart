import 'package:flutter_modular/flutter_modular.dart';

class Utils {
  static void redirectFun(s) {
    switch (s['state']) {
      case 'selecting_basket':
        Modular.to.pushNamed('/basket');
        break;
      case 'product_picking':
        Modular.to.pushNamed('/picking');
        break;
      case 'submiting_baskets':
        Modular.to.pushNamed('/picking/submit');
        break;
      case 'idle':
        Modular.to.pushNamed('/home/');
        break;
    }
  }

  static String parseDate(s) {
    var d = DateTime.parse(s);
    return "${d.day}/${d.month}/${d.year} ${d.hour}:${d.minute}:${d.second}";
  }
}
