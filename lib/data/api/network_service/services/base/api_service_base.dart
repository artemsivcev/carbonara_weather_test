import 'package:dio/dio.dart';

import '../../interceptors/logger_interceptor.dart';

/// The class reliable for backend requests.
abstract class ApiServiceBase {
  static final _baseUrl =
      "https://${const String.fromEnvironment("DEF_BASE_URL")}/api/v1";

  /// dio for requests needing token
  final Dio dioWithToken = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      contentType: "application/json",
      connectTimeout: 30000,
      receiveTimeout: 30000,
    ),
  );

  /// dio for authentication requests
  /// Used on the screens of the FlowMode.REGISTRATION and when tokens refreshes
  final Dio dioWithoutAuth = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      contentType: "application/json",
      connectTimeout: 30000,
      receiveTimeout: 30000,
    ),
  );

  /// constructor is needed to add interceptors
  ApiServiceBase() {
    addTokenInterceptors();
    addAuthInterceptors();
  }

  ///add all interceptors for token dio
  Dio addTokenInterceptors() => dioWithToken
    // ..interceptors.add(BodyModifierInterceptor())
    // ..interceptors.add(TokenInterceptor(this))
    // ..interceptors.add(DigitalSignInterceptor())
    ..interceptors.add(LoggerInterceptor());

  ///add all interceptors for auth dio
  Dio addAuthInterceptors() => dioWithoutAuth
    // ..interceptors.add(BodyModifierInterceptor())
    ..interceptors.add(LoggerInterceptor());

  /// refresh token
  Future<Response?> refreshToken(String? refreshToken) async {
    var response = await dioWithoutAuth
        .post("/refresh-tokens", data: {"refreshToken": refreshToken});

    return response;
  }

  void clearAllHeaders() {
    dioWithToken.options.headers.remove("Authorization");
    // dioWithToken.options.headers.remove(digitalSignHeader);
  }
}
