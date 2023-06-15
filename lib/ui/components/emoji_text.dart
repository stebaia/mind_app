import 'package:flutter/material.dart';

class EmojyTextWidget extends StatelessWidget {
  EmojyTextWidget({super.key, required this.mood});

  int mood; 



  @override
  Widget build(BuildContext context) {
    switch (mood) {
      case 1:
      return Text('😔', style: TextStyle(fontSize: 40),);
      case 2:
      return Text('🙁', style: TextStyle(fontSize: 40),);
      case 3:
      return Text('😕', style: TextStyle(fontSize: 40),);
      case 4:
      return Text('😌', style: TextStyle(fontSize: 40),);
      case 5:
      return Text('😊', style: TextStyle(fontSize: 40),);
      default: return Text('😊', style: TextStyle(fontSize: 40),);
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