import 'package:flutter_application_1/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> getCurrentUser();
  Future<void> login(String email, String password);
  Future<void> logout();
}
