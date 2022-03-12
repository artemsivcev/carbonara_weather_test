import 'package:json_annotation/json_annotation.dart';

part "city_data.g.dart";

@JsonSerializable()
class CityData {
  //data example
  // [{"title":"Paris","location_type":"City","woeid":615702,"latt_long":"48.856930,2.341200"}]

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
