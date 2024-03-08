import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_app/model/day.dart';
import 'package:mind_app/providers/dark_theme_provider.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/emoji_widget.dart';
import 'package:mind_app/utils/theme_helper.dart';
import 'package:provider/provider.dart';

class LineChartSample2 extends StatefulWidget {
  LineChartSample2({super.key, this.days});
  List<Day>? days;
  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  bool showAvg = false;
  final currentDays = DateConverter.getCurrentWeekDates();
  List<Day> lastWeekDays = [];
  final List<DateTime> allWeekDays = [];
  Map<DateTime, int>? moodMap = Map();

  @override
  void initState() {
    super.initState();
    if (widget.days != null) {
      lastWeekDays.addAll(widget.days!
          .where((day) =>
              DateTime.parse(day.day).isAfter(currentDays['start']!) &&
              DateTime.parse(day.day).isBefore(currentDays['end']!))
          .toList());
      print(lastWeekDays);
    }
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    List<Color> gradientColors = darkMode.darkTheme
        ? [ThemeHelper.backgroundColorWhite, ThemeHelper.backgroundColorWhite]
        : [ThemeHelper.buttonSecondaryColor, ThemeHelper.buttonSecondaryColor];
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.40,
          child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child: lastWeekDays != null
                  ? lastWeekDays.isNotEmpty
                      ? LineChart(
                          mainData(
                              lastWeekDays.last.day,
                              darkMode.darkTheme
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                              gradientColors),
                        )
                      : Container(
                          child: Center(child: Text('No data')),
                        )
                  : Container(
                      child: Center(child: Text('No data')),
                    )),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets2(double value, TitleMeta meta, Color color) {
    int index = value.toInt();

    if (index >= 0 && index < allWeekDays.length) {
      // Ottieni la data corrispondente all'indice
      DateTime day = allWeekDays[index];

      // Ottieni il mood corrispondente dalla mappa dei mood
      final mood = moodMap![day];

      // Ottieni il nome del giorno
      String dayName = _getDayName(day.weekday);

      // Se il mood è disponibile, mostralo accanto al giorno
      String text = mood != null ? '$dayName' : dayName;

      return Text(text, style: TextStyle(fontSize: 12, color: color));
    }

    return Container();
  }

  String _getDayName(int dayOfWeek) {
    List<String> dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return dayNames[dayOfWeek - 1];
  }

  Widget bottomTitleWidgets(
    double value,
    TitleMeta meta,
  ) {
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

  LineChartData mainData(String? date, Color color, List<Color> gradient) {
    final Map<String, DateTime> weekDates = DateConverter.getCurrentWeekDates();
    allWeekDays.clear();
    for (DateTime day = weekDates['start']!;
        day.isBefore(weekDates['end']!);
        day = day.add(Duration(days: 1))) {
      allWeekDays.add(day);
    }

    // Ordina i giorni per data
    lastWeekDays
        .sort((a, b) => DateTime.parse(a.day).compareTo(DateTime.parse(b.day)));

    // Mappa dei mood per data
    moodMap = Map.fromIterable(
      lastWeekDays,
      key: (day) => DateTime.parse(day.day),
      value: (day) => day.mood,
    );
    final List<FlSpot> spots = [];

    for (int i = 0; i < allWeekDays.length; i++) {
      final day = allWeekDays[i];
      final mood = moodMap![day];
      spots.add(FlSpot(i.toDouble(), mood?.toDouble() ?? 0));
    }

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
            getTitlesWidget: (value, meta) {
              return bottomTitleWidgets2(value, meta, color);
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) {
              return leftTitleWidgets(value, meta, color); // Colore rosso
            },
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: allWeekDays.length.toDouble() - 1,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: false,
          gradient: LinearGradient(
            colors: gradient,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradient.map((color) => color.withOpacity(0.3)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
