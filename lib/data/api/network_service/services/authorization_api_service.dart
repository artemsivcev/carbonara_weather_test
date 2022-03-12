import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'base/api_service_base.dart';

/// The class reliable for backend requests.
class AuthorizationApiService extends ApiServiceBase {
  Future<Response?> login({
    required String login,
    required String password,
    String? verificationCode,
  }) async {
    var data = {
      "email": login,
      "password": password,
      "verificationCode": verificationCode,
    };
    var response = await dioWithoutAuth.post('/login', data: data);

    return response;
  }

  Future<Response?> authWithPin({
    required String pinCode,
  }) async {
    var data = {
      "pinCode": pinCode,
    };
    var response = await dioWithToken.post('/auth/pincode', data: data);

    return response;
  }

  Future<Response?> resetPassword({
    required String email,
    required DateTime dateOfBirth,
    String? otpCode,
    String? password,
  }) async {
    var data = {
      "email": email,
      "dateOfBirth": DateFormat("yyyy-MM-dd").format(dateOfBirth),
      "otpCode": otpCode,
      "password": password,
    };
    var response = await dioWithoutAuth.put('/password-reset', data: data);

    return response;
  }

  Future<Response?> resetPasswordCheckOtp({
    required String email,
    required DateTime dateOfBirth,
    required otpCode,
  }) async {
    var data = {
      "email": email,
      "dateOfBirth": DateFormat("yyyy-MM-dd").format(dateOfBirth),
      "otpCode": otpCode,
    };
    var response =
        await dioWithoutAuth.post('/password-reset/check-otp', data: data);

    return response;
  }

  //logout method for unbinding
  Future<Response?> logout() async => dioWithToken.get('/logout');
}
