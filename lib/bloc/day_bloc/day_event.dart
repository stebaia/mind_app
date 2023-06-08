part of 'day_bloc.dart';

abstract class DayEvent extends Equatable {
  const DayEvent();

  @override
  List<Object> get props => [];
}

class GetDayEvent extends DayEvent {
  final String userId;
  final String dayFrom;
  final String dayTo;

  const GetDayEvent(
      {required this.userId, required this.dayFrom, required this.dayTo});

  @override
  List<Object> get props => [userId, dayFrom, dayTo];
}

class SetDayEvent extends DayEvent {
  final String userId;
  final String day;
  final int mood;
  final String note;
  final List<String> tags;
  final String timestamp;

  const SetDayEvent(
      {required this.userId,
      required this.day,
      required this.mood,
      required this.note,
      required this.tags,
      required this.timestamp});

  @override
  List<Object> get props => [userId, userId, day, mood, note, tags, timestamp];
}
