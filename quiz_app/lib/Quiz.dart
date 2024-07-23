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
      });
    }
  }

  void resetGame(){
    setState(() {
      selectedAnswers = [];
      activeScreen = "QUESTIONS_SCREEN";
    });
  }

  @override
  Widget build(BuildContext context) {
     Widget screenWidget = StartScreen((switchScreen));

     if (activeScreen == "QUESTIONS_SCREEN") {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
     if(activeScreen == "RESULTS_SCREEN") {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onPlayAgainPressed: resetGame,
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
