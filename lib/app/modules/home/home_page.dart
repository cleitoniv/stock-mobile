// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:central_stock_mobile/app/widgets/drawer_widget.dart';
import 'package:central_stock_mobile/app/widgets/user/packages_widget.dart';
import 'package:central_stock_mobile/app/widgets/user/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Inicio'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    store.getUser();
  }

  @override
  void dispose() {
    Modular.dispose<HomeStore>();
    super.dispose();
  }

  Widget screen(Map state) {
    print("36");
    if (state.isEmpty) {
      return Container();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                  child: Row(
                children: [
                  Text(
                    "Ola, ${state['data']['full_name']}!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.waving_hand_outlined,
                    color: Colors.amber,
                    size: 35,
                  )
                ],
              )),
            ),
            Expanded(
              flex: 7,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: OutlinedButton(
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(
                              color: Theme.of(context).highlightColor)),
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          minimumSize:
                              MaterialStateProperty.all<Size>(Size(150, 150)),
                          maximumSize:
                              MaterialStateProperty.all<Size>(Size(150, 150)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(200)))),
                      onPressed: () => store.start(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.play_arrow,
                            size: 60,
                            color: Color(0xff36AFC6),
                          ),
                          const Text(
                            "COMEÇAR",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: Color(0xff36AFC6)),
                          )
                        ],
                      ))),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButtonLocation: ExpandableFab.location,
        // floatingActionButton: ExpandableFab(
        //   overlayStyle: null,
        //   backgroundColor: Theme.of(context).highlightColor,
        //   closeButtonStyle: ExpandableFabCloseButtonStyle(
        //       backgroundColor: Theme.of(context).highlightColor),
        //   children: [
        //     OutlinedButton(
        //         style: OutlinedButton.styleFrom(
        //             side: BorderSide(color: Theme.of(context).highlightColor)),
        //         onPressed: () {},
        //         child: Text(
        //           "Minhas Ordens",
        //           style: TextStyle(
        //               color: Theme.of(context).highlightColor,
        //               fontSize: 18,
        //               fontWeight: FontWeight.w700),
        //         )),
        //   ],
        // ),
        drawer: const DrawerWidget(),
        body: ScopedBuilder(
          store: store,
          onError: ((context, error) => Center(
                child: Text("Erro no processamento dos dados!"),
              )),
          onLoading: (context) => Center(child: CircularProgressIndicator()),
          onState: (context, Map state) => SafeArea(child: screen(state)),
        ));
  }
}
