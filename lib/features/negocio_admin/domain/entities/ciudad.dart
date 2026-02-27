class Ciudad {
  final int id;
  final String nombre;
  final String departamento;

  const Ciudad({
    required this.id,
    required this.nombre,
    required this.departamento,
  });
  factory Ciudad.fromMap(Map<String, dynamic> map) {
    return Ciudad(
      id: map['id'],
      nombre: map['nombre'],
      departamento: map['departamento'],
    );
  }
}
