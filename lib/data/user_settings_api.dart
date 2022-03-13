import 'package:carbonara_weather_test/domain/repositories/user_settings_repository.dart';

import 'api/storages/user_settings_storage.dart';

/// UserSettingsApi class extends UserSettingsRepository
/// and communicate with storage service
class UserSettingsApi extends UserSettingsRepository {
  late final UserSettingsStorage _userSettingsStorage;

  UserSettingsApi() {
    _userSettingsStorage = UserSettingsStorage();
  }

  @override
  Future<void> saveUserCity({String? city}) async {
    _userSettingsStorage.saveUserCity(city: city);
  }

  @override
  Future<String?> getUserCity() async {
    return await _userSettingsStorage.getUserCity();
  }

  @override
  Future<void> saveUserTempType({bool isFahrenheit = false}) async {
    await _userSettingsStorage.saveUserTempType(isFahrenheit: isFahrenheit);
  }

  @override
  Future<bool> getUserTempType() async {
    return await _userSettingsStorage.getUserTempType();
  }
}
