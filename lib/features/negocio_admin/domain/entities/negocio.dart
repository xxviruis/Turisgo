class Negocio {
  final String id;
  final DateTime createdAt;
  final String nombre;
  final String descripcion;
  final String direccion;
  final String ciudad;
  final String telefono;
  final String emailNegocio;
  final String? sitioWeb;
  final List<String> imagenes;
  final String propietarioId;
  final double puntuacion;
  final List<String> amenidades;
  final Map<String, dynamic>? precios;
  final int tipoId;
  final List<Map<String, dynamic>> metodosPago;

  Negocio({
    required this.id,
    required this.createdAt,
    required this.nombre,
    required this.descripcion,
    required this.direccion,
    required this.ciudad,
    required this.telefono,
    required this.emailNegocio,
    this.sitioWeb,
    required this.imagenes,
    required this.propietarioId,
    required this.puntuacion,
    required this.amenidades,
    this.precios,
    required this.tipoId,
    required this.metodosPago,
  });
}
