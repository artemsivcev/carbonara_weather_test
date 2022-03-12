import 'package:dio/dio.dart';

import 'base/api_service_base.dart';

/// The class reliable for backend requests.
class WeatherApiService extends ApiServiceBase {
  Future<Response?> getDataByCity({
    required String query,
  }) async {
    var queryParameters = {
      "query": query,
    };
    var response =
        await dio.get('api/location/search/', queryParameters: queryParameters);

    return response;
  }

  Future<Response?> getWeatherByWOEIDForToday({
    required int woeid,
  }) async {
    var response = await dio.get('api/location/$woeid');

    return response;
  }
}
