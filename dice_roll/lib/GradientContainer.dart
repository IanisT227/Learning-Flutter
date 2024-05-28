import 'dart:math';

import 'package:dice_roll/DiceRoller.dart';
import 'package:dice_roll/StyledText.dart';
import 'package:flutter/material.dart';

const Alignment startAlignment = Alignment.topCenter;

class GradientContainer extends StatelessWidget {
   GradientContainer( this.colorsList, {super.key});

  final List<Color> colorsList;
   int activeDiceImage = 1;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorsList,
          begin: startAlignment,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: DiceRoller()
      ),
    );
  }
}
