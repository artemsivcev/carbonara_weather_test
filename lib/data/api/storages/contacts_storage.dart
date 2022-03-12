import 'dart:convert';
import 'base/safe_storage_base.dart';

class ContactsStorage extends SafeStorageBase {
  // Future<void> saveContacts({required List<CFPSContactModel> contacts}) async {
  //   for (var c in contacts) save(keyName: c.phone, value: jsonEncode(c));
  // }
  //
  // Future<List<CFPSContactModel>> getAllContacts({
  //   required List<String> phones,
  // }) async {
  //   List<CFPSContactModel> result = [];
  //   for (var p in phones) {
  //     var data = await read(keyName: p);
  //     if (data != null) result.add(CFPSContactModel.fromJson(jsonDecode(data)));
  //   }
  //
  //   return result;
  // }
  //
  // Future<void> deleteContacts({
  //   required List<String> phones,
  // }) async {
  //   for (var p in phones) deleteValue(keyName: p);
  // }
}
