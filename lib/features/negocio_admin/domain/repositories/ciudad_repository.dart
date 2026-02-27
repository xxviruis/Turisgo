import 'package:flutter_application_1/features/negocio_admin/domain/entities/ciudad.dart';

abstract class CiudadRepository {
  Future<List<Ciudad>> buscarCiudades(String query);
  
}
