import 'package:dio/dio.dart';
import 'package:mind_app/model/request/login_request.dart';
import 'package:mind_app/model/request/registration_request.dart';
import 'package:mind_app/services/dto/user_dto.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @POST('login')
  Future<UserDTO> login(@Body() LoginRequest request);

  @POST('register')
  Future<UserDTO> registration(@Body() RegistrationRequest request);
}
