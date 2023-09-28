import 'package:flutter/material.dart';

class EmojyTextWidget extends StatelessWidget {
  EmojyTextWidget({super.key, required this.mood, required this.size,required this.color});

  int mood; 
  Color color;
  double size;

  @override
  Widget build(BuildContext context) {
    switch (mood) {
      case 1:
      return Text('😔', style: TextStyle(fontSize: size),);
      case 2:
      return Text('🙁', style: TextStyle(fontSize: size),);
      case 3:
      return Text('😕', style: TextStyle(fontSize: size),);
      case 4:
      return Text('😌', style: TextStyle(fontSize: size),);
      case 5:
      return Text('😊', style: TextStyle(fontSize: size),);
      default: return Text('😊', style: TextStyle(fontSize: size, color: color),);
    }
  }
}

String moodToString(int mood){
  switch (mood) {
      case 1:
      return 'very bad';
      case 2:
      return 'bad';
      case 3:
      return 'normal';
      case 4:
      return 'good';
      case 5:
      return 'awesome';
      default: return 'awesome';
    }
}