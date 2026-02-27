import 'package:flutter_application_1/features/negocio_admin/domain/entities/negocio.dart';

import '../dtos/create_negocio_dto.dart';

abstract class NegocioRepository {
  Future<void> crearNegocio(CreateNegocioDto dto);

  Future<Negocio?> obtenerNegocioPorId(String id);

  Future<List<Negocio>> obtenerNegociosPorPropietario(String propietarioId);
}
