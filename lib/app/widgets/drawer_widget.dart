import 'package:central_stock_mobile/app/widgets/user/profile_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final String title;
  const DrawerWidget({Key? key, this.title = "DrawerWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [const DrawerHeader(child: UserProfileWidget())],
      ),
    );
  }
}
