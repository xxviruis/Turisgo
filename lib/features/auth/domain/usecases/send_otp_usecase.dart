import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  Future<void> call(String email) {
    return repository.sendPasswordResetCode(email);
  }
}
