import 'package:flutter_application_1/features/negocio_admin/domain/entities/tipo_negocio.dart';

abstract class TipoNegocioRepository {
  Future<List<TipoNegocio>> obtenerTipos();
}
