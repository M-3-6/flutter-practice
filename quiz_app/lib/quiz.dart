import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  
  // Widget? activeScreen;
  var activeScreenStr = "start-screen";
  List<String> selectedAnswers = [];

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i< selectedAnswers.length; i++) {
      summary.add(
      {
        'question_idx': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      }
    );
    } 
    return summary;
  }
  
  // @override
  // void initState() {   
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      // activeScreen = const QuestionsScreen();
      activeScreenStr = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (questions.length ==  selectedAnswers.length) {
      setState(() {
      activeScreenStr = "result-screen";
    });
    }
  }
  
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 58, 1, 110),
                  Color.fromARGB(255, 15, 0, 29),
                ],
              ),
              ),
              child: activeScreenStr == "start-screen" ? StartScreen(switchScreen) : activeScreenStr == "result-screen" ? ResultsScreen(summary: getSummaryData(),) : QuestionsScreen(onSelectAnswer: chooseAnswer))),
    );
  }
}
