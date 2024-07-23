import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  Color getAnswerColor(Map<String, Object> dataElement) {
    return dataElement['user_answer'] == dataElement['correct_answer']
        ? Colors.lightBlueAccent
        : Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (dataElement) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: getAnswerColor(dataElement)
                    ),
                    margin: EdgeInsets.only(right: 8.0),
                    child: Text(
                      ((dataElement['question_index'] as int) + 1).toString(),
                      style:GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ) ,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dataElement['question_data'] as String,
                            style: GoogleFonts.montserrat(
                              color: Colors.white70,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(dataElement['user_answer'] as String,
                            style: GoogleFonts.montserrat(
                              color: getAnswerColor(dataElement),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(dataElement['correct_answer'] as String,
                            style: GoogleFonts.montserrat(
                              color: Colors.lightBlueAccent,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
