import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Slidy',
      theme: ThemeData(
          primaryColor: Color(0xff56B952),
          highlightColor: Color(0xff36AFC6),
          scaffoldBackgroundColor: Colors.white,
          splashColor: Color(0xffEFC75E),
          dividerColor: Colors.transparent,
          textTheme: TextTheme(
              displaySmall: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500))),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
