import 'package:equatable/equatable.dart';
import 'package:mind_app/model/day.dart';

class DaysList extends Equatable {
  int count;
  List<Day>? days;

  DaysList({required this.count, this.days});

  
  @override
  // TODO: implement props
  List<Object?> get props => [count, days];
}