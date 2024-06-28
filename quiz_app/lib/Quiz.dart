import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/QuestionsScreen.dart';
import 'package:quiz_app/ResultsScreen.dart';
import 'package:quiz_app/data/questionsData.dart';

import 'StartScreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "START_SCREEN";
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = "QUESTIONS_SCREEN";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "RESULTS_SCREEN";
        selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget;
    if (activeScreen == "START_SCREEN") {
      screenWidget = StartScreen((switchScreen));
    } else if (activeScreen == "QUESTIONS_SCREEN") {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurple, Colors.deepPurpleAccent],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
