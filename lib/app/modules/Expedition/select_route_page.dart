import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'expedition_store.dart';

class SelectRoutePage extends StatefulWidget {
  final String title;
  const SelectRoutePage({Key? key, this.title = 'SelectRoutePage'})
      : super(key: key);
  @override
  SelectRoutePageState createState() => SelectRoutePageState();
}

class SelectRoutePageState extends State<SelectRoutePage> {
  late final ExpeditionStore expedStore;
  var selectedItems = [];
  bool selectedValue = false;
  var selectedRoute = '';
  var items = [];
  
  @override
  void initState() {
    super.initState();
    expedStore = Modular.get<ExpeditionStore>();
  }

  @override
  void dispose() {
    Modular.dispose<ExpeditionStore>();
    super.dispose();
  }
  
   routes(params) async {
    var order = await expedStore.getExpedRoutes(params);
    print('acessando aqui %%%%%%');
    print(order);
    setState(() {
      items = order;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (items.isEmpty) {
      routes(selectedRoute);
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // children: const [],
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 70,
                        child: Align(
                          alignment: Alignment.center,
                          heightFactor: 4,
                          child: Image.asset(
                            'assets/images/logo_alinhada.png',
                            fit: BoxFit.scaleDown,
                          ),
                        ))
                  ],
                ),
                const Divider(
                  height: 80,
                )
              ]),
          Container(
            // padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(12.0),
                border: Border.all(width: 1)),
            child: SizedBox(
              height: 170,
              width: 200,
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: false,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Material(
                      child: ListTile(
                          dense: true,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                          ),
                          selected: selectedItems.contains(items[index]),
                          selectedTileColor:
                              const Color.fromARGB(255, 34, 218, 231),
                          title: Text(
                            maxLines: 1,
                            "${items[index]}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          onTap: () {
                            setState(() {
                              selectedRoute = items[index];
                            });
                            if (items.isEmpty) {
                              routes(selectedRoute);
                            }
                            selectedItems.contains(items[index])
                                ? selectedItems.remove(items[index])
                                : selectedItems.add(items[index]);

                            if (selectedItems.isNotEmpty && items[index] != selectedItems.first) {
                              setState(() {
                                selectedValue =
                                    selectedItems.contains(items[index]);
                                selectedItems.isNotEmpty
                                    ? selectedItems.remove(selectedItems.first)
                                    : print('item ja selecionado');
                              });
                            }
                             else if (selectedItems.isEmpty) {
                              print("item selecionado");
                              print(selectedItems);
                              setState(() {
                                selectedValue = false;
                              });
                            } else {
                              setState(() {
                                print('item ja selecionado else');
                                selectedValue =
                                    selectedItems.contains(items[index]);
                              });
                            }
                          }),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 170,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:selectedRoute == '' || selectedItems.isEmpty ? Colors.grey : Colors.cyan,
              fixedSize: const Size(180, 35),
            ),
            onPressed: selectedRoute == '' || selectedItems.isEmpty ? () {
                print(selectedRoute);
            } : () {
              Modular.to.pushNamed('/select_activity', arguments: {'selectedRoute': selectedRoute, 'selectedExped': 'rota'});
            },
            child: const Text(
              'Conferencia',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
              fixedSize: const Size(180, 35),
            ),
            onPressed: selectedRoute.isEmpty ? () { } : () {
              Modular.to.pushNamed('/transport_ticket',
                  arguments: {'selectedValue': selectedRoute});
            },
            child: const Text(
              'GERAR ETIQUETA',
              style: TextStyle(color: Colors.white),
              //
            ),
          )
        ],
      ),
    );
  }
}
