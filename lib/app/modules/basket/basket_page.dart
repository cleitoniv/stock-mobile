import 'package:central_stock_mobile/app/modules/basket/basket_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BasketPage extends StatefulWidget {
  final String title;
  const BasketPage({Key? key, this.title = 'BasketPage'}) : super(key: key);
  @override
  BasketPageState createState() => BasketPageState();
}

class BasketPageState extends State<BasketPage> {
  String basketUid = '';
  late final BasketStore store;
  MobileScannerController controller = MobileScannerController();

  @override
  void initState() {
    super.initState();
    controller.stop();
    store = Modular.get<BasketStore>();
  }

  @override
  void dispose() {
    Modular.dispose<BasketStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(bottom: 50),
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Stack(children: [
                    MobileScanner(
                      controller: controller,
                      errorBuilder: (context, error, child) {
                        controller.stop();
                        controller.start();
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      // fit: BoxFit.contain,
                      onDetect: (capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        for (final barcode in barcodes) {
                          if (barcode.rawValue != basketUid) {
                            setState(() {
                              basketUid = barcode.rawValue ?? '';
                            });
                            FlutterBeep.beep();
                          }
                        }
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green, width: 2)),
                                child: Container()),
                          ],
                        )
                      ],
                    )
                  ]),
                ),
                Container(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                      child: Image.asset(
                        'assets/images/cesta.jpg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),
                    basketUid != ''
                        ? Text(
                            '#${basketUid}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54),
                          )
                        : Container()
                  ],
                )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 45),
                      backgroundColor: Theme.of(context).highlightColor,
                    ),
                    onPressed: () {
                      store.select(basketUid);
                    },
                    child: const Text(
                      "Selecionar",
                      style: TextStyle(fontSize: 16),
                    ))
              ])),
    );
  }
}
