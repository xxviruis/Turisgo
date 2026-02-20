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
}
