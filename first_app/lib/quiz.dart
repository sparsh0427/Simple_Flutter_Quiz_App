import 'package:flutter/material.dart';

import './question.dart';

import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(//Custom Widget
            questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) { //answer is the element //Although we have passed List to map but we need to mention in explicitely
          return Answer(() => answerQuestion(answer['score']), answer['text']); // We are passing answerQuestion as anonymous function because we need to pass a parameter in that function also    // ... operator basically converts a nested list into individual elements
        }).toList() //toList() because map gives Iterable
      ],
    );
  }
}
