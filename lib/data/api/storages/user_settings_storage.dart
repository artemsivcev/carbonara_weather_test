import 'base/safe_storage_base.dart';

class UserSettingsStorage extends SafeStorageBase {
  static const _keyIsFahrenheit = "is_fahrenheit";
  static const _keyUserCity = "user_city";

  Future<void> saveUserCity({required String? city}) async {
    if (city != null) {
      await save(keyName: _keyUserCity, value: city);
    }
  }

  Future<String?> getUserCity() async => await read(keyName: _keyUserCity);

  Future<void> saveUserTempType({bool isFahrenheit = false}) async =>
      await save(keyName: _keyIsFahrenheit, value: isFahrenheit.toString());

  Future<bool> getUserTempType() async {
    String? userTemp = await read(keyName: _keyIsFahrenheit);
    if (userTemp == "true") {
      return true;
    }
    return false;
  }
}
