import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QuestionsSummary(summaryData: summary),
            TextButton.icon(icon: const Icon(Icons.restart_alt_sharp), onPressed: () {}, label: const Text('Restart Quiz', style: TextStyle(color: Color.fromARGB(255, 155, 112, 226)),))
          ],
        )));
    
  }
}