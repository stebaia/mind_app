import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:mind_app/model/request/login_request.dart';
import 'package:mind_app/model/request/registration_request.dart';
import 'package:mind_app/model/user.dart';
import 'package:mind_app/services/dto/user_dto.dart';
import 'package:mind_app/services/network/user_service/user_service.dart';
import 'package:mind_app/utils/app_utils.dart';
import 'package:mind_app/utils/constants.dart';

import 'package:crypto/crypto.dart';
import 'package:pine/pine.dart';

class UserRepository {
  final UserService userService;
  final Mapper<User, String> userMapper;
  final DTOMapper<UserDTO, User> userDTOMapper;
  final FlutterSecureStorage flutterSecureStorage;
  final Logger logger;

  UserRepository({
    required this.flutterSecureStorage,
    required this.logger,
    required this.userDTOMapper,
    required this.userMapper,
    required this.userService,
  });

  Future<User> registration(
      {required String email,
      required String password,
      required String name,
      required String surname,
      required String username,
      required String birth}) async {
    try {
      final response = await userService.registration(RegistrationRequest(
          name: name,
          surname: surname,
          birth: birth,
          username: sha256.convert(utf8.encode(username)).toString(),
          email: email,
          password: sha256.convert(utf8.encode(password)).toString(),
          timestamp: DateConverter.getDateNowWithFormat()));

      User user = userDTOMapper.fromDTO(response);

      return user;
    } catch (error, stackTrace) {
      logger.e('Error sing in with email $email', error, stackTrace);
      rethrow;
    }
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await userService
          .login(LoginRequest(email: email, password: password));

      User user = userDTOMapper.fromDTO(response.data);
      user.token = response.response.headers['jwt']![0];
      await flutterSecureStorage.write(
          key: Constants.userKey, value: userMapper.from(user));
      return user;
    } catch (error, stackTrace) {
      logger.e('Error sing in with email $email', error, stackTrace);
      rethrow;
    }
  }

  Future<void> logout() async {
    await flutterSecureStorage.delete(
      key: Constants.userKey,
    );
  }

  Future<User?> get currentUser async {
    final json = await flutterSecureStorage.read(key: Constants.userKey);
    if (json != null) {
      return userMapper.to(json);
    }
    return null;
  }
}
