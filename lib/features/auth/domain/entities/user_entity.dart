class UserEntity {
  final String id;
  final String email;
  final String nombre;
  final String rol;
  final bool activo;

  const UserEntity({
    required this.id,
    required this.email,
    required this.nombre,
    required this.rol,
    required this.activo,
  });
}
