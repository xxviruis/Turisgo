class UsuarioModel {
  final String id;
  final String email;
  final String nombre;
  final String rol;
  final bool activo;

  UsuarioModel({
    required this.id,
    required this.email,
    required this.nombre,
    required this.rol,
    this.activo = true,
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
}
