import 'package:flutter/cupertino.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/utils/theme_helper.dart';

class MoodDetailWidget extends StatelessWidget {
  const MoodDetailWidget({super.key, required this.day});
  final Day day;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Comment:', style: TextStyle(fontFamily: 'PoppinsExtraBold',fontSize: 20),),
        SizedBox(height: 10,),
        Text(day.note != null ? day.note!: ''),
        SizedBox(height: 50,),
        Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: day.tags!.map((e) => _buildChip(e)).toList(),
        )
      ],
    );
  }
}

Widget _buildChip(String label) {
  return Container(
      height: 36,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: ThemeHelper.colorSemiWhite, borderRadius: BorderRadius.circular(10)),
      child: FittedBox(fit: BoxFit.fitWidth,child: Center(child: Text(label, style: TextStyle(color: ThemeHelper.buttonColor, fontSize: 14),))),
    );
}
    

