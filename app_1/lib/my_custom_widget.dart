import 'package:flutter/material.dart';

class MyCustomWidget extends StatelessWidget {
  // MyCustomWidget(String text, {super.key}) : this.text = text;
  const MyCustomWidget(this.text, {super.key});
  final String text;

  @override
  Widget build(context) {
    return Text(text);
  }
}