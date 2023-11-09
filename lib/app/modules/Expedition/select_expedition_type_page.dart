import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SelectExpeditionTypePage extends StatefulWidget {
  final String title;
  const SelectExpeditionTypePage(
      {Key? key, this.title = 'SelectExpeditionTypePage'})
      : super(key: key);
  @override
  SelectExpeditionTypePageState createState() =>
      SelectExpeditionTypePageState();
}

class SelectExpeditionTypePageState extends State<SelectExpeditionTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Row(
                    children: const [
                      Text(
                        "TIPO DE EXPEDIÇÃO",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Icon(
                      //   Icons.,
                      //   color: Colors.amber,
                      //   size: 35,
                      // )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    SizedBox(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                                color:
                                    //  Colors.black
                                    Theme.of(context).highlightColor)),
                            elevation: MaterialStateProperty.all<double>(0),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            minimumSize: MaterialStateProperty.all<Size>(
                                const Size(135, 130)),
                            maximumSize: MaterialStateProperty.all<Size>(
                                const Size(135, 130)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              const RoundedRectangleBorder(),
                            ),
                          ),
                          onPressed: () {
                            Modular.to.pushNamed('/select_activity',
                                arguments: {'selectedExped': 'distribuidor'});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Image.asset(
                                    'assets/images/distribuidor.png'),
                              ),
                              const Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Center(
                                  child: Text(
                                    "DISTRIBUIDOR",
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: OutlinedButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide(
                                  color: Theme.of(context).highlightColor)),
                              elevation: MaterialStateProperty.all<double>(0),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(135, 130)),
                              maximumSize: MaterialStateProperty.all<Size>(
                                  const Size(135, 130)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder())),
                          onPressed: () => Modular.to.pushNamed('/select_route')
                          // Modular.to.pushNamed('/conference')
                          ,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Image.asset('assets/images/rota.png'),
                              ),
                              const Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Center(
                                  child: Text(
                                    "ROTA",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
