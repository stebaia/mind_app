import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mind_app/app.dart';
import 'package:mind_app/utils/mock_mood_improvment.dart';

class MoodTipsListPage extends StatelessWidget {
  const MoodTipsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const Text(
                'Mood Tips',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 30,
          ),
          ListView.builder(
            primary: false,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: moodImprovementTips.length,
            itemBuilder: (context, index) => ListTile(
              leading: SizedBox(
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      moodImprovementTips[index].imagePath,
                      fit: BoxFit.cover,
                    ),
                  )),
              title: Text(
                moodImprovementTips[index].title,
              ),
              subtitle: Text(
                moodImprovementTips[index].creationDate,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
