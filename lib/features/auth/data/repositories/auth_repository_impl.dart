import 'package:flutter_application_1/features/auth/data/datasource/auth_dao.dart';
import 'package:flutter_application_1/features/auth/data/models/usuario_model.dart';
import 'package:flutter_application_1/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDAO dao;

  AuthRepositoryImpl(this.dao);

  @override
  Future<void> login(String email, String password) async {
    await dao.signIn(email, password);
  }

  @override
  Future<void> logout() async {
    await dao.signOut();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final authUser = dao.getCurrentUser();
    if (authUser == null) return null;

    final profile = await dao.getUserProfile(authUser.id);
    if (profile == null) return null;

    final usuario = UsuarioModel.fromMap(profile);

    if (!usuario.activo) return null; // 🔥 Bloqueo automático

    return usuario;
  }

  @override
  Future<void> confirmPasswordReset({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    final response = await dao.verifyOTP(email, code);
    if (response.session != null) {
      await dao.updateUserPassword(newPassword);
      await dao.signOut(); // Cerrar sesión después de cambiar la contraseña
    } else {
      // Si el código es incorrecto o expiró, lanzamos una excepción clara
      throw Exception("El código de verificación es incorrecto o ha expirado.");
    }
  }

  Future<void> sendPasswordResetCode(String email) async {
    try {
      // Supabase envía el código o link automáticamente al correo
      await dao.sendResetPasswordEmail(email);
    } catch (e) {
      // Lanzamos el error para que el controlador lo capture en el catch y muestre el mensaje
      throw Exception("Error al enviar el código: $e");
    }
  }
}
