part of 'day_bloc.dart';

abstract class GetDayState extends Equatable {
  const GetDayState();
  
  @override
  List<Object> get props => [];
}

class EmptyGetDayState extends GetDayState {
  const EmptyGetDayState();
}

class TryGetDayState extends GetDayState {
  const TryGetDayState();
}

class ResultGetDayState extends GetDayState {
  final DaysList daysList;
  const ResultGetDayState(this.daysList);

  List<Object> get props => [daysList];
}

class ErrorGetDayState extends GetDayState {
  const ErrorGetDayState();
}
