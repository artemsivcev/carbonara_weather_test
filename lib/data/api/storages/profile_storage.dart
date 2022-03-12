import 'dart:convert';

import 'base/safe_storage_base.dart';

class ProfileStorage extends SafeStorageBase {
  static const _keyProfile = "Profile";

  // Future<void> saveProfile({required Profile profile}) async =>
  //     save(keyName: _keyProfile, value: jsonEncode(profile.toJson()));
  //
  // Future<Profile?> restoreProfile() async {
  //   var stringSource = await read(keyName: _keyProfile);
  //
  //   var result;
  //
  //   if (stringSource != null) {
  //     var map = jsonDecode(stringSource);
  //
  //     result = Profile.fromJson(map);
  //   }
  //
  //   return result;
  // }
}
