import 'base/safe_storage_base.dart';

class CredentialsStorage extends SafeStorageBase {
  static const _keyIsPinSet = "pincode_set";
  static const _keyAuthProperties = "auth_properties";
  static const _keyIsBiometricSet = "biometric_set";
  static const _keyLastPinAttempt = "pin_attempt";
  static const String _keySignaturePrivateKey = "private_key";
  static const String _keySignaturePublicKey = "public_key";

  // Future<void> savePincode({required String isPinSet}) async =>
  //     await save(keyName: _keyIsPinSet, value: isPinSet);
  //
  // Future<String?> getPincode() async => await read(keyName: _keyIsPinSet);
  //
  // Future<void> removePincode() async =>
  //     await deleteValue(keyName: _keyIsPinSet);
  //
  // Future<void> changeAuthProperties({
  //   required AuthProperties authProperties,
  // }) async =>
  //     await save(
  //       keyName: _keyAuthProperties,
  //       value: jsonEncode(authProperties.toJson()),
  //     );
  //
  // Future<AuthProperties?> getAuthProperties() async {
  //   var propertiesString = await read(keyName: _keyAuthProperties);
  //   if (propertiesString != null) {
  //     return await AuthProperties.formJson(jsonDecode(propertiesString));
  //   }
  //
  //   return null;
  // }
  //
  // Future<void> setBiometric({required String isSet}) async =>
  //     await save(keyName: _keyIsBiometricSet, value: isSet);
  //
  // Future<String?> getBiometric() async =>
  //     await read(keyName: _keyIsBiometricSet);
  //
  // Future<void> deleteBiometric() async =>
  //     await deleteValue(keyName: _keyIsBiometricSet);
  //
  // Future<void> saveLastPinAttempt({required String date}) async =>
  //     await save(keyName: _keyLastPinAttempt, value: date);
  //
  // Future<String?> getLastPinAttempt() async =>
  //     await read(keyName: _keyLastPinAttempt);
  //
  // Future<void> removeLastPinAttempt() async =>
  //     await deleteValue(keyName: _keyLastPinAttempt);
  //
  // Future<void> saveSignaturePrivateKey(String privateKey) async {
  //   await save(keyName: _keySignaturePrivateKey, value: privateKey);
  //   Logger().d('saveSignaturePrivateKey: $privateKey');
  // }

  Future<String?> getSignaturePrivateKey() async {
    // var key = await read(keyName: _keySignaturePrivateKey);
    // Logger().d('getSignaturePrivateKey: $key');

    // return key;
  }

  Future<void> saveSignaturePubliceKey(String publicKey) async {
    // await save(keyName: _keySignaturePublicKey, value: publicKey);
    // Logger().d('saveSignaturePublicKey: $publicKey');
  }

  Future<String?> getSignaturePublicKey() async {
    // var key = await read(keyName: _keySignaturePublicKey);
    // Logger().d('getSignaturePublicKey: $key');

    // return key;
  }

  Future<void> removeSignatureData() async {
    // await deleteValue(keyName: _keySignaturePrivateKey);
    // await deleteValue(keyName: _keySignaturePublicKey);
    // Logger().d(
    //     'removeSignatureData: private_key && public_key');
  }
}
