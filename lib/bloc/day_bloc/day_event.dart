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

  const GetDayEvent({
    required this.userId,
    required this.dayFrom,
    required this.dayTo
  });

  @override
  List<Object> get props => [
        userId,
        dayFrom,
        dayTo
      ];

}
