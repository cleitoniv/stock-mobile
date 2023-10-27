import 'package:central_stock_mobile/app/modules/Expedition/expedition_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ExpeditionPage extends StatefulWidget {
  final String title;
  const ExpeditionPage({Key? key, this.title = 'ExpeditionPage'})
      : super(key: key);
  @override
  ExpeditionPageState createState() => ExpeditionPageState();
}

class ExpeditionPageState extends State<ExpeditionPage> {
  String scannerUid = '';
  late final ExpeditionStore store;
  MobileScannerController controller = MobileScannerController();
  var dropdownvalue = '';
  var items = ['ES Motoboy', 'Sedex', 'MG Motoboy'];
  List selectedItems = [];
  var orderList = [
    {'pedido': '0501026738'},
    {'pedido': '0302065416'},
    {'pedido': '0501026740'},
    {'pedido': '0501026741'},
    {'pedido': '0501026742'},
    {'pedido': '0501026743'},
    {'pedido': '0501026744'},
    {'pedido': '0501026745'},
    {'pedido': '0501026746'},
    {'pedido': '0501026747'}
  ];

  @override
  void initState() {
    super.initState();
    controller.stop();
    // store = Modular.get<BasketStore>();
  }

  @override
  void dispose() {
    // Modular.dispose<BasketStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
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
                      if (barcode.rawValue != scannerUid) {
                        for (var i = 0; i < orderList.length; i++) {
                          if (!selectedItems.contains(barcode.rawValue) &&
                              orderList[i]['pedido']!
                                  .contains(barcode.rawValue as String)) {
                            selectedItems.add(barcode.rawValue);
                            setState(() {
                              selectedItems = selectedItems;
                            });
                          }
                        }

                        setState(() {
                          // selectedItems = selectedItems;
                          scannerUid = barcode.rawValue ?? '';
                        });
                        FlutterBeep.beep();
                      }
                      // print(scannerUid);
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
                                border:
                                    Border.all(color: Colors.green, width: 2)),
                            child: Container()),
                      ],
                    )
                  ],
                )
              ]),
            ),
            Text(
              'Nome: ${args['selectedValue']}',
              style: const TextStyle(
                  fontWeight: FontWeight.w900, color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total: ${orderList.length}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
                const SizedBox(
                  width: 120,
                ),
                Text(
                  'Escaneados: ${selectedItems.length}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.black),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 4)),
              child: SizedBox(
                height: 200,
                width: 250,
                child: ListView.builder(
                  itemExtent: 40,
                  padding: EdgeInsets.zero,
                  shrinkWrap: false,
                  itemCount: orderList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Material(
                      child: ListTile(
                        dense: true,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                        ),
                        selected:
                            selectedItems.contains(orderList[index]['pedido']),
                        selectedTileColor:
                            const Color.fromARGB(255, 102, 248, 168),
                        title: Text(
                          orderList[index]['pedido'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                        // onTap: () {

                        // },
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 45),
                backgroundColor: Theme.of(context).highlightColor,
              ),
              onPressed: () {
                print(selectedItems);
                print(scannerUid);
                // store.select(scannerUid);
              },
              child: const Text(
                "Gerar etiqueta",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
