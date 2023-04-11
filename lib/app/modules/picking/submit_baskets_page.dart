import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:central_stock_mobile/app/modules/picking/picking_store.dart';
import 'package:central_stock_mobile/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SubmitBasketsPage extends StatefulWidget {
  final String title;
  const SubmitBasketsPage({Key? key, this.title = 'SubmitBasketsPage'})
      : super(key: key);
  @override
  SubmitBasketsPageState createState() => SubmitBasketsPageState();
}

class SubmitBasketsPageState extends State<SubmitBasketsPage> {
  late final PickingStore store;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store = Modular.get<PickingStore>();
    store.getBasketOrder();
  }

  Widget _productsList(pd) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
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

  Widget screen(state) {
    inspect(state);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Pedido nº ${state['order']['uid']}",
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
                    "Data e hora: ${Utils.parseDate(state['order']['integrated_at'])}",
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
                    "Usuario: ${state['order']['agent']['full_name']}",
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
                    "Total de ${state['order']['products'].length} itens",
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: state['baskets'].map<Widget>((basket) {
                  return Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                              child: Image.asset(
                                'assets/images/cesta.jpg',
                                fit: BoxFit.scaleDown,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#${basket['uid']}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Total de itens ${basket['products'].length}",
                              style: TextStyle(color: Colors.black54)),
                          const SizedBox(
                            height: 5,
                          ),
                          basket['capacity'] <= basket['products'].length
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: const Text(
                                    "COMPLETA",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 2),
                                  ))
                              : Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: const Text(
                                    "PARCIAL",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 2),
                                  ))
                        ],
                      ))
                    ],
                  );
                }).toList(),
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Theme.of(context).highlightColor,
              ),
              onPressed: () {
                store.submit();
              },
              child: const Text(
                "ENVIAR",
                style: TextStyle(color: Colors.white),
              ))
        ]),
      ),
      body: ScopedBuilder(
        store: store,
        onError: (context, error) => Container(),
        onState: (context, Map state) => SingleChildScrollView(
            child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 10),
          child: screen(state),
        )),
        onLoading: (context) => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
