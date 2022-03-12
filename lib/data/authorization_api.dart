import 'package:carbonara_weather_test/di/injector_provider.dart';

import '../domain/repositories/authorization_repository.dart';
import 'api/network_service/services/authorization_api_service.dart';
import 'api/storages/credentials_storage.dart';

class AuthorizationApi extends AuthorizationRepository {
  late final AuthorizationApiService _authService;

  late final CredentialsStorage _credentialsStorage;

  AuthorizationApi() {
    _authService = AuthorizationApiService();

    _credentialsStorage = injector<CredentialsStorage>();
  }

  // // todo create an auth exception to show auth screen.
  // Future<String?> getAccessToken() async {
  //   // todo add logic in case with access token = null
  //   // after what changed a returned type to  the String
  //   return await _tokensStorage.getAccessToken();
  // }
  //
  // Future<String?> getRefreshToken() async {
  //   // todo add logic in case with refresh token = null
  //   // after what changed a returned type to the String
  //   return await _tokensStorage.getRefreshToken();
  // }

  @override
  Future<bool> login({
    required String login,
    required String password,
    String? verificationCode,
  }) async {
    var response = await _authService.login(
      login: login,
      password: password,
      verificationCode: verificationCode,
    );

    if (response != null && response.data != null) {
      // await _tokensStorage
      //   ..setAccessToken(accesToken: response.data['accessToken'])
      //   ..setRefreshToken(refreshToken: response.data['refreshToken']);
    }

    return response != null && response.data != null;
  }

  @override
  Future<void> logout({bool isErrorLogout = false}) async {
    if (!isErrorLogout) {
      /// onError is null because logout on back isn't necessary
      await _authService.logout().onError((error, stackTrace) => null);
    }
    // _authService.dioWithToken.clear();
    // _tokensStorage.clearAllData();
    // _authService.clearAllHeaders();
    // _credentialsStorage.removeSignatureData();
    // await removeLastPinAttempt();
    // await _profilesApi.removePin();
  }

  // @override
  // Future<AuthProperties?> getAuthProperties() async =>
  //     await _credentialsStorage.getAuthProperties();
  //
  // @override
  // Future<void> changeAuthProperties({
  //   required AuthProperties authProperties,
  // }) async {
  //   await _credentialsStorage.changeAuthProperties(
  //     authProperties: authProperties,
  //   );
  // }

  // /// For testing purpouse
  // Future<void> clearStorage() async {
  //   await _tokensStorage.clearAllData();
  // }
  //
  // @override
  // Future<void> deleteAccessToken() async =>
  //     await _tokensStorage.deleteAccessToken();
  //
  // @override
  // Future<void> deleteRefreshToken() async =>
  //     _tokensStorage.deleteRefreshToken();

  @override
  Future<bool> resetPassword({
    required String email,
    required DateTime dateOfBirth,
    String? otpCode,
    String? password,
  }) async {
    var response = await _authService.resetPassword(
      email: email,
      dateOfBirth: dateOfBirth,
      otpCode: otpCode,
      password: password,
    );

    return response != null && response.data != null;
  }

  @override
  Future<bool> resetPasswordCheckOtp({
    required String email,
    required DateTime dateOfBirth,
    required otpCode,
  }) async {
    var response = await _authService.resetPasswordCheckOtp(
      email: email,
      dateOfBirth: dateOfBirth,
      otpCode: otpCode,
    );

    return response != null && response.data != null;
  }

  @override
  Future<bool> authWithPin({required String pinCode}) async {
    var response = await _authService.authWithPin(pinCode: pinCode);

    return response != null && response.data != null;
  }

  @override
  Future<String?> getLastPinAttempt() async =>
     null;

  @override
  Future<void> removeLastPinAttempt() async =>
     null;

  @override
  Future<void> saveLastPinAttempt({required DateTime date}) async => null;
      // await _credentialsStorage.saveLastPinAttempt(
      //   date: date.toString(),
      // );

  @override
  Future<void> deleteAccessToken() {
    // TODO: implement deleteAccessToken
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRefreshToken() {
    // TODO: implement deleteRefreshToken
    throw UnimplementedError();
  }
}
