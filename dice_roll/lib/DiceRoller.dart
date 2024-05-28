import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  int activeDiceImage = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/dice-$activeDiceImage.png",
          width: 200,
        ),
        const SizedBox(
          height: 40.0,
        ),
        TextButton(
            onPressed: clickHandler,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20.0),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28.0),
            ),
            child: const Text("Roll dice"))
      ],
    );
  }

  void clickHandler() {
    setState(() {
      activeDiceImage = Random().nextInt(6)+1;
    });
  }
}
