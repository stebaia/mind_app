import 'package:equatable/equatable.dart';
import 'package:mind_app/model/day.dart';

class DayResult extends Equatable {
  final Day? day;
  DayResult({required this.day});
  
  @override
  // TODO: implement props
  List<Object?> get props => [day];

}