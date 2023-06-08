part of 'day_bloc.dart';

abstract class DayState extends Equatable {
  const DayState();
  
  @override
  List<Object> get props => [];
}

class EmptyGetDayState extends DayState {
  const EmptyGetDayState();
}

class TryGetDayState extends DayState {
  const TryGetDayState();
}

class ResultGetDayState extends DayState {
  final DaysList daysList;
  const ResultGetDayState(this.daysList);

  List<Object> get props => [daysList];
}

class ErrorGetDayState extends DayState {
  const ErrorGetDayState();
}

class ErrorSetDayState extends DayState {
  const ErrorSetDayState();
} 

class TrySetDayState extends DayState {
  const TrySetDayState();
}

class ResultSetDayState extends DayState {
  final DayResult dayResult;
  const ResultSetDayState(this.dayResult);

  List<Object> get props => [dayResult];
}

