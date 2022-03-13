import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/constants.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part "weather.g.dart";

/// Main weather info model
/// Contains ConsolidatedWeather class with weather info
/// and normalization for some variables
@JsonSerializable()
class Weather {
  final String time;
  final String sun_rise;
  final String sun_set;

  final List<ConsolidatedWeather> consolidated_weather;

  Weather({
    required this.time,
    required this.sun_rise,
    required this.sun_set,
    required this.consolidated_weather,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class ConsolidatedWeather {
  final mainState = injector<MainState>();

  final String weather_state_name;
  final String weather_state_abbr;

  final String wind_direction_compass;
  final double wind_speed;
  final double wind_direction;

  final String applicable_date;

  final double min_temp;
  final double max_temp;
  final double the_temp;

  final double air_pressure;
  final double humidity;
  final double visibility;
  final double predictability;

  ConsolidatedWeather({
    required this.weather_state_name,
    required this.weather_state_abbr,
    required this.wind_direction_compass,
    required this.wind_speed,
    required this.wind_direction,
    required this.applicable_date,
    required this.min_temp,
    required this.max_temp,
    required this.the_temp,
    required this.air_pressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$ConsolidatedWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);

  String getImageLink() {
    return "${Constants.baseURL}/static/img/weather/png/64/$weather_state_abbr.png";
  }

  String getMinTempFormatted() {
    return convertTemp(min_temp);
  }

  String getMaxTempFormatted() {
    return convertTemp(max_temp);
  }

  String getTheTempFormatted() {
    return convertTemp(the_temp);
  }

  String convertTemp(double temp) {
    var varTemp = temp;
    if (mainState.userDegrees.contains("F")) {
      varTemp = (temp * 9 / 5) + 32;
    }

    return varTemp.toStringAsFixed(2) + " " + mainState.userDegrees.toString();
  }

  String getHumidityFormatted() {
    return humidity.roundToDouble().toString() + "%";
  }

  String getAirPressureFormatted() {
    return air_pressure.roundToDouble().toString() + " mbar";
  }

  String getWindSpeedFormatted() {
    return wind_speed.roundToDouble().toString() + " mph";
  }

  String getDateFormatted() {
    var localDate = DateTime.parse(applicable_date).toLocal();
    return DateFormat('yyyy.MM.dd EEEE').format(localDate).toString();
  }

  String getDayOfWeekFromDateFormatted() {
    var localDate = DateTime.parse(applicable_date).toLocal();
    return DateFormat('EEEE').format(localDate).toString();
  }
}
