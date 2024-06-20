import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 142, 75, 197),
          foregroundColor: const Color.fromARGB(255, 210, 190, 241),
          fixedSize: const Size(300, 60),
        ),
        child: Text(answerText, textAlign: TextAlign.center,),),
      );
  }
}
