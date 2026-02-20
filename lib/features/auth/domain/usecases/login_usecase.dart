import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> execute(String email, String password) async {
    await repository.login(email, password);
  }
}
