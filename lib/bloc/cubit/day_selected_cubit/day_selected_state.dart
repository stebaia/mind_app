part of 'day_selected_cubit.dart';

abstract class DaySelectedState {}

class DaySelectedInitial extends DaySelectedState {
  Day? day;
  DaySelectedInitial({required this.day});
}

class UnselectedDay extends DaySelectedState{}