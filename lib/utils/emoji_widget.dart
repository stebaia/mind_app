import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget leftTitleWidgets(double value, TitleMeta meta, Color color) {
  final style = TextStyle(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '😔';
      break;

    case 3:
      text = '😕';
      break;

    case 5:
      text = '😁';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}

Widget leftTitleWidgetsText(double value) {
  final style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '😔';
      break;

    case 3:
      text = '😕';
      break;

    case 5:
      text = '😁';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}
