import 'package:central_stock_mobile/app/modules/picking/picking_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SuccessPage extends StatefulWidget {
  final String title;
  const SuccessPage({Key? key, this.title = 'SuccessPage'}) : super(key: key);
  @override
  SuccessPageState createState() => SuccessPageState();
}

class SuccessPageState extends State<SuccessPage> {
  late final PickingStore store;

  @override
  void initState() {
    // TODO: implement initState
    store = Modular.get<PickingStore>();
    Future.delayed(Duration(seconds: 5), () {
      Modular.to.pushNamed('/home/');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              size: 80,
              color: Colors.green,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Pedido separado com sucesso!")
          ],
        )
      ]),
    );
  }
}
