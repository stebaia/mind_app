import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mind_app/utils/app_utils.dart';

class TextFeelingWidget extends StatelessWidget {
  const TextFeelingWidget({super.key, required this.mood});

  final int mood;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'You seem to be ',
            style: TextStyle(color: Colors.black),
            children: [
          TextSpan(
              text: DateConverter.getStatusByValueSlider(mood),
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(text: ' today!', style: TextStyle(color: Colors.black)),
        ]));
  }
}
