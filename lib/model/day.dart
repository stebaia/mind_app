import 'package:equatable/equatable.dart';

class Day extends Equatable {
  int mood;
  String day;
  String? note;
  List<String>? tags;

  Day({required this.mood, required this.day, this.note,  this.tags});

  
  @override
  // TODO: implement props
  List<Object?> get props => [mood, day, note, tags];
}