import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<void> call({
    required String email,
    required String code,
    required String newPassword,
  }) {
    return repository.confirmPasswordReset(
      email: email,
      code: code,
      newPassword: newPassword,
    );
  }
}
