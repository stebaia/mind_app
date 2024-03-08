import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mind_app/app.dart';
import 'package:mind_app/utils/mock_mood_improvment.dart';

class MoodTipsListPage extends StatelessWidget {
  const MoodTipsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mood Tips'),
        ),
        body: ListView.builder(
          itemCount: moodImprovementTips.length,
          itemBuilder: (context, index) => ListTile(
            leading: Image.network(moodImprovementTips[index].imagePath),
            title: Text(
              moodImprovementTips[index].title,
            ),
            subtitle: Text(
              moodImprovementTips[index].creationDate,
            ),
          ),
        ));
  }
}
