import 'package:flutter/material.dart';

Widget faceFeedback(int feedbackNumber, Color color) {
  switch (feedbackNumber) {
    case 1:
      {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/sad.gif",
              height: 150.0,
              width: 150.0,
            ),
            SizedBox(
              height: 20,
            ),
            textFaceState('Oggi mi sento molto triste :(', color),
          ],
        );
      }
    case 2:
      {
        return Column(children: [
          Image.asset(
            "assets/angry.gif",
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(
            height: 20,
          ),
          textFaceState('Uffa! vorrei spaccare tutto!', color),
        ]);
      }
    case 3:
      {
        return Column(children: [
          Image.asset(
            "assets/neutral.gif",
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(
            height: 20,
          ),
          textFaceState('Giornata abbastanza normale', color),
        ]);
      }
    case 4:
      {
        return Column(children: [
          Image.asset(
            "assets/happy.gif",
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(
            height: 20,
          ),
          textFaceState('Oggi è stata una bella giornata!', color),
        ]);
      }
    case 5:
      {
        return Column(children: [
          Image.asset(
            "assets/love.gif",
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(
            height: 20,
          ),
          textFaceState('Oggi sono veramente felice! :)', color),
        ]);
      }
    default:
      {
        return Column(children: [
          Image.asset(
            "assets/happy.gif",
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(
            height: 20,
          ),
          textFaceState('Oggi mi sento molto triste', color),
        ]);
      }
  }
}

Widget textFaceState(String description, Color color) {
  return Text(description,
      textAlign: TextAlign.center,
      style:
          TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color));
}
