import 'package:carbonara_weather_test/domain/constants/constants.dart';
import 'package:dio/dio.dart';

import '../../interceptors/logger_interceptor.dart';

/// Base api service with dio init
abstract class ApiServiceBase {
  /// dio for requests needing token
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseURL,
      contentType: "application/json",
      connectTimeout: 30000,
      receiveTimeout: 30000,
    ),
  );

  /// constructor is needed to add interceptors
  ApiServiceBase() {
    addInterceptors();
  }

  ///add all interceptors for dio
  Dio addInterceptors() => dio..interceptors.add(LoggerInterceptor());
}
