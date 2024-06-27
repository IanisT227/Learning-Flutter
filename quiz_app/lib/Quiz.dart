import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/QuestionsScreen.dart';

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


  void switchScreen() {
    setState(() {
      activeScreen = "QUESTIONS_SCREEN";
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget = activeScreen == "START_SCREEN"
        ? StartScreen((switchScreen))
        : const QuestionsScreen();

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
