import 'package:logger/logger.dart';
import 'package:mind_app/model/day_list.dart';
import 'package:mind_app/model/request/get_day_request.dart';
import 'package:mind_app/model/request/set_day_request.dart';
import 'package:mind_app/services/dto/days_dto.dart';
import 'package:mind_app/services/network/days_service/days_service.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:pine/pine.dart';

class DaysRepository {
  final DaysService daysService;
  final DTOMapper<DaysDTO, DaysList> dtoMapper;
  final Logger logger;

  DaysRepository({
    required this.daysService,
    required this.logger,
    required this.dtoMapper
  });

  Future<DaysList> getDay({
    required String userId,
    required String dayFrom,
    required String dayTo
  }) async {
    try{
      final response = await daysService.getDay(
        GetDayRequest(userId: userId, dayFrom: DateConverter.convertDate(dayFrom), dayTo: DateConverter.convertDate(dayFrom))
      );
      return dtoMapper.fromDTO(response);
    } catch (error, stackTrace){
      logger.e('Error sing in with email $userId', error, stackTrace);
      rethrow;
    }
  }

  Future<DaysList> setDay({
    required String userId,
    required String day,
    required int mood,
    required String comment,
    required List<String> tags,
    required String timestamp
  }) async {
    try{
      final response = await daysService.setDay(SetDayRequest(userId: userId, day: DateConverter.convertDate(day), mood: mood, comment: comment, tags: tags, timestamp: DateConverter.getDateNowWithFormat()));
      return dtoMapper.fromDTO(response);
    } catch (error, stackTrace){
      logger.e('Error sing in with email $userId', error, stackTrace);
      rethrow;
    }
  }
}