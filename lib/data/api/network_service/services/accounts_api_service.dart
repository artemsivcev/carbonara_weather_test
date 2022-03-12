import 'package:dio/dio.dart';

import 'base/api_service_base.dart';

class AccountsService extends ApiServiceBase {
  /// get list of accounts
  Future<Response?> getAccounts() async {
    var response = await dioWithToken.get(
      "/accounts",
    );

    return response;
  }

  Future<Response?> createSavingEnvelope({
    required String envelopeName,
    required num targetAmount,
    required DateTime targetDate,
  }) async {
    var response = await dioWithToken.post(
      "/accounts/saving-envelope",
      data: {
        "envelopeName": envelopeName,
        "targetAmount": targetAmount,
        "targetDate": targetDate.toIso8601String(),
      },
    );

    return response;
  }

  Future<Response?> editSavingEnvelope({
    required String id,
    required String name,
    required num targetAmount,
    required DateTime targetDate,
  }) async {
    var response = await dioWithToken.put(
      "/accounts/saving-envelope/${id}",
      data: {
        "name": name,
        "targetAmount": targetAmount,
        "targetDate": targetDate.toIso8601String(),
      },
    );

    return response;
  }

  Future<Response?> getCloseReasons() async {
    var response = await dioWithToken.get(
      "/accounts/saving-envelope/close-reasons",
    );

    return response;
  }

  Future<Response?> deleteSavingEnvelope({
    required String id,
    String? closeReasonId,
    String? customReason,
  }) async {
    print({
      "closeReasonId": closeReasonId,
      "customReason": customReason,
    });

    var response = await dioWithToken.delete(
      "/accounts/saving-envelope/${id}",
      data: {
        "closeReasonId": closeReasonId,
        "customReason": customReason,
      },
    );

    return response;
  }

  Future<Response?> getAccountsLimit({
    required String iban,
    required String bic,
    required int accountIdentifier,
  }) async {
    var response = await dioWithToken.post(
      "/accounts/limits",
      data: {
        "iban": iban,
        "bic": bic,
        "accountIdentifier": accountIdentifier,
      },
    );

    return response;
  }

  /// put for create virtual account
  Future<Response?> createVirtualAccount() async {
    var response = await dioWithToken.put(
      "/virtual-cards/order",
    );

    return response;
  }
}
