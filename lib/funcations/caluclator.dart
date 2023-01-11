import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class caluclator {
  final List buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  //check for the Opertator Buttons
  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '+' || x == '-' || x == '%' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  //
  //
  // function to calculate the input operation
  String equalPressed(String userInput, String answer) {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();

    return answer;
  }
}
