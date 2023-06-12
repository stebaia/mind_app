import 'dart:io';

import 'package:dio/dio.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['x-api-key'] = 'bBIwkPCHhK3KoeYOrVrKn1gvoXATOZQXa2Sg9ZDg';

    super.onRequest(options, handler);
  }
}
