import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectAnswer, super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currIdx = 0;

  void answerQn(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currIdx += 1;
    });
  }

  @override
  Widget build(context) {
    var question = questions[currIdx];

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              question.question,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 215, 185, 243), fontSize: 24)),
            ),
            const SizedBox(
              height: 30,
            ),
            ...question.answers.map((answer) => AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQn(answer);
                }))
          ],
        ),
      ),
    );
  }
}
