import 'package:carbonara_weather_test/data/user_settings_api.dart';
import 'package:carbonara_weather_test/data/weather_api.dart';
import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/constants.dart';
import 'package:carbonara_weather_test/domain/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'main_state.g.dart';

class MainState = _MainState with _$MainState;

/// State is used for manipulating with main settings of the game.
/// For example, when the user wants to go back or choosing
/// to play the game with image or not.
abstract class _MainState with Store {
  final WeatherApi weatherApi = injector<WeatherApi>();
  final UserSettingsApi userSettingsApi = injector<UserSettingsApi>();

  @observable
  bool isLoading = false;

  @observable
  bool searchingError = false;

  @observable
  bool dataFetchingError = false;

  final TextEditingController userCityController = TextEditingController();

  @observable
  ConsolidatedWeather? selectedWeather;

  @observable
  Weather? lastLoadedWeather;

  Future<String> get userPrevCity async {
    var prevUserCity = await userSettingsApi.getUserCity();
    if (prevUserCity != null && prevUserCity.isNotEmpty) {
      return prevUserCity;
    }
    return Constants.defaultCity;
  }
  @action
  Future<void> fillUserCityOnInit() async {
    var city = await userPrevCity;
    userCityController.text = city;
  }

  @action
  Future<void> fetchDataByCurrentCity() async {
    isLoading = true;
    resetErrors();
    var city = await getCurrentCity();
    saveUserCity(city);
    await weatherApi
        .getDataByCity(city)
        .then((cityData) async => await weatherApi
            .getWeatherByWOEIDForToday(cityData.woeid)
            .then(
              (weather) => {
                lastLoadedWeather = weather,
                selectedWeather = lastLoadedWeather!.consolidated_weather.first,
              },
            )
            .onError((error, stackTrace) => {
                  dataFetchingError = true,
                }))
        .onError((error, stackTrace) => {
              searchingError = true,
            });
    isLoading = false;
  }

  void resetErrors() {
    dataFetchingError = false;
    searchingError = false;
  }

  Future<String> getCurrentCity() async {
    var city = "";
    if (userCityController.text.isNotEmpty) {
      city = userCityController.text;
    } else {
      city = await userPrevCity;
    }
    return city;
  }

  void saveUserCity(String city) {
    userSettingsApi.saveUserCity(city: city);
  }

  @action
  void selectDay(int index) {
    selectedWeather = lastLoadedWeather!.consolidated_weather[index];
  }
}
