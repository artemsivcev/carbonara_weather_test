import 'package:carbonara_weather_test/domain/models/city_data.dart';
import 'package:carbonara_weather_test/domain/models/weather.dart';

abstract class WeatherRepository {
  Future<CityData> getDataByCity(String city);

  Future<Weather> getWeatherByWOEIDForToday(int woeid);
}
