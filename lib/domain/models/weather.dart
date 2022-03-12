import 'package:json_annotation/json_annotation.dart';

part "weather.g.dart";

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
}
