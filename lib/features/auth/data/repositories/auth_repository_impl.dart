import 'package:flutter_application_1/features/auth/data/datasource/auth_dao.dart';
import 'package:flutter_application_1/features/auth/data/models/usuario_model.dart';
import 'package:flutter_application_1/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this.dao);

  final AuthDAO dao;

  @override
  Future<void> login(String email, String password) async {
    await dao.signIn(email, password);
  }

  @override
  Future<void> logout() async {
    await dao.signOut();
  }

  /// Retorna el usuario autenticado con perfil completo,
  /// o `null` si no hay sesión o el usuario está inactivo.
  @override
  Future<UserEntity?> getCurrentUser() async {
    final authUser = dao.getCurrentUser();
    if (authUser == null) return null;

    final profileData = await dao.getUserProfile(authUser.id);
    if (profileData == null) return null;

    final usuario = UsuarioModel.fromMap(profileData);
    if (!usuario.activo) return null;

    return usuario;
  }

  @override
  Future<void> sendPasswordResetCode(String email) async {
    try {
      await dao.sendOtp(email);
    } catch (_) {
      throw Exception(
        'Error al enviar el código. Verifica tu correo o intenta más tarde.',
      );
    }
  }

  @override
  Future<void> confirmPasswordReset({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    await dao.verifyOtp(email, code);
    await dao.updateUserPassword(newPassword);
    await dao.signOut();
  }
}
