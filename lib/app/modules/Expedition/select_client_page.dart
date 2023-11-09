import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SelectClientPage extends StatefulWidget {
  final String title;
  const SelectClientPage({Key? key, this.title = 'SelectClientPage'}) : super(key: key);
  @override
  SelectClientPageState createState() => SelectClientPageState();
}
class SelectClientPageState extends State<SelectClientPage> {
  var selectedItems = [];
  bool selectedValue = false;
  var selectedRoute = '';
  var items = [
    'CLEITON MEIRELES',
    'PAULO MADEIRA',
    'ALBERTO BITTECOURT',
    'THIAGO BOEKER',
    'JESSE ALVES'
  ];
  // var items = 'ES Motoboy';

  @override
  Widget build(BuildContext context) {
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
                            items[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          onTap: () {
                            setState(() {
                              selectedRoute = items[index];
                            });
                            selectedItems.contains(items[index])
                                ? selectedItems.remove(items[index])
                                : selectedItems.add(items[index]);
                            print(selectedValue);
                            print(items[index]);
                            if (items[index] != selectedItems[0]) {
                              print('passando');
                              setState(() {
                                selectedValue =
                                    selectedItems.contains(items[index]);
                                selectedItems.isNotEmpty
                                    ? selectedItems.remove(selectedItems[0])
                                    : print('item ja selecionado');
                              });
                            } else if (items[index] == selectedItems[0]) {
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
              backgroundColor: Colors.cyan,
              fixedSize: const Size(180, 35),
            ),
            onPressed: () {
              Modular.to.pushNamed('/conference',
                  arguments: {'selectedValue': selectedRoute});
            },
            child: const Text(
              'Conferência',
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
            onPressed: () {
              Modular.to.pushNamed('/service_ticket',
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