import 'package:flutter_application_1/features/auth/domain/entities/user_entity.dart';

class UsuarioModel extends UserEntity {
  const UsuarioModel({
    required super.id,
    required super.email,
    required super.nombre,
    required super.rol,
    required super.activo,
  });

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      nombre: map['nombre'] ?? 'Sin nombre',
      rol: map['rol'] ?? 'user',
      activo: map['activo'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'nombre': nombre,
      'rol': rol,
      'activo': activo,
    };
  }
}
