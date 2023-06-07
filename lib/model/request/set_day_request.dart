import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class SetDayRequest extends DTO with EquatableMixin {
  static const _userId = 'userId';
  static const _day = 'day';
  static const _mood = "mood";
  static const _comment = 'comment';
  static const _tags = 'tags';
  static const _timestamp = "timestamp";

  final String userId;
  final String day;
  final int mood;
  final String comment;
  final List<String> tags;
  final String timestamp;

  SetDayRequest({required this.userId, required this.day, required this.mood, required this.comment, required  this.tags, required this.timestamp});

  Map<String, dynamic> toJson() => {_userId: userId, _day: day, _mood: mood, _comment: comment, _tags: tags, _timestamp: timestamp};

  @override
  List<Object?> get props => [userId, day, mood, comment, tags, timestamp];
}