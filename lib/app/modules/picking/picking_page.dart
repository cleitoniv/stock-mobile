import 'package:cached_network_image/cached_network_image.dart';
import 'package:central_stock_mobile/app/modules/picking/picking_store.dart';
import 'package:central_stock_mobile/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class PickingPage extends StatefulWidget {
  final String title;
  const PickingPage({Key? key, this.title = 'PickingPage'}) : super(key: key);
  @override
  PickingPageState createState() => PickingPageState();
}

class PickingPageState extends State<PickingPage> {
  late final PickingStore store;
  bool alocatedType = false;
  String? barcode = '';
  MobileScannerController controller = MobileScannerController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store = Modular.get<PickingStore>();
    store.getOrder();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget _productsList(state) {
    print(state['products'].length);
    List pd = state['products']
        .where((p) => p['is_alocated'] == alocatedType)
        .toList();

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.vertical,
        itemCount: pd.length,
        itemBuilder: ((context, index) {
          Map product = pd[index];
          return Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      CachedNetworkImage(
                          width: 100,
                          height: 100,
                          imageUrl: product['image_url'])
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontWeight: FontWeight.w800),
                        ),
                        const Text(
                          "sku: 039C00000101",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }));
  }

  Widget _filterButton() {
    List pendents =
        store.state['products'].where((p) => p['is_alocated'] != true).toList();
    List separated =
        store.state['products'].where((p) => p['is_alocated'] == true).toList();
    return Row(
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                alocatedType = !alocatedType;
              });
            },
            child: Row(children: [
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      const Text(
                        "Pendentes",
                      ),
                      !alocatedType
                          ? Icon(Icons.keyboard_arrow_up)
                          : Container(
                              height: 20,
                            )
                    ],
                  )),
              const SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.red,
                child: Text(
                  "${pendents.length}",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ])),
        TextButton(
            onPressed: () {
              setState(() {
                alocatedType = !alocatedType;
              });
            },
            child: Row(children: [
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      const Text(
                        "Separados",
                      ),
                      alocatedType
                          ? Icon(Icons.keyboard_arrow_up)
                          : Container(
                              height: 20,
                            )
                    ],
                  )),
              const SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green,
                child: Text(
                  "${separated.length}",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]))
      ],
    );
  }

  Widget screen(Map state) {
    if (state.isEmpty) {
      return Container();
    }

    print(state);

    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 30, bottom: 20, left: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Pedido nº ${state['uid']}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.black54),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Data e hora: ${Utils.parseDate(state['integrated_at'])}",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Usuario: ${state['agent']['full_name']}",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Total de ${state['products'].length} itens",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            )
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        height: MediaQuery.of(context).size.height / 2,
        child: Stack(children: [
          MobileScanner(
            controller: controller,
            errorBuilder: (context, error, child) {
              controller.stop();
              controller.start();
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            // fit: BoxFit.contain,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final code in barcodes) {
                if (code.rawValue != barcode) {
                  setState(() {
                    barcode = code.rawValue;
                  });
                  // FlutterRingtonePlayer.play(
                  //   android: AndroidSounds.notification,
                  //   ios: IosSounds.glass,
                  // );
                  FlutterBeep.beep();
                  store.pick(code.rawValue);
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
                          border: Border.all(color: Colors.green, width: 2)),
                      child: Container()),
                ],
              )
            ],
          )
        ]),
      ),
      const Divider(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 30),
              child: const Text(
                "Produtos",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),
              )),
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: _filterButton(),
          )
        ],
      ),
      const Divider(
        color: Colors.black26,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30),
        child: _productsList(state),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedBuilder(
        store: store,
        onError: (context, error) => Container(),
        onState: (context, Map state) => SingleChildScrollView(
            padding: EdgeInsets.only(top: 40), child: screen(state)),
        onLoading: (context) => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
