import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/utils/app_utils.dart';

class DetailMoodPage extends StatelessWidget {
  const DetailMoodPage({super.key, required this.day});

  final Day day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            SizedBox(height: 60,),
            Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    IconButton(
                        icon: Icon(
                          CupertinoIcons.arrow_left,
                        ),
                        onPressed: () => context.popRoute()),
                    Text(
                      DateConverter.getDateString(day.day),
                      style:
                          TextStyle(fontSize:20, fontFamily: 'PoppinsExtrabold'),
                    ),
                    
                  ])),
          ]),
        ),
      ),
    );
  }
}