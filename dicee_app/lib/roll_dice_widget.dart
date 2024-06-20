import 'dart:math';

import 'package:flutter/material.dart';

class RollDiceWidget extends StatefulWidget {
  const RollDiceWidget({super.key});

  @override
  State<RollDiceWidget> createState() {
    return _RollDiceWidgetState();
  }
}

class _RollDiceWidgetState extends State<RollDiceWidget> {
  var num = 1;
  void _rollDice() {
    setState(() {
      num = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/dice-$num.png',
              height: 100,
              width: 100,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            FilledButton(
              onPressed: _rollDice,
              child: const Text('Roll The Dice'),
              
            ),
          ],
        ),
      );
  }
}