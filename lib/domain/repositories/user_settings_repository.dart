abstract class UserSettingsRepository {
  Future<void> saveUserCity({String city});

  Future<String?> getUserCity();

  Future<void> saveUserTempType({bool isFahrenheit = false});

  Future<bool> getUserTempType();
}
