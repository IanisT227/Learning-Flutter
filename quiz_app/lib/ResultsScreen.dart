import 'package:flutter/material.dart';
import 'package:quiz_app/data/questionsData.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question_data': questions[i].questionText,
        'correct_answer': questions[i].answersText[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('You answered X out of Y questions correctly!'),
            const SizedBox(
              height: 30,
            ),
            Text('List of answers and questions'),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: Text('Play again!'),
            ),
          ],
        ),
      ),
    );
  }
}
