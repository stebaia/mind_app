import 'package:logger/logger.dart';
import 'package:mind_app/model/day_list.dart';
import 'package:mind_app/model/day_result.dart';
import 'package:mind_app/model/request/get_day_request.dart';
import 'package:mind_app/model/request/set_day_request.dart';
import 'package:mind_app/services/dto/days_dto.dart';
import 'package:mind_app/services/network/days_service/days_service.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:pine/pine.dart';

class DaysRepository {
  final DaysService daysService;
  final DTOMapper<DaysDTO, DaysList> dtoMapper;
  final DTOMapper<DayResultDTO, DayResult> dtoResultMapper;
  final Logger logger;

  DaysRepository(
      {required this.daysService,
      required this.logger,
      required this.dtoMapper,
      required this.dtoResultMapper});

  Future<DaysList> getSingleDay(
      {required String userId,
      required String dayFrom,
      required String dayTo}) async {
    try {
      String date = DateConverter.getDateNowWithFormatSimples();
      final response = await daysService.getSingleDays(date);

      /*final response = await daysService.getDay(GetDayRequest(
          userId: userId,
          dayFrom: DateConverter.convertDate(dayFrom),
          dayTo: DateConverter.convertDate(dayTo)));
          */
      return dtoMapper.fromDTO(response);
    } catch (error, stackTrace) {
      logger.e('Error sing in with email $userId');
      rethrow;
    }
  }

  Future<DaysList> getDayTo(
      {required String userId,
      required String dayFrom,
      required String dayTo}) async {
    try {
      String date = DateConverter.getDateNowWithFormatSimples();
      final response = await daysService.getDaysTo(date);

      /*final response = await daysService.getDay(GetDayRequest(
          userId: userId,
          dayFrom: DateConverter.convertDate(dayFrom),
          dayTo: DateConverter.convertDate(dayTo)));
          */
      return dtoMapper.fromDTO(response);
    } catch (error, stackTrace) {
      logger.e('Error sing in with email $userId');
      rethrow;
    }
  }

  Future<DayResult> setDay(
      {required String userId,
      required String day,
      required int mood,
      required String note,
      required List<String> tags,
      required String timestamp}) async {
    try {
      final response = await daysService.setDay(
          day,
          SetDayRequest(
              userId: userId,
              day: DateConverter.convertDate(day),
              mood: mood.toString(),
              note: note,
              tags: tags,
              timestamp: DateConverter.getDateNowWithFormat()));
      return dtoResultMapper.fromDTO(response);
    } catch (error, stackTrace) {
      logger.e('Error sing in with email $userId');
      rethrow;
    }
  }
}
