

//todo change name, now it is temporary
abstract class AuthorizationRepository {
  Future<bool> login({
    required String login,
    required String password,
    String? verificationCode,
  });

  Future<bool> authWithPin({
    required String pinCode,
  });

  Future<bool> resetPassword({
    required String email,
    required DateTime dateOfBirth,
    String? otpCode,
    String? password,
  });

  Future<bool> resetPasswordCheckOtp({
    required String email,
    required DateTime dateOfBirth,
    required otpCode,
  });

  Future<void> logout();

  // Saving a type of authentication to enter to the app which user choosed.
  // Future<void> changeAuthProperties({required AuthProperties authProperties});
  //
  // Future<AuthProperties?> getAuthProperties();

  Future<void> deleteAccessToken();

  Future<void> deleteRefreshToken();

  Future<void> saveLastPinAttempt({required DateTime date});

  Future<void> removeLastPinAttempt();

  Future<String?> getLastPinAttempt();
}
