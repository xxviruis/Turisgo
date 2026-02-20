import 'package:flutter_application_1/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<UserEntity?> execute() async {
    return await repository.getCurrentUser();
  }
}
