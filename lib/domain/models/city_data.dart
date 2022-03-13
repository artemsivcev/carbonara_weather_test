import 'package:json_annotation/json_annotation.dart';

part "city_data.g.dart";

/// Model class with city info.
/// Response on search
@JsonSerializable()
class CityData {

  final String title;
  final String location_type;
  final int woeid;
  final String latt_long;

  CityData({
    required this.title,
    required this.location_type,
    required this.woeid,
    required this.latt_long,
  });

  factory CityData.fromJson(Map<String, dynamic> json) =>
      _$CityDataFromJson(json);

  Map<String, dynamic> toJson() => _$CityDataToJson(this);
}
