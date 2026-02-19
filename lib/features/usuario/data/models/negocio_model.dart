class Negocio {
  final String id;
  final String nombre;
  final String descripcion;
  final String tipo;
  final String direccion;
  final String ciudad;
  final double latitud;
  final double longitud;
  final String telefono;
  final String emailNegocio;
  final String? sitioWeb;
  final List<String> imagenes;
  final String propietarioId;

  Negocio({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.tipo,
    required this.direccion,
    required this.ciudad,
    required this.latitud,
    required this.longitud,
    required this.telefono,
    required this.emailNegocio,
    this.sitioWeb,
    required this.imagenes,
    required this.propietarioId,
  });

  factory Negocio.fromMap(Map<String, dynamic> map) => Negocio(
    id: map['id'],
    nombre: map['nombre'] ?? '',
    descripcion: map['descripcion'] ?? '',
    tipo: map['tipo'] ?? '',
    direccion: map['direccion'] ?? '',
    ciudad: map['ciudad'] ?? '',
    latitud: (map['latitud'] as num).toDouble(),
    longitud: (map['longitud'] as num).toDouble(),
    telefono: map['telefono'] ?? '',
    emailNegocio: map['email_negocio'] ?? '',
    sitioWeb: map['sitio_web'],
    imagenes: List<String>.from(map['imagenes'] ?? []),
    propietarioId: map['propietario_id'],
  );

  Map<String, dynamic> toMap() => {
    'nombre': nombre,
    'descripcion': descripcion,
    'tipo': tipo,
    'direccion': direccion,
    'ciudad': ciudad,
    'latitud': latitud,
    'longitud': longitud,
    'telefono': telefono,
    'email_negocio': emailNegocio,
    'sitio_web': sitioWeb,
    'imagenes': imagenes,
  };
}
