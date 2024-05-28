import 'package:flutter/material.dart';
import 'GradientContainer.dart';

void main() {
  List<Color> colorsList = [Colors.deepPurple, Colors.purpleAccent, Colors.pinkAccent];
  runApp(
     MaterialApp(
      home: Scaffold(body: GradientContainer( colorsList)),
    ),
  );
}


