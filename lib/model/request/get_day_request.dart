import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class GetDayRequest extends DTO with EquatableMixin {
  static const _userId = 'userId';
  static const _dayFrom = 'dayFrom';
  static const _dayTo = "dayTo";


  final String userId;
  final String dayFrom;
  final String dayTo;

  GetDayRequest({required this.userId, required this.dayFrom, required this.dayTo});

  Map<String, dynamic> toJson() => {_userId: userId, _dayFrom: dayFrom, _dayTo: dayTo};

  @override
  List<Object?> get props => [userId, dayFrom, dayTo];
}