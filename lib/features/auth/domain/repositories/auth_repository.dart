import 'package:flutter_application_1/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();

  // Forgot Password
  Future<void> sendPasswordResetCode(String email);
  Future<void> confirmPasswordReset({
    required String email,
    required String code,
    required String newPassword,
  });
}
