import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
            width: 300,
            color: const Color.fromARGB(200, 181, 142, 218),
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 181, 142, 218),
              fontSize: 24
            ),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.play_arrow),
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 198, 161, 233),
            ),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
