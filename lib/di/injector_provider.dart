import 'package:carbonara_weather_test/data/user_settings_api.dart';
import 'package:carbonara_weather_test/data/weather_api.dart';
import 'package:carbonara_weather_test/domain/states/main_state.dart';
import 'package:carbonara_weather_test/domain/states/screen_state.dart';
import 'package:get_it/get_it.dart';

/// It is necessary to register a file in the "injector"
/// by an appropriate method for organizing common access to the file
final GetIt injector = GetIt.I;

Future<void> setupInjection() async {
  injector.registerLazySingleton(() => WeatherApi());
  injector.registerLazySingleton(() => UserSettingsApi());

  injector.registerLazySingleton(() => ScreenState());
  injector.registerLazySingleton(() => MainState());

  await injector.allReady();
}