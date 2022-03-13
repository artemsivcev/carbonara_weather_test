import 'package:carbonara_weather_test/data/user_settings_api.dart';
import 'package:carbonara_weather_test/data/weather_api.dart';
import 'package:carbonara_weather_test/di/injector_provider.dart';
import 'package:carbonara_weather_test/domain/constants/constants.dart';
import 'package:carbonara_weather_test/domain/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'main_state.g.dart';

class MainState = _MainState with _$MainState;

/// State is used for manipulating with main settings of the app.
abstract class _MainState with Store {
  final WeatherApi weatherApi = injector<WeatherApi>();
  final UserSettingsApi userSettingsApi = injector<UserSettingsApi>();

  /// Bool for loader state
  @observable
  bool isLoading = false;

  /// If there is some error when you searching a city
  @observable
  bool searchingError = false;

  /// If there is some error on any other api call
  @observable
  bool dataFetchingError = false;

  /// Controller for user city search
  final TextEditingController userCityController = TextEditingController();

  /// selected day with weather info
  @observable
  ConsolidatedWeather? selectedWeather;

  /// Last loaded object with weather info from api
  @observable
  Weather? lastLoadedWeather;

  /// userPrevCity return last user city.
  /// If there is no any, then return default city
  Future<String> get userPrevCity async {
    var prevUserCity = await userSettingsApi.getUserCity();
    if (prevUserCity != null && prevUserCity.isNotEmpty) {
      return prevUserCity;
    }
    return Constants.defaultCity;
  }

  /// loadDegrees return user preferred degree state.
  /// Default is C°
  Future<String> get loadDegrees async {
    var prevUserDegrees = await userSettingsApi.getUserTempType();
    if (prevUserDegrees) {
      userDegrees =  "F°";
      return "F°";
    }
    userDegrees = "C°";
    return "C°";
  }

  /// observable userDegrees current info
  @observable
  String userDegrees = "C°";

  /// Function load user data from vault
  @action
  Future<void> initUserData() async {
    var city = await userPrevCity;
    userCityController.text = city;
    await loadDegrees;
  }

  /// Main function to search and load weather info
  /// It takes city from controller and send it to api,
  /// then it takes WOEID and search weather by it
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

  /// Function to reset errors state to false
  void resetErrors() {
    dataFetchingError = false;
    searchingError = false;
  }

  /// Function return current city from controller or user previous city
  Future<String> getCurrentCity() async {
    var city = "";
    if (userCityController.text.isNotEmpty) {
      city = userCityController.text;
    } else {
      city = await userPrevCity;
    }
    return city;
  }

  /// Function to save user city to vault
  void saveUserCity(String city) {
    userSettingsApi.saveUserCity(city: city);
  }

  /// Function to select weather to show
  @action
  void selectDay(int index) {
    selectedWeather = lastLoadedWeather!.consolidated_weather[index];
  }

  /// Function to change user degree and save it to vault
  @action
  Future<void> changeDegrees() async {
    var isFahrenheit = false;
    if(userDegrees.contains("C")){
      isFahrenheit = true;
    }
    await userSettingsApi.saveUserTempType(isFahrenheit: isFahrenheit);
    await loadDegrees;
  }
}
