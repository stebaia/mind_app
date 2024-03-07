import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class SetDayRequest extends DTO with EquatableMixin {
  static const _userId = 'userId';
  static const _day = 'day';
  static const _mood = "mood";
  static const _note = 'note';
  static const _tags = 'tags';
  static const _timestamp = "timestamp";

  final String userId;
  final String day;
  final String mood;
  final String note;
  final List<String> tags;
  final String timestamp;

  SetDayRequest(
      {required this.userId,
      required this.day,
      required this.mood,
      required this.note,
      required this.tags,
      required this.timestamp});

  Map<String, dynamic> toJson() => {
        _userId: userId,
        _day: day,
        _mood: mood,
        _note: note,
        _tags: tags,
        _timestamp: timestamp
      };

  @override
  List<Object?> get props => [userId, day, mood, note, tags, timestamp];
}
