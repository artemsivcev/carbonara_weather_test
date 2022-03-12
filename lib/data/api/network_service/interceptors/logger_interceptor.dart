import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// Interceptor class for logging events like request starting and uts result (response or error)
class LoggerInterceptor extends Interceptor {
  final Logger logger = Logger();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i(
      '<--| REQUEST[${options.method.toUpperCase()}] => URL: ${options.baseUrl + options.path} => DATA: ${options.data} |-->',
    );

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.v(
      '<--|RESPONSE[${response.statusCode}] : DATA ${response.data} => URL: ${response.requestOptions.baseUrl}${response.requestOptions.path} |-->',
    );

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e(
      '<--| ERROR[${err.response?.statusCode}] : MESSAGE[${err.message}] =>'
      ' URL: ${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path} -> '
      'DATA: ${err.response?.data} |-->',
    );

    return super.onError(err, handler);
  }
}
