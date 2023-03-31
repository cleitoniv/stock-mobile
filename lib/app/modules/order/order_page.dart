// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderPage extends StatefulWidget {
  final String title;
  final int id;
  // ignore: use_key_in_widget_constructors
  const OrderPage({required this.id, this.title = 'OrderPage'});
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  Widget renderAddress(data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_constructors
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 35,
                      color: Colors.red,
                    )
                  ],
                )
              ],
            )),
        Expanded(
          flex: 20,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Endereço de entrega",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Escadaria Santa Clara, Nº 105"),
                    const Text("Bairro Conquista, Anexo Larikas Bar"),
                    const Text("Vitória - ES")
                  ],
                )
              ],
            )
          ]),
        )
      ],
    );
  }

  Widget renderClient(data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_constructors
                  children: [
                    const Icon(
                      Icons.person_pin,
                      size: 35,
                      color: Colors.blue,
                    )
                  ],
                )
              ],
            )),
        Expanded(
          flex: 20,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Cliente",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Escadaria Santa Clara, Nº 105"),
                    const Text("Bairro Conquista, Anexo Larikas Bar"),
                    const Text("Vitória - ES")
                  ],
                )
              ],
            )
          ]),
        )
      ],
    );
  }

  Widget renderItens(data) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                CachedNetworkImage(
                    width: 100,
                    height: 100,
                    imageUrl: 'http://187.64.129.117/images/039C.jpg')
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
                  const Text(
                    "SILIDROGEL TORICA CX 6",
                    style: TextStyle(
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
        Row(
          children: [
            Column(
              children: [
                CachedNetworkImage(
                    width: 100,
                    height: 100,
                    imageUrl: 'http://187.64.129.117/images/010C.jpg')
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
                  const Text(
                    "BIOVIEW TORICA CX 6",
                    style: TextStyle(
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
        )
      ],
    );
  }

  Widget actionButtons(data) {
    return Column(
      children: [
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(220, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                        side: BorderSide(color: Colors.blueGrey)))),
            onPressed: () {
              Modular.to.pushNamed('/sign/', arguments: {'id': 123456});
            },
            child: Text('ENTREGAR')),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(220, 50)),
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).highlightColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                        side: BorderSide(
                            color: Theme.of(context).highlightColor)))),
            onPressed: () {},
            child: const Text('TRANSFERIR'))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: Colors.blueGrey,
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Modular.to.pop();
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Pedido nº ${widget.id}',
            style: const TextStyle(
                color: Colors.blueGrey, fontWeight: FontWeight.w700),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  children: [
                    renderAddress({}),
                    const SizedBox(
                      height: 25,
                    ),
                    renderClient({}),
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Divider(
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: renderItens({}),
                    ),
                  ],
                )),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height * 0.15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [actionButtons({})],
              ),
            )
          ],
        ));
  }
}
