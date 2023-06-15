import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/ui/components/emoji_text.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/theme_helper.dart';

class DateSelectedElementWidget extends StatelessWidget {
  DateSelectedElementWidget({super.key, required this.day});
  final Day day;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        height: 130,
        width: 80,
        decoration: BoxDecoration(
            color: ThemeHelper.buttonSecondaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          SizedBox(
            height: 4,
          ),
          //Text(DateConverter.getMonthByDate(days[index].day,), style: TextStyle(color: Colors.white,  fontSize: 12),),
          Text(
            DateConverter.getDayName(
              day.day,
            ),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),

          Text(
            DateConverter.getDayNumber(
              day.day,
            ),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          EmojyTextWidget(mood: day.mood)
        ]));
  }
}

class DateUnSelectedElementWidget extends StatelessWidget {
  DateUnSelectedElementWidget({super.key, required this.day});
  final Day day;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        height: 130,
        width: 80,
        decoration: BoxDecoration(
            color: ThemeHelper.colorSemiWhite,
            borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          SizedBox(
            height: 4,
          ),
          //Text(DateConverter.getMonthByDate(days[index].day,), style: TextStyle(color: Colors.white,  fontSize: 12),),
          Text(
            DateConverter.getDayName(
              day.day,
            ),
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          ),

          Text(
            DateConverter.getDayNumber(
              day.day,
            ),
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          EmojyTextWidget(mood: day.mood)
        ]));
  }
}
