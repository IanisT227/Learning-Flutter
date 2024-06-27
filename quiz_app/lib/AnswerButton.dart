import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 33, 1, 95),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  const AnswerButton(
      {required this.answerText, required this.onTap, super.key});
}
