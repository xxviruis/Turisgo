import 'package:flutter_application_1/features/negocio_admin/domain/entities/negocio.dart';

class NegocioModel extends Negocio {
  NegocioModel({
    required super.id,
    required super.createdAt,
    required super.nombre,
    required super.descripcion,
    required super.direccion,
    required super.ciudad,
    required super.telefono,
    required super.emailNegocio,
    super.sitioWeb,
    required super.imagenes,
    required super.propietarioId,
    required super.puntuacion,
    required super.amenidades,
    super.precios,
    required super.tipoId,
    required super.metodosPago,
  });

  factory NegocioModel.fromMap(Map<String, dynamic> map) {
    return NegocioModel(
      id: map['id'],
      createdAt: DateTime.parse(map['created_at']),
      nombre: map['nombre'],
      descripcion: map['descripcion'],
      direccion: map['direccion'],
      ciudad: map['ciudad'],
      telefono: map['telefono'],
      emailNegocio: map['email_negocio'],
      sitioWeb: map['sitio_web'],
      imagenes: List<String>.from(map['imagenes'] ?? []),
      propietarioId: map['propietario_id'],
      puntuacion: (map['puntuacion'] ?? 0).toDouble(),
      amenidades: List<String>.from(map['amenidades'] ?? []),
      precios: map['precios'],
      tipoId: map['tipo_id'],
      metodosPago: List<Map<String, dynamic>>.from(
        (map['metodos_pago'] ?? []).map((e) => Map<String, dynamic>.from(e)),
      ),
    );
  }
}
