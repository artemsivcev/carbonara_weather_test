import 'package:carbonara_weather_test/domain/models/city_data.dart';
import 'package:carbonara_weather_test/domain/models/weather.dart';
import 'package:carbonara_weather_test/domain/repositories/weather_repository.dart';
import 'package:logger/logger.dart';

import 'api/network_service/services/weather_api_service.dart';

/// WeatherApi class extends WeatherRepository and communicate with api service
class WeatherApi extends WeatherRepository {
  late final WeatherApiService _weatherApiService;
  final Logger logger = Logger();

  WeatherApi() {
    _weatherApiService = WeatherApiService();
  }

  @override
  Future<CityData> getDataByCity(String city) async {
    var response = await _weatherApiService.getDataByCity(query: city);

    if (response != null && response.data != null && response.data.isNotEmpty) {
      CityData cityData = CityData.fromJson(response.data.first);

      return cityData;
    } else {
      logger.e(
        '<--| ERROR[ CityData is empty ] |-->',
      );
      throw Exception('CityData is empty');
    }
  }

  @override
  Future<Weather> getWeatherByWOEIDForToday(int woeid) async {
    var response =
        await _weatherApiService.getWeatherByWOEIDForToday(woeid: woeid);

    if (response != null && response.data != null) {
      Weather weather = Weather.fromJson(response.data);

      return weather;
    } else {
      logger.e(
        '<--| ERROR[ Weather is empty ] |-->',
      );
      throw Exception('Weather is empty');
    }
  }
}
