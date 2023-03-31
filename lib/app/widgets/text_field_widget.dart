import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const TextFieldWidget({required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            labelText: this.labelText,
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).highlightColor)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).highlightColor)),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).highlightColor))),
        controller: controller);
  }
}
