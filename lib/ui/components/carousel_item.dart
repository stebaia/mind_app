import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mind_app/model/mood_improvment_tip.dart';
import 'package:mind_app/utils/mock_mood_improvment.dart';
import 'package:mind_app/utils/theme_helper.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    return _horizzontalListView(context);
  }

  Widget _horizzontalListView(BuildContext context) {
    List<MoodImprovementTip> listMood = getRandomTips();
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: listMood.length,
        shrinkWrap: false,
        padding: EdgeInsets.only(left: 24, top: 0),
        scrollDirection: Axis.horizontal,
        primary: false,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: 10, bottom: 10),
          width: 200,
          height: 10,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    listMood[index].imagePath,
                  ),
                  fit: BoxFit.cover),
              color: ThemeHelper.drawingColor,
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(10)),
            width: 200,
            height: 10,
            child: Center(
              child: Text(
                listMood[index].title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<MoodImprovementTip> getRandomTips() {
    final random = Random();
    List<MoodImprovementTip> randomTips = [];
    while (randomTips.length < 4) {
      MoodImprovementTip tip =
          moodImprovementTips[random.nextInt(moodImprovementTips.length)];
      if (!randomTips.contains(tip)) {
        randomTips.add(tip);
      }
    }
    return randomTips;
  }

  Widget _buildCarousel(
    BuildContext context,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(
              viewportFraction: 0.8,
              initialPage: 0,
            ),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, 1, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
