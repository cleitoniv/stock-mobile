import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SelectActivityPage extends StatefulWidget {
  final String title;
  const SelectActivityPage({Key? key, this.title = 'SelectActivityPage'}) : super(key: key);
  @override
  SelectActivityPageState createState() => SelectActivityPageState();
}
class SelectActivityPageState extends State<SelectActivityPage> {
  var selectedItems = [];
  bool selectedValue = false;
  var selectedRoute = '';
  // var items = [
  //   'SP MOTOBOY - 1',
  //   'SP MOTOBOY - 2',
  //   'SP MOTOBOY - 3',
  //   'SP MOTOBOY - 4',
  //   'SP SEDEX'
  // ];
  
  var items = {
    'rota': [
    'SP MOTOBOY - 1',
    'SP MOTOBOY - 2',
    'SP MOTOBOY - 3',
    'SP MOTOBOY - 4',
    'SP SEDEX'
  ],'distribuidor': [
    'CRYSTAL',
    'ESTRELA',
    'PRIME'
  ]
  };
  // var items = 'ES Motoboy';

  @override
  Widget build(BuildContext context) {
    final typeExped =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
        print(typeExped);
        print(items[typeExped['selectedExped']]);
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
                  itemCount: items[typeExped['selectedExped']]?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Material(
                      child: ListTile(
                          dense: true,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                          ),
                          selected: selectedItems.contains(items[typeExped['selectedExped']]![index]),
                          selectedTileColor:
                              const Color.fromARGB(255, 34, 218, 231),
                          title: Text(
                            maxLines: 1,
                            items[typeExped['selectedExped']]![index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          onTap: () {
                            setState(() {
                              selectedRoute = items[typeExped['selectedExped']]![index];
                            });
                            selectedItems.contains(items[typeExped['selectedExped']]![index])
                                ? selectedItems.remove(items[typeExped['selectedExped']]![index])
                                : selectedItems.add(items[typeExped['selectedExped']]![index]);
                            // print(selectedValue);
                            // print(items[typeExped['selectedExped']]![index]);
                            if (items[typeExped['selectedExped']]![index] != selectedItems[0]) {
                              setState(() {
                                selectedValue =
                                    selectedItems.contains(items[typeExped['selectedExped']]![index]);
                                selectedItems.isNotEmpty
                                    ? selectedItems.remove(selectedItems[0])
                                    : print('item ja selecionado');
                              });
                            } else if (items[typeExped['selectedExped']]![index] == selectedItems[0]) {
                              setState(() {
                                selectedValue = false;
                              });
                            } else {
                              setState(() {
                                print('item ja selecionado else');
                                selectedValue =
                                    selectedItems.contains(items[typeExped['selectedExped']]![index]);
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
            height: 200,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
              fixedSize: const Size(180, 35),
            ),
             onPressed: typeExped['selectedExped'] == 'rota' ? selectedRoute.isNotEmpty ? () {
              Modular.to.pushNamed('/select_client',
                  arguments: {'selectedValue': selectedRoute});
            } : () { print('selecione um item');} : selectedRoute.isNotEmpty ? () {
              print(typeExped);
              print('mudando de pagina');
              Modular.to.pushNamed('/conference', arguments: {'selectedValue': selectedRoute, 'selectedExped': typeExped['selectedExped']});
            } : () { print('selecione um item');},
            child: const Text(
              'Conferência',
              style: TextStyle(color: Colors.white),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          
        ],
      ),
    );
  }
}