import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mind_app/repositories/user_repository.dart';

class AuthInterceptor extends QueuedInterceptor {
  final UserRepository userRepository;
  final FlutterSecureStorage flutterSecureStorage;

  AuthInterceptor({
    required this.userRepository,
    required this.flutterSecureStorage,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['x-api-key'] = 'bBIwkPCHhK3KoeYOrVrKn1gvoXATOZQXa2Sg9ZDg';
    final user = await userRepository.currentUser;
    if (user != null) {
      options.headers[HttpHeaders.authorizationHeader] = user.token;
    }
    super.onRequest(options, handler);
  }
}
