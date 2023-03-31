import 'package:flutter/material.dart';

class PickingPage extends StatefulWidget {
  final String title;
  const PickingPage({Key? key, this.title = 'PickingPage'}) : super(key: key);
  @override
  PickingPageState createState() => PickingPageState();
}
class PickingPageState extends State<PickingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}