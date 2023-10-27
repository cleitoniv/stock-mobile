import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeInitialScreenPage extends StatefulWidget {
  final String title;
  const HomeInitialScreenPage({Key? key, this.title = 'HomeInitialScreenPage'})
      : super(key: key);
  @override
  HomeInitialScreenPageState createState() => HomeInitialScreenPageState();
}

class HomeInitialScreenPageState extends State<HomeInitialScreenPage> {
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
                        "Selecione a atividade",
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
                                color: Theme.of(context).highlightColor)),
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
                          onPressed: () => Modular.to.pushNamed('/home/'),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Flexible(
                                flex: 2,
                                child: Image.asset(
                                        'assets/images/Separador-icon.png')
                              ),
                              const Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Center(
                                  child: Text(
                                    "SEPARADOR",
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: Color(0xff36AFC6),
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
                          onPressed: () => Modular.to.pushNamed('/type_expedition'),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Flexible(
                                flex: 2,
                                child: 
                                Image.asset(
                                        'assets/images/Expedidor-icon.png')
                              ),
                              const Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Center(
                                  child: Text(
                                    "EXPEDIDOR",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                        color: Color(0xff36AFC6)),
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
