class CreateNegocioDto {
  final String nombre;
  final String descripcion;
  final String direccion;
  final int ciudadId;
  final String telefono;
  final String emailNegocio;
  final String? sitioWeb;
  final List<String> imagenes;
  final String propietarioId;
  final List<String> amenidades;
  final Map<String, dynamic>? precios;
  final int tipoId;
  final List<Map<String, dynamic>> metodosPago;

  const CreateNegocioDto({
    required this.nombre,
    required this.descripcion,
    required this.direccion,
    required this.ciudadId,
    required this.telefono,
    required this.emailNegocio,
    this.sitioWeb,
    required this.imagenes,
    required this.propietarioId,
    required this.amenidades,
    this.precios,
    required this.tipoId,
    required this.metodosPago,
  });
}
