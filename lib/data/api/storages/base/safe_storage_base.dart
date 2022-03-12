import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Base class for creating various clients for the Flutter Secure Storage.
/// Storage can safe only String types values.
///
/// After extending [SafeStorageBase] class you need to create
/// your own methods which will be based on [save] and [read] methods.
///
/// After what create DB service to work with your storage.
/// See classes from the data/api/storage/ folder.
abstract class SafeStorageBase {
  static const _storage = FlutterSecureStorage();

  Future<void> save({required String keyName, required String value}) async {
    assert(keyName.isNotEmpty, "The key can't be empty!");
    await _storage.write(key: keyName, value: value);
  }

  Future<String?> read({required String keyName}) async {
    assert(keyName.isNotEmpty, "The key can't be empty!");

    return await _storage.read(key: keyName);
  }

  Future<void> deleteValue({required String keyName}) async {
    assert(keyName.isNotEmpty, "The key can't be empty!");

    return await _storage.delete(key: keyName);
  }

  Future<void> clearAllData() async {
    await _storage.deleteAll();
  }
}
