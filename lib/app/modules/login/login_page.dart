import 'package:central_stock_mobile/app/modules/login/login_store.dart';
import 'package:central_stock_mobile/app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'Autenticação'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  late final LoginStore store;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store = Modular.get<LoginStore>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Modular.dispose<LoginStore>();
    super.dispose();
  }

  Widget screen(state) {
    print(state);
    return Column(
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
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 260,
              child: Column(children: [
                TextFieldWidget(
                  controller: _username,
                  labelText: 'Usuario',
                ),
                const Divider(
                  height: 20,
                ),
              ]),
            )
          ],
        ),
        const Divider(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 45),
                  backgroundColor: Theme.of(context).highlightColor,
                ),
                onPressed: () {
                  store.doLogin(_username.text);
                },
                child: const Text(
                  "Acessar",
                  style: TextStyle(fontSize: 16),
                )),
          ],
        ),
        const Divider(
          height: 30,
        ),
        store.state['error'] != null
            ? const Text(
                "Usuario invalido!",
                style: TextStyle(color: Colors.red),
              )
            : Container()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).highlightColor),
        ),
      ),
      body: ScopedBuilder(
        store: store,
        onError: (context, error) => Container(),
        onState: (context, state) => screen(state),
        onLoading: (context) => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
