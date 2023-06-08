import 'package:dio/dio.dart';
import 'package:mind_app/model/request/get_day_request.dart';
import 'package:mind_app/model/request/login_request.dart';
import 'package:mind_app/model/request/registration_request.dart';
import 'package:mind_app/model/request/set_day_request.dart';
import 'package:mind_app/services/dto/days_dto.dart';
import 'package:mind_app/services/dto/user_dto.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'days_service.g.dart';

@RestApi()
abstract class DaysService {
  factory DaysService(Dio dio, {String baseUrl}) = _DaysService;

  @PUT('getday')
  Future<DaysDTO> getDay(@Body() GetDayRequest request);

  @POST('setday')
  Future<DayResultDTO> setDay(@Body() SetDayRequest request);
}
