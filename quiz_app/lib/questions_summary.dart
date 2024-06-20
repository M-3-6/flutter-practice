import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  int calculateScore() {
      int score = 0;
      summaryData.forEach((data) {
        if (data['correct_answer'] == data['user_answer']) score++;
      });
      return score;
    }

  @override
  Widget build(context) {

    int totalQns = questions.length;

    int score = calculateScore();

    return Column(
      children: [
        Text('You answered $score out of $totalQns questions correctly!', style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
        Column(
        children: summaryData
            .map((data) => Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(((data['question_idx'] as int) + 1).toString() + ".", style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
                        Text(data['question'].toString(), style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,)
                      ],
                    ),
                    Text(data['correct_answer'].toString(), style: TextStyle(color: Colors.green),),
                    Text(data['user_answer'].toString(), style: TextStyle(color: Colors.white),),
              ],
            ))
            .toList(),
      ),]
    );
  }
}
