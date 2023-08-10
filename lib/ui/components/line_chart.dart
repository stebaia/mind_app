import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/utils/theme_helper.dart';

class LineChartSample2 extends StatefulWidget {
  LineChartSample2({super.key, this.days});
  List<Day> ?days;
  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    ThemeHelper.buttonSecondaryColor,
    ThemeHelper.buttonSecondaryColor
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: widget.days != null ? LineChart(
              mainData(widget.days?.last.day),
            ): Container(),
          ),
        ),
        
      ],
    );
  }

  Widget bottomTitleWidgets2(double value, TitleMeta meta) {
    int index = value.toInt();
    if (index >= 0 && index < widget.days!.length) {
      DateTime day = DateTime.parse(widget.days![index].day);
      int dayOfWeek = day.weekday; // 1 = Monday, 2 = Tuesday, ...
      String dayName = _getDayName(dayOfWeek);
      return Text(dayName, style: TextStyle(fontSize: 12));
    }
    return Container();
  }

  String _getDayName(int dayOfWeek) {
    List<String> dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return dayNames[dayOfWeek - 1];
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, ) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '😔';
        break;
  
      case 3:
        text = '😕';
        break;

      case 5:
        text = '😁';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(String? date) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: ThemeHelper.mainColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: ThemeHelper.mainColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget:bottomTitleWidgets2 
        ),
      ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: widget.days != null ? widget.days!.length.toDouble() -1 : 0,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: widget.days!.asMap().entries.map((e) {
            int index = e.key;
            Day day = e.value;
            int mood = day.mood;
            return FlSpot(index.toDouble(), mood.toDouble());
          }).toList(),
          
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  
}