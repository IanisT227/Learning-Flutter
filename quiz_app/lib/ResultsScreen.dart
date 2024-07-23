import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/QuestionsSummary.dart';
import 'package:quiz_app/data/questionsData.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onPlayAgainPressed});

  final List<String> chosenAnswers;
  final void Function() onPlayAgainPressed;


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
    final summaryData = getSummaryData();
    final int totalQuestionsNumber = questions.length;
    final int correctQuestionsNumber = summaryData.where((element) {
      return element['correct_answer'] == element['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                'You answered $correctQuestionsNumber out of $totalQuestionsNumber questions correctly!',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.white54,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
               onPlayAgainPressed();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restart_alt, color: Colors.white70,),
                  Text(
                    'Reset Game',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
