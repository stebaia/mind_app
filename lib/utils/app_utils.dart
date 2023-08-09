import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateConverter {
  static String convert(String? inputDate) {
    if (inputDate != null) {
      DateTime date = DateTime.parse(inputDate).toLocal();
      String formattedDate = DateFormat('MMMM dd - HH:mm y').format(date);
      return formattedDate;
    } else
      return "";
  }

  static String convertDate(String? inputDate) {
    if (inputDate != null) {
      DateTime date = DateTime.parse(inputDate).toLocal();
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      return formattedDate;
    } else
      return "";
  }

  static String convertDateToISO(String? inputDate) {
    if (inputDate != null) {
      DateTime date = DateTime.parse(inputDate).toLocal();
      String formattedDate = DateFormat('yyyy/MM/dd').format(date);
      return formattedDate;
    } else
      return "";
  }

  static String getMonthByDate(String? inputDate) {
    if (inputDate != null) {
      initializeDateFormatting('it_IT', null);
      DateTime date = DateTime.parse(inputDate).toLocal();
      String formattedDate = DateFormat('MMMM', 'it_IT').format(date);
      return formattedDate;
    } else
      return "";
  }

  static String getDayName(String? inputDate) {
    if (inputDate != null) {
      initializeDateFormatting('it_IT', null);
      DateTime date = DateTime.parse(inputDate).toLocal();
      String formattedDate = DateFormat('EEEE', 'it_IT').format(date);
      return formattedDate.toUpperCase().substring(0, 3);
    } else
      return "";
  }

  static String getDayNumber(String? inputDate) {
    if (inputDate != null) {
      DateTime date = DateTime.parse(inputDate).toLocal();
      String formattedDate = DateFormat(
        'dd',
      ).format(date);
      return formattedDate.toUpperCase();
    } else
      return "";
  }

  static String getDateString(String inputDate) {
    initializeDateFormatting('it_IT', null);

    DateTime date = DateTime.parse(inputDate);
    String formattedDate = DateFormat('EEEE, d MMMM y', 'it_IT').format(date);

    return formattedDate;
  }

  static String getDateSevenDaysAgo() {
    DateTime currentDate = DateTime.now();
    DateTime sevenDaysAgo = currentDate.subtract(Duration(days: 7));
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(sevenDaysAgo);
  }

  static String getDateAll() {
    DateTime currentDate = DateTime.now();
    DateTime sevenDaysAgo = currentDate.subtract(Duration(days: 365));
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(sevenDaysAgo);
  }

  static String getDateNowWithFormatSimpleWithParameter(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  static String getDateNowWithFormatSimples() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  static String getDateNowWithFormat() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }

  static String convertAgendaDate(String? inputDate) {
    if (inputDate != null) {
      DateTime date = DateTime.parse(inputDate).toLocal();
      String formattedDate = DateFormat('MMMM dd yyyy').format(date);
      return formattedDate;
    } else
      return "";
  }

  static String compareDates(String? inputDate1, String? inputDate2) {
    try {
      if (inputDate1 == null || inputDate1.isEmpty) {
        return '';
      }
      DateTime date1 = DateTime.parse(inputDate1).toLocal();
      if (inputDate2 == null || inputDate2.isEmpty) {
        if (date1.hour != 0) {
          return DateFormat('MMMM d - HH y').format(date1);
        } else {
          return convert(inputDate1);
        }
      }
      DateTime date2 = DateTime.parse(inputDate2).toLocal();
      if (date1.isAtSameMomentAs(date2)) {
        return convert(inputDate1);
      } else if (date1.year == date2.year && date1.month == date2.month) {
        return DateFormat('MMMM d - ').format(date1) +
            DateFormat('d y').format(date2);
      } else if (date1.year == date2.year) {
        return DateFormat('MMMM - ').format(date1) +
            DateFormat('MMMM y').format(date2);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  static String compareDatesWithoutHour(
      String? inputDate1, String? inputDate2) {
    try {
      if (inputDate1 == null || inputDate1.isEmpty) {
        return '';
      }
      DateTime date1 = DateTime.parse(inputDate1).toLocal();
      if (inputDate2 == null || inputDate2.isEmpty) {
        if (date1.hour != 0) {
          return DateFormat('MMMM d').format(date1);
        } else {
          return convert(inputDate1);
        }
      }
      DateTime date2 = DateTime.parse(inputDate2).toLocal();
      if (date1.isAtSameMomentAs(date2)) {
        return convert(inputDate1);
      } else if (date1.year == date2.year && date1.month == date2.month) {
        return DateFormat('MMMM d - ').format(date1) +
            DateFormat('d y').format(date2);
      } else if (date1.year == date2.year) {
        return DateFormat('MMMM - ').format(date1) +
            DateFormat('MMMM y').format(date2);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  static String compareHour(String? inputDate1, String? inputDate2) {
    try {
      if (inputDate1 == null || inputDate1.isEmpty) {
        return '';
      }
      DateTime date1 = DateTime.parse(inputDate1).toLocal();
      if (inputDate2 == null || inputDate2.isEmpty) {
        if (date1.hour != 0) {
          return DateFormat('hh').format(date1);
        } else {
          return convert(inputDate1);
        }
      }
      DateTime date2 = DateTime.parse(inputDate2).toLocal();
      if (date1.isAtSameMomentAs(date2)) {
        return convert(inputDate1);
      } else if (date1.year == date2.year && date1.month == date2.month) {
        return DateFormat('MMMM d - ').format(date1) +
            DateFormat('d y').format(date2);
      } else if (date1.year == date2.year) {
        return DateFormat('MMMM - ').format(date1) +
            DateFormat('MMMM y').format(date2);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  static String compareDatesToMacro(String? inputDate1, String? inputDate2) {
    try {
      if (inputDate1 == null || inputDate1.isEmpty) {
        return '';
      }
      DateTime date1 = DateTime.parse(inputDate1).toLocal();
      if (inputDate2 == null || inputDate2.isEmpty) {
        if (date1.hour != 0) {
          return DateFormat('MMMM d').format(date1);
        } else {
          return convert(inputDate1);
        }
      }
      DateTime date2 = DateTime.parse(inputDate2).toLocal();
      if (date1.isAtSameMomentAs(date2)) {
        return convert(inputDate1);
      } else if (date1.year == date2.year && date1.month == date2.month) {
        return DateFormat('MMMM d - ').format(date1) +
            DateFormat('d y').format(date2);
      } else if (date1.year == date2.year) {
        return DateFormat('MMMM - ').format(date1) +
            DateFormat('MMMM y').format(date2);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  static String getStatusByValueSlider(int mood) {
    switch (mood) {
      case 1:
        return 'depressed';
      case 2: 
        return 'sad';
      case 3:
        return 'balance';
      case 4:
        return 'happy';
      case 5: 
        return 'euphoric';
      default: return 'balance';
    }
  }

  static MaterialColor getEventColor(int mood) {
    switch (mood) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.amber;
      case 4:
        return Colors.lightGreen;
      case 5:
        return Colors.green;
      default:
        return Colors.amber;
    }
  }

  static String calculateMood(int mood) {
    switch (mood) {
      case 1:
        return 'Che giornata terribile oggi!';
      case 2:
        return 'Sembra che oggi non sia affatto una bella giornata per te';
      case 3:
        return 'Uhm una giornata nella media';
      case 4:
        return 'Oggi è una bella giornata!';
      case 5:
        return 'Che giornata fantastica oggi!';
      default:
        return '';
    }
  }

  static List<String> tagNameHelper = [
    'work',
    'relationships',
    'love',
    'family',
    'sports',
    'finances',
    'fashion',
    'travel',
    'food',
    'stress',
    'lifestyle',
    'mental health'
  ];

  static String calculateHourDifference(
      String startDateStr, String endDateStr) {
    DateTime dateTime1 = DateTime.parse(startDateStr);
    DateTime dateTime2 = DateTime.parse(endDateStr);

    Duration duration = dateTime2.difference(dateTime1);

    int hours = duration.inHours;
    int minutes = (duration.inMinutes - (hours * 60));

    String formattedHours = hours.abs().toString().padLeft(2, '0');
    String formattedMinutes = minutes.abs().toString().padLeft(2, '0');
    String sign = hours < 0 ? '-' : '+';

    return '${dateTime1.hour}:${dateTime1.minute} ${dateTime1.hour < 12 ? "am" : "pm"} - $formattedHours:$formattedMinutes';
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
