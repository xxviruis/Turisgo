import 'package:flutter_application_1/features/negocio_admin/domain/dtos/create_negocio_dto.dart';

class CreateNegocioMapper {
  static Map<String, dynamic> toMap(CreateNegocioDto dto) {
    final map = {
      'nombre': dto.nombre,
      'descripcion': dto.descripcion,
      'direccion': dto.direccion,
      'ciudad_id': dto.ciudadId,
      'telefono': dto.telefono,
      'email_negocio': dto.emailNegocio,
      'sitio_web': dto.sitioWeb,
      'imagenes': dto.imagenes,
      'propietario_id': dto.propietarioId,
      'puntuacion': 0,
      'amenidades': dto.amenidades,
      'precios': dto.precios,
      'tipo_id': dto.tipoId,
      'metodos_pago': dto.metodosPago,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }
}
