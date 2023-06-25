part of 'calendar_cubit.dart';

abstract class CalendarState{}

class CalendarInitial extends CalendarState {
  Day? day;
  CalendarInitial({this.day});
}
