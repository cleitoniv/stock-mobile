import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:central_stock_mobile/app/modules/picking/picking_module.dart';
 
void main() {

  setUpAll(() {
    initModule(PickingModule());
  });
}